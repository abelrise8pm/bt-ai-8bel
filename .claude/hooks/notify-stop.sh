#!/usr/bin/env bash
# Send notification to Mac host when Claude stops
# This hook is non-blocking and gracefully handles failures

# Get repo name from current directory
REPO_NAME=$(basename "$PWD")

curl -s -m 2 -X POST "http://host.containers.internal:9999/claude-stopped" \
  -H "Content-Type: application/json" \
  -d '{"event":"stop","repo":"'"${REPO_NAME}"'"}' \
  2>/dev/null || true

exit 0
