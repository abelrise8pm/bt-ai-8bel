#!/bin/bash

# Clean up script for XPai AI Assistant container
# This script stops and removes containers/images created by the container build

set -e

echo "Stopping XPai AI Assistant containers..."
if [ "$(podman ps -q --filter ancestor=localhost/xpai-base)" ]; then
    podman stop $(podman ps -q --filter ancestor=localhost/xpai-base)
    echo "Stopped XPai AI Assistant containers"
else
    echo "No running XPai AI Assistant containers found"
fi

echo "Removing XPai AI Assistant containers..."
if [ "$(podman ps -aq --filter ancestor=localhost/xpai-base)" ]; then
    podman rm $(podman ps -aq --filter ancestor=localhost/xpai-base)
    echo "Removed XPai AI Assistant containers"
else
    echo "No XPai AI Assistant containers to remove"
fi

echo "Removing XPai Base container images..."
if [ "$(podman images -q localhost/xpai-base)" ]; then
    podman rmi localhost/xpai-base
    echo "Removed XPai Base container images"
else
    echo "No XPai Base container images to remove"
fi

echo "XPai Base container cleanup complete!"