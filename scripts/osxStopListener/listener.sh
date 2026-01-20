#!/usr/bin/env bash
# Claude Code Stop Listener
# Receives HTTP POST from container and shows macOS notification with repo name

PORT=9999
LOG_FILE="/tmp/claude-stop-listener.log"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

log "Listener started on port $PORT"

while true; do
  # Capture full request - nc will close when client disconnects after timeout
  # Use -d to not read from stdin (BSD nc on macOS)
  request=$(nc -l "$PORT" -d 2>/dev/null || nc -l "$PORT" 2>/dev/null)

  log "Received request: $request"

  # Extract repo name from JSON payload
  repo=$(echo "$request" | grep -ao '"repo":"[^"]*"' | head -1 | cut -d'"' -f4)

  log "Parsed repo: ${repo:-<empty>}"

  if [[ -n "$repo" ]]; then
    message="Finished: $repo"
  else
    message="Claude Code stopped"
  fi

  log "Showing notification: $message"

  # Show macOS notification
  osascript -e "display notification \"$message\" with title \"Claude Code\" sound name \"Glass\""
done
