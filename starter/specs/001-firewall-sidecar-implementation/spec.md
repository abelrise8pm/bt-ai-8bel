# Feature Specification: Firewall Sidecar Implementation for CUI Compliance

**Feature Branch**: `001-firewall-sidecar-implementation`
**Created**: 2025-10-15
**Status**: Draft
**Input**: User description: "Read commit 450e255f1bbf2bb563db182394e8e754d55b7fce and use that as the start of this specification."

## Clarifications

### Session 2025-10-15

- Q: How should tested whitelist additions become permanent entries that persist across the team? → A: Git-tracked whitelist with pull request review (security team as required reviewers)

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Deploy AI Assistant with Network Isolation (Priority: P1)

As a CUI project developer, I need to run an AI assistant in a container that prevents data exfiltration while still allowing access to approved AWS Bedrock endpoints, so that I can use AI tooling without risking unauthorized transmission of sensitive information.

**Why this priority**: This is the core security requirement for CMMC Level 2 compliance. Without this, CUI projects cannot safely use AI assistants due to the risk of prompt injection attacks causing data exfiltration.

**Independent Test**: Can be fully tested by starting the containerized AI assistant, verifying it can communicate with AWS Bedrock endpoints, and confirming it cannot access non-whitelisted external services. Delivers immediate security value by establishing the "deny by default, allow by exception" network policy.

**Acceptance Scenarios**:

1. **Given** a CUI project repository with the firewall sidecar configuration, **When** a developer runs `podman-compose up -d`, **Then** both firewall-manager and ai-assistant containers start successfully with the firewall-manager container in a healthy state
2. **Given** the containers are running, **When** the AI assistant attempts to invoke AWS Bedrock models in us-gov-east-1, **Then** the requests succeed and the AI generates responses
3. **Given** the containers are running, **When** the AI assistant attempts to access a non-whitelisted domain (e.g., example.com), **Then** the connection is blocked and logged by the firewall
4. **Given** the AI container is running, **When** inspecting the container capabilities, **Then** the container has zero network capabilities (cap_drop: ALL)

---

### User Story 2 - VSCode DevContainer Integration (Priority: P2)

As a CUI project developer using VSCode, I need to open my project in the containerized environment using the standard "Reopen in Container" button, so that I can maintain my existing development workflow while gaining the security benefits of the firewall sidecar.

**Why this priority**: Team productivity depends on maintaining the familiar VSCode devcontainer workflow. Without this integration, developers would need to learn new commands and workflows, slowing adoption.

**Independent Test**: Can be tested by opening VSCode, selecting "Reopen in Container", and verifying that the IDE connects to the AI assistant container with all extensions and configurations working properly.

**Acceptance Scenarios**:

1. **Given** a CUI project with the updated devcontainer.json configuration, **When** a developer clicks "Reopen in Container" in VSCode, **Then** VSCode connects to the ai-assistant container with Claude Code extension activated
2. **Given** VSCode is connected to the container, **When** a developer opens a terminal, **Then** the terminal operates within the ai-assistant container environment
3. **Given** VSCode is connected to the container, **When** a developer uses Claude Code to generate code, **Then** Claude Code successfully communicates with AWS Bedrock through the firewall

---

### User Story 3 - Whitelist Management for Testing (Priority: P3)

As a CUI project developer testing integrations, I need to temporarily add additional endpoints to the firewall whitelist, so that I can test new services while maintaining security controls before they are approved for production use.

**Why this priority**: Enables testing and experimentation without completely disabling security. Lower priority because the default Bedrock-only whitelist covers the primary use case.

**Independent Test**: Can be tested by editing whitelist.txt, restarting containers, and verifying that newly added endpoints are accessible while others remain blocked.

**Promotion to Production**: When a tested whitelist addition needs to become permanent, the whitelist.txt file is committed to git and submitted via pull request with security team as required reviewers. This creates an audit trail and ensures security approval before team-wide deployment.

**Acceptance Scenarios**:

1. **Given** the firewall whitelist configuration file, **When** a developer adds a new domain:port entry to whitelist.txt for local testing, **Then** the file can be edited without requiring elevated permissions
2. **Given** an updated whitelist.txt file, **When** the developer runs `podman-compose down && podman-compose up -d`, **Then** the containers restart and the firewall applies the new whitelist rules
3. **Given** a newly whitelisted endpoint, **When** the AI assistant attempts to access that endpoint, **Then** the connection succeeds
4. **Given** the whitelist has been modified, **When** running the test script, **Then** the test suite validates that all whitelisted endpoints are accessible and all others are blocked
5. **Given** a successfully tested whitelist addition, **When** the developer submits a pull request with the updated whitelist.txt, **Then** security team reviewers can evaluate the request and approve permanent addition to the team's whitelist

---

### User Story 4 - Audit and Troubleshooting (Priority: P3)

As a security auditor or developer troubleshooting connection issues, I need to view logs of blocked connection attempts and active firewall rules, so that I can verify the firewall is working correctly and diagnose connectivity problems.

**Why this priority**: Essential for security compliance validation and operational troubleshooting. Lower priority because it's used less frequently than the core development workflow.

**Independent Test**: Can be tested by attempting blocked connections and then verifying those attempts appear in the firewall logs with appropriate prefixes.

**Acceptance Scenarios**:

1. **Given** the firewall-manager container is running, **When** viewing the container logs, **Then** the logs show successful initialization, loaded whitelist entries, and configured iptables rules
2. **Given** a blocked connection attempt from the AI container, **When** viewing the firewall logs, **Then** the logs contain an entry with the "FW-BLOCKED-" prefix showing the blocked destination
3. **Given** the firewall-manager container is running, **When** executing `podman exec firewall-manager iptables -L -n -v`, **Then** the output shows the default DROP policy and ACCEPT rules for whitelisted endpoints
4. **Given** the test script is run, **When** the script completes, **Then** it provides a summary showing passed and failed tests with clear success/failure indicators

---

### Edge Cases

- What happens when a whitelisted domain's IP address changes? The firewall-manager resolves domains to IPs at startup, so IP changes require container restart.
- How does the system handle DNS resolution failures? The firewall-manager logs a warning and skips that whitelist entry, continuing with other entries.
- What happens if the firewall-manager container fails or crashes? The AI container loses network access entirely due to sharing the firewall-manager's network namespace (fail-secure behavior).
- How does the system handle IPv6 addresses? Currently focused on IPv4; IPv6 would require additional ip6tables rules.
- What happens when attempting to access a whitelisted domain on a non-whitelisted port? The connection is blocked because the whitelist specifies domain:port pairs.
- How does the system handle subdomain wildcards? Not supported in initial implementation; each subdomain must be explicitly listed.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: System MUST create two containers: a privileged firewall-manager container with NET_ADMIN capability, and an unprivileged ai-assistant container with all capabilities dropped
- **FR-002**: System MUST configure the ai-assistant container to share the network namespace of the firewall-manager container
- **FR-003**: System MUST implement default DROP iptables policy for INPUT, OUTPUT, and FORWARD chains
- **FR-004**: System MUST read whitelist configuration from an immutable file (read-only permissions: chmod 444, mounted as read-only volume with `:ro` suffix) containing domain:port entries
- **FR-005**: System MUST resolve whitelisted domains to IP addresses at firewall startup and create ACCEPT rules for those IPs
- **FR-006**: System MUST allow established and related connections (responses to whitelisted requests)
- **FR-007**: System MUST allow DNS queries for domain resolution (UDP and TCP port 53)
- **FR-008**: System MUST log all blocked connection attempts with identifying prefixes (FW-BLOCKED-IN, FW-BLOCKED-OUT, FW-BLOCKED-FWD)
- **FR-009**: System MUST provide a health check for the firewall-manager container that validates iptables is configured
- **FR-010**: System MUST whitelist AWS Bedrock endpoints by default: bedrock-runtime.us-gov-east-1.amazonaws.com:443 and bedrock.us-gov-east-1.amazonaws.com:443
- **FR-011**: System MUST use docker-compose.yml at .devcontainer/docker-compose.yml (podman-compose compatible) for multi-container orchestration
- **FR-012**: System MUST integrate with VSCode devcontainer configuration for seamless "Reopen in Container" functionality
- **FR-013**: System MUST provide automated test scripts that validate whitelisted endpoints are accessible and non-whitelisted endpoints are blocked
- **FR-014**: System MUST document the architecture, security properties, troubleshooting procedures, and whitelist management process
- **FR-015**: System MUST ensure the ai-assistant container cannot modify iptables rules under any circumstances (no NET_ADMIN capability)
- **FR-016**: Whitelist configuration MUST be version-controlled in git with permanent additions requiring pull request review by security team before team-wide deployment

### Key Entities

- **Firewall-Manager Container** (service name: `firewall-manager`): A privileged container running Alpine Linux with iptables, responsible for managing network access rules. Contains whitelist configuration and initialization scripts. Runs continuously to maintain iptables rules.
- **AI Assistant Container**: An unprivileged container with zero network capabilities that runs the Claude Code AI assistant. Shares network namespace with firewall-manager container. All outbound connections are subject to firewall rules.
- **Whitelist Configuration**: A read-only text file containing domain:port entries that define allowed network destinations. Loaded at firewall startup and translated to iptables rules.
- **Docker Compose Configuration**: Orchestration file defining both containers, their capabilities, network configuration, and dependencies. Ensures firewall-manager container starts before AI container.
- **Firewall Rules (iptables)**: Set of network filtering rules applied by the firewall-manager container: default DROP policy, ACCEPT rules for whitelisted IPs, ACCEPT for established connections, LOG rules for blocked traffic.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Developers can start the containerized AI assistant environment in under 2 minutes from repository clone to ready state
- **SC-002**: AI assistant successfully invokes AWS Bedrock models (Claude 3.7 Sonnet, 3.5 Sonnet, 3 Haiku) with response times within 100ms or 10% of direct API access baseline (whichever is greater), measured for first-token latency
- **SC-003**: 100% of connection attempts to non-whitelisted domains are blocked and logged by the firewall
- **SC-004**: AI assistant container inspection confirms zero network capabilities (cap_drop: ALL) in 100% of deployments
- **SC-005**: VSCode devcontainer integration allows developers to connect using "Reopen in Container" with 100% success rate
- **SC-006**: Automated test suite executes in under 3 minutes and validates all security properties (whitelisted access, blocked access, capability restrictions)
- **SC-007**: Firewall logs provide sufficient detail to identify blocked connection attempts within 30 seconds of occurrence
- **SC-008**: Whitelist modifications take effect within 1 minute of restarting containers
- **SC-009**: System meets CMMC Level 2 network access control requirements: SC.L2-3.13.6 (deny by default, allow by exception), SC.L2-3.13.1 (boundary protection), AC.L2-3.1.20 (least privilege)
- **SC-010**: Security architecture documentation is complete enough for security auditors to validate compliance without requiring code inspection

## Assumptions *(mandatory)*

1. **Container Runtime**: The project uses Podman on macOS (via podman machine VM) as the container runtime. The solution must be podman-compose compatible.
2. **AWS Region**: CUI projects operate in the AWS GovCloud us-gov-east-1 region exclusively for Bedrock services.
3. **Authentication**: AWS credentials are provided via environment files (.env.bedrock) and are correctly configured before container startup.
4. **Network Access Pattern**: The AI assistant only needs outbound HTTPS connections (port 443). No inbound connections are required.
5. **DNS Resolution**: Standard DNS services are available to the container for resolving whitelisted domain names.
6. **Development Environment**: Developers use VSCode with the devcontainer extension for their primary workflow.
7. **IP Stability**: AWS Bedrock endpoint IP addresses are relatively stable; changes are infrequent enough that container restarts for DNS re-resolution are acceptable.
8. **Restart Tolerance**: Brief service interruptions for whitelist updates (requiring container restart) are acceptable for testing scenarios.
9. **Single Host**: All containers run on the same podman machine; no multi-host orchestration is required.
10. **No Content Filtering**: The firewall performs network-level blocking only; it does not inspect or filter the content of allowed connections (DLP/content sanitization is out of scope).
11. **Git Workflow for Whitelist**: The project uses git for version control with pull request workflow. Security team members are configured as required reviewers for changes to whitelist.txt via branch protection rules or CODEOWNERS file.

## Security Properties *(mandatory)*

### Threat Model Addressed

The system addresses the "lethal trifecta" security vulnerability in AI-assisted development:

1. **Access to private data**: AI assistant operates in workspace containing CUI (Controlled Unclassified Information)
2. **Exposure to untrusted content**: AI processes user prompts that could contain malicious instructions (prompt injection)
3. **Ability to communicate externally**: Without controls, AI could exfiltrate data to attacker-controlled systems

### Security Controls

- **Privilege Separation**: Firewall management and AI execution are separated into distinct containers with different privilege levels
- **Immutable Configuration**: Whitelist file has read-only permissions (chmod 444) and is mounted as read-only volume in docker-compose.yml (`:ro` suffix), preventing modification by processes inside containers. Changes require container restart with updated volume mount.
- **Fail-Secure Design**: If firewall-manager container fails, AI container loses all network access (shared namespace dependency)
- **Deny by Default**: Default DROP policy blocks all traffic except explicitly allowed connections
- **Capability Restrictions**: AI container has no Linux capabilities, cannot elevate privileges or modify system configuration
- **Audit Logging**: All blocked connection attempts are logged with identifying prefixes for security monitoring
- **Least Privilege Network Access**: Only specific domain:port combinations are whitelisted; no wildcard or subnet-based rules

### CMMC Level 2 Compliance Mapping

- **SC.L2-3.13.6 (Deny by default, allow by exception)**: Default DROP iptables policy with explicit ACCEPT rules only for whitelisted endpoints
- **SC.L2-3.13.1 (Boundary protection)**: Firewall sidecar provides monitored and controlled communications at external boundaries
- **AC.L2-3.1.20 (Least privilege)**: AI container operates with minimal capabilities (cap_drop: ALL) and minimal network access

## Dependencies

- **External**: AWS Bedrock service availability in us-gov-east-1 region
- **External**: Podman container runtime (version supporting compose and capability management)
- **External**: VSCode with Remote-Containers extension
- **Internal**: Existing AI assistant container image (ghcr.io/rise8-us/xpai/ai-assistant-home)
- **Internal**: Environment configuration files (.env.bedrock, .env.claude)
- **Configuration**: Alpine Linux base image for firewall container (includes iptables)

## Out of Scope

- **GPG-signed configurations**: Cryptographic signing of whitelist and compose files (future enhancement)
- **Content sanitization proxy**: Deep packet inspection or DLP filtering of allowed connections (separate feature)
- **Dynamic whitelist updates**: Runtime modification of whitelist without container restart (future enhancement)
- **Multi-region support**: Support for AWS regions beyond us-gov-east-1 (current scope is GovCloud only)
- **Kubernetes deployment**: This implementation targets local development with podman-compose; Kubernetes NetworkPolicies are separate
- **IPv6 support**: Initial implementation focuses on IPv4; IPv6 would require additional ip6tables configuration
- **Wildcard domain matching**: Each domain must be explicitly listed; subdomain wildcards not supported initially
- **Rate limiting**: No throttling or rate limiting of allowed connections
- **Connection state analysis**: Beyond basic established/related tracking already provided by iptables conntrack
