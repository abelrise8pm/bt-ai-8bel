#!/bin/bash
set -e

# publish-release.sh
# Publishes the starter directory to the external repository with full git history.
# Uses git subtree split to extract only starter/ commits and rewrite paths.
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
#   1. Clean working tree    - No uncommitted changes allowed
#   2. Changelog current     - Validated by check-changelog.sh
#   3. On main branch        - Warning if not on main (can override)
#
# Usage:
#   From repository root:  ./starter/scripts/publish-release.sh
#   Or:                    cd starter && ./scripts/publish-release.sh

EXTERNAL_REPO="git@github.com:rise8-us/xpai-ai-assistant-container-starter.git"
EXTERNAL_BRANCH="main"
SOURCE_PREFIX="starter"
SPLIT_BRANCH="starter-split-$(date +%s)"
TEMP_DIR="/tmp/starter-publish-$(date +%s)"
ORIGINAL_DIR="$(pwd)"
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

# Verify we're on the main branch and up to date
CURRENT_BRANCH=$(git branch --show-current)
if [ "${CURRENT_BRANCH}" != "main" ]; then
    echo "Warning: You are on branch '${CURRENT_BRANCH}', not 'main'"
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

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

# Function to clean up on exit
cleanup() {
    echo ""
    echo "Cleaning up..."

    # Return to original directory to delete the split branch
    cd "${ORIGINAL_DIR}" || true

    # Delete the split branch if it exists
    if git rev-parse --verify "${SPLIT_BRANCH}" >/dev/null 2>&1; then
        echo "Deleting temporary split branch: ${SPLIT_BRANCH}"
        if git branch -D "${SPLIT_BRANCH}" 2>/dev/null; then
            echo "Split branch deleted successfully"
        else
            echo "Warning: Failed to delete split branch ${SPLIT_BRANCH}"
        fi
    else
        echo "Split branch ${SPLIT_BRANCH} not found (may have been deleted already)"
    fi

    # Remove temporary directory
    if [ -d "${TEMP_DIR}" ]; then
        echo "Removing temporary directory: ${TEMP_DIR}"
        if rm -rf "${TEMP_DIR}"; then
            echo "Temporary directory removed successfully"
        else
            echo "Warning: Failed to remove temporary directory"
        fi
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
git clone --local --branch "${SPLIT_BRANCH}" . "${TEMP_DIR}"

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
echo "Cleanup will happen automatically."
