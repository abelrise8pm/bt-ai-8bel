#!/bin/bash
set -e

echo "Starting Claude Code software version update process..."
echo "Working directory: $(pwd)"
echo "Target: image/Dockerfile"
echo "Running release-engineer-beta:update-versions skill for image/Dockerfile"
claude -p "Use release-engineer-beta:update-versions for image/Dockerfile" --dangerously-skip-permissions
echo "Claude Code software version update completed successfully"
