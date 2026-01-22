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

  # Extract event type and repo name from JSON payload
  event=$(echo "$request" | grep -ao '"event":"[^"]*"' | head -1 | cut -d'"' -f4)
  repo=$(echo "$request" | grep -ao '"repo":"[^"]*"' | head -1 | cut -d'"' -f4)

  log "Parsed event: ${event:-<empty>}, repo: ${repo:-<empty>}"

  # Determine message and sound based on event type
  case "$event" in
    attention)
      if [[ -n "$repo" ]]; then
        message="Needs input: $repo"
      else
        message="Claude Code needs input"
      fi
      sound="Ping"
      ;;
    stop|*)
      if [[ -n "$repo" ]]; then
        message="Finished: $repo"
      else
        message="Claude Code stopped"
      fi
      sound="Glass"
      ;;
  esac

  log "Showing notification: $message (sound: $sound)"

  # Show macOS notification
  osascript -e "display notification \"$message\" with title \"Claude Code\" sound name \"$sound\""
done
