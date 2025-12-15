#!/bin/bash
set -e

# publish-to-external-repo.sh
# Publishes the starter directory to the external repository with full git history
# Uses git subtree split to extract only starter/ commits and rewrite paths

EXTERNAL_REPO="git@github.com:rise8-us/xpai-ai-assistant-container-starter.git"
EXTERNAL_BRANCH="main"
SOURCE_PREFIX="starter"
SPLIT_BRANCH="starter-split-$(date +%s)"
TEMP_DIR="/tmp/starter-publish-$(date +%s)"
ORIGINAL_DIR="$(pwd)"

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
# Refresh the index to avoid race conditions with stale stat info
git update-index --refresh -q
if ! git diff-index --quiet HEAD --; then
    echo "Error: You have uncommitted changes. Please commit or stash them first."
    exit 1
fi

# Validate CHANGELOG.md is up-to-date
echo ""
echo "Validating CHANGELOG.md is current..."

# Get all commit SHAs mentioned in CHANGELOG.md (7-char short SHAs in commit links)
DOCUMENTED_SHAS=$(grep -oE '\[([a-f0-9]{7})\]\(' "${SOURCE_PREFIX}/CHANGELOG.md" | sed 's/\[\(.*\)\](/\1/')

if [ -z "${DOCUMENTED_SHAS}" ]; then
    echo "Error: No commit SHAs found in CHANGELOG.md"
    echo "CHANGELOG should contain commit links like: [abc1234](https://...)"
    exit 1
fi

# Find the most recent documented commit (first one that appears in git log AND is in changelog)
LATEST_DOCUMENTED=""
while IFS= read -r sha; do
    # Check if this SHA is in the documented list
    if echo "${DOCUMENTED_SHAS}" | grep -q "^${sha}$"; then
        LATEST_DOCUMENTED="$sha"
        break
    fi
done <<< "$(git log --format="%h" -- "${SOURCE_PREFIX}/")"

if [ -z "${LATEST_DOCUMENTED}" ]; then
    echo "Error: Could not find any documented commits in git history"
    exit 1
fi

echo "Latest documented commit: ${LATEST_DOCUMENTED}"

# Get all commits after the latest documented one
ALL_UNDOCUMENTED=($(git log --format="%h" "${LATEST_DOCUMENTED}..HEAD" -- "${SOURCE_PREFIX}/" 2>/dev/null))

# Filter out commits that ONLY touch CHANGELOG.md (these are changelog update commits)
UNDOCUMENTED=()
for sha in "${ALL_UNDOCUMENTED[@]}"; do
    # Get list of files changed in this commit
    FILES_CHANGED=$(git diff-tree --no-commit-id --name-only -r "$sha" -- "${SOURCE_PREFIX}/" | sed "s|^${SOURCE_PREFIX}/||")

    # If the commit changes files other than just CHANGELOG.md, it needs to be documented
    if [ "$FILES_CHANGED" != "CHANGELOG.md" ]; then
        UNDOCUMENTED+=("$sha")
    else
        echo "Skipping CHANGELOG-only commit: $(git log -1 --oneline "$sha")"
    fi
done

# If there are undocumented commits (excluding CHANGELOG-only commits), show them and fail
if [ ${#UNDOCUMENTED[@]} -gt 0 ]; then
    echo ""
    echo "❌ ERROR: CHANGELOG.md is out of date!"
    echo ""
    echo "The following commits to starter/ are not documented in CHANGELOG.md:"
    echo ""

    for sha in "${UNDOCUMENTED[@]}"; do
        git --no-pager log -1 --oneline "$sha" -- "${SOURCE_PREFIX}/"
    done

    echo ""
    echo "Please update starter/CHANGELOG.md with these changes before publishing."
    echo ""
    echo "Steps to update:"
    echo "  1. Run: /update-starter-changelog"
    echo "  2. Review the generated entries"
    echo "  3. Commit the updated CHANGELOG.md"
    echo "  4. Run this script again"
    echo ""
    exit 1
fi

echo "✅ CHANGELOG.md is current (all commits documented)"

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
            echo "✅ Split branch deleted successfully"
        else
            echo "⚠️  Failed to delete split branch ${SPLIT_BRANCH}"
        fi
    else
        echo "Split branch ${SPLIT_BRANCH} not found (may have been deleted already)"
    fi

    # Remove temporary directory
    if [ -d "${TEMP_DIR}" ]; then
        echo "Removing temporary directory: ${TEMP_DIR}"
        if rm -rf "${TEMP_DIR}"; then
            echo "✅ Temporary directory removed successfully"
        else
            echo "⚠️  Failed to remove temporary directory"
        fi
    fi

    echo "✅ Cleanup complete"
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
