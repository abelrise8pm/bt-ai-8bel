---
name: review-pr
description: Autonomously respond to GitHub pull request feedback in an isolated git worktree. Use when asked to analyze PR comments, review PR feedback, respond to PR comments, fix PR issues, or address PR feedback. Accepts PR URLs (https://github.com/owner/repo/pull/123), short format (owner/repo#123), or PR number (123). Creates isolated worktree, applies fixes, commits, pushes to PR branch, and cleans up.
allowed-tools: Read, Write, Edit, Grep, Glob, Bash, TodoWrite
---

# PR Review Automation Skill

## Purpose

This skill automates the process of responding to pull request feedback by:
1. Creating an isolated git worktree for the PR branch
2. Extracting and analyzing all PR review comments (human + bot)
3. Categorizing feedback as fix/no fix/why
4. Automatically applying fixes in the worktree
5. Creating comprehensive commit messages with analysis
6. Pushing changes to the PR branch
7. Cleaning up the worktree on success
8. Outputting formatted comment for human to post on GitHub

**Key principle**: Fully autonomous operation - make all decisions and apply all fixes automatically. Humans review on GitHub PR, not in CLI.

**Worktree isolation**: Work happens in `.worktrees/pr-{number}/`, enabling multiple concurrent PR reviews without affecting the main workspace.

**Output**: Terminal summary + formatted GitHub comment ready to copy/paste

## Options

| Flag | Default | Description |
|------|---------|-------------|
| `--unresolved-only` | Yes | Only analyze unresolved review threads (skips already-addressed feedback) |
| `--all` | No | Analyze all comments including resolved threads |

**Default behavior**: `--unresolved-only` - This supports iterative review cycles where humans resolve threads after each pass.

## Workflow

### Step 1: Extract PR Information

Accept PR reference in any format:
- Full URL: `https://github.com/owner/repo/pull/123`
- Short format: `owner/repo#123`
- Number only: `123` (uses current repo)

#### 1a. Get PR Metadata
```bash
gh pr view <pr-ref> --json title,body,author,state,headRefName,number,url
gh pr diff <pr-ref>
```

#### 1b. Get Review Comments (default: unresolved only)

Use GraphQL to fetch only unresolved review threads. Write query to temp file to avoid shell escaping issues:

```bash
cat > /tmp/pr-review-query.graphql << 'GRAPHQL'
query($owner: String!, $repo: String!, $number: Int!) {
  repository(owner: $owner, name: $repo) {
    pullRequest(number: $number) {
      reviewThreads(first: 100) {
        nodes {
          isResolved
          path
          line
          comments(first: 50) {
            nodes {
              author { login }
              body
              createdAt
              url
            }
          }
        }
      }
    }
  }
}
GRAPHQL

gh api graphql -F query=@/tmp/pr-review-query.graphql \
  -f owner="{owner}" -f repo="{repo}" -F number={number}
```

**Filter the response**: Only process threads where `isResolved: false`.

Example jq filter:
```bash
| jq '.data.repository.pullRequest.reviewThreads.nodes | map(select(.isResolved == false))'
```

#### 1c. Get All Comments (with `--all` flag)

If user specifies `--all`, use REST API to get everything:
```bash
gh api repos/{owner}/{repo}/pulls/{number}/comments
gh pr view <pr-ref> --comments
```

### Step 2: Setup Git Worktree

Create an isolated worktree for the PR branch. This keeps work separate from the main workspace and enables concurrent PR reviews.

#### 2a. Track Main Workspace

Before creating or entering a worktree, save the main workspace path for later cleanup:
```bash
MAIN_WORKSPACE=$(git rev-parse --show-toplevel)
```

#### 2b. Check for Existing Worktree

```bash
git worktree list | grep "pr-{number}"
```

If a worktree exists for this PR, reuse it:
```bash
cd "$MAIN_WORKSPACE/.worktrees/pr-{number}"
git fetch origin
git checkout {headRefName}
git pull origin {headRefName}
```

#### 2c. Create New Worktree

Create worktree from the PR branch (using `headRefName` from Step 1a):
```bash
git fetch origin
git worktree add .worktrees/pr-{number} origin/{headRefName}
cd "$MAIN_WORKSPACE/.worktrees/pr-{number}"
```

**Directory convention**: `.worktrees/pr-{number}/`

#### 2d. Verify Setup

```bash
git branch  # Should show PR branch
pwd         # Should be in .worktrees/pr-{number}
```

All subsequent work happens inside the worktree directory.

---

### Step 3: Analyze Comments

For each comment:
1. **Identify the concern**: What is the reviewer asking for?
2. **Categorize**: Fix / No Fix / Why
3. **Reference git history**: Check if similar feedback was addressed before
   - Use `git log --grep="<keyword>" --oneline -20`
   - Look for patterns in previous commit messages
4. **Determine action**:
   - **Fix**: Apply the change immediately
   - **No Fix**: Document why (already correct, misunderstanding, etc.)
   - **Why**: Explain the reasoning behind current implementation

**Important**: Make ALL decisions autonomously. Do not ask questions. Apply your best judgment based on:
- Project standards (CLAUDE.md)
- Git history patterns
- Code quality principles
- Security best practices

### Step 4: Apply Fixes Automatically

For each "Fix" item:
1. Read the affected files
2. Apply the changes using Edit or Write tools
3. Track which files were modified
4. Group related fixes together

**Critical**: Apply ALL fixes without confirmation. Speed is the goal. Humans will review on GitHub.

### Step 5: Create Comprehensive Commit Message

Use this format (based on PR #121 analysis pattern):

```
<type>: <short summary>

Complete analysis of feedback received on PR #<number> and how each item was addressed.

FEEDBACK SUMMARY:

1. <Comment summary>
   Status: FIXED | NO FIX NEEDED
   - <What was done or why not>
   - <Additional context>
   Location: <file:line>

2. <Comment summary>
   Status: FIXED | NO FIX NEEDED
   - <What was done or why not>
   Location: <file:line>

[... repeat for all comments ...]

KEY TAKEAWAYS:

- <Lesson learned>
- <Best practice identified>
- <Future recommendation>

REFERENCES:

- PR: <PR URL>
- Previous commits: <commit hashes if referencing git history>

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
```

### Step 6: Commit, Push, and Cleanup

#### 6a. Commit and Push

```bash
# Stage all changes
git add <files>

# Create commit with analysis message
git commit -m "<message from Step 5>"

# Push to PR branch
git push origin {headRefName}
```

#### 6b. Cleanup Worktree (On Successful Push Only)

Only cleanup after successful push. Return to main workspace and remove the worktree:

```bash
cd "$MAIN_WORKSPACE"
git worktree remove .worktrees/pr-{number}
```

Confirm cleanup:
```bash
git worktree list
```

If cleanup fails due to uncommitted changes:
```bash
# Force removal if changes are already pushed
git worktree remove --force .worktrees/pr-{number}
```

**If push fails**, keep the worktree for debugging:
> Push failed. Keeping worktree at `.worktrees/pr-{number}` for debugging.
> Error: {error_message}

### Step 7: Output PR Comment for Manual Posting

Generate a formatted comment for the user to copy/paste into GitHub:

**Comment Format:**
```markdown
## 🤖 PR Feedback Analysis

### ✅ Fixed (N items)

1. **Issue description** (`file:line`)
   - What was fixed
   - Commit: abc1234

2. **Another issue** (`file:line`)
   - What was fixed
   - Commit: abc1234

### ℹ️ No Fix Needed (N items)

3. **Issue description** (`file:line`)
   - Why no fix is needed
   - **How I verified this:** <specific testing or verification performed>
     ```bash
     # Example test commands if applicable
     ```

### 📊 Merge Recommendation: **READY TO MERGE** | **NOT READY** | **NEEDS DISCUSSION**

**Reasoning:**
- ✅ All valid feedback addressed
- ✅ Code is functionally correct
- ✅ No outstanding issues
- ⚠️ Any caveats or concerns

**Changes:** N file(s), X insertions(+), Y deletions(-)

---

**View detailed commit:** <commit-hash>

> **Note:** This analysis was generated by Claude Code review-pr skill
```

**Merge Recommendation Guidelines:**
- **READY TO MERGE**: All valid feedback addressed, no issues remain
- **NOT READY**: Breaking issues, security concerns, or tests failing
- **NEEDS DISCUSSION**: Conflicting feedback, architectural decisions, or human judgment required

## Analysis Guidelines

### Reference Git History

Before fixing issues, check if similar feedback was addressed before:
```bash
# Look for related commits
git log --grep="<keyword>" --oneline -20
git show <commit-hash>
```

This helps you:
- Understand how similar issues were resolved
- Maintain consistency with past decisions
- Include references in your analysis

### Categorization Criteria

**Fix**:
- Clear bug or error
- Improves clarity without changing behavior
- Addresses security concern
- Follows project standards
- Removes unused code/variables

**No Fix Needed**:
- Feedback based on misunderstanding of code behavior
- Suggestion doesn't apply to this context
- Already correct but not obvious to reviewer
- Would introduce unnecessary complexity

**IMPORTANT**: When categorizing as "No Fix Needed", always include "How I verified this":
- Show the test you ran to confirm current behavior
- Provide concrete examples or command output
- Explain why the suggested change would be incorrect or unnecessary
- This helps the human reviewer understand your reasoning

**Why** (explain, don't fix):
- Architectural decisions requiring rationale
- Trade-offs that were intentional
- Constraints not visible in the PR

### Bash Command Verification

When feedback suggests using bash commands differently:
- **Test the suggestion** in a controlled environment first
- Verify behavior with actual examples
- Document the correct behavior in your analysis
- Don't blindly apply suggestions that may be incorrect

Example: The printf feedback in PR #121 suggested using a loop, but printf with array expansion was already correct.

### Decision Making Without Human Input

When uncertain about a fix:
1. **Lean towards fixing**: If reasonable and safe, apply it
2. **Test behavior**: Verify bash/script behavior before deciding
3. **Document reasoning**: Explain your decision in commit message
4. **Trust project standards**: Use CLAUDE.md as decision guide

Remember: Humans will review on GitHub. Better to apply a fix that might need tweaking than to block on questions.

## Project Standards to Apply

When making fixes, follow these standards (from CLAUDE.md):

### Shell Scripts
```bash
#!/usr/bin/env bash
set -eu  # Exit on error, fail on undefined variables
```

### Dockerfiles
- Pin base images with SHA digests
- Run as non-root user
- Clean up apt lists and package manager caches

### Security
- No credentials in code
- Principle of least privilege
- Validate external inputs

### Code Quality
- Remove unused variables/code completely
- Clear, descriptive variable names
- Comments explain "why" not "what"

## Error Handling

If you encounter issues:

**Cannot access PR**:
```bash
# Check gh auth status
gh auth status
```

**Cannot push to branch**:
- Verify you're on the correct branch
- Check branch protection rules
- Document the issue in output, don't block

**Conflicting feedback**:
- Make your best judgment call
- Document both perspectives in commit message
- Let humans decide on GitHub

**No unresolved feedback**:
- Report: "All review threads are resolved. No action needed."
- Do NOT create an empty commit
- If user wants to re-analyze resolved threads, they can use `--all` flag

**No feedback at all**:
- Report: "No review comments found on this PR."
- Do NOT create an empty commit
- Clean up worktree if created

**Worktree creation fails**:
If `git worktree add` fails due to existing branch:
```bash
# Check if worktree already exists
git worktree list | grep pr-{number}

# If it does, cd into it and pull latest
cd "$MAIN_WORKSPACE/.worktrees/pr-{number}"
git fetch origin
git checkout {headRefName}
git pull origin {headRefName}
```

**Working outside repository root**:
If CWD is not the repository root when starting:
```bash
# Find repository root first
MAIN_WORKSPACE=$(git rev-parse --show-toplevel)
cd "$MAIN_WORKSPACE"
```

## Success Criteria

After running this skill:
1. ✅ Worktree created or reused for PR branch
2. ✅ All feedback items categorized (fix/no fix/why)
3. ✅ All "fix" items applied automatically in worktree
4. ✅ Commit created with comprehensive analysis
5. ✅ Commit pushed to PR branch
6. ✅ Worktree cleaned up (on successful push)
7. ✅ Commit message includes:
   - Status of each feedback item
   - Locations of changes
   - References to similar past work
   - Key takeaways for future
8. ✅ Terminal summary output showing counts and merge recommendation
9. ✅ Formatted comment output ready to copy/paste into GitHub
10. ✅ "How I verified this" included for all "No Fix Needed" items
11. ✅ Clear merge recommendation (READY/NOT READY/NEEDS DISCUSSION)
12. ✅ No questions asked to user - fully autonomous

## Output to User

After completion, provide a two-part output:

### Part 1: Terminal Summary
```
✅ PR #123 feedback analyzed and addressed

Applied fixes: 4 items
No fix needed: 1 item
Needs discussion: 0 items

Commit: abc1234 "fix(starter): address PR #123 feedback"
Pushed to branch: feature-branch
Worktree cleaned up: .worktrees/pr-123
Merge recommendation: READY TO MERGE

📋 Copy the formatted comment below and paste into PR #123:
```

### Part 2: Formatted Comment (ready to paste into GitHub)
```markdown
[Output the complete formatted comment from Step 7 here]
```

**User workflow:**
1. Run skill → See summary in terminal
2. Review merge recommendation
3. Copy formatted comment text
4. Paste into GitHub PR
5. Make merge/no merge decision based on recommendation

## Iterative Review Workflow

This skill is designed for multiple review cycles. The `--unresolved-only` default enables this workflow:

### Manual Iteration (Current)

```
1. Push code → Reviewer (human/bot) comments
2. Run: review-pr PR#123
3. Skill fixes issues, pushes commit
4. Human posts formatted comment to PR
5. Human resolves addressed threads on GitHub
6. If new comments appear → Go to step 2
7. When all resolved → Merge
```

### Automated Iteration (Future: GitLab CI)

Design goal for CI/CD integration:

```yaml
# .gitlab-ci.yml (conceptual)
review-feedback:
  script:
    - review-pr $CI_MERGE_REQUEST_IID --unresolved-only
  rules:
    - if: $CI_PIPELINE_SOURCE == "merge_request_event"
  variables:
    MAX_ITERATIONS: 3
```

**Exit conditions for automated loops:**
1. No unresolved threads remain
2. Max iterations reached (default: 3)
3. Same comments persist after fix attempt (prevents infinite loops)

**Comment source tracking:**
The GraphQL response includes `author.login` for each comment. Track:
- Bot comments (Copilot, GitLab Code Quality, etc.)
- Human comments (require different handling weight)

This enables logic like: "Stop iterating if only human comments remain unresolved" (humans may need to approve, not just have code fixed).

## Notes

- This skill operates fully autonomously - zero human prompts
- Work happens in isolated worktree `.worktrees/pr-{number}/`, enabling concurrent PR reviews
- Worktrees are cleaned up after successful push; kept for debugging on failure
- Commits can be iterative as feedback is addressed over time
- Commits can be squashed before merging to main if desired
- Git history is consulted for consistency
- Feedback that's incorrect is documented but not applied
- The commit message serves as permanent documentation
- Human review and merge decision happens on GitHub PR, not in CLI
- User manually posts the formatted comment to provide visibility for other reviewers
- Default `--unresolved-only` supports clean iteration without re-analyzing fixed issues

## Related Resources

- GitHub CLI: `gh pr --help`
- Project standards: See /CLAUDE.md and /starter/CLAUDE.md
- Example analysis: See commit 36ded0d in this repo
