# Data Model: Firewall Sidecar Configuration

**Feature**: 001-firewall-sidecar-implementation
**Date**: 2025-10-15

## Overview

This document defines the configuration entities and their relationships for the firewall sidecar implementation. Since this is an infrastructure project rather than an application with a traditional data model, the "entities" are configuration files and runtime state.

## Configuration Entities

### 1. WhitelistEntry

Represents a single allowed network destination.

**Format**: Plain text file entry
**Location**: `firewall/whitelist.txt`

**Fields**:
- `domain` (string, required): Fully qualified domain name (FQDN)
- `port` (integer, required): TCP port number (1-65535)

**Validation Rules**:
- Domain must be valid FQDN (alphanumeric, hyphens, dots)
- Port must be integer in range 1-65535
- One entry per line
- Empty lines ignored
- Lines starting with `#` are comments (ignored)
- Format: `domain:port` (colon separator, no spaces)

**Examples**:
```
bedrock-runtime.us-gov-east-1.amazonaws.com:443
bedrock.us-gov-east-1.amazonaws.com:443
api.example.com:8443
```

**Invalid Examples**:
```
example.com                          # Missing port
example.com:443:extra               # Multiple colons
example.com: 443                    # Space after colon
example.com:99999                   # Invalid port range
-example.com:443                    # Invalid domain (starts with hyphen)
```

**State Transitions**:
- `unvalidated` → `validated` (via test-whitelist.sh)
- `validated` → `active` (via container restart)
- `active` → `inactive` (via entry removal + container restart)

### 2. FirewallRule

Represents an iptables rule applied by the firewall container.

**Format**: iptables command
**Location**: Runtime state in kernel (created by init-firewall.sh)

**Fields**:
- `chain` (string, required): INPUT, OUTPUT, or FORWARD
- `action` (string, required): ACCEPT, DROP, or LOG
- `protocol` (string, optional): tcp, udp, icmp, or all
- `destination` (string, optional): IP address or CIDR
- `dport` (integer, optional): Destination port
- `log_prefix` (string, optional): Log message prefix (for LOG action)

**Rule Categories**:
1. **Stateful rules**: ACCEPT for ESTABLISHED,RELATED connections
2. **DNS rules**: ACCEPT for port 53 (UDP and TCP)
3. **Whitelist rules**: ACCEPT for each WhitelistEntry (resolved IP:port)
4. **Logging rules**: LOG with custom prefix for blocked traffic
5. **Default policy**: DROP for all chains

**Validation Rules**:
- Chain must be one of: INPUT, OUTPUT, FORWARD
- Action must be one of: ACCEPT, DROP, LOG
- If dport specified, protocol must be tcp or udp
- Log prefix maximum 29 characters (iptables limitation)

**Example Rules**:
```bash
# Stateful
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# DNS
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

# Whitelist
iptables -A OUTPUT -d 52.46.145.72 -p tcp --dport 443 -j ACCEPT

# Logging
iptables -A OUTPUT -j LOG --log-prefix "FW-BLOCKED-OUT: "

# Default policy
iptables -P OUTPUT DROP
```

**State Transitions**:
- `pending` → `applied` (via iptables command)
- `applied` → `active` (after container fully initialized)
- `active` → `removed` (via container restart or iptables flush)

### 3. ContainerConfiguration

Represents the multi-container orchestration setup.

**Format**: YAML (docker-compose.yml)
**Location**: `.devcontainer/docker-compose.yml`

**Services**:

#### firewall-manager service
- `image`: alpine:latest
- `container_name`: cui-firewall-manager
- `cap_add`: [NET_ADMIN]
- `volumes`: firewall config directory mounted
- `command`: /firewall/init-firewall.sh
- `healthcheck`: validates iptables configuration

**Fields**:
- `service_name` (string, required): "firewall-manager"
- `capabilities` (array, required): [NET_ADMIN]
- `volumes` (array, required): whitelist mount path
- `health_check_command` (string, required): iptables validation command

**Validation Rules**:
- Must have NET_ADMIN capability
- Must mount whitelist.txt as read-only
- Health check must verify iptables rules present
- Must use Alpine Linux or minimal base image

#### ai-assistant service
- `image`: ghcr.io/rise8-us/xpai/ai-assistant-home:latest
- `container_name`: cui-ai-assistant
- `network_mode`: "service:firewall-manager"
- `cap_drop`: [ALL]
- `depends_on`: firewall-manager health check
- `volumes`: workspace mounted

**Fields**:
- `service_name` (string, required): "ai-assistant"
- `network_mode` (string, required): "service:firewall-manager"
- `capabilities` (array, required): [] (all dropped)
- `dependencies` (array, required): [firewall-manager]

**Validation Rules**:
- Must have cap_drop: ALL
- Must use network_mode: service:firewall-manager
- Must depend on firewall-manager health
- Cannot have independent network configuration

**State Transitions**:
- `defined` → `validated` (via yamllint, docker-compose config)
- `validated` → `running` (via docker-compose up)
- `running` → `stopped` (via docker-compose down)

### 4. DevContainerConfiguration

Represents VSCode devcontainer integration.

**Format**: JSON (devcontainer.json)
**Location**: `.devcontainer/devcontainer.json`

**Fields**:
- `name` (string, required): Human-readable environment name
- `dockerComposeFile` (string, required): Path to docker-compose.yml
- `service` (string, required): Service name to attach to ("ai-assistant")
- `workspaceFolder` (string, required): Container workspace path
- `extensions` (array, optional): VSCode extensions to install
- `settings` (object, optional): VSCode settings

**Validation Rules**:
- `dockerComposeFile` must reference existing compose file
- `service` must match ai-assistant service name
- `workspaceFolder` must be absolute path in container

**Example**:
```json
{
  "name": "AI Assistant (Firewall Protected)",
  "dockerComposeFile": "docker-compose.yml",
  "service": "ai-assistant",
  "workspaceFolder": "/workspace",
  "extensions": [
    "anthropic.claude-code"
  ]
}
```

**State Transitions**:
- `defined` → `validated` (via JSON schema validation)
- `validated` → `active` (via VSCode "Reopen in Container")
- `active` → `disconnected` (via VSCode close or container stop)

### 5. FirewallLog

Represents logged network activity.

**Format**: Kernel log message via iptables LOG target
**Location**: Container stdout (accessible via `podman logs`)

**Fields**:
- `timestamp` (datetime, auto-generated): When event occurred
- `prefix` (string, required): Log category (FW-BLOCKED-IN/OUT/FWD)
- `src_ip` (string, auto): Source IP address
- `dst_ip` (string, auto): Destination IP address
- `dst_port` (integer, auto): Destination port
- `protocol` (string, auto): TCP/UDP/ICMP

**Log Prefixes**:
- `FW-BLOCKED-IN: ` - Inbound traffic blocked
- `FW-BLOCKED-OUT: ` - Outbound traffic blocked (most common)
- `FW-BLOCKED-FWD: ` - Forwarded traffic blocked

**Example Log Entry**:
```
[Oct 15 14:23:45] FW-BLOCKED-OUT: SRC=10.88.0.2 DST=93.184.216.34 PROTO=TCP DPT=443
```

**Validation Rules**:
- Prefix must match one of three categories
- IPs must be valid IPv4 addresses
- Port must be in range 1-65535
- Protocol must be TCP, UDP, or ICMP

**State Transitions**:
- `generated` → `logged` (via iptables LOG)
- `logged` → `persisted` (via container log driver)
- `persisted` → `archived` (via log rotation policy)

## Entity Relationships

```
WhitelistEntry (1) ----resolves-to----> (N) FirewallRule
  |                                          |
  | loaded-by                                | applied-by
  |                                          |
  v                                          v
FirewallContainer <---- shares-network ---- AIContainer
  |                                          |
  | orchestrated-by                          | orchestrated-by
  |                                          |
  v                                          v
        ContainerConfiguration (docker-compose.yml)
                   ^
                   | referenced-by
                   |
        DevContainerConfiguration (devcontainer.json)

FirewallRule ----generates----> FirewallLog (when traffic blocked)
```

**Relationship Descriptions**:

1. **WhitelistEntry → FirewallRule** (1:N)
   - Each whitelist entry generates multiple iptables rules (DNS lookup may return multiple IPs)
   - Cardinality: One whitelist entry → 1-N firewall rules

2. **WhitelistEntry → FirewallContainer** (loaded-by)
   - Whitelist file read at firewall container initialization
   - Read-only relationship (whitelist never modified at runtime)

3. **FirewallContainer → AIContainer** (shares-network)
   - AI container uses firewall's network namespace
   - Bidirectional dependency: firewall must exist for AI network to work

4. **ContainerConfiguration → Both Containers** (orchestrated-by)
   - docker-compose.yml defines both containers and their relationship
   - Startup order enforced via depends_on with health check

5. **DevContainerConfiguration → ContainerConfiguration** (referenced-by)
   - devcontainer.json references docker-compose.yml
   - Specifies which service VSCode attaches to (ai-assistant)

6. **FirewallRule → FirewallLog** (generates)
   - LOG rules generate log entries when traffic is blocked
   - One rule → many log entries (over time)

## Validation Strategy

### Contract Tests (test-whitelist.sh)

1. **Whitelist format validation**:
   - Regex: `^[a-zA-Z0-9.-]+:[0-9]{1,5}$`
   - Port range: 1-65535
   - No duplicate entries

2. **Compose file validation**:
   - YAML syntax: `yamllint docker-compose.yml`
   - Compose schema: `docker-compose config`
   - Required services present (firewall-manager, ai-assistant)

3. **Firewall rule validation**:
   - Rules present: `iptables -L -n | grep -q "default policy DROP"`
   - Expected rule count matches whitelist entries
   - DNS rules exist: `iptables -L -n | grep -q "dpt:53"`

### Integration Tests (test-firewall.sh)

1. **Network isolation validation**:
   - Whitelisted endpoint accessible (curl succeeds)
   - Non-whitelisted endpoint blocked (curl fails or times out)
   - Blocked attempts logged with correct prefix

2. **Capability validation**:
   - AI container has no capabilities: `capsh --print` shows empty set
   - Firewall container has NET_ADMIN: `capsh --print | grep net_admin`

3. **Namespace validation**:
   - AI container shares firewall network: IP addresses match
   - Container restart maintains namespace sharing

## File Permissions and Ownership

### Security-Critical Files

1. **whitelist.txt**:
   - Permissions: 0444 (read-only for all)
   - Owner: root:root (in container)
   - Prevents modification by compromised container

2. **init-firewall.sh**:
   - Permissions: 0555 (read-execute for all)
   - Owner: root:root (in container)
   - Prevents tampering with firewall logic

3. **docker-compose.yml**:
   - Permissions: 0644 (standard file)
   - Owner: developer's user (on host)
   - Version controlled in git

4. **devcontainer.json**:
   - Permissions: 0644 (standard file)
   - Owner: developer's user (on host)
   - Version controlled in git

## Configuration Immutability

**Immutable at Runtime**:
- whitelist.txt (chmod 444, read-only mount)
- init-firewall.sh (chmod 555, read-only logic)
- Applied iptables rules (no modification capability in AI container)

**Mutable via Process**:
- Whitelist changes require: edit file → commit to git → PR review → merge → container restart
- Compose changes require: edit YAML → validate → commit → PR review → merge
- Configuration tested locally before team-wide deployment via PR workflow

## Edge Cases

1. **Whitelist domain DNS resolution failure**:
   - Behavior: Warning logged, entry skipped, firewall continues with remaining entries
   - Detection: Check logs for "DNS resolution failed for [domain]"
   - Recovery: Fix DNS or remove invalid entry, restart containers

2. **Duplicate whitelist entries**:
   - Behavior: Both entries processed, duplicate iptables rules created (harmless but wasteful)
   - Prevention: test-whitelist.sh validates no duplicates
   - Recovery: Remove duplicate, restart containers

3. **Firewall container crash**:
   - Behavior: AI container loses all network access (fail-secure)
   - Detection: AI container health check fails, applications cannot connect
   - Recovery: docker-compose restart (orchestrator should auto-restart)

4. **AI container attempts to modify iptables**:
   - Behavior: Operation fails with "permission denied" (no NET_ADMIN capability)
   - Detection: Error in application logs
   - Recovery: None needed (security control working as designed)

5. **Whitelist IP address changes**:
   - Behavior: Existing connections continue (established), new connections to old IP fail
   - Detection: Connection failures to previously working endpoints
   - Recovery: Restart containers to re-resolve DNS

## Performance Considerations

1. **iptables rule evaluation**:
   - Rules evaluated sequentially (top to bottom)
   - Stateful rules first (ESTABLISHED,RELATED) → most traffic matches early
   - Whitelist rules after DNS → specific before general
   - Expected rule count: ~15 rules (2 stateful + 2 DNS + ~10 whitelist + logging + policy)
   - Performance impact: Negligible (<1ms per packet)

2. **DNS resolution at startup**:
   - Serial resolution of whitelist entries
   - Expected duration: <5 seconds for 10 entries
   - Timeout per entry: 5 seconds (dig default)
   - Parallel resolution: Not implemented (acceptable startup time)

3. **Log volume**:
   - Only blocked traffic logged (not allowed traffic)
   - Expected rate: Low in normal operation (<1 blocked attempt per minute)
   - Log rotation: Handled by Docker/Podman log driver
   - Storage impact: Minimal (<1MB per day)
