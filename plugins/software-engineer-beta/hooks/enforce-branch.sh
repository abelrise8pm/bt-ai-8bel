#!/usr/bin/env bash
set -eu

# Read hook input from stdin
input=$(cat)

# Extract tool name and command (if Bash)
tool_name=$(echo "$input" | jq -r '.tool_name // ""')
command=$(echo "$input" | jq -r '.tool_input.command // ""')

# Only check for Edit, Write, or git commit commands
case "$tool_name" in
  Edit|Write)
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

# Get current branch
current_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "")

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
if ! git rev-parse --verify origin/main &>/dev/null; then
  exit 0  # No origin/main, skip this check
fi

if ! git merge-base --is-ancestor origin/main HEAD 2>/dev/null; then
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
