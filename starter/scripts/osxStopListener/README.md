# macOS Notification Listener

Receive macOS notifications when Claude Code needs attention or finishes working.

## How It Works

```
┌─────────────────────────────────┐     HTTP POST      ┌─────────────────────────────┐
│  Container (Podman)             │ ──────────────────→│  Mac Host                   │
│                                 │                    │                             │
│  Claude needs input / stops     │   port 9999        │  LaunchAgent listener       │
│  → Hook runs                    │                    │  → macOS notification       │
│  → curl host.containers.internal│                    │                             │
└─────────────────────────────────┘                    └─────────────────────────────┘
```

The container has hooks that send HTTP POST requests to the Mac host:
- **Stop hook** (`.claude/hooks/notify-stop.sh`) - fires when Claude Code finishes
- **Attention hook** (`.claude/hooks/notify-attention.sh`) - fires when Claude needs user input (permission dialogs, questions)

## HTTP Interface

The listener accepts POST requests on port 9999 with a JSON payload:

```json
{
  "event": "stop|attention",
  "repo": "repository-name"
}
```

| Field | Type | Description |
|-------|------|-------------|
| `event` | string | Event type: `stop` or `attention` |
| `repo` | string | Repository/directory name where Claude is running |

| Event | Message | Sound |
|-------|---------|-------|
| `attention` | "Needs input: {repo}" | Ping |
| `stop` | "Finished: {repo}" | Glass |

## Installation

Run on your Mac:

```bash
./install.sh
```

## Uninstallation

```bash
./uninstall.sh
```

## Testing

From inside the container:

```bash
# Test stop notification
curl -s -X POST "http://host.containers.internal:9999/claude-stop" \
  -d '{"event":"stop","repo":"my-project"}'

# Test attention notification
curl -s -X POST "http://host.containers.internal:9999/claude-attention" \
  -d '{"event":"attention","repo":"my-project"}'
```

You should see macOS notifications:
- Stop: "Finished: my-project" with "Glass" sound
- Attention: "Needs input: my-project" with "Ping" sound

## Troubleshooting

**No notification appears:**
1. Check the listener is running: `launchctl list | grep claude`
2. Check for errors: `cat /tmp/claude-stop-listener.err`
3. Verify port 9999 is not in use: `lsof -i :9999`

**Port already in use:**
Edit the plist to change port 9999 to another port, and update `.claude/hooks/notify-stop.sh` to match.
