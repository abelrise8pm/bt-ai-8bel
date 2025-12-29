#!/usr/bin/env bash
set -eu

# Read hook input from stdin
input=$(cat)

# Extract tool name and command (if Bash)
tool_name=$(echo "$input" | jq -r '.tool_name // ""')
command=$(echo "$input" | jq -r '.tool_input.command // ""')

# Determine the git directory context based on the tool being used
# This enables support for git worktrees by checking the branch of the
# target file's repository, not the current working directory
git_dir="."

# Only check for Edit, Write, or git commit commands
case "$tool_name" in
  Edit|Write)
    # Extract target file path and use its directory for git context
    file_path=$(echo "$input" | jq -r '.tool_input.file_path // ""')
    if [[ -n "$file_path" ]]; then
      target_dir="$(dirname "$file_path")"
      if [[ -d "$target_dir" ]]; then
        git_dir="$target_dir"
      fi
    fi
    ;;
  Bash)
    if [[ ! "$command" =~ ^git\ commit ]]; then
      exit 0
    fi
    ;;
  *)
    exit 0
    ;;
esac

# Get current branch for the target file's git repository
# Using -C to run git commands in the context of the target directory
current_branch=$(git -C "$git_dir" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "")

if [[ -z "$current_branch" ]]; then
  exit 0  # Not in a git repo, allow
fi

# Check 1: Must not be on main
if [[ "$current_branch" == "main" ]]; then
  cat >&2 << 'EOF'
ERROR: Cannot work directly on 'main' branch.

Create a feature branch first:
  git fetch origin
  git checkout -b feature/your-feature origin/main
EOF
  exit 2
fi

# Check 2: Branch must be based on origin/main
if ! git -C "$git_dir" rev-parse --verify origin/main &>/dev/null; then
  exit 0  # No origin/main, skip this check
fi

if ! git -C "$git_dir" merge-base --is-ancestor origin/main HEAD 2>/dev/null; then
  cat >&2 << EOF
ERROR: Branch '$current_branch' is not based on origin/main.

Rebase your branch onto origin/main.

NOTE: Rebase rewrites history and can cause data loss if used incorrectly.
      Before rebasing:
        - Make sure you have no uncommitted changes (run: git status)
        - Consider backing up your branch (e.g.: git branch backup/$current_branch)

  git fetch origin
  git rebase origin/main
EOF
  exit 2
fi

exit 0
