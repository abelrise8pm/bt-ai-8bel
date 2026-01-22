#!/usr/bin/env bash
# Send notification to Mac host when Claude needs user attention
# This hook is non-blocking and gracefully handles failures
#
# Requires the listener daemon running on the host machine.
# See: scripts/osxStopListener/README.md

# Get repo name from current directory
REPO_NAME=$(basename "$PWD")

curl -s -m 2 -X POST "http://host.containers.internal:9999/claude-attention" \
  -H "Content-Type: application/json" \
  -d '{"event":"attention","repo":"'"${REPO_NAME}"'"}' \
  2>/dev/null || true

exit 0
