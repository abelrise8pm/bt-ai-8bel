#!/bin/bash
set -e

# publish-to-external-repo.sh
# Publishes the starter directory to the external repository as a single commit
# This gives project teams a clean slate without inheriting development history

EXTERNAL_REPO="git@github.com:rise8-us/xpai-ai-assistant-container-starter.git"
EXTERNAL_BRANCH="main"
SOURCE_PREFIX="starter"
TEMP_DIR="/tmp/starter-publish-$(date +%s)"

# Files and directories to exclude from publishing
EXCLUDE_ITEMS=(
    "specs"
    "tests"
    "DEVELOPMENT.md"
    "publish-to-external-repo.sh"
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
if ! git diff-index --quiet HEAD --; then
    echo "Error: You have uncommitted changes. Please commit or stash them first."
    exit 1
fi

# Function to clean up on exit
cleanup() {
    echo ""
    echo "Cleaning up temporary directory..."
    rm -rf "${TEMP_DIR}"
}
trap cleanup EXIT

# Create temporary directory and copy starter content
echo "Creating temporary directory: ${TEMP_DIR}"
mkdir -p "${TEMP_DIR}"

echo "Copying starter content (git-tracked files only)..."
# Use git archive to copy only files tracked in git
git archive --format=tar HEAD:"${SOURCE_PREFIX}" | tar -x -C "${TEMP_DIR}"

# Remove excluded items from temp directory
echo "Removing excluded items..."
for item in "${EXCLUDE_ITEMS[@]}"; do
    if [ -e "${TEMP_DIR}/${item}" ]; then
        echo "  - Removing ${item}"
        rm -rf "${TEMP_DIR}/${item}"
    else
        echo "  - ${item} not found (skipping)"
    fi
done

# Initialize git repo in temp directory
cd "${TEMP_DIR}"
git init -b main
git add .

# Create a single clean commit for the starter template
COMMIT_MSG="Initial commit: AI Assistant Container Starter Template

This is a starter template for project teams using the AI Assistant Container.
For development history, see: https://github.com/rise8-us/xpai-ai-assistant-container"

echo "Creating single commit..."
git commit -m "${COMMIT_MSG}"

# Push to external repository
echo ""
echo "Pushing to external repository..."
echo "Note: Using force push to maintain single commit"

git push --force "${EXTERNAL_REPO}" "HEAD:${EXTERNAL_BRANCH}"

echo ""
echo "=== Successfully published to external repository ==="
echo "External repo now has a single clean commit."
echo "Temporary directory will be cleaned up automatically."
