---
name: software-engineer-beta-review-pr
description: This skill should be used when the user asks to "review PR feedback", "address PR comments", "respond to reviewer", "fix PR issues", "implement reviewer suggestions", "handle review comments", "what changes does the reviewer want", or "update based on review". Autonomously analyzes all PR comment sources, applies fixes in isolated worktree, commits, and pushes to PR branch.
allowed-tools: Read, Write, Edit, Grep, Glob, Bash, TodoWrite
---

# PR Review Automation

Autonomously respond to pull request feedback by analyzing all comment sources, applying fixes in an isolated worktree, and pushing changes.

## Key Principles

- **Fully autonomous** - Make all decisions without asking questions
- **All comment sources** - Fetch review threads, review bodies, AND discussion comments
- **Worktree isolation** - Work in `.worktrees/pr-{number}/` to enable concurrent reviews
- **Output for humans** - Terminal summary + GitHub comment ready to copy/paste

## Options

| Flag | Default | Description |
|------|---------|-------------|
| `--unresolved-only` | Yes | Only analyze unresolved review threads |
| `--all` | No | Include resolved threads |

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

#### 1b. Get Review Comments and Bodies

Use the GraphQL query from `scripts/pr-review-query.graphql`:

```bash
gh api graphql -F query=@scripts/pr-review-query.graphql \
  -f owner="{owner}" -f repo="{repo}" -F number={number}
```

Filter for unresolved threads:
```bash
| jq '.data.repository.pullRequest.reviewThreads.nodes | map(select(.isResolved == false))'
```

**Important**: Always check `reviews.nodes` for review body comments (overall feedback submitted with Approve/Request Changes).

#### 1c. Get Discussion Comments

```bash
gh pr view <pr-ref> --comments --json comments
```

Or via REST:
```bash
gh api repos/{owner}/{repo}/issues/{number}/comments
```

### Step 2: Setup Git Worktree

```bash
# Save main workspace path
MAIN_WORKSPACE=$(git rev-parse --show-toplevel)

# Check for existing worktree
git worktree list | grep "pr-{number}"

# Create or reuse worktree
git fetch origin
git worktree add .worktrees/pr-{number} origin/{headRefName}
cd "$MAIN_WORKSPACE/.worktrees/pr-{number}"
```

### Step 3: Analyze Comments

#### 3a. Consolidate All Sources

| Source | Contains | Priority |
|--------|----------|----------|
| Review threads | Line-specific code comments | High |
| Review bodies | Overall review comments | High - may contain blocking concerns |
| Discussion comments | General PR conversation | Medium |

**Critical**: Do not skip any source.

#### 3b. Categorize Each Comment

For each comment:
1. Identify the concern
2. Categorize: **Fix** / **No Fix** / **Why**
3. Check git history for similar past feedback
4. Determine action

See `references/categorization-guide.md` for detailed criteria.

### Step 4: Apply Fixes

For each "Fix" item:
1. Read affected files
2. Apply changes using Edit or Write tools
3. Track modified files
4. Group related fixes

**Apply ALL fixes without confirmation.** Humans review on GitHub.

### Step 5: Commit and Push

```bash
git add <files>
git commit -m "<message>"  # See references/commit-format.md
git push origin {headRefName}
```

### Step 6: Cleanup Worktree

Only after successful push:

```bash
cd "$MAIN_WORKSPACE"
git worktree remove .worktrees/pr-{number}
```

### Step 7: Output

Provide two-part output:

1. **Terminal summary** - Counts, commit hash, merge recommendation
2. **GitHub comment** - Formatted markdown ready to paste into PR

See `references/commit-format.md` for exact formats.

## Success Criteria

1. All comment sources fetched (threads, bodies, discussion)
2. Worktree created or reused
3. All feedback categorized (fix/no fix/why)
4. All fixes applied automatically
5. Commit with comprehensive analysis pushed
6. Worktree cleaned up
7. Terminal summary and GitHub comment output
8. Merge recommendation provided
9. No questions asked - fully autonomous

## Additional Resources

### Reference Files

- **`references/commit-format.md`** - Commit message and GitHub comment formats
- **`references/categorization-guide.md`** - How to categorize feedback and make decisions
- **`references/error-handling.md`** - Handling common errors and edge cases

### Scripts

- **`scripts/pr-review-query.graphql`** - GraphQL query for fetching PR comments

## Iterative Workflow

This skill supports multiple review cycles:

```
1. Push code → Reviewer comments
2. Run: review-pr PR#123
3. Skill fixes issues, pushes commit
4. Human posts formatted comment to PR
5. Human resolves addressed threads on GitHub
6. If new comments → Go to step 2
7. When all resolved → Merge
```

Default `--unresolved-only` prevents re-analyzing already-fixed issues.
