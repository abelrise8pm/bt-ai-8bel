#!/usr/bin/env bash
set -eu

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Protected branches that should never be deleted
PROTECTED_BRANCHES="main master develop"

echo "Scanning local branches for merged PRs..."
echo ""

# Get current branch
current_branch=$(git branch --show-current)

# Arrays to track branches
declare -a merged_branches=()
declare -a open_branches=()
declare -a no_pr_branches=()

# Get all local branches except protected ones
for branch in $(git branch --format='%(refname:short)'); do
  # Skip protected branches
  if echo "$PROTECTED_BRANCHES" | grep -qw "$branch"; then
    continue
  fi

  # Query GitHub for PR status
  pr_info=$(gh pr list --state all --head "$branch" --json number,state,title 2>/dev/null || echo "[]")

  if [ "$pr_info" = "[]" ]; then
    no_pr_branches+=("$branch")
  else
    state=$(echo "$pr_info" | jq -r '.[0].state // "UNKNOWN"')
    number=$(echo "$pr_info" | jq -r '.[0].number // "?"')

    case "$state" in
      MERGED)
        merged_branches+=("$branch|#$number")
        ;;
      OPEN)
        open_branches+=("$branch|#$number")
        ;;
      *)
        no_pr_branches+=("$branch")
        ;;
    esac
  fi
done

# Display results
echo "=== Branch Status ==="
echo ""

if [ ${#merged_branches[@]} -gt 0 ]; then
  echo -e "${GREEN}MERGED (will delete):${NC}"
  for item in "${merged_branches[@]}"; do
    branch="${item%|*}"
    pr="${item#*|}"
    marker=""
    [ "$branch" = "$current_branch" ] && marker=" (current)"
    echo "  - $branch ($pr)$marker"
  done
  echo ""
fi

if [ ${#open_branches[@]} -gt 0 ]; then
  echo -e "${YELLOW}OPEN (keeping):${NC}"
  for item in "${open_branches[@]}"; do
    branch="${item%|*}"
    pr="${item#*|}"
    echo "  - $branch ($pr)"
  done
  echo ""
fi

if [ ${#no_pr_branches[@]} -gt 0 ]; then
  echo -e "${RED}NO PR (manual review needed):${NC}"
  for branch in "${no_pr_branches[@]}"; do
    echo "  - $branch"
  done
  echo ""
fi

# Exit if nothing to delete
if [ ${#merged_branches[@]} -eq 0 ]; then
  echo "No merged branches to delete."
  exit 0
fi

# Confirm deletion
echo -n "Delete ${#merged_branches[@]} merged branch(es)? [y/N] "
read -r confirm
if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
  echo "Aborted."
  exit 0
fi

# Switch from current branch if it's being deleted
for item in "${merged_branches[@]}"; do
  branch="${item%|*}"
  if [ "$branch" = "$current_branch" ]; then
    echo "Switching from $current_branch to main..."
    git checkout main
    break
  fi
done

# Delete merged branches
echo ""
echo "Deleting branches..."
for item in "${merged_branches[@]}"; do
  branch="${item%|*}"
  pr="${item#*|}"
  if git branch -D "$branch" 2>/dev/null; then
    echo -e "${GREEN}Deleted${NC} $branch ($pr)"
  else
    echo -e "${RED}Failed to delete${NC} $branch"
  fi
done

echo ""
echo "Done."
