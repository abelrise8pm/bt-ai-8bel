#!/bin/bash
set -e

# check-changelog.sh
# Validates that all git commits affecting the starter directory are documented in CHANGELOG.md.
#
# INTERFACE REQUIREMENTS
# ======================
# This script validates changelog completeness for the release-engineer workflow.
# It can be run standalone to verify changelog coverage before committing.
#
# Required files in the parent directory:
#   - CHANGELOG.md     Must contain commit links in format: [abc1234](https://...)
#                      All commits affecting this directory must be documented.
#
# Exit codes:
#   0 - All commits are documented
#   1 - Undocumented commits found or validation error
#
# Usage:
#   From repository root:  ./starter/scripts/check-changelog.sh
#   Or:                    cd starter && ./scripts/check-changelog.sh

# Determine the source directory (starter/)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_PREFIX="$(basename "$(dirname "$SCRIPT_DIR")")"

# If we're in the starter directory, go up to repo root
if [ "$(basename "$(pwd)")" = "${SOURCE_PREFIX}" ]; then
    cd ..
fi

# Verify we're in the repository root with the source prefix directory
if [ ! -d "${SOURCE_PREFIX}" ]; then
    echo "Error: Cannot find ${SOURCE_PREFIX}/ directory"
    echo "Run this script from the repository root or from ${SOURCE_PREFIX}/"
    exit 1
fi

CHANGELOG_PATH="${SOURCE_PREFIX}/CHANGELOG.md"

if [ ! -f "${CHANGELOG_PATH}" ]; then
    echo "Error: ${CHANGELOG_PATH} not found"
    exit 1
fi

echo "Validating ${CHANGELOG_PATH} is current..."

# Get all commit SHAs mentioned in CHANGELOG.md (7-char short SHAs in commit links)
DOCUMENTED_SHAS=$(grep -oE '\[([a-f0-9]{7})\]\(' "${CHANGELOG_PATH}" | sed 's/\[\(.*\)\](/\1/')

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
    echo "ERROR: CHANGELOG.md is out of date!"
    echo ""
    echo "The following commits to ${SOURCE_PREFIX}/ are not documented in CHANGELOG.md:"
    echo ""

    for sha in "${UNDOCUMENTED[@]}"; do
        git --no-pager log -1 --oneline "$sha" -- "${SOURCE_PREFIX}/"
    done

    echo ""
    echo "Please update ${CHANGELOG_PATH} with these changes."
    echo ""
    echo "Steps to update:"
    echo "  1. Use release-engineer:update-changelog for ${SOURCE_PREFIX}/"
    echo "  2. Review the generated entries"
    echo "  3. Commit the updated CHANGELOG.md"
    echo "  4. Run this script again"
    echo ""
    exit 1
fi

echo "CHANGELOG.md is current (all commits documented)"
exit 0
