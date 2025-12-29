---
name: implement-story
description: This skill should be used when the user asks to "implement issue", "implement story", "work on issue", "start issue", or provides a GitHub issue URL to implement. Creates an isolated git worktree, implements the story with tests, commits, pushes, and cleans up.
---

# Story Implementation

Implement a GitHub issue in an isolated git worktree following clean code principles with automated testing.

## Input

GitHub issue URL or reference:
- Full URL: `https://github.com/owner/repo/issues/123`
- Short format: `owner/repo#123`
- Issue number (if repo context known): `#123` or `123`

## Workflow Overview

1. **Fetch story** - Understand requirements and acceptance criteria
2. **Setup worktree** - Create isolated branch and working directory
3. **Plan implementation** - Break down into tasks
4. **Implement** - Write tests, code, and verify
5. **Push and cleanup** - Push branch and remove worktree

---

## 1. Fetch and Understand the Story

```bash
gh issue view {number} --repo {owner}/{repo} --json title,body,labels,comments
```

Extract:
- **Story statement**: Problem description or "As a... I want... so that..."
- **Acceptance criteria**: GIVEN/WHEN/THEN conditions or requirements
- **Out of scope**: What's explicitly excluded
- **Technical notes**: Implementation hints or constraints

If acceptance criteria are unclear, work with available information and clarify with user during implementation.

---

## 2. Setup Git Worktree

Create an isolated worktree for the implementation. This keeps work separate from other branches and enables parallel development.

### Track Main Workspace

Before creating or entering a worktree, save the main workspace path for later cleanup:
```bash
MAIN_WORKSPACE=$(git rev-parse --show-toplevel)
```

### Check for Existing Worktree

```bash
git worktree list | grep "issue-{number}"
```

If a worktree exists for this issue, reuse it:
```bash
cd "$MAIN_WORKSPACE/.worktrees/issue-{number}"
git fetch origin
git status
```

### Create New Worktree

Generate a branch slug from the issue title:
```bash
# Take issue title, lowercase, replace spaces/special chars with hyphens, truncate to 50 chars
# Example: "Add user authentication flow" → "add-user-authentication-flow"
# Example: "Fix bug in payment processing (#123)" → "fix-bug-in-payment-processing"
slug=$(echo "{issue_title}" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//' | cut -c1-50)
```

Create worktree from origin/main:
```bash
git fetch origin
git worktree add .worktrees/issue-{number} -b feature/issue-{number}-{slug} origin/main
cd "$MAIN_WORKSPACE/.worktrees/issue-{number}"
```

**Directory convention**: `.worktrees/issue-{number}/`
**Branch convention**: `feature/issue-{number}-{slug}`

### Verify Setup

```bash
git branch  # Should show feature branch
pwd         # Should be in .worktrees/issue-{number}
```

All subsequent work happens inside the worktree directory.

---

## 3. Create Implementation Plan

Use TodoWrite to create a task list based on acceptance criteria:

1. Map each criterion to implementation tasks
2. Order by dependency (foundational work first)
3. Identify which tasks need tests vs. structural changes

**Task naming**:
- Tests: "Write test: [what it verifies]"
- Implementation: "Implement: [capability]"
- Refactor: "Refactor: [what's being improved]"

---

## 4. Explore the Codebase

Before writing code, understand existing patterns:

```bash
git ls-files | grep -i {relevant_terms}
```

Identify:
- **Existing patterns**: How similar functionality is implemented
- **Test patterns**: How tests are structured
- **File locations**: Where new code should live
- **Naming conventions**: How things are named

---

## 5. Implement with Tests

### Testing Philosophy

- Tests validate expected behavior and serve as living documentation
- Tests should fail for the right reasons, pinpointing what's broken
- Tests enable safe refactoring with confidence
- Follow the testing pyramid: many unit tests, moderate integration, few E2E

### Implementation Cycle

1. Write test capturing acceptance criterion
2. Run test (should fail)
3. Implement minimum code to pass
4. Run test (should pass)
5. Refactor if needed
6. Repeat for next criterion

```bash
{test_command}  # e.g., npm test, pytest, go test
```

---

## 6. Commit Strategy

Follow atomic commit principles. Never mix structural and behavioral changes.

**Structural changes** (refactoring):
```bash
git add {files}
git commit -m "refactor: {what changed structurally}"
```

**Behavioral changes** (features):
```bash
git add {files}
git commit -m "feat: {what capability was added}"
```

### Commit Message Format

```
<type>(<scope>): <description>

[optional body explaining why]

Closes #{issue_number}
```

Types: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`

---

## 7. Verify Acceptance Criteria

Before completing, verify each criterion:

| Criterion | Test | Status |
|-----------|------|--------|
| AC #1 | `test_name` | PASS/FAIL |
| AC #2 | `test_name` | PASS/FAIL |

Run full test suite and linters:
```bash
{full_test_command}
{lint_command}
```

---

## 8. Push and Cleanup

### Push Branch

```bash
git push -u origin feature/issue-{number}-{slug}
```

**If push succeeds**, report to user:
> Branch `feature/issue-{number}-{slug}` pushed. Ready for PR at:
> https://github.com/{owner}/{repo}/pull/new/feature/issue-{number}-{slug}

**If push fails**, keep the worktree for debugging:
> Push failed. Keeping worktree at `.worktrees/issue-{number}` for debugging.
> Error: {error_message}

### Cleanup Worktree (On Successful Push Only)

Only cleanup after successful push. Return to main workspace and remove the worktree:

```bash
cd "$MAIN_WORKSPACE"
git worktree remove .worktrees/issue-{number}
```

Confirm cleanup:
```bash
git worktree list
```

If cleanup fails due to uncommitted changes:
```bash
# Force removal if changes are already pushed
git worktree remove --force .worktrees/issue-{number}
```

---

## Progress Updates

Keep user informed at milestones:
- After understanding the story
- After worktree setup
- After creating implementation plan
- After completing major steps
- When all criteria verified
- After push and cleanup

---

## Edge Cases

### Story is Too Large

> This story is larger than initially scoped. Natural boundaries:
> 1. [First piece]
> 2. [Second piece]
>
> Continue with just the first piece?

### Missing Test Infrastructure

> No existing test infrastructure found. Before implementing:
> 1. Add basic test configuration for {framework}
> 2. Proceed without tests (not recommended)

### Unclear Acceptance Criteria

> The criterion "{criterion}" is ambiguous. Specifically: {what's unclear}. How should I interpret this?

### Worktree Creation Fails

If `git worktree add` fails due to existing branch:
```bash
# Check if branch exists
git branch -a | grep feature/issue-{number}

# If remote branch exists, create worktree tracking it
git worktree add .worktrees/issue-{number} feature/issue-{number}-{slug}
```

### Working Outside Repository Root

If CWD is not the repository root when starting:
```bash
# Find repository root
git rev-parse --show-toplevel
cd $(git rev-parse --show-toplevel)
```

---

## Scope

**Do**:
- Create isolated worktree for implementation
- Write tests validating acceptance criteria
- Create atomic commits
- Verify all acceptance criteria
- Push and cleanup worktree when complete
- Keep user informed of progress

**Don't**:
- Work directly on main branch
- Add features not in acceptance criteria
- Skip tests for "simple" changes
- Cleanup worktree if push failed (keep for debugging)
- Mix refactoring with feature changes in commits
