# Quickstart: Firewall Sidecar for AI Assistant

**Feature**: 001-firewall-sidecar-implementation
**Estimated Time**: 5 minutes
**Prerequisites**: Podman or Docker installed, VSCode with Remote-Containers extension

## What This Does

This quickstart sets up a network-isolated AI assistant container using a firewall sidecar pattern. The AI assistant can only communicate with approved AWS Bedrock endpoints, preventing data exfiltration even in the event of prompt injection attacks.

**Security Properties**:
- Deny-by-default network policy (iptables DROP)
- Zero network capabilities in AI container (cap_drop: ALL)
- Whitelist-based network access (only approved endpoints)
- Fail-secure design (network unavailable if firewall fails)

## Step 1: Start the Containers

```bash
# Navigate to devcontainer directory
cd .devcontainer

# Start both firewall and AI assistant containers
podman-compose up -d

# Verify containers are running
podman-compose ps
```

**Expected Output**:
```
NAME                    STATUS    PORTS
cui-firewall-manager    Up (healthy)
cui-ai-assistant        Up
```

## Step 2: Verify Firewall Configuration

```bash
# Check firewall logs to see applied rules
podman logs cui-firewall-manager

# Verify iptables rules are configured
podman exec cui-firewall-manager iptables -L -n -v
```

**Expected Log Output**:
```
[INIT] Starting firewall initialization...
[WHITELIST] Loading whitelist from /firewall/whitelist.txt
[WHITELIST] Added rule for bedrock-runtime.us-gov-east-1.amazonaws.com:443 (52.46.145.72:443)
[WHITELIST] Added rule for bedrock.us-gov-east-1.amazonaws.com:443 (52.222.147.69:443)
[RULES] Applying stateful rules...
[RULES] Applying DNS rules...
[RULES] Applying default DROP policy...
[INIT] Firewall initialization complete
```

**Expected iptables Output**:
```
Chain OUTPUT (policy DROP)
target     prot opt source       destination
ACCEPT     all  --  anywhere     anywhere     state ESTABLISHED,RELATED
ACCEPT     udp  --  anywhere     anywhere     udp dpt:53
ACCEPT     tcp  --  anywhere     anywhere     tcp dpt:53
ACCEPT     tcp  --  anywhere     52.46.145.72 tcp dpt:443
ACCEPT     tcp  --  anywhere     52.222.147.69 tcp dpt:443
LOG        all  --  anywhere     anywhere     LOG prefix "FW-BLOCKED-OUT: "
```

## Step 3: Test Network Access

```bash
# Enter the AI container
podman exec -it cui-ai-assistant /bin/bash

# Test 1: Whitelisted endpoint (should succeed)
curl -v https://bedrock-runtime.us-gov-east-1.amazonaws.com

# Test 2: Non-whitelisted endpoint (should fail/timeout)
curl --max-time 5 https://example.com
```

**Expected Results**:
- Test 1: Connection succeeds, receives HTTP response
- Test 2: Connection times out or fails with "Connection timed out"

## Step 4: Connect VSCode

1. Open VSCode in the project directory
2. Click the green "Remote" button in bottom-left corner
3. Select "Reopen in Container"
4. VSCode connects to `cui-ai-assistant` container
5. Extensions load, terminal opens in container

**Verification**:
```bash
# In VSCode integrated terminal
hostname  # Should show container hostname
```

## Step 5: Verify Security Properties

```bash
# Run automated security tests
./tests/test-firewall.sh

# Expected output: All tests pass
```

## Common Commands

### View Firewall Logs
```bash
# Real-time logs
podman logs -f cui-firewall-manager

# Search for blocked connections
podman logs cui-firewall-manager 2>&1 | grep "FW-BLOCKED-OUT"
```

### Restart Containers
```bash
# Stop containers
podman-compose down

# Start containers
podman-compose up -d
```

### Check Container Status
```bash
# List containers
podman-compose ps

# Inspect specific container
podman inspect cui-firewall-manager
podman inspect cui-ai-assistant
```

### Verify Network Namespace Sharing
```bash
# Get firewall network namespace
firewall_net=$(podman inspect cui-firewall-manager --format '{{.NetworkSettings.SandboxKey}}')

# Get AI container network namespace
ai_net=$(podman inspect cui-ai-assistant --format '{{.NetworkSettings.SandboxKey}}')

# Compare (should be identical)
echo "Firewall: $firewall_net"
echo "AI:       $ai_net"
```

## Troubleshooting

### Problem: Firewall container is unhealthy

**Symptoms**:
- `podman-compose ps` shows firewall-manager as "unhealthy"
- AI container not starting

**Diagnosis**:
```bash
# Check firewall logs
podman logs cui-firewall-manager

# Common issues:
# - "whitelist.txt: No such file or directory" → volume mount incorrect
# - "DNS resolution failed" → network connectivity issue
# - "iptables: Permission denied" → missing NET_ADMIN capability
```

**Resolution**:
```bash
# Verify volume mount
podman inspect cui-firewall-manager | grep -A 5 "Mounts"

# Verify whitelist file exists
ls -la ../firewall/whitelist.txt

# Verify capabilities
podman inspect cui-firewall-manager --format '{{.HostConfig.CapAdd}}'  # Should show [NET_ADMIN]
```

### Problem: AI container cannot reach whitelisted endpoints

**Symptoms**:
- Connections to AWS Bedrock timeout
- Claude Code cannot generate responses

**Diagnosis**:
```bash
# Check if whitelist rules applied
podman exec cui-firewall-manager iptables -L OUTPUT -n | grep "dpt:443"

# Test DNS resolution
podman exec cui-ai-assistant nslookup bedrock-runtime.us-gov-east-1.amazonaws.com

# Test direct connection
podman exec cui-ai-assistant curl -v https://bedrock-runtime.us-gov-east-1.amazonaws.com
```

**Resolution**:
```bash
# Option 1: Restart containers (re-resolves DNS)
podman-compose down && podman-compose up -d

# Option 2: Verify AWS credentials
cat ../.env.bedrock  # Should contain AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY

# Option 3: Check whitelist entry format
cat ../firewall/whitelist.txt  # Verify domain:port format
```

### Problem: All connections blocked (even whitelisted)

**Symptoms**:
- All curl commands fail
- No network connectivity

**Diagnosis**:
```bash
# Check if default DROP policy applied prematurely
podman exec cui-firewall-manager iptables -L OUTPUT -n -v

# Verify rule order
podman logs cui-firewall-manager | grep -A 20 "[INIT]"
```

**Resolution**:
```bash
# Check init-firewall.sh for rule ordering errors
cat ../firewall/init-firewall.sh

# Ensure stateful rules and whitelist rules applied BEFORE default DROP policy
```

### Problem: VSCode cannot connect to container

**Symptoms**:
- "Reopen in Container" fails
- Error: "Cannot find service 'ai-assistant'"

**Diagnosis**:
```bash
# Verify docker-compose.yml service names
podman-compose config --services

# Verify devcontainer.json configuration
cat .devcontainer/devcontainer.json | grep service
```

**Resolution**:
```bash
# Ensure service name matches in devcontainer.json
# "service": "ai-assistant"

# Restart VSCode and try again
```

## Next Steps

### Adding a New Whitelisted Endpoint

1. **Edit whitelist** (local testing):
   ```bash
   echo "api.newservice.com:443" >> ../firewall/whitelist.txt
   ```

2. **Restart containers**:
   ```bash
   podman-compose down && podman-compose up -d
   ```

3. **Test connectivity**:
   ```bash
   podman exec cui-ai-assistant curl https://api.newservice.com
   ```

4. **Run validation tests**:
   ```bash
   ./tests/test-firewall.sh
   ```

5. **Promote to team** (if test successful):
   ```bash
   git add ../firewall/whitelist.txt
   git commit -m "Add api.newservice.com to firewall whitelist"
   git push origin feature-branch
   # Open pull request for security team review
   ```

### Viewing Audit Logs

```bash
# View all blocked connection attempts
podman logs cui-firewall-manager 2>&1 | grep "FW-BLOCKED-OUT"

# Filter by destination IP
podman logs cui-firewall-manager 2>&1 | grep "FW-BLOCKED-OUT.*93.184.216.34"

# Filter by destination port
podman logs cui-firewall-manager 2>&1 | grep "FW-BLOCKED-OUT.*DPT=443"

# Export logs for audit
podman logs cui-firewall-manager > firewall-audit-$(date +%Y%m%d).log
```

### Performance Monitoring

```bash
# Check iptables rule packet counters
podman exec cui-firewall-manager iptables -L OUTPUT -n -v

# Columns:
# pkts = packets matched
# bytes = bytes matched
# target = action taken

# Example output:
# Chain OUTPUT (policy DROP 0 packets, 0 bytes)
#  pkts bytes target     prot opt in     out     source               destination
#   150  120K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0     state ESTABLISHED,RELATED
#     5   300 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0     udp dpt:53
#    45   30K ACCEPT     tcp  --  *      *       0.0.0.0/0            52.46.145.72 tcp dpt:443
#     2   120 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0     LOG prefix "FW-BLOCKED-OUT: "
```

## Architecture Diagram

```
┌─────────────────────────────────────────┐
│                                         │
│           Podman/Docker Host            │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │  cui-firewall-manager container   │  │
│  │  ┌─────────────────────────────┐  │  │
│  │  │  Alpine Linux + iptables    │  │  │
│  │  │  ┌───────────────────────┐  │  │  │
│  │  │  │  Network Namespace    │  │  │  │
│  │  │  │  ┌─────────────────┐  │  │  │  │
│  │  │  │  │  iptables rules │  │  │  │  │
│  │  │  │  │  - DROP policy  │  │  │  │  │
│  │  │  │  │  - Whitelist    │  │  │  │  │
│  │  │  │  │  - Logging      │  │  │  │  │
│  │  │  │  └─────────────────┘  │  │  │  │
│  │  │  │         ▲              │  │  │  │
│  │  │  │         │              │  │  │  │
│  │  │  │         │ shared by    │  │  │  │
│  │  │  │         │              │  │  │  │
│  │  │  └─────────┼──────────────┘  │  │  │
│  │  └────────────┼─────────────────┘  │  │
│  │               │                    │  │
│  │  CAP_NET_ADMIN granted             │  │
│  └───────────────┼────────────────────┘  │
│                  │                       │
│  ┌───────────────┼────────────────────┐  │
│  │  cui-ai-assistant container        │  │
│  │               │                    │  │
│  │  ┌────────────▼─────────────────┐  │  │
│  │  │  Network Namespace (shared) │  │  │
│  │  │  - Uses firewall's network  │  │  │
│  │  │  - No independent network   │  │  │
│  │  └─────────────────────────────┘  │  │
│  │                                   │  │
│  │  AI Assistant Application         │  │
│  │  - Claude Code                    │  │
│  │  - AWS Bedrock client             │  │
│  │                                   │  │
│  │  cap_drop: ALL                    │  │
│  └───────────────────────────────────┘  │
│                                         │
└─────────────────────────────────────────┘

Network traffic flow:
1. AI container → Outbound request
2. Firewall network namespace → iptables rules
3. If whitelisted → ACCEPT → External network
4. If not whitelisted → LOG → DROP
```

## Security Checklist

After setup, verify these security properties:

- [ ] Firewall container has NET_ADMIN capability only (not full privileged)
- [ ] AI container has zero capabilities (cap_drop: ALL)
- [ ] AI container shares firewall's network namespace
- [ ] iptables default policy is DROP for all chains
- [ ] Whitelisted endpoints are accessible
- [ ] Non-whitelisted endpoints are blocked
- [ ] Blocked attempts are logged with FW-BLOCKED- prefix
- [ ] whitelist.txt is read-only (chmod 444)
- [ ] init-firewall.sh is read-only (chmod 555)
- [ ] Firewall container health check passes
- [ ] Test suite passes (./tests/test-firewall.sh)

## Resources

- **Architecture Documentation**: `docs/FIREWALL-ARCHITECTURE.md`
- **Troubleshooting Guide**: `docs/FIREWALL-TROUBLESHOOTING.md`
- **Test Scripts**: `tests/test-firewall.sh`, `tests/test-whitelist.sh`
- **Contracts**: `specs/001-firewall-sidecar-implementation/contracts/`
- **Feature Spec**: `specs/001-firewall-sidecar-implementation/spec.md`

## Support

For issues or questions:
1. Check troubleshooting section above
2. Review firewall logs: `podman logs cui-firewall-manager`
3. Run test suite: `./tests/test-firewall.sh`
4. Consult FIREWALL-TROUBLESHOOTING.md for detailed diagnosis
