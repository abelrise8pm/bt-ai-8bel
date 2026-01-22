#!/usr/bin/env bash
set -eu

# Install Claude Code Stop Listener as a macOS LaunchAgent
# This enables automatic notifications when Claude Code stops

PLIST_NAME="com.claude.stop-listener.plist"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_PLIST="${SCRIPT_DIR}/${PLIST_NAME}"
SOURCE_LISTENER="${SCRIPT_DIR}/listener.sh"

INSTALL_DIR="${HOME}/.local/share/claude-stop-listener"
TARGET_LISTENER="${INSTALL_DIR}/listener.sh"
TARGET_DIR="${HOME}/Library/LaunchAgents"
TARGET_PLIST="${TARGET_DIR}/${PLIST_NAME}"

echo "Installing Claude Code Stop Listener..."

# Create directories
mkdir -p "${INSTALL_DIR}"
mkdir -p "${TARGET_DIR}"

# Unload existing service if running
if launchctl list | grep -q "com.claude.stop-listener"; then
    echo "Stopping existing listener..."
    launchctl unload "${TARGET_PLIST}" 2>/dev/null || true
fi

# Copy listener script
cp "${SOURCE_LISTENER}" "${TARGET_LISTENER}"
chmod +x "${TARGET_LISTENER}"
echo "Installed listener to ${TARGET_LISTENER}"

# Copy plist and substitute path
sed "s|__LISTENER_PATH__|${TARGET_LISTENER}|g" "${SOURCE_PLIST}" > "${TARGET_PLIST}"
echo "Installed plist to ${TARGET_PLIST}"

# Load the service
launchctl load "${TARGET_PLIST}"

# Verify
if launchctl list | grep -q "com.claude.stop-listener"; then
    echo ""
    echo "✓ Claude Code Stop Listener installed and running"
    echo "  Listening on port 9999"
    echo "  Will start automatically on login"
else
    echo ""
    echo "✗ Failed to start listener. Check /tmp/claude-stop-listener.err for errors"
    exit 1
fi
