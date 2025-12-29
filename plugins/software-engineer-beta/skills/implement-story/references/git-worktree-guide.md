# Git Worktree Guide

Git worktrees enable multiple working directories from a single repository, allowing parallel development on different branches without stashing or switching.

## Why Use Worktrees

- **Isolation**: Each implementation has its own working directory
- **Parallel work**: Work on multiple issues simultaneously
- **Clean state**: Start each implementation from a known base
- **Easy cleanup**: Remove the directory when done

## Directory and Branch Conventions

### Directory Convention

```
{repo_root}/.worktrees/issue-{number}/
```

Examples:
- `.worktrees/issue-123/`
- `.worktrees/issue-456/`

### Branch Convention

```
feature/issue-{number}-{slug}
```

Where `{slug}` is derived from the issue title:
- Lowercase
- Replace spaces and special characters with hyphens
- Remove consecutive hyphens
- Truncate to 50 characters

Examples:
- `feature/issue-123-add-user-authentication`
- `feature/issue-456-fix-payment-processing`

## Worktree Commands

### Track Main Workspace

Before creating a worktree, save the main workspace path:

```bash
MAIN_WORKSPACE=$(git rev-parse --show-toplevel)
```

### Create New Worktree

```bash
# Fetch latest from origin
git fetch origin

# Generate branch slug from issue title
slug=$(echo "{issue_title}" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//' | cut -c1-50)

# Create worktree with new branch from origin/main
git worktree add .worktrees/issue-{number} -b feature/issue-{number}-${slug} origin/main

# Enter the worktree
cd "$MAIN_WORKSPACE/.worktrees/issue-{number}"
```

### List Worktrees

```bash
git worktree list
```

Output example:
```
/path/to/repo                  abc1234 [main]
/path/to/repo/.worktrees/issue-123  def5678 [feature/issue-123-add-auth]
```

### Check for Existing Worktree

```bash
git worktree list | grep "issue-{number}"
```

### Reuse Existing Worktree

If a worktree exists for the issue:

```bash
cd "$MAIN_WORKSPACE/.worktrees/issue-{number}"
git fetch origin
git status
```

### Remove Worktree

After successful push:

```bash
cd "$MAIN_WORKSPACE"
git worktree remove .worktrees/issue-{number}
```

Force removal (if uncommitted changes already pushed):

```bash
git worktree remove --force .worktrees/issue-{number}
```

### Prune Stale Worktrees

Clean up worktrees whose directories were manually deleted:

```bash
git worktree prune
```

## Troubleshooting

### Branch Already Exists

If the branch already exists on remote:

```bash
# Check if branch exists
git branch -a | grep feature/issue-{number}

# Create worktree tracking existing remote branch
git fetch origin feature/issue-{number}-{slug}
git worktree add .worktrees/issue-{number} feature/issue-{number}-{slug}
```

### Worktree Directory Already Exists

```bash
# Check what's in the directory
ls -la .worktrees/issue-{number}

# If it's from a previous worktree, prune first
git worktree prune

# Then create fresh worktree
git worktree add .worktrees/issue-{number} -b feature/issue-{number}-{slug} origin/main
```

### Working Outside Repository Root

If current directory is not repository root:

```bash
# Find repository root
REPO_ROOT=$(git rev-parse --show-toplevel)
cd "$REPO_ROOT"
```

### Worktree Has Uncommitted Changes

Before removing a worktree with changes:

```bash
cd "$MAIN_WORKSPACE/.worktrees/issue-{number}"
git status

# If changes should be kept, commit and push first
git add -A
git commit -m "wip: save progress"
git push -u origin feature/issue-{number}-{slug}

# Then remove
cd "$MAIN_WORKSPACE"
git worktree remove .worktrees/issue-{number}
```

### Cannot Create Worktree (Locked)

If worktree is locked:

```bash
# Unlock worktree
git worktree unlock .worktrees/issue-{number}

# Then remove
git worktree remove .worktrees/issue-{number}
```

## Best Practices

### Always Track Main Workspace

Save `MAIN_WORKSPACE` at the start:

```bash
MAIN_WORKSPACE=$(git rev-parse --show-toplevel)
```

Use it for navigation:

```bash
cd "$MAIN_WORKSPACE"                           # Return to main
cd "$MAIN_WORKSPACE/.worktrees/issue-{number}" # Enter worktree
```

### Keep Worktrees Short-Lived

- Create worktree when starting implementation
- Remove worktree after successful push
- Don't leave worktrees lingering for weeks

### One Issue Per Worktree

Each worktree should focus on a single issue:
- Clear scope
- Easy cleanup
- No mixed changes

### Regular Cleanup

Periodically check for stale worktrees:

```bash
git worktree list
git worktree prune
```

### Handle Push Failures

If push fails:
- Keep the worktree for debugging
- Fix the issue
- Push again
- Only cleanup after successful push
