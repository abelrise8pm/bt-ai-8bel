# Firewall Manager Container

Prebuilt Alpine-based firewall manager for container egress filtering using iptables.

## Overview

This container enforces network egress policies on AI assistant containers using a **whitelist-based approach** (deny all by default, permit by exception) aligned with CMMC Level 2 requirements (SC.L2-3.13.1).

## Usage

Mount your whitelist file and run with `NET_ADMIN` capability:

```yaml
firewall-manager:
  # Use pinned SHA digest for reproducibility (updated by CI)
  image: ghcr.io/rise8-us/xpai/firewall-manager@sha256:<digest>
  cap_add:
    - NET_ADMIN
  volumes:
    - ./whitelist.txt:/firewall/whitelist.txt:ro
```

**Getting the latest digest:**
```bash
skopeo inspect --format "{{.Digest}}" docker://ghcr.io/rise8-us/xpai/firewall-manager:latest
```

### Whitelist Format

```text
# Comments start with #
# Format: domain:port
bedrock-runtime.us-gov-east-1.amazonaws.com:443
bedrock.us-gov-east-1.amazonaws.com:443
```

## What's Baked In

- `iptables` - Network filtering
- `bind-tools` - DNS resolution (dig)
- `init-firewall.sh` - Firewall configuration script

## What You Provide

- `whitelist.txt` - Your project-specific allowed endpoints

## Local Development

Build and test with Docker:

```bash
cd firewall-manager/
docker build -t firewall-manager:test .
./integration-test.sh
```

Build and test with Podman:

```bash
cd firewall-manager/
podman build -t firewall-manager:test .
CONTAINER_RUNTIME=podman ./integration-test.sh
```

### Integration Tests

The `integration-test.sh` script validates the firewall using the same `docker-compose.firewall.yml` that users deploy. Tests include:
- Container health and capabilities
- iptables rules (DROP policy, DNS, HTTPS)
- Loopback connectivity
- Network namespace sharing
- Whitelisted domains accessible
- Non-whitelisted domains blocked

## CI/CD

The image is automatically built via GitHub Actions on changes to `firewall-manager/`.

**Build Process:**
1. Build multi-arch image (amd64, arm64)
2. Run integration tests
3. Run Trivy security scan
4. Promote to `latest` on main branch
5. Auto-create PR to update `starter/.devcontainer/docker-compose.firewall.yml` with new digest

**Image Tags:**
- `latest` - Most recent build from main branch
- `sha-<commit>` - Specific commit builds
- Use `@sha256:<digest>` for pinned, reproducible deployments
