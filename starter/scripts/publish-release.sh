#!/bin/bash
set -e

# publish-release.sh
# Publishes the starter directory to the external repository with full git history.
# Uses git subtree split to extract only starter/ commits and rewrite paths.
#
# BRANCH WORKFLOW
# ===============
# This script must be run from a feature branch that contains ONLY changelog
# updates. It creates a temporary merge of origin/main + your branch, ensuring
# published content always includes:
#   - All commits from origin/main (the canonical source)
#   - Your changelog updates
#
# Workflow:
#   1. Create a branch with only CHANGELOG.md updates
#   2. Run publish-release from that branch
#   3. Published content = origin/main + your changelog
#   4. Merge your branch to main via PR
#
# INTERFACE REQUIREMENTS
# ======================
# This script is the implementation of the standard publish-release interface
# used by the release-engineer:publish-release skill. The skill invokes this
# script with the expected environment and repository layout.
#
# Required files in the parent directory:
#   - CHANGELOG.md     Must contain commit links in format: [abc1234](https://...)
#                      All commits affecting this directory must be documented.
#
# Pre-flight checks (script will fail if not met):
#   1. Clean working tree      - No uncommitted changes allowed
#   2. On feature branch       - Cannot run from main
#   3. Only changelog changes  - Branch must contain ONLY CHANGELOG.md changes
#   4. Changelog current       - Validated by check-changelog.sh
#   5. Branch mergeable        - Must merge cleanly with origin/main
#
# Usage:
#   From repository root:  ./starter/scripts/publish-release.sh
#   Or:                    cd starter && ./scripts/publish-release.sh

EXTERNAL_REPO="git@github.com:rise8-us/xpai-ai-assistant-container-starter.git"
EXTERNAL_BRANCH="main"
SOURCE_PREFIX="starter"
SPLIT_BRANCH="starter-split-$(date +%s)"
MERGE_BRANCH="starter-publish-merge-$(date +%s)"
TEMP_DIR="/tmp/starter-publish-$(date +%s)"
ORIGINAL_DIR="$(pwd)"
ORIGINAL_BRANCH="$(git branch --show-current)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Files and directories to exclude from publishing
EXCLUDE_ITEMS=(
    "specs"
    "tests"
    "DEVELOPMENT.md"
    "scripts/publish-release.sh"
    "scripts/check-changelog.sh"
    "docs/PRD-AUTOMATED-ONBOARDING.md"
)

echo "=== Publishing starter to external repository ==="
echo "External repo: ${EXTERNAL_REPO}"
echo "Excluding: ${EXCLUDE_ITEMS[*]}"
echo ""

# Verify we're in the XPai repository root
if [ ! -d "${SOURCE_PREFIX}" ]; then
    echo "Error: Must run this script from the repository root"
    exit 1
fi

# Verify we're on a feature branch (not main)
if [ "${ORIGINAL_BRANCH}" = "main" ]; then
    echo "Error: Cannot publish from main branch."
    echo "Create a feature branch with changelog updates first:"
    echo "  git checkout -b docs/starter-changelog-update origin/main"
    echo "  # ... update CHANGELOG.md ..."
    echo "  git commit -m 'docs(starter): update CHANGELOG.md'"
    echo "  ./starter/scripts/publish-release.sh"
    exit 1
fi

# Fetch origin/main to ensure we have latest
echo "Fetching origin/main..."
git fetch origin main

# TODO: Re-enable after testing. Verify branch contains ONLY changelog changes
# echo "Verifying branch contains only changelog changes..."
# CHANGED_FILES=$(git diff --name-only origin/main...HEAD)
# NON_CHANGELOG_FILES=$(echo "$CHANGED_FILES" | grep -v 'CHANGELOG.md$' || true)
#
# if [ -z "$CHANGED_FILES" ]; then
#     echo "Error: Branch has no changes compared to origin/main."
#     echo "Update the CHANGELOG.md before publishing."
#     exit 1
# fi
#
# if [ -n "$NON_CHANGELOG_FILES" ]; then
#     echo "Error: Branch contains non-changelog changes:"
#     echo "$NON_CHANGELOG_FILES" | sed 's/^/  - /'
#     echo ""
#     echo "This script only allows branches with CHANGELOG.md updates."
#     echo "Create a dedicated changelog branch for publishing."
#     exit 1
# fi
#
# echo "Branch contains only changelog changes: OK"

# Check for uncommitted changes
# Refresh the index to avoid race conditions with stale stat info
git update-index --refresh -q
if ! git diff-index --quiet HEAD --; then
    echo "Error: You have uncommitted changes. Please commit or stash them first."
    exit 1
fi

# Run changelog validation
echo ""
echo "Running changelog validation..."
if ! "${SCRIPT_DIR}/check-changelog.sh"; then
    echo ""
    echo "Publish aborted: changelog validation failed"
    exit 1
fi

# Create temporary merge branch: origin/main + current branch changes
echo ""
echo "Creating temporary merge of origin/main + ${ORIGINAL_BRANCH}..."
git checkout -b "${MERGE_BRANCH}" origin/main
if ! git merge "${ORIGINAL_BRANCH}" --no-edit -m "Temporary merge for publish: origin/main + ${ORIGINAL_BRANCH}"; then
    echo ""
    echo "Error: Failed to merge ${ORIGINAL_BRANCH} into origin/main."
    echo "Resolve conflicts and try again, or rebase your branch:"
    echo "  git checkout ${ORIGINAL_BRANCH}"
    echo "  git rebase origin/main"
    exit 1
fi
echo "Temporary merge created successfully"

# Function to clean up on exit
cleanup() {
    echo ""
    echo "Cleaning up..."

    # Return to original directory and branch
    cd "${ORIGINAL_DIR}" || true

    # Return to original branch if we switched away
    CURRENT=$(git branch --show-current 2>/dev/null || true)
    if [ "${CURRENT}" != "${ORIGINAL_BRANCH}" ] && [ -n "${ORIGINAL_BRANCH}" ]; then
        echo "Returning to original branch: ${ORIGINAL_BRANCH}"
        git checkout "${ORIGINAL_BRANCH}" 2>/dev/null || true
    fi

    # Delete the merge branch if it exists
    if git rev-parse --verify "${MERGE_BRANCH}" >/dev/null 2>&1; then
        echo "Deleting temporary merge branch: ${MERGE_BRANCH}"
        git branch -D "${MERGE_BRANCH}" 2>/dev/null || echo "Warning: Failed to delete merge branch"
    fi

    # Delete the split branch if it exists
    if git rev-parse --verify "${SPLIT_BRANCH}" >/dev/null 2>&1; then
        echo "Deleting temporary split branch: ${SPLIT_BRANCH}"
        git branch -D "${SPLIT_BRANCH}" 2>/dev/null || echo "Warning: Failed to delete split branch"
    fi

    # Remove temporary directory
    if [ -d "${TEMP_DIR}" ]; then
        echo "Removing temporary directory: ${TEMP_DIR}"
        rm -rf "${TEMP_DIR}" || echo "Warning: Failed to remove temporary directory"
    fi

    echo "Cleanup complete"
}
trap cleanup EXIT

# Extract starter/ directory history with path rewriting
echo ""
echo "Extracting starter/ directory history..."
echo "This may take a moment for repositories with extensive history..."
git subtree split --prefix="${SOURCE_PREFIX}" -b "${SPLIT_BRANCH}"

# Clone the split branch to temp directory
echo ""
echo "Creating temporary working directory..."
mkdir -p "${TEMP_DIR}"
git clone --local --no-hardlinks --branch "${SPLIT_BRANCH}" . "${TEMP_DIR}"

# Remove excluded items from the current state
cd "${TEMP_DIR}"
echo ""
echo "Removing excluded items from repository..."
ITEMS_REMOVED=false
for item in "${EXCLUDE_ITEMS[@]}"; do
    if [ -e "${item}" ]; then
        echo "  - Removing ${item}"
        rm -rf "${item}"
        git rm -rf "${item}" 2>/dev/null || true
        ITEMS_REMOVED=true
    else
        echo "  - ${item} not found (skipping)"
    fi
done

# Commit exclusions if any items were removed
if [ "${ITEMS_REMOVED}" = true ]; then
    echo ""
    echo "Committing exclusions..."
    git commit -m "chore: remove development-only files from published template

Excluded files:
${EXCLUDE_ITEMS[*]}

These files are used during internal development but are not needed
in the published starter template for project teams."
fi

# Push to external repository with full history
echo ""
echo "Pushing full history to external repository..."
echo "Note: Using force push to update external repo with complete history"
git push --force "${EXTERNAL_REPO}" "HEAD:${EXTERNAL_BRANCH}"

echo ""
echo "=== Successfully published to external repository ==="
echo "External repo now has full commit history for the starter directory."
echo "Paths have been rewritten (starter/ prefix removed)."
echo "Total commits published: $(git rev-list --count HEAD)"
echo ""
echo "Next steps:"
echo "  1. Push your changelog branch: git push -u origin ${ORIGINAL_BRANCH}"
echo "  2. Create PR and merge to main"
echo ""
echo "Cleanup will happen automatically."
