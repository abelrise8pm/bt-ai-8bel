#!/bin/bash
################################################################################
# AI Assistant Container - Diagnostic Script
#
# PURPOSE: Quick diagnostic check for AI Assistant environment
# Run this when things aren't working to identify common issues.
#
# SYNC NOTE: This script should stay in sync with onboard.sh
# When updating onboard.sh phases, update the corresponding checks here.
# See: scripts/onboard.sh
################################################################################

set -uo pipefail  # Don't exit on error - we want to run all checks

# Color codes
readonly COLOR_RESET='\033[0m'
readonly COLOR_GREEN='\033[0;32m'
readonly COLOR_YELLOW='\033[1;33m'
readonly COLOR_RED='\033[0;31m'
readonly COLOR_CYAN='\033[0;36m'

echo ""
echo "🔍 AI Assistant Environment Diagnostic"
echo "======================================="
echo ""

# Track issues
issues_found=0
warnings_found=0

print_ok() {
    echo -e "${COLOR_GREEN}✅ $*${COLOR_RESET}"
}

print_warn() {
    echo -e "${COLOR_YELLOW}⚠️  $*${COLOR_RESET}"
    ((warnings_found++))
}

print_fail() {
    echo -e "${COLOR_RED}❌ $*${COLOR_RESET}"
    ((issues_found++))
}

print_fix() {
    echo -e "   ${COLOR_CYAN}Fix:${COLOR_RESET} $*"
}

################################################################################
# PHASE 0 CHECKS: Prerequisites
################################################################################
echo "--- Phase 0: Prerequisites ---"
echo ""

# Check: Architecture (ARM64)
echo -n "Architecture (ARM64): "
arch=$(uname -m)
if [[ "${arch}" == "arm64" ]]; then
    print_ok "ARM64 (Apple Silicon)"
else
    print_fail "Unsupported: ${arch}"
    echo "   This setup only supports Apple Silicon Macs (M1, M2, M3, M4)"
fi

# Check: OS (macOS)
echo -n "Operating System: "
os=$(uname -s)
if [[ "${os}" == "Darwin" ]]; then
    print_ok "macOS"
else
    print_fail "Unsupported: ${os}"
    echo "   This setup only supports macOS"
fi

# Check: Xcode CLI Tools
echo -n "Xcode CLI Tools: "
if xcode-select -p &> /dev/null; then
    print_ok "Installed"
else
    print_fail "NOT INSTALLED"
    print_fix "xcode-select --install"
fi

# Check: Git
echo -n "Git: "
if command -v git &> /dev/null; then
    print_ok "$(git --version | head -n1)"
else
    print_fail "NOT FOUND"
    print_fix "Install Xcode CLI Tools: xcode-select --install"
fi

echo ""

################################################################################
# PHASE 1 CHECKS: Homebrew
################################################################################
echo "--- Phase 1: Homebrew ---"
echo ""

echo -n "Homebrew installed: "
if command -v brew &> /dev/null; then
    print_ok "$(brew --version | head -n1)"
else
    print_fail "NOT FOUND"
    print_fix "./scripts/onboard.sh (or visit https://brew.sh)"
fi

echo ""

################################################################################
# PHASE 2 CHECKS: Tools
################################################################################
echo "--- Phase 2: Tools ---"
echo ""

# Check: Podman installed
echo -n "Podman installed: "
if command -v podman &> /dev/null; then
    print_ok "$(podman --version | head -n1)"
else
    print_fail "NOT FOUND"
    print_fix "brew install podman"
fi

# Check: Podman machine exists
echo -n "Podman machine exists: "
if command -v podman &> /dev/null && podman machine list 2>/dev/null | grep -q "podman-machine-default"; then
    print_ok "Found"
else
    print_fail "NOT FOUND"
    print_fix "podman machine init --cpus 6 --memory 16384"
fi

# Check: Podman machine running
echo -n "Podman machine running: "
if command -v podman &> /dev/null && podman machine list 2>/dev/null | grep -q "Currently running"; then
    print_ok "Running"
else
    print_fail "NOT RUNNING"
    print_fix "podman machine start"
fi

# Check: Podman auto-start configured
echo -n "Podman auto-start: "
if [[ -f "${HOME}/Library/LaunchAgents/com.podman.machine.plist" ]]; then
    print_ok "Configured"
else
    print_warn "Not configured (Podman won't start after reboot)"
    print_fix "./scripts/onboard.sh (or create LaunchAgent manually)"
fi

# Check: Docker symlink
echo -n "Docker symlink: "
if command -v docker &> /dev/null; then
    if [[ -L "$(command -v docker)" ]]; then
        link_target=$(readlink "$(command -v docker)")
        if [[ "${link_target}" == *"podman"* ]]; then
            print_ok "Symlinked to podman"
        else
            print_warn "Symlink exists but points to: ${link_target}"
        fi
    else
        print_warn "Docker installed independently (not symlink to podman)"
    fi
else
    print_fail "NOT FOUND"
    if command -v podman &> /dev/null; then
        print_fix "sudo ln -sf $(which podman) /usr/local/bin/docker"
    else
        print_fix "Install podman first, then create symlink"
    fi
fi

# Check: GitHub CLI
echo -n "GitHub CLI installed: "
if command -v gh &> /dev/null; then
    print_ok "$(gh --version | head -n1)"
else
    print_fail "NOT FOUND"
    print_fix "brew install gh"
fi

# Check: VS Code
echo -n "VS Code installed: "
if command -v code &> /dev/null; then
    print_ok "Found"
else
    if [[ -d "/Applications/Visual Studio Code.app" ]]; then
        print_warn "Installed but 'code' command not in PATH"
        print_fix "sudo ln -sf '/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code' /usr/local/bin/code"
    else
        print_fail "NOT FOUND"
        print_fix "brew install --cask visual-studio-code"
    fi
fi

echo ""

################################################################################
# PHASE 4 CHECKS: DevContainer
################################################################################
echo "--- Phase 4: DevContainer ---"
echo ""

# Check: .devcontainer folder
echo -n ".devcontainer folder: "
if [[ -d ".devcontainer" ]]; then
    print_ok "Found"
else
    print_fail "NOT FOUND"
    echo "   Are you in the repository root directory?"
    print_fix "cd to your project root (where .devcontainer/ exists)"
fi

# Check: devcontainer.json
echo -n "devcontainer.json: "
if [[ -f ".devcontainer/devcontainer.json" ]]; then
    print_ok "Found"
else
    print_fail "NOT FOUND"
    print_fix "./scripts/onboard.sh (or copy from devcontainer.no-cui.json)"
fi

echo ""

################################################################################
# PHASE 5 CHECKS: Environment
################################################################################
echo "--- Phase 5: Environment ---"
echo ""

# Check: .env file exists
echo -n ".env file exists: "
if [[ -f ".env" ]]; then
    print_ok "Found"

    # Check: .env permissions
    echo -n ".env permissions: "
    env_perms=$(stat -f "%Lp" ".env" 2>/dev/null || stat -c "%a" ".env" 2>/dev/null)
    if [[ "${env_perms}" == "600" ]]; then
        print_ok "Secure (600)"
    else
        print_warn "Insecure permissions: ${env_perms}"
        print_fix "chmod 600 .env"
    fi

    # Check: API key configured
    echo -n "ANTHROPIC_API_KEY: "
    if grep -q "^ANTHROPIC_API_KEY=sk-ant-api03-" .env 2>/dev/null; then
        print_ok "Configured"
    elif grep -q "^ANTHROPIC_API_KEY=$" .env 2>/dev/null; then
        print_fail "Empty (not set)"
        print_fix "Edit .env and add your API key"
    elif grep -q "^#ANTHROPIC_API_KEY=" .env 2>/dev/null; then
        print_fail "Commented out"
        print_fix "Uncomment ANTHROPIC_API_KEY line in .env"
    else
        print_fail "Not found or invalid format"
        print_fix "Add ANTHROPIC_API_KEY=sk-ant-api03-... to .env"
    fi
else
    print_fail "NOT FOUND"
    print_fix "./scripts/onboard.sh (or cp .env.example .env)"
fi

echo ""

################################################################################
# PHASE 6 CHECKS: GitHub Authentication
################################################################################
echo "--- Phase 6: GitHub Authentication ---"
echo ""

# Check: GitHub authenticated
echo -n "GitHub authenticated: "
if command -v gh &> /dev/null && gh auth status &> /dev/null; then
    gh_user=$(gh api user --jq .login 2>/dev/null || echo "unknown")
    print_ok "Logged in as: ${gh_user}"

    # Check: read:packages scope
    echo -n "read:packages scope: "
    if gh api user/packages?package_type=container &> /dev/null; then
        print_ok "Available"
    else
        print_warn "May be missing"
        print_fix "gh auth logout && gh auth login -s read:packages"
    fi
else
    print_fail "NOT AUTHENTICATED"
    print_fix "gh auth login -s read:packages"
fi

echo ""

################################################################################
# PHASE 7 CHECKS: Container Registry
################################################################################
echo "--- Phase 7: Container Registry ---"
echo ""

# Check: Podman authenticated to ghcr.io
echo -n "ghcr.io authenticated: "
if command -v podman &> /dev/null && podman login --get-login ghcr.io &> /dev/null; then
    registry_user=$(podman login --get-login ghcr.io 2>/dev/null || echo "unknown")
    print_ok "Logged in as: ${registry_user}"
else
    print_fail "NOT AUTHENTICATED"
    print_fix "gh auth token | podman login ghcr.io -u \$(gh api user --jq .login) --password-stdin"
fi

echo ""

################################################################################
# ADDITIONAL CHECKS
################################################################################
echo "--- Additional Checks ---"
echo ""

# Check: Zscaler running (informational)
echo -n "Zscaler running: "
if ps aux | grep -i "[Z]scaler" &> /dev/null; then
    print_ok "Running"
else
    print_warn "Not detected (OK if not using Zscaler)"
fi

# Check: Current directory is a git repo
echo -n "Git repository: "
if git rev-parse --git-dir &> /dev/null; then
    print_ok "Yes"
else
    print_warn "Not a git repository"
    echo "   Make sure you're in a cloned project directory"
fi

echo ""

################################################################################
# SUMMARY
################################################################################
echo "======================================="
echo ""

if [[ ${issues_found} -eq 0 ]] && [[ ${warnings_found} -eq 0 ]]; then
    echo -e "${COLOR_GREEN}✅ All checks passed! Your environment looks good.${COLOR_RESET}"
elif [[ ${issues_found} -eq 0 ]]; then
    echo -e "${COLOR_YELLOW}⚠️  ${warnings_found} warning(s) found (non-critical)${COLOR_RESET}"
    echo "   Your environment should work, but consider addressing warnings."
else
    echo -e "${COLOR_RED}❌ ${issues_found} issue(s) found${COLOR_RESET}"
    if [[ ${warnings_found} -gt 0 ]]; then
        echo -e "${COLOR_YELLOW}⚠️  ${warnings_found} warning(s) found${COLOR_RESET}"
    fi
    echo ""
    echo "To fix issues, run: ./scripts/onboard.sh"
fi

echo ""
echo "Need help? Ask in #r-and-d Slack channel"
echo ""
