#!/bin/bash

# Clean up script for XPai AI Assistant devcontainer
# This script stops and removes containers/images created by the devcontainer

set -e

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Build the devcontainer config path relative to script location
DEVCONTAINER_CONFIG="$SCRIPT_DIR/.devcontainer/devcontainer.json"

echo "Using devcontainer config: $DEVCONTAINER_CONFIG"

echo "Stopping XPai AI Assistant devcontainer containers..."
if [ "$(podman ps -q --filter label=devcontainer.config_file=$DEVCONTAINER_CONFIG)" ]; then
    podman stop $(podman ps -q --filter label=devcontainer.config_file=$DEVCONTAINER_CONFIG)
    echo "Stopped XPai AI Assistant devcontainer containers"
else
    echo "No running XPai AI Assistant devcontainer containers found"
fi

echo "Removing XPai AI Assistant devcontainer containers..."
if [ "$(podman ps -aq --filter label=devcontainer.config_file=$DEVCONTAINER_CONFIG)" ]; then
    podman rm $(podman ps -aq --filter label=devcontainer.config_file=$DEVCONTAINER_CONFIG)
    echo "Removed XPai AI Assistant devcontainer containers"
else
    echo "No XPai AI Assistant devcontainer containers to remove"
fi

echo "Removing XPai Base devcontainer images..."
if [ "$(podman images -q localhost/xpai-base)" ]; then
    podman rmi localhost/xpai-base
    echo "Removed XPai Base devcontainer images"
else
    echo "No XPai Base devcontainer images to remove"
fi

echo "XPai Base devcontainer cleanup complete!"