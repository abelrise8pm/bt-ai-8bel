# macOS Stop Listener

Receive macOS notifications when Claude Code stops in a container.

## How It Works

```
┌─────────────────────────────────┐     HTTP POST      ┌─────────────────────────────┐
│  Container (Podman)             │ ──────────────────→│  Mac Host                   │
│                                 │                    │                             │
│  Claude stops                   │   port 9999        │  LaunchAgent listener       │
│  → Stop hook runs               │                    │  → macOS notification       │
│  → curl host.containers.internal│                    │                             │
└─────────────────────────────────┘                    └─────────────────────────────┘
```

The container has a Stop hook (`.claude/hooks/notify-stop.sh`) that sends an HTTP POST to the Mac host when Claude Code stops. This listener receives that request and shows a macOS notification.

## HTTP Interface

The listener accepts POST requests on port 9999 with a JSON payload:

```json
{
  "event": "stop",
  "repo": "repository-name"
}
```

| Field | Type | Description |
|-------|------|-------------|
| `event` | string | Event type (currently only `stop`) |
| `repo` | string | Repository/directory name where Claude was running |

The notification displays "Finished: {repo}" when a repo name is provided.

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
curl -s -X POST "http://host.containers.internal:9999/claude-stopped" \
  -d '{"event":"stop","repo":"my-project"}'
```

You should see a macOS notification showing "Finished: my-project" with the "Glass" sound.

## Troubleshooting

**No notification appears:**
1. Check the listener is running: `launchctl list | grep claude`
2. Check for errors: `cat /tmp/claude-stop-listener.err`
3. Verify port 9999 is not in use: `lsof -i :9999`

**Port already in use:**
Edit the plist to change port 9999 to another port, and update `.claude/hooks/notify-stop.sh` to match.
