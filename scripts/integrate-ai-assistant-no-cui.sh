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
echo ""

# Check for existing files and warn user
print_info "Checking for existing files in target repository..."

CONFLICTS=()
[ -d "$TARGET_DIR/.devcontainer" ] && CONFLICTS+=(".devcontainer")
[ -f "$TARGET_DIR/CLAUDE.md" ] && CONFLICTS+=("CLAUDE.md")
[ -f "$TARGET_DIR/.mcp.json" ] && CONFLICTS+=(".mcp.json")

if [ ${#CONFLICTS[@]} -gt 0 ]; then
    print_warning "The following files/directories already exist in target:"
    for conflict in "${CONFLICTS[@]}"; do
        echo "  - $conflict"
    done
    echo ""
    if ! confirm "Do you want to proceed? Existing files will be backed up"; then
        print_info "Integration cancelled"
        exit 0
    fi
fi

# Start integration
print_info "Starting integration process..."
echo ""

# Track what was integrated
INTEGRATED=()

# 1. Copy .devcontainer directory (only essential files)
print_info "Integrating DevContainer configuration..."
if [ -d "$TARGET_DIR/.devcontainer" ]; then
    print_warning "Backing up existing .devcontainer to .devcontainer.backup"
    mv "$TARGET_DIR/.devcontainer" "$TARGET_DIR/.devcontainer.backup"
fi

# Create .devcontainer directory and copy only the no-cui version as default
mkdir -p "$TARGET_DIR/.devcontainer"
cp "$STARTER_DIR/.devcontainer/devcontainer.no-cui.json" "$TARGET_DIR/.devcontainer/devcontainer.json"

print_success "DevContainer configuration copied (no-cui version)"
INTEGRATED+=(".devcontainer")

# 2. Copy CLAUDE.md.example only
print_info "Integrating CLAUDE.md configuration..."

# Copy the example file for reference
cp "$STARTER_DIR/CLAUDE.md.example" "$TARGET_DIR/CLAUDE.md.example"
print_success "CLAUDE.md.example copied for reference"
print_info "Teams can create CLAUDE.md from the example when ready"
INTEGRATED+=("CLAUDE.md.example")

# 3. Copy .mcp.json if it doesn't exist
print_info "Integrating MCP configuration..."
if [ -f "$TARGET_DIR/.mcp.json" ]; then
    print_warning "Backing up existing .mcp.json to .mcp.json.backup"
    mv "$TARGET_DIR/.mcp.json" "$TARGET_DIR/.mcp.json.backup"
fi
cp "$STARTER_DIR/.mcp.json" "$TARGET_DIR/"
print_success "MCP configuration copied"
INTEGRATED+=(".mcp.json")

# 4. Handle .env.example
print_info "Checking .env configuration..."
if [ ! -f "$TARGET_DIR/.env.example" ]; then
    cp "$STARTER_DIR/.env.example" "$TARGET_DIR/.env.example"
    print_success ".env.example copied"
    INTEGRATED+=(".env.example")
else
    # Check if it has ANTHROPIC_API_KEY
    if ! grep -q "ANTHROPIC_API_KEY" "$TARGET_DIR/.env.example"; then
        print_warning "Adding ANTHROPIC_API_KEY to existing .env.example"
        echo "" >> "$TARGET_DIR/.env.example"
        echo "# AI Assistant Configuration" >> "$TARGET_DIR/.env.example"
        grep "ANTHROPIC_API_KEY" "$STARTER_DIR/.env.example" >> "$TARGET_DIR/.env.example"
        INTEGRATED+=(".env.example (updated)")
    else
        print_info ".env.example already has ANTHROPIC_API_KEY configuration"
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
print_info "Files/directories integrated:"
for item in "${INTEGRATED[@]}"; do
    echo "  ✓ $item"
done

echo ""
print_info "Next steps:"
echo "  1. Navigate to your repository: cd $TARGET_DIR"
echo "  2. Review and commit the changes:"
echo "     git add ."
echo "     git status"
echo "     git commit -m \"Add AI Assistant container integration\""
echo ""
echo "  3. Set up your environment:"
echo "     - Copy .env.example to .env"
echo "     - Add your ANTHROPIC_API_KEY to .env"
echo ""
echo "  4. Open in VS Code and reopen in container:"
echo "     code ."
echo "     Then use 'Reopen in Container' when prompted"
echo ""

if [ ${#CONFLICTS[@]} -gt 0 ]; then
    print_warning "Backup files were created:"
    for conflict in "${CONFLICTS[@]}"; do
        echo "  - $conflict.backup"
    done
    echo "  Review these backups and merge any necessary configurations"
fi

print_success "Happy coding with AI assistance! 🚀"