#!/bin/bash

# AI Assistant Container Integration Script
# This script integrates the AI assistant container setup into an existing repository
# Usage: ./integrate-ai-assistant.sh [target-repo-path]

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Function to prompt for confirmation
confirm() {
    local prompt="$1"
    local response
    read -p "$prompt (y/n): " response
    [[ "$response" =~ ^[Yy]$ ]]
}

# Function to check if files are different
files_differ() {
    local file1="$1"
    local file2="$2"

    # If either file doesn't exist, they differ
    [ ! -f "$file1" ] || [ ! -f "$file2" ] && return 0

    # Compare files
    ! cmp -s "$file1" "$file2"
}

# Get the script's directory and the starter directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# The starter directory is at the root level, parallel to scripts
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
STARTER_DIR="$REPO_ROOT/starter"

# Get target repository path
if [ $# -eq 0 ]; then
    print_error "Usage: $0 <target-repository-path>"
    echo "Example: $0 /Users/mike/workspace/rise8-internal"
    exit 1
fi

TARGET_DIR="$1"

# Validate target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    print_error "Target directory does not exist: $TARGET_DIR"
    exit 1
fi

# Validate it's a git repository
if [ ! -d "$TARGET_DIR/.git" ]; then
    print_error "Target directory is not a git repository: $TARGET_DIR"
    exit 1
fi

print_info "AI Assistant Container Integration Script"
print_info "========================================="
print_info "Starter repository: $STARTER_DIR"
print_info "Target repository: $TARGET_DIR"
print_info ""
print_info "This script is idempotent - safe to run multiple times."
print_info "Only changed files will be updated (backups created automatically)."
echo ""

# Start integration
print_info "Starting integration process..."
echo ""

# Track what was integrated
INTEGRATED=()
UPDATED=()
UNCHANGED=()

# 1. Copy .devcontainer directory (only essential files)
print_info "Integrating DevContainer configuration..."

mkdir -p "$TARGET_DIR/.devcontainer"
TARGET_DEVCONTAINER="$TARGET_DIR/.devcontainer/devcontainer.json"
SOURCE_DEVCONTAINER="$STARTER_DIR/.devcontainer/devcontainer.cui.json"

if files_differ "$SOURCE_DEVCONTAINER" "$TARGET_DEVCONTAINER"; then
    if [ -f "$TARGET_DEVCONTAINER" ]; then
        print_warning "Updating existing devcontainer.json (backup created)"
        cp "$TARGET_DEVCONTAINER" "$TARGET_DEVCONTAINER.backup"
    fi
    cp "$SOURCE_DEVCONTAINER" "$TARGET_DEVCONTAINER"
    print_success "DevContainer configuration updated (cui version)"
    INTEGRATED+=(".devcontainer")
    UPDATED+=(".devcontainer/devcontainer.json")
else
    print_info "DevContainer configuration already up-to-date"
    UNCHANGED+=(".devcontainer/devcontainer.json")
fi

# 2. Copy CLAUDE.md as example
print_info "Integrating CLAUDE.md configuration..."

if [ -f "$STARTER_DIR/CLAUDE.md" ]; then
    TARGET_CLAUDE="$TARGET_DIR/CLAUDE.md.example"
    SOURCE_CLAUDE="$STARTER_DIR/CLAUDE.md"

    if files_differ "$SOURCE_CLAUDE" "$TARGET_CLAUDE"; then
        if [ -f "$TARGET_CLAUDE" ]; then
            print_warning "Updating existing CLAUDE.md.example (backup created)"
            cp "$TARGET_CLAUDE" "$TARGET_CLAUDE.backup"
        fi
        cp "$SOURCE_CLAUDE" "$TARGET_CLAUDE"
        print_success "CLAUDE.md.example updated"
        print_info "Teams can create CLAUDE.md from the example when ready"
        INTEGRATED+=("CLAUDE.md.example")
        UPDATED+=("CLAUDE.md.example")
    else
        print_info "CLAUDE.md.example already up-to-date"
        UNCHANGED+=("CLAUDE.md.example")
    fi
else
    print_warning "CLAUDE.md not found in starter directory, skipping"
fi

# 3. Handle .env.example
print_info "Checking .env configuration..."
if [ ! -f "$TARGET_DIR/.env.example" ]; then
    cp "$STARTER_DIR/.env.example" "$TARGET_DIR/.env.example"
    print_success ".env.example created"
    INTEGRATED+=(".env.example")
    UPDATED+=(".env.example")
else
    # Check if it has ANTHROPIC_API_KEY
    if ! grep -q "ANTHROPIC_API_KEY" "$TARGET_DIR/.env.example"; then
        print_warning "Adding ANTHROPIC_API_KEY to existing .env.example"
        echo "" >> "$TARGET_DIR/.env.example"
        echo "# AI Assistant Configuration" >> "$TARGET_DIR/.env.example"
        grep "ANTHROPIC_API_KEY" "$STARTER_DIR/.env.example" >> "$TARGET_DIR/.env.example"
        INTEGRATED+=(".env.example")
        UPDATED+=(".env.example (added ANTHROPIC_API_KEY)")
    else
        print_info ".env.example already has ANTHROPIC_API_KEY configuration"
        UNCHANGED+=(".env.example")
    fi
fi

# 5. Handle GitHub workflows (optional)
print_info "Checking GitHub workflows..."
if [ -d "$TARGET_DIR/.github/workflows" ]; then
    print_warning "Existing workflows detected in target repository"
    echo "Available AI Assistant workflows:"
    echo "  - build-project-container.yml (Build custom container images)"
    echo "  - nightly-project-container-scan.yml (Security scanning)"
    echo "  - update-base-container-on-new-version.yml (Auto-update base image)"
    echo ""

    if confirm "Would you like to add AI Assistant workflows alongside existing ones?"; then
        # Copy workflows with ai-assistant- prefix
        for workflow in "$STARTER_DIR/.github/workflows"/*.yml; do
            basename=$(basename "$workflow")
            newname="ai-assistant-${basename}"
            cp "$workflow" "$TARGET_DIR/.github/workflows/$newname"
            print_success "Copied $basename as $newname"
        done

        # Also copy required actions and scripts
        print_info "Copying GitHub actions..."
        if [ ! -d "$TARGET_DIR/.github/actions" ]; then
            mkdir -p "$TARGET_DIR/.github/actions"
        fi
        cp -r "$STARTER_DIR/.github/actions"/* "$TARGET_DIR/.github/actions/" 2>/dev/null || true

        print_info "Copying GitHub scripts..."
        if [ ! -d "$TARGET_DIR/.github/scripts" ]; then
            cp -r "$STARTER_DIR/.github/scripts" "$TARGET_DIR/.github/"
            chmod +x "$TARGET_DIR/.github/scripts"/*.sh
        fi

        INTEGRATED+=("GitHub workflows (prefixed with ai-assistant-)")
    else
        print_info "Skipping GitHub workflows integration"
    fi
else
    print_info "No existing .github/workflows directory found"
    if confirm "Would you like to create .github/workflows and add AI Assistant workflows?"; then
        mkdir -p "$TARGET_DIR/.github/workflows"
        cp "$STARTER_DIR/.github/workflows"/*.yml "$TARGET_DIR/.github/workflows/"

        # Copy actions and scripts
        mkdir -p "$TARGET_DIR/.github/actions"
        cp -r "$STARTER_DIR/.github/actions"/* "$TARGET_DIR/.github/actions/" 2>/dev/null || true
        cp -r "$STARTER_DIR/.github/scripts" "$TARGET_DIR/.github/"
        chmod +x "$TARGET_DIR/.github/scripts"/*.sh

        print_success "GitHub workflows, actions, and scripts copied"
        INTEGRATED+=("GitHub workflows")
    fi
fi

# 6. Copy project-container example (optional)
print_info "Checking project container setup..."
if [ ! -d "$TARGET_DIR/project-container" ]; then
    if confirm "Would you like to add the project-container example for customization?"; then
        cp -r "$STARTER_DIR/project-container" "$TARGET_DIR/"
        print_success "Project container example copied"
        INTEGRATED+=("project-container")
    fi
else
    print_info "project-container directory already exists, skipping"
fi

# 7. Update .gitignore
print_info "Updating .gitignore..."
GITIGNORE_ENTRIES=(
    "# AI Assistant files"
    ".env"
    "ai-assistant-onboard.log"
    "*.backup"
)

if [ -f "$TARGET_DIR/.gitignore" ]; then
    for entry in "${GITIGNORE_ENTRIES[@]}"; do
        if ! grep -q "$entry" "$TARGET_DIR/.gitignore"; then
            echo "$entry" >> "$TARGET_DIR/.gitignore"
        fi
    done
    print_success ".gitignore updated"
else
    print_warning "No .gitignore found, creating one"
    printf "%s\n" "${GITIGNORE_ENTRIES[@]}" > "$TARGET_DIR/.gitignore"
fi

# Summary
echo ""
print_success "Integration complete!"
echo ""

if [ ${#UPDATED[@]} -gt 0 ]; then
    print_info "Files updated:"
    for item in "${UPDATED[@]}"; do
        echo "  ✓ $item"
    done
    echo ""
fi

if [ ${#UNCHANGED[@]} -gt 0 ]; then
    print_info "Files already up-to-date:"
    for item in "${UNCHANGED[@]}"; do
        echo "  ✓ $item"
    done
    echo ""
fi

if [ ${#UPDATED[@]} -eq 0 ] && [ ${#UNCHANGED[@]} -eq 0 ]; then
    print_info "No files were integrated (possible configuration issue)"
    echo ""
fi

print_info "Next steps:"
echo "  1. Navigate to your repository: cd $TARGET_DIR"

if [ ${#UPDATED[@]} -gt 0 ]; then
    echo "  2. Review and commit the changes:"
    echo "     git add ."
    echo "     git status"
    echo "     git commit -m \"Update AI Assistant container integration\""
    echo ""
    echo "  3. Set up your environment (if not already done):"
else
    echo "  2. Set up your environment (if not already done):"
fi

echo "     - Copy .env.example to .env (if not exists)"
echo "     - Add your ANTHROPIC_API_KEY to .env"
echo ""

if [ ${#UPDATED[@]} -gt 0 ]; then
    echo "  4. Open in VS Code and reopen in container:"
else
    echo "  3. Open in VS Code and reopen in container:"
fi

echo "     code ."
echo "     Then use 'Reopen in Container' when prompted"
echo ""

# Check if any backup files were created
BACKUP_FILES=$(find "$TARGET_DIR" -maxdepth 2 -name "*.backup" 2>/dev/null)
if [ -n "$BACKUP_FILES" ]; then
    print_warning "Backup files were created for files that changed:"
    echo "$BACKUP_FILES" | while read -r backup; do
        echo "  - $(basename "$backup")"
    done
    echo "  Review these backups and merge any necessary configurations"
    echo ""
fi

print_success "Happy coding with AI assistance! 🚀"