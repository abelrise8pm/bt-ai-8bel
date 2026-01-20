---
name: software-engineer-beta-delete-merged-local-branches
description: This skill should be used when the user asks to "clean up branches", "delete merged branches", "remove old branches", "prune local branches", or mentions cleaning up local git branches that have been merged.
version: 0.1.0
---

# Delete Merged Local Branches

Clean up local git branches that have merged PRs, handling both regular merges and squash merges.

## Why This Skill Exists

`git branch --merged` only detects branches merged via regular merge commits. Squash merges (common in GitHub workflows) leave local branches appearing unmerged. This skill checks PR status via GitHub CLI to accurately identify branches safe to delete.

## Usage

Run the cleanup script:

```bash
${CLAUDE_PLUGIN_ROOT}/skills/delete-merged-local-branches/scripts/cleanup-branches.sh
```

The script will:
1. Scan local branches and check PR status via `gh pr list`
2. Categorize as MERGED / OPEN / NO_PR
3. Show summary and prompt for confirmation
4. Switch away from current branch if needed
5. Delete branches with merged PRs

## Edge Cases

### No GitHub Remote

If `gh pr list` fails, fall back to `git branch --merged`:

```bash
git branch --merged main | grep -v '^\*' | grep -v 'main' | xargs git branch -d
```

This only catches regular merges, not squash merges.

### Protected Branches

The script never deletes: `main`, `master`, `develop`

### Branches Without PRs

Branches that were never pushed/PRed are flagged for manual review.

### Remote Tracking Branches

This skill handles local branches only. To prune remote-tracking references:

```bash
git fetch --prune
```
