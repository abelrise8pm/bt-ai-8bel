---
name: software-engineer-beta-implement-story
description: This skill should be used when the user asks to "implement issue", "implement story", "work on issue", "start issue", or provides a GitHub issue URL to implement. Creates an isolated git worktree, implements the story with tests, commits, pushes, and cleans up.
version: 0.1.0
---

# Story Implementation

Implement a GitHub issue in an isolated git worktree following clean code principles with automated testing.

## Input

GitHub issue URL or reference:
- Full URL: `https://github.com/owner/repo/issues/123`
- Short format: `owner/repo#123`
- Issue number (if repo context known): `#123` or `123`

## Workflow Overview

1. **Fetch story and comments** - Read ALL comments first, then understand requirements
2. **Setup worktree** - Create isolated branch and working directory
3. **Plan implementation** - Break down into tasks (unless comments already contain a plan)
4. **Implement** - Write tests, code, and verify
5. **Push and cleanup** - Push branch and remove worktree

---

## 1. Fetch and Understand the Story

```bash
gh issue view {number} --repo {owner}/{repo} --json title,body,labels,comments
```

### Read Comments First

**CRITICAL**: Before doing ANY research or planning, read ALL comments on the issue. Comments often contain:
- **Research already done** - Don't duplicate work that's already been completed
- **Decisions made** - Implementation approach may already be decided
- **Implementation plans** - Step-by-step guidance from prior analysis
- **Clarifications** - Answers to questions about the original requirements
- **Context** - Why certain approaches were chosen or rejected

If comments contain a decision or implementation plan, **follow it** rather than starting from scratch.

### Extract from Issue Body

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

Follow test-driven implementation: write test, see it fail, implement, see it pass, refactor.

For each acceptance criterion:
1. Write test capturing the criterion
2. Run test (should fail)
3. Implement minimum code to pass
4. Run test (should pass)
5. Refactor if needed

```bash
{test_command}  # e.g., npm test, pytest, go test
```

See `references/testing-philosophy.md` for testing pyramid, naming conventions, and best practices.

---

## 6. Commit Strategy

Follow atomic commit principles. **Never mix structural and behavioral changes.**

```bash
# Structural changes (refactoring)
git commit -m "refactor(scope): {what changed}"

# Behavioral changes (features)
git commit -m "feat(scope): {what capability was added}"
```

Types: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`

See `references/commit-conventions.md` for detailed format and examples.

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

### Worktree Issues

See `references/git-worktree-guide.md` for troubleshooting:
- Branch already exists
- Worktree directory already exists
- Uncommitted changes blocking removal

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

---

## Additional Resources

### Reference Files

For detailed guidance on specific topics:

- **`references/testing-philosophy.md`** - Testing pyramid, test naming, AAA pattern, common antipatterns
- **`references/commit-conventions.md`** - Conventional commits format, atomic commits, examples
- **`references/git-worktree-guide.md`** - Worktree commands, troubleshooting, best practices
