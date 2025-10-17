#!/bin/bash
set -e

# publish-to-external-repo.sh
# Publishes the ai-assistant-container-starter-repo to the external repository
# while excluding specified files and directories

EXTERNAL_REPO="git@github.com:rise8-us/xpai-ai-assistant-container-starter.git"
EXTERNAL_BRANCH="main"
SOURCE_PREFIX="ai-assistant-container-starter-repo"
TEMP_BRANCH="temp-publish-$(date +%s)"

# Files and directories to exclude from publishing
EXCLUDE_ITEMS=(
    "specs"
    "tests"
    "DEVELOPMENT.md"
    "publish-to-external-repo.sh"
)

echo "=== Publishing ai-assistant-container-starter-repo to external repository ==="
echo "External repo: ${EXTERNAL_REPO}"
echo "Excluding: ${EXCLUDE_ITEMS[*]}"
echo ""

# Verify we're in the XPai repository root
if [ ! -d "${SOURCE_PREFIX}" ]; then
    echo "Error: Must run this script from the XPai repository root"
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
if ! git diff-index --quiet HEAD --; then
    echo "Error: You have uncommitted changes. Please commit or stash them first."
    exit 1
fi

# Create temporary branch from current HEAD
echo "Creating temporary branch: ${TEMP_BRANCH}"
git branch "${TEMP_BRANCH}"

# Switch to temporary branch
echo "Switching to temporary branch"
git checkout "${TEMP_BRANCH}"

# Function to clean up on exit
cleanup() {
    echo ""
    echo "Cleaning up temporary branch..."
    git checkout "${CURRENT_BRANCH}"
    git branch -D "${TEMP_BRANCH}" 2>/dev/null || true
}
trap cleanup EXIT

# Remove excluded items
echo "Removing excluded items from temporary branch..."
for item in "${EXCLUDE_ITEMS[@]}"; do
    FULL_PATH="${SOURCE_PREFIX}/${item}"
    if [ -e "${FULL_PATH}" ]; then
        echo "  - Removing ${FULL_PATH}"
        git rm -rf "${FULL_PATH}"
    else
        echo "  - ${FULL_PATH} not found (skipping)"
    fi
done

# Commit the exclusions
echo "Committing exclusions..."
git commit -m "Temporary commit: Remove files for external publishing" --allow-empty

# Push using git subtree with force flag
# Since the external repo is read-only (destination only), force push is safe
echo ""
echo "Pushing to external repository..."
echo "This may take a while..."
echo "Note: Using force push since external repo is destination-only"

# git subtree doesn't support --force directly, so we use split + push
SUBTREE_COMMIT=$(git subtree split --prefix="${SOURCE_PREFIX}")
git push --force "${EXTERNAL_REPO}" "${SUBTREE_COMMIT}:${EXTERNAL_BRANCH}"

echo ""
echo "=== Successfully published to external repository ==="
echo "Temporary branch will be cleaned up automatically."
