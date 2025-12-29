# Error Handling Guide

## Cannot Access PR

```bash
# Check gh auth status
gh auth status
```

Verify GitHub CLI is authenticated and has access to the repository.

## Cannot Push to Branch

- Verify on the correct branch
- Check branch protection rules
- Document the issue in output, don't block

## Conflicting Feedback

When reviewers disagree:
- Make best judgment call
- Document both perspectives in commit message
- Let humans decide on GitHub

## No Unresolved Feedback

Report: "All review threads are resolved. No action needed."

- Do NOT create an empty commit
- If user wants to re-analyze resolved threads, use `--all` flag

## No Feedback At All

Report: "No review comments found on this PR."

- Do NOT create an empty commit
- Clean up worktree if created

## Worktree Creation Fails

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

## Working Outside Repository Root

If CWD is not the repository root when starting:

```bash
# Find repository root first
MAIN_WORKSPACE=$(git rev-parse --show-toplevel)
cd "$MAIN_WORKSPACE"
```

## Push Fails

Keep the worktree for debugging:

> Push failed. Keeping worktree at `.worktrees/pr-{number}` for debugging.
> Error: {error_message}

## Worktree Cleanup Fails

If cleanup fails due to uncommitted changes:

```bash
# Force removal if changes are already pushed
git worktree remove --force .worktrees/pr-{number}
```
