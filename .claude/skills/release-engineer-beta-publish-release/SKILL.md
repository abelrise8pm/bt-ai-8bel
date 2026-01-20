---
name: release-engineer-beta-publish-release
description: Publish a release for a directory by running its scripts/publish-release.sh. Use when publishing, releasing, or deploying a component.
---

# Publish Release

Run the publish script for a directory.

## Input

**Required**: Directory path (e.g., `starter/`)

## Workflow

1. Verify `{directory}/scripts/publish-release.sh` exists
2. Run from repository root: `./{directory}/scripts/publish-release.sh`
3. The script handles all validation (clean tree, changelog current) and provides actionable error messages

## Note

This skill cannot execute shell scripts directly. Provide the command for the user to run:

```bash
./{directory}/scripts/publish-release.sh
```

If the script fails due to undocumented commits, guide user to run `release-engineer:update-changelog` first.
