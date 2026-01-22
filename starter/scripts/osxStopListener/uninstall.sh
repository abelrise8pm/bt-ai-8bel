#!/usr/bin/env bash
set -eu

# Uninstall Claude Code Stop Listener

PLIST_NAME="com.claude.stop-listener.plist"
TARGET_PLIST="${HOME}/Library/LaunchAgents/${PLIST_NAME}"
INSTALL_DIR="${HOME}/.local/share/claude-stop-listener"

echo "Uninstalling Claude Code Stop Listener..."

# Unload service if running
if launchctl list | grep -q "com.claude.stop-listener"; then
    echo "Stopping listener..."
    launchctl unload "${TARGET_PLIST}" 2>/dev/null || true
fi

# Remove plist
if [[ -f "${TARGET_PLIST}" ]]; then
    rm "${TARGET_PLIST}"
    echo "Removed ${TARGET_PLIST}"
fi

# Remove listener script
if [[ -d "${INSTALL_DIR}" ]]; then
    rm -rf "${INSTALL_DIR}"
    echo "Removed ${INSTALL_DIR}"
fi

echo ""
echo "✓ Claude Code Stop Listener uninstalled"
