# Implementation Plan: Firewall Sidecar Implementation for CUI Compliance

**Branch**: `001-firewall-sidecar-implementation` | **Date**: 2025-10-15 | **Spec**: [spec.md](./spec.md)
**Input**: Feature specification from `/workspaces/XPai/specs/001-firewall-sidecar-implementation/spec.md`

**Note**: This template is filled in by the `/speckit.plan` command. See `.specify/templates/commands/plan.md` for the execution workflow.

## Summary

Implement a firewall sidecar container architecture to provide network isolation for AI assistants running in CUI environments. The system uses a privileged firewall-manager container with iptables to enforce deny-by-default network policies, with an unprivileged AI assistant container sharing its network namespace. This provides CMMC Level 2 compliant boundary protection while maintaining developer workflow compatibility with VSCode devcontainers.

## Technical Context

**Language/Version**: Bash 5.x (for firewall initialization scripts), YAML 1.2 (docker-compose configuration)
**Primary Dependencies**:
- Alpine Linux (firewall-manager container base image with iptables)
- Podman/Docker Compose (multi-container orchestration)
- iptables (Linux kernel firewall)
- VSCode Remote-Containers extension
**Storage**: File-based configuration (whitelist.txt, docker-compose.yml, .devcontainer/)
**Testing**: Bash test scripts with curl/nc for connectivity validation
**Target Platform**: Podman on macOS (via podman machine VM), Linux containers (Alpine for firewall, existing AI assistant image)
**Project Type**: Infrastructure/security configuration (containerized multi-service deployment)
**Performance Goals**:
- Container startup: <2 minutes from clone to ready state
- API latency: No significant increase vs direct Bedrock access
- Test execution: <3 minutes for full security validation suite
- Whitelist updates: <1 minute to take effect (restart time)
**Constraints**:
- Network isolation: 100% of non-whitelisted connections blocked
- Zero capabilities: AI container must have cap_drop: ALL
- Fail-secure: Network unavailable if firewall-manager container fails
- Read-only config: Whitelist immutable (chmod 444)
**Scale/Scope**:
- Single developer workstation deployment
- ~10 whitelisted endpoints initially (AWS Bedrock + future additions)
- Single AI assistant container per deployment
- Local development only (no multi-host orchestration)

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

Verify compliance with `.specify/memory/constitution.md` principles:

- [x] **TDD (Principle I)**: Tests will be written before implementation (Red-Green-Refactor)
  - Bash test scripts validate security properties before implementing firewall rules
  - Test scenarios: whitelisted access succeeds, non-whitelisted access blocked, capability restrictions verified
  - User approval of test scenarios required per spec acceptance criteria
- [x] **Tidy First (Principle II)**: Structural and behavioral changes separated in commits
  - Infrastructure setup (compose files, directories) committed separately
  - Configuration changes (whitelist entries) committed separately
  - Firewall rule implementation committed separately
  - VSCode integration committed separately
- [x] **Code Quality (Principle III)**: Linting, formatting, naming standards defined
  - Bash scripts: shellcheck linting, consistent naming (init-firewall.sh, test-firewall.sh)
  - YAML: yamllint for compose files, consistent indentation (2 spaces)
  - Clear naming: firewall-manager, ai-assistant container names (service names in docker-compose.yml)
  - Comments explain "why" for security-critical decisions (e.g., why DNS allowed, why established/related)
- [x] **Testing Standards (Principle IV)**: Contract/integration/unit test strategy documented
  - **Integration tests**: Validate container interaction (network namespace sharing, capability enforcement)
  - **Contract tests**: Validate iptables rule structure, whitelist file format
  - **No mocks**: Tests use real containers, real iptables, real network connections
  - Test names describe behavior: "test_whitelisted_endpoint_accessible", "test_nonwhitelisted_endpoint_blocked"
- [x] **UX Consistency (Principle V)**: CLI text I/O protocol followed, consistent interface design
  - Test scripts output to stdout (success), stderr (errors)
  - Firewall logs use structured prefixes: FW-BLOCKED-IN, FW-BLOCKED-OUT, FW-BLOCKED-FWD
  - Podman-compose standard commands: up -d, down, logs, exec
  - Error messages actionable: "Whitelist file not found at /etc/firewall/whitelist.txt"
- [x] **Performance (Principle VI)**: Performance goals defined in Technical Context section
  - Startup: <2 minutes, API latency: no significant increase, Test: <3 minutes, Whitelist updates: <1 minute
- [x] **Observability (Principle VII)**: Logging strategy and error handling approach defined
  - Firewall logs: initialization steps, loaded whitelist, applied rules, blocked attempts
  - Structured logging: [INIT], [WHITELIST], [RULES], [BLOCKED] prefixes
  - Container health checks: validate iptables configuration
  - No sensitive data logged (IPs/domains only, no request content)
- [x] **Library-First (if applicable)**: N/A - This is infrastructure configuration, not a library
- [x] **Versioning**: Semantic versioning strategy documented for breaking changes
  - Compose file version: 3.8 (documented in docker-compose.yml)
  - Breaking changes: whitelist format changes, capability requirement changes
  - Migration docs: required for whitelist format updates

**Complexity Justification**: No constitutional violations requiring justification. All principles satisfied.

## Project Structure

### Documentation (this feature)

```
specs/[###-feature]/
├── plan.md              # This file (/speckit.plan command output)
├── research.md          # Phase 0 output (/speckit.plan command)
├── data-model.md        # Phase 1 output (/speckit.plan command)
├── quickstart.md        # Phase 1 output (/speckit.plan command)
├── contracts/           # Phase 1 output (/speckit.plan command)
└── tasks.md             # Phase 2 output (/speckit.tasks command - NOT created by /speckit.plan)
```

### Source Code (repository root)

```
.devcontainer/
├── devcontainer.json     # VSCode devcontainer config pointing to ai-assistant service
└── docker-compose.yml    # Multi-container setup: firewall-manager + ai-assistant

firewall/
├── init-firewall.sh      # Firewall initialization script (reads whitelist, configures iptables)
├── whitelist.txt         # Domain:port whitelist (read-only, chmod 444)
└── Dockerfile            # Alpine-based firewall-manager container image (if needed)

tests/
├── test-firewall.sh      # Integration tests for firewall behavior
└── test-whitelist.sh     # Contract tests for whitelist format validation

docs/
├── FIREWALL-ARCHITECTURE.md   # Security architecture documentation
└── FIREWALL-TROUBLESHOOTING.md # Operational guide for debugging
```

**Structure Decision**: Infrastructure configuration project. Files organized by function:
- `.devcontainer/`: VSCode integration (standard devcontainer pattern)
- `firewall/`: Firewall-specific configuration and scripts (isolated for security review)
- `tests/`: Test scripts for validation (separate from implementation)
- `docs/`: Architecture and operational documentation (separate from code)

## Complexity Tracking

*Fill ONLY if Constitution Check has violations that must be justified*

**Status**: No violations. All constitutional principles satisfied without requiring complexity justification.

---

## Planning Summary

### Phase 0: Research (Complete)

**Output**: `research.md`

**Key Decisions**:
- Container network isolation via namespace sharing
- iptables on Alpine Linux for firewall
- Plain text whitelist format (domain:port)
- DNS resolution at initialization with runtime DNS queries allowed
- CAP_NET_ADMIN for firewall, cap_drop: ALL for AI container
- iptables LOG target with custom prefixes
- Git-based whitelist change workflow with PR review

**Rationale**: All decisions prioritize security, simplicity, and maintainability. Alternatives considered and documented with rejection rationale.

### Phase 1: Design (Complete)

**Outputs**: `data-model.md`, `contracts/`, `quickstart.md`, updated `CLAUDE.md`

**Data Model**:
- Configuration entities: WhitelistEntry, FirewallRule, ContainerConfiguration, DevContainerConfiguration, FirewallLog
- Entity relationships documented with cardinality
- Validation strategies defined (contract tests, integration tests)
- Edge cases and error scenarios identified

**Contracts**:
- `whitelist-format.contract`: Plain text format specification (v1.0.0)
- `docker-compose.contract`: Multi-container orchestration requirements (v1.0.0)
- `iptables-rules.contract`: Firewall rule structure and order (v1.0.0)

**Quickstart Guide**:
- 5-minute setup with step-by-step instructions
- Verification commands for each step
- Common troubleshooting scenarios
- Security checklist

### Constitution Re-evaluation (Post-Design)

All principles remain satisfied:
- **TDD**: Test scripts defined in contracts, ready for implementation
- **Tidy First**: Commit strategy documented (infrastructure, config, rules, integration separate)
- **Code Quality**: Linting tools specified (shellcheck, yamllint), naming conventions established
- **Testing Standards**: Integration and contract test strategies fully documented
- **UX Consistency**: CLI patterns follow text I/O protocol, structured logging with prefixes
- **Performance**: Goals met by design (minimal iptables rules, stateful rule optimization)
- **Observability**: Comprehensive logging strategy with audit trail
- **Versioning**: Semantic versioning strategy defined for all artifacts

### Next Steps

**Not Performed by /speckit.plan** (requires separate command):
- Phase 2: Task generation (`/speckit.tasks` command)
- Implementation (execute tasks.md)
- Testing (run test scripts)
- Documentation (FIREWALL-ARCHITECTURE.md, FIREWALL-TROUBLESHOOTING.md)

**Ready for**:
- `/speckit.tasks`: Generate actionable, dependency-ordered tasks from this plan
- Implementation: All design artifacts available for developers

---

## Artifacts Generated

```
specs/001-firewall-sidecar-implementation/
├── spec.md                              # Feature specification (input)
├── plan.md                              # This file
├── research.md                          # Phase 0 output (technical decisions)
├── data-model.md                        # Phase 1 output (entities and relationships)
├── quickstart.md                        # Phase 1 output (5-minute setup guide)
└── contracts/
    ├── whitelist-format.contract        # Whitelist file format specification
    ├── docker-compose.contract          # Multi-container orchestration requirements
    └── iptables-rules.contract          # Firewall rule structure and order
```

**Branch**: `001-firewall-sidecar-implementation`
**Status**: Planning complete, ready for task generation
