# Research: Firewall Sidecar Implementation

**Feature**: 001-firewall-sidecar-implementation
**Date**: 2025-10-15
**Status**: Phase 0 Complete

## Overview

This document captures technical research and decisions for implementing a firewall sidecar container that provides network isolation for AI assistants in CUI environments.

## Technology Decisions

### 1. Container Network Isolation Approach

**Decision**: Use Docker/Podman network namespace sharing with a privileged firewall container

**Rationale**:
- Network namespace sharing (`network_mode: service:firewall-manager`) ensures the AI container has zero independent network capabilities
- Privileged firewall container with NET_ADMIN can manage iptables without affecting host
- Separation of concerns: security logic in firewall container, application logic in AI container
- Fail-secure design: if firewall fails, AI container loses all network access

**Alternatives Considered**:
- **Host-based firewall**: Rejected because it affects all containers and requires host-level privilege
- **CNI plugins (Calico, Cilium)**: Rejected due to Kubernetes dependency; this is local development with podman-compose
- **Application-level proxy**: Rejected due to complexity and potential bypass via direct socket access
- **Network policies alone**: Rejected because Docker/Podman network policies don't provide iptables-level control

### 2. Firewall Technology

**Decision**: iptables on Alpine Linux

**Rationale**:
- iptables is the standard Linux kernel firewall, mature and well-documented
- Alpine Linux provides minimal attack surface (<10MB base image)
- Built-in support for stateful packet filtering (conntrack for established/related)
- Detailed logging capabilities with custom prefixes
- No additional dependencies needed

**Alternatives Considered**:
- **nftables**: Rejected due to less widespread knowledge in the team, iptables sufficient for requirements
- **firewalld**: Rejected due to systemd dependency and larger footprint
- **ufw (Uncomplicated Firewall)**: Rejected because iptables gives more direct control for security-critical implementation

### 3. Whitelist Configuration Format

**Decision**: Plain text file with `domain:port` entries (one per line)

**Rationale**:
- Simple, human-readable format for easy review
- Git-friendly for version control and pull request diffs
- Easy to parse in bash scripts (standard tooling: awk, grep)
- No parsing ambiguity (structured but not complex)
- Comments supported with `#` prefix

**Alternatives Considered**:
- **JSON/YAML**: Rejected due to parsing complexity in bash, overkill for simple list
- **Environment variables**: Rejected due to poor scalability and no version control clarity
- **ConfigMap-style**: Rejected due to Kubernetes dependency

**Example Format**:
```
# AWS Bedrock endpoints
bedrock-runtime.us-gov-east-1.amazonaws.com:443
bedrock.us-gov-east-1.amazonaws.com:443

# Future additions
# newservice.example.com:443
```

### 4. DNS Resolution Strategy

**Decision**: Resolve domains to IPs at firewall initialization, allow DNS queries

**Rationale**:
- iptables works with IP addresses, not domains
- DNS resolution at startup provides snapshot of IPs for whitelist
- Allowing DNS (port 53 UDP/TCP) enables dynamic resolution by applications
- Container restart required for IP changes (acceptable trade-off per spec assumptions)

**Alternatives Considered**:
- **Dynamic DNS resolution with ipset**: Rejected due to complexity; ipset + dnsmasq integration overkill for ~10 endpoints
- **Block all DNS, pre-resolve only**: Rejected because applications may need DNS for error handling
- **DNS proxy with whitelist**: Rejected due to additional attack surface

**Implementation**:
```bash
# Allow DNS queries
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT

# Resolve whitelist domains at init
while read -r entry; do
  domain=$(echo "$entry" | cut -d: -f1)
  port=$(echo "$entry" | cut -d: -f2)
  ip=$(dig +short "$domain" | head -1)
  iptables -A OUTPUT -d "$ip" -p tcp --dport "$port" -j ACCEPT
done < /etc/firewall/whitelist.txt
```

### 5. Container Capability Model

**Decision**: Firewall container with CAP_NET_ADMIN only, AI container with cap_drop: ALL

**Rationale**:
- CAP_NET_ADMIN is minimum capability for iptables management
- AI container needs zero capabilities due to network namespace sharing
- Follows principle of least privilege (Constitution Principle VII)
- Prevents privilege escalation attacks in AI container

**Alternatives Considered**:
- **Privileged firewall container**: Rejected because CAP_NET_ADMIN is sufficient, full privileged mode grants unnecessary capabilities
- **AI container with limited capabilities**: Rejected because shared network namespace means no capabilities needed

### 6. Logging Strategy

**Decision**: iptables LOG target with custom prefixes for blocked traffic

**Rationale**:
- Provides audit trail for security compliance (CMMC Level 2)
- Custom prefixes enable log filtering: FW-BLOCKED-IN, FW-BLOCKED-OUT, FW-BLOCKED-FWD
- Logs destination IP/port for troubleshooting
- Container logs accessible via `podman logs cui-firewall-manager`

**Alternatives Considered**:
- **NFLOG with dedicated logging daemon**: Rejected due to complexity
- **No logging**: Rejected due to compliance requirements

**Implementation**:
```bash
# Log blocked output traffic
iptables -A OUTPUT -j LOG --log-prefix "FW-BLOCKED-OUT: "
iptables -A OUTPUT -j DROP
```

### 7. VSCode DevContainer Integration

**Decision**: Use `devcontainer.json` with `dockerComposeFile` and `service` properties

**Rationale**:
- Standard VSCode Remote-Containers pattern for multi-container environments
- Preserves existing developer workflow (Reopen in Container)
- `service: ai-assistant` ensures VSCode connects to correct container
- `workspaceFolder` maintains workspace context

**Alternatives Considered**:
- **Custom connection script**: Rejected because devcontainer native support is simpler
- **Single container with embedded firewall**: Rejected due to lack of isolation

**Configuration**:
```json
{
  "name": "AI Assistant (Firewall Protected)",
  "dockerComposeFile": "docker-compose.yml",
  "service": "ai-assistant",
  "workspaceFolder": "/workspace"
}
```

### 8. Testing Strategy

**Decision**: Bash scripts with curl/nc for connectivity validation

**Rationale**:
- Curl tests HTTPS endpoints (AWS Bedrock)
- Netcat tests raw TCP connectivity (for edge cases)
- Exit codes enable test automation (0 = success, non-zero = failure)
- Tests run from inside AI container to validate end-to-end behavior

**Test Categories**:
1. **Integration tests** (test-firewall.sh):
   - Whitelisted endpoint accessible (curl to Bedrock)
   - Non-whitelisted endpoint blocked (curl to example.com)
   - Container capabilities validated (capsh --print)
2. **Contract tests** (test-whitelist.sh):
   - Whitelist format validation (domain:port regex)
   - Iptables rules presence validation (iptables -L)

**Alternatives Considered**:
- **Python/pytest framework**: Rejected due to additional dependencies in test environment
- **Go-based testing**: Rejected due to compilation overhead
- **Manual testing**: Rejected due to lack of reproducibility

### 9. Immutable Configuration

**Decision**: Whitelist file with read-only permissions (chmod 444)

**Rationale**:
- Prevents modification by compromised containers
- Forces explicit process for whitelist changes (edit file, restart containers)
- Creates audit trail via git commits
- Aligns with infrastructure-as-code principles

**Alternatives Considered**:
- **Writable configuration with git hooks**: Rejected because runtime immutability is stronger guarantee
- **Signed configuration files**: Deferred to future enhancement (GPG-signed configs in spec "Out of Scope")

### 10. Whitelist Change Workflow

**Decision**: Git-based workflow with pull request review

**Rationale**:
- Version control provides audit trail
- Pull request enables security team review
- CODEOWNERS or branch protection enforces required reviewers
- Tested changes (local) promoted to team via PR

**Workflow**:
1. Developer edits whitelist.txt locally
2. Restarts containers to test changes
3. Validates with test-firewall.sh
4. Commits changes and opens pull request
5. Security team reviews and approves
6. Changes merge to main branch for team use

**Alternatives Considered**:
- **Centralized configuration server**: Rejected due to complexity and single point of failure
- **Manual approval system**: Rejected because git PR provides better workflow

## Best Practices

### Container Security

1. **Minimize attack surface**: Use Alpine Linux for firewall container (small image size)
2. **Principle of least privilege**: Grant only necessary capabilities (CAP_NET_ADMIN)
3. **Fail-secure design**: Network unavailable if firewall fails (shared namespace dependency)
4. **Immutable infrastructure**: Configuration as code, read-only at runtime
5. **Defense in depth**: Multiple layers (network namespace, capabilities, iptables, whitelist)

### iptables Rules Order

1. **Stateful rules first**: ESTABLISHED,RELATED connections (performance optimization)
2. **Essential services**: DNS (required for application function)
3. **Whitelist rules**: Explicit ACCEPT for allowed destinations
4. **Logging**: LOG before DROP (captures violations)
5. **Default DROP**: Final policy denies all unmatched traffic

### Operational Considerations

1. **Health checks**: Container health validates iptables configuration
2. **Startup dependencies**: Firewall must start before AI container (depends_on in compose)
3. **Log rotation**: Container logs managed by Docker/Podman (no custom rotation needed)
4. **IP address changes**: Require container restart for DNS re-resolution (documented limitation)
5. **Testing before deployment**: Always run test-firewall.sh after whitelist changes

## Security Considerations

### Threat Mitigation

- **Prompt injection → data exfiltration**: Blocked by deny-by-default network policy
- **Compromised AI container**: Cannot modify iptables (no NET_ADMIN), cannot escape network namespace
- **DNS-based exfiltration**: Mitigated by whitelist (only approved destinations resolve)
- **Firewall bypass**: Prevented by network namespace sharing (no independent network stack)

### Attack Surface

- **Firewall container**: Privileged with NET_ADMIN (minimal Alpine, isolated from application)
- **AI container**: Unprivileged, no capabilities (cannot affect system)
- **Whitelist file**: Read-only (immutable after initialization)
- **Docker socket**: Not exposed to containers (no container escape via docker API)

### Compliance Mapping

- **CMMC SC.L2-3.13.6**: Deny by default (iptables DROP policy), allow by exception (whitelist)
- **CMMC SC.L2-3.13.1**: Boundary protection (firewall monitors/controls external communication)
- **CMMC AC.L2-3.1.20**: Least privilege (AI container cap_drop: ALL)

## Open Questions

None. All technical decisions resolved.

## References

- [iptables man page](https://linux.die.net/man/8/iptables)
- [Docker network namespace sharing](https://docs.docker.com/compose/compose-file/compose-file-v3/#network_mode)
- [Linux capabilities](https://man7.org/linux/man-pages/man7/capabilities.7.html)
- [CMMC Level 2 Requirements](https://www.acq.osd.mil/cmmc/)
- [VSCode devcontainer.json reference](https://containers.dev/implementors/json_reference/)
