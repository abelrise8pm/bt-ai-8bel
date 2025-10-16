# Tasks: Firewall Sidecar Implementation for CUI Compliance

**Feature**: 001-firewall-sidecar-implementation
**Branch**: `001-firewall-sidecar-implementation`
**Input**: Design documents from `/workspaces/XPai/specs/001-firewall-sidecar-implementation/`

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

**Note**: Tests are included per specification requirements. All test scripts will be written following TDD principles (tests first, verify they fail, then implement).

## Format: `[ID] [P?] [Story?] Description`
- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3, US4)
- Include exact file paths in descriptions

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Create project structure and foundational files

- [ ] T001 Create firewall directory structure at /workspaces/XPai/firewall/
- [ ] T002 Create tests directory structure at /workspaces/XPai/tests/
- [ ] T003 Create docs directory structure at /workspaces/XPai/docs/
- [ ] T004 [P] Create .devcontainer directory at /workspaces/XPai/.devcontainer/
- [ ] T005 [P] Create whitelist.txt file with read-only permissions (chmod 444) at /workspaces/XPai/firewall/whitelist.txt (will be mounted as read-only volume in docker-compose.yml)
- [ ] T006 [P] Add default AWS Bedrock endpoints to /workspaces/XPai/firewall/whitelist.txt

---

## Phase 2a: Foundational Tests (TDD - Red Phase)

**Purpose**: Write failing tests for foundational infrastructure BEFORE implementation

**⚠️ CRITICAL**: These tests MUST fail initially. Do not proceed to Phase 2b until all tests are written and verified to fail.

### Firewall Initialization Script Tests

- [ ] T006a [P] Create test script for firewall initialization at /workspaces/XPai/tests/test-firewall-init.sh
- [ ] T006b [P] Add test case for whitelist file reading to /workspaces/XPai/tests/test-firewall-init.sh (expects: script reads whitelist.txt successfully)
- [ ] T006c [P] Add test case for whitelist parsing to /workspaces/XPai/tests/test-firewall-init.sh (expects: domain:port entries parsed correctly)
- [ ] T006d [P] Add test case for DNS resolution to /workspaces/XPai/tests/test-firewall-init.sh (expects: domains resolved to IPs)
- [ ] T006e [P] Add test case for iptables rule generation to /workspaces/XPai/tests/test-firewall-init.sh (expects: ACCEPT rules created for resolved IPs)
- [ ] T006f [P] Add test case for stateful rules to /workspaces/XPai/tests/test-firewall-init.sh (expects: ESTABLISHED,RELATED rules present)
- [ ] T006g [P] Add test case for DNS rules to /workspaces/XPai/tests/test-firewall-init.sh (expects: UDP/TCP port 53 allowed)
- [ ] T006h [P] Add test case for logging rules to /workspaces/XPai/tests/test-firewall-init.sh (expects: LOG rules with FW-BLOCKED-* prefixes)
- [ ] T006i [P] Add test case for default DROP policy to /workspaces/XPai/tests/test-firewall-init.sh (expects: INPUT/OUTPUT/FORWARD chains have DROP policy)
- [ ] T006j [P] Add test case for error handling to /workspaces/XPai/tests/test-firewall-init.sh (expects: script exits with error if whitelist missing)
- [ ] T006k [P] Add test case for DNS resolution failure to /workspaces/XPai/tests/test-firewall-init.sh (expects: warning logged, script continues)
- [ ] T006m Run /workspaces/XPai/tests/test-firewall-init.sh and verify ALL tests FAIL (RED phase confirmed)

### Docker Compose Configuration Tests

- [ ] T006n [P] Create test script for docker-compose validation at /workspaces/XPai/tests/test-compose-config.sh
- [ ] T006o [P] Add test case for compose file syntax validation to /workspaces/XPai/tests/test-compose-config.sh (expects: valid YAML, version 3.8)
- [ ] T006p [P] Add test case for firewall-manager service definition to /workspaces/XPai/tests/test-compose-config.sh (expects: Alpine image, NET_ADMIN capability)
- [ ] T006q [P] Add test case for ai-assistant service definition to /workspaces/XPai/tests/test-compose-config.sh (expects: cap_drop: ALL, network_mode: service:firewall-manager)
- [ ] T006r [P] Add test case for health check configuration to /workspaces/XPai/tests/test-compose-config.sh (expects: firewall-manager has health check validating iptables)
- [ ] T006s [P] Add test case for service dependencies to /workspaces/XPai/tests/test-compose-config.sh (expects: ai-assistant depends_on firewall-manager with health condition)
- [ ] T006t [P] Add test case for volume mounts to /workspaces/XPai/tests/test-compose-config.sh (expects: whitelist.txt and init-firewall.sh mounted read-only)
- [ ] T006u Run /workspaces/XPai/tests/test-compose-config.sh and verify ALL tests FAIL (RED phase confirmed)

**Checkpoint**: All foundational tests written and verified to fail. Ready for Phase 2b implementation.

---

## Phase 2b: Foundational Implementation (TDD - Green Phase)

**Purpose**: Implement core firewall and container configuration to make tests pass

**⚠️ CRITICAL**: Run tests after each implementation task to verify progress toward GREEN phase

- [ ] T007 Implement firewall initialization script at /workspaces/XPai/firewall/init-firewall.sh (acceptance: script executes without errors, sets up iptables)
- [ ] T008 Add stateful iptables rules (ESTABLISHED,RELATED) to /workspaces/XPai/firewall/init-firewall.sh (acceptance: iptables -L shows ACCEPT rule for state ESTABLISHED,RELATED in INPUT and OUTPUT chains)
- [ ] T009 Add DNS rules (UDP/TCP port 53) to /workspaces/XPai/firewall/init-firewall.sh (acceptance: iptables -L shows ACCEPT rules for destination port 53 in OUTPUT chain)
- [ ] T010 Add whitelist parsing logic to /workspaces/XPai/firewall/init-firewall.sh (acceptance: script reads whitelist.txt, parses domain:port entries, skips comments and empty lines)
- [ ] T011 Add DNS resolution for whitelist entries to /workspaces/XPai/firewall/init-firewall.sh (acceptance: script resolves each domain to IP address using dig/nslookup, logs resolved IPs)
- [ ] T012 Add iptables rule generation for whitelist entries to /workspaces/XPai/firewall/init-firewall.sh (acceptance: iptables -L shows ACCEPT rule for each resolved IP:port combination in OUTPUT chain)
- [ ] T013 Add logging rules (FW-BLOCKED-IN, FW-BLOCKED-OUT, FW-BLOCKED-FWD) to /workspaces/XPai/firewall/init-firewall.sh (acceptance: iptables -L shows LOG rules with --log-prefix for each chain before DROP policy)
- [ ] T014 Add default DROP policy to /workspaces/XPai/firewall/init-firewall.sh (acceptance: iptables -L shows policy DROP for INPUT, OUTPUT, and FORWARD chains)
- [ ] T015 Add error handling and validation to /workspaces/XPai/firewall/init-firewall.sh (acceptance: script exits with code 1 if whitelist.txt missing, logs warnings for DNS failures but continues, validates port ranges 1-65535)
- [ ] T016 Set executable permissions (chmod 555) on /workspaces/XPai/firewall/init-firewall.sh (acceptance: ls -l shows -r-xr-xr-x permissions)
- [ ] T016a Run /workspaces/XPai/tests/test-firewall-init.sh and verify all tests PASS (GREEN phase achieved for firewall script)
- [ ] T017 Create docker-compose.yml with firewall-manager service at /workspaces/XPai/.devcontainer/docker-compose.yml
- [ ] T018 Configure firewall-manager service (service name: firewall-manager in docker-compose.yml) with Alpine image and NET_ADMIN capability in /workspaces/XPai/.devcontainer/docker-compose.yml
- [ ] T019 Add firewall health check to firewall-manager service in /workspaces/XPai/.devcontainer/docker-compose.yml
- [ ] T020 Add ai-assistant service with network_mode sharing to /workspaces/XPai/.devcontainer/docker-compose.yml
- [ ] T021 Configure ai-assistant service with cap_drop: ALL in /workspaces/XPai/.devcontainer/docker-compose.yml
- [ ] T022 Add depends_on with health check condition to ai-assistant service in /workspaces/XPai/.devcontainer/docker-compose.yml
- [ ] T022a Run /workspaces/XPai/tests/test-compose-config.sh and verify all tests PASS (GREEN phase achieved for docker-compose)

**Checkpoint**: Foundation ready - user story implementation can now begin in parallel

---

## Phase 3: User Story 1 - Deploy AI Assistant with Network Isolation (Priority: P1) 🎯 MVP

**Goal**: Deploy firewall-protected AI assistant container that allows AWS Bedrock access while blocking all other network traffic

**Independent Test**: Start containers, verify AI can call AWS Bedrock, verify non-whitelisted domains are blocked, verify container has zero capabilities

### Tests for User Story 1

**NOTE: Write these tests FIRST, ensure they FAIL before implementation**

- [ ] T023 [P] [US1] Create contract test for whitelist file format validation in /workspaces/XPai/tests/test-whitelist.sh
- [ ] T024 [P] [US1] Add test case for valid domain:port format to /workspaces/XPai/tests/test-whitelist.sh
- [ ] T025 [P] [US1] Add test case for invalid port range to /workspaces/XPai/tests/test-whitelist.sh
- [ ] T026 [P] [US1] Add test case for comment and empty line handling to /workspaces/XPai/tests/test-whitelist.sh
- [ ] T027 [P] [US1] Add test case for invalid entry formats to /workspaces/XPai/tests/test-whitelist.sh
- [ ] T028 [P] [US1] Create integration test for firewall behavior in /workspaces/XPai/tests/test-firewall.sh
- [ ] T029 [P] [US1] Add test case for whitelisted endpoint accessibility to /workspaces/XPai/tests/test-firewall.sh
- [ ] T030 [P] [US1] Add test case for non-whitelisted endpoint blocking to /workspaces/XPai/tests/test-firewall.sh
- [ ] T031 [P] [US1] Add test case for container capability verification to /workspaces/XPai/tests/test-firewall.sh
- [ ] T032 [P] [US1] Add test case for iptables rules verification to /workspaces/XPai/tests/test-firewall.sh
- [ ] T033 [P] [US1] Add test case for network namespace sharing to /workspaces/XPai/tests/test-firewall.sh
- [ ] T034 [P] [US1] Add test case for firewall logs validation to /workspaces/XPai/tests/test-firewall.sh

### Implementation for User Story 1

- [ ] T035 [US1] Run shellcheck validation on /workspaces/XPai/firewall/init-firewall.sh
- [ ] T036 [US1] Run yamllint validation on /workspaces/XPai/.devcontainer/docker-compose.yml
- [ ] T037 [US1] Validate docker-compose configuration with podman-compose config command
- [ ] T038 [US1] Start containers with podman-compose up -d from /workspaces/XPai/.devcontainer/
- [ ] T039 [US1] Verify firewall-manager container reaches healthy state
- [ ] T040 [US1] Verify ai-assistant container starts successfully
- [ ] T041 [US1] Test AWS Bedrock connectivity from ai-assistant container
- [ ] T042 [US1] Test non-whitelisted domain blocking from ai-assistant container
- [ ] T043 [US1] Run /workspaces/XPai/tests/test-whitelist.sh and verify all tests pass
- [ ] T044 [US1] Run /workspaces/XPai/tests/test-firewall.sh and verify all tests pass
- [ ] T045 [US1] Verify firewall logs show blocked connection attempts with FW-BLOCKED-OUT prefix

**Checkpoint**: At this point, User Story 1 should be fully functional - AI assistant is deployed with network isolation and can access AWS Bedrock

---

## Phase 4: User Story 2 - VSCode DevContainer Integration (Priority: P2)

**Goal**: Enable developers to use VSCode "Reopen in Container" to connect to the firewall-protected AI assistant

**Independent Test**: Open project in VSCode, click "Reopen in Container", verify VSCode connects to ai-assistant container with all extensions working

### Tests for User Story 2

- [ ] T046 [P] [US2] Create contract test for devcontainer.json schema validation in /workspaces/XPai/tests/test-devcontainer.sh
- [ ] T047 [P] [US2] Add test case for required devcontainer.json fields to /workspaces/XPai/tests/test-devcontainer.sh
- [ ] T048 [P] [US2] Add test case for service reference validation to /workspaces/XPai/tests/test-devcontainer.sh

### Implementation for User Story 2

- [ ] T049 [US2] Create devcontainer.json configuration file at /workspaces/XPai/.devcontainer/devcontainer.json
- [ ] T050 [US2] Set name to "AI Assistant (Firewall Protected)" in /workspaces/XPai/.devcontainer/devcontainer.json
- [ ] T051 [US2] Configure dockerComposeFile reference to docker-compose.yml in /workspaces/XPai/.devcontainer/devcontainer.json
- [ ] T052 [US2] Set service to "ai-assistant" in /workspaces/XPai/.devcontainer/devcontainer.json
- [ ] T053 [US2] Configure workspaceFolder to /workspace in /workspaces/XPai/.devcontainer/devcontainer.json
- [ ] T054 [US2] Add Claude Code extension to extensions list in /workspaces/XPai/.devcontainer/devcontainer.json
- [ ] T055 [US2] Test VSCode "Reopen in Container" functionality
- [ ] T056 [US2] Verify VSCode terminal operates within ai-assistant container
- [ ] T057 [US2] Verify Claude Code extension activates and can communicate with AWS Bedrock
- [ ] T058 [US2] Run /workspaces/XPai/tests/test-devcontainer.sh and verify all tests pass

**Checkpoint**: VSCode devcontainer integration is complete - developers can seamlessly connect to firewall-protected environment

---

## Phase 5: User Story 3 - Whitelist Management for Testing (Priority: P3)

**Goal**: Enable developers to test new services by temporarily modifying the whitelist and restarting containers

**Independent Test**: Edit whitelist.txt to add a new endpoint, restart containers, verify new endpoint is accessible, verify changes can be promoted via git PR workflow

### Tests for User Story 3

- [ ] T059 [P] [US3] Add test case for whitelist modification workflow to /workspaces/XPai/tests/test-whitelist.sh
- [ ] T060 [P] [US3] Add test case for duplicate entry detection to /workspaces/XPai/tests/test-whitelist.sh
- [ ] T061 [P] [US3] Create integration test for whitelist update process in /workspaces/XPai/tests/test-whitelist-update.sh
- [ ] T062 [P] [US3] Add test case for container restart with new whitelist to /workspaces/XPai/tests/test-whitelist-update.sh
- [ ] T063 [P] [US3] Add test case for newly whitelisted endpoint accessibility to /workspaces/XPai/tests/test-whitelist-update.sh

### Implementation for User Story 3

- [ ] T064 [US3] Document whitelist modification workflow in /workspaces/XPai/docs/WHITELIST-MANAGEMENT.md
- [ ] T065 [US3] Add instructions for local testing in /workspaces/XPai/docs/WHITELIST-MANAGEMENT.md
- [ ] T066 [US3] Add instructions for git PR workflow in /workspaces/XPai/docs/WHITELIST-MANAGEMENT.md
- [ ] T067 [US3] Create example CODEOWNERS file at /workspaces/XPai/.github/CODEOWNERS with security team as reviewers for firewall/whitelist.txt
- [ ] T068 [US3] Test whitelist entry addition workflow (edit, restart, verify)
- [ ] T069 [US3] Test whitelist entry removal workflow (edit, restart, verify)
- [ ] T070 [US3] Run /workspaces/XPai/tests/test-whitelist.sh and verify all tests pass
- [ ] T071 [US3] Run /workspaces/XPai/tests/test-whitelist-update.sh and verify all tests pass
- [ ] T072 [US3] Verify restart time meets performance goal (<1 minute)

**Checkpoint**: Whitelist management workflow is complete - developers can test new services and promote changes via PR

---

## Phase 6: User Story 4 - Audit and Troubleshooting (Priority: P3)

**Goal**: Provide comprehensive logging and troubleshooting tools for security auditors and developers

**Independent Test**: Attempt blocked connections, verify logs show blocked attempts, verify iptables rules can be inspected, verify test suite provides clear diagnostics

### Tests for User Story 4

- [ ] T073 [P] [US4] Add test case for firewall log format validation to /workspaces/XPai/tests/test-firewall.sh
- [ ] T074 [P] [US4] Add test case for log prefix verification to /workspaces/XPai/tests/test-firewall.sh
- [ ] T075 [P] [US4] Add test case for blocked connection log entries to /workspaces/XPai/tests/test-firewall.sh

### Implementation for User Story 4

- [ ] T076 [P] [US4] Create firewall architecture documentation at /workspaces/XPai/docs/FIREWALL-ARCHITECTURE.md
- [ ] T077 [P] [US4] Document security architecture and threat model in /workspaces/XPai/docs/FIREWALL-ARCHITECTURE.md
- [ ] T078 [P] [US4] Document container architecture and network isolation in /workspaces/XPai/docs/FIREWALL-ARCHITECTURE.md
- [ ] T079 [P] [US4] Document iptables rule structure and order in /workspaces/XPai/docs/FIREWALL-ARCHITECTURE.md
- [ ] T080 [P] [US4] Document CMMC Level 2 compliance mapping in /workspaces/XPai/docs/FIREWALL-ARCHITECTURE.md
- [ ] T081 [P] [US4] Create firewall troubleshooting guide at /workspaces/XPai/docs/FIREWALL-TROUBLESHOOTING.md
- [ ] T082 [P] [US4] Document common failure scenarios in /workspaces/XPai/docs/FIREWALL-TROUBLESHOOTING.md
- [ ] T083 [P] [US4] Add diagnostic commands and expected outputs to /workspaces/XPai/docs/FIREWALL-TROUBLESHOOTING.md
- [ ] T084 [P] [US4] Add troubleshooting flowcharts to /workspaces/XPai/docs/FIREWALL-TROUBLESHOOTING.md
- [ ] T085 [US4] Verify firewall-manager container logs show initialization steps with [INIT], [WHITELIST], [RULES] prefixes
- [ ] T086 [US4] Verify blocked attempts logged with FW-BLOCKED- prefixes including destination IP and port
- [ ] T087 [US4] Test iptables inspection commands (iptables -L -n -v) from firewall-manager container
- [ ] T088 [US4] Verify test suite provides clear pass/fail indicators with actionable error messages
- [ ] T089 [US4] Run full test suite and verify all tests pass with clear output
- [ ] T090 [US4] Verify test execution time meets performance goal (<3 minutes)

**Checkpoint**: Audit and troubleshooting capabilities are complete - security auditors and developers have comprehensive visibility

---

## Phase 7: Polish & Cross-Cutting Concerns

**Purpose**: Final validation, performance optimization, and documentation completion

- [ ] T091 [P] Verify container startup time meets performance goal (<2 minutes)
- [ ] T092 [P] Verify API latency is within 100ms or 10% of direct Bedrock access baseline (measure: first-token latency for Claude 3.5 Sonnet with 100-token prompt, 10 samples, compare mean with/without firewall)
- [ ] T093 [P] Verify all constitutional principles are satisfied (TDD, Tidy First, Code Quality, etc.)
- [ ] T094 [P] Run shellcheck on all bash scripts and fix any warnings
- [ ] T095 [P] Run yamllint on all YAML files and fix any warnings
- [ ] T096 [P] Verify all file permissions are correct (whitelist.txt 444, init-firewall.sh 555)
- [ ] T097 Create main README.md with quickstart instructions at /workspaces/XPai/README-FIREWALL.md
- [ ] T098 Add security checklist to quickstart guide in /workspaces/XPai/README-FIREWALL.md
- [ ] T099 Validate quickstart.md instructions by following them end-to-end
- [ ] T100 Create pull request with all changes for security team review

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion - BLOCKS all user stories
- **User Stories (Phase 3-6)**: All depend on Foundational phase completion
  - User Story 1 (P1): Can start after Foundational - No dependencies on other stories ✅ MVP
  - User Story 2 (P2): Can start after Foundational - Depends on US1 docker-compose.yml
  - User Story 3 (P3): Can start after Foundational - Depends on US1 infrastructure
  - User Story 4 (P4): Can start after Foundational - Benefits from US1-3 being testable
- **Polish (Phase 7)**: Depends on all desired user stories being complete

### User Story Dependencies

- **User Story 1 (P1) - MVP**: Independently testable after Foundational phase
  - Delivers: Network-isolated AI assistant with AWS Bedrock access
  - Required for: All other user stories (provides base infrastructure)

- **User Story 2 (P2)**: Builds on US1
  - Delivers: VSCode devcontainer integration
  - Depends on: docker-compose.yml from US1
  - Independently testable: Yes (can verify VSCode connection)

- **User Story 3 (P3)**: Builds on US1
  - Delivers: Whitelist management workflow
  - Depends on: Firewall infrastructure from US1
  - Independently testable: Yes (can test whitelist modification)

- **User Story 4 (P3)**: Builds on US1-3
  - Delivers: Audit and troubleshooting capabilities
  - Depends on: Infrastructure from US1 for testing
  - Independently testable: Yes (can verify logs and diagnostics)

### Within Each User Story

- Tests MUST be written and FAIL before implementation (TDD)
- Test scripts before running tests
- Infrastructure before validation
- Core functionality before polish
- All tests must pass before story is considered complete

### Parallel Opportunities

#### Phase 1 (Setup) - 3 parallel groups:
```bash
# Group 1: Directory structure
T001 (firewall/), T002 (tests/), T003 (docs/)

# Group 2: .devcontainer directory
T004 (.devcontainer/)

# Group 3: Whitelist file
T005 (whitelist.txt), T006 (add Bedrock endpoints)
```

#### Phase 2 (Foundational) - Sequential (dependencies exist):
- T007-T016: Firewall script (sequential - each builds on previous)
- T017-T022: Docker compose (sequential - each builds on previous)

#### Phase 3 (User Story 1) - Tests in parallel:
```bash
# All contract/integration tests can run in parallel (different files):
T023, T024, T025, T026, T027 (whitelist tests)
T028, T029, T030, T031, T032, T033, T034 (firewall tests)
```

#### Phase 4 (User Story 2) - Tests in parallel:
```bash
T046, T047, T048 (devcontainer tests)
```

#### Phase 5 (User Story 3) - Tests in parallel:
```bash
T059, T060 (whitelist tests)
T061, T062, T063 (update tests)
```

#### Phase 6 (User Story 4) - Tests and docs in parallel:
```bash
# Tests:
T073, T074, T075

# Documentation (all independent):
T076, T077, T078, T079, T080 (architecture docs)
T081, T082, T083, T084 (troubleshooting docs)
```

#### Phase 7 (Polish) - Most tasks in parallel:
```bash
T091, T092, T093, T094, T095, T096 (all verification tasks independent)
```

---

## Parallel Example: User Story 1 Tests

```bash
# Launch all contract tests for User Story 1 together:
Task: "Create contract test for whitelist file format validation in /workspaces/XPai/tests/test-whitelist.sh"
Task: "Add test case for valid domain:port format to /workspaces/XPai/tests/test-whitelist.sh"
Task: "Add test case for invalid port range to /workspaces/XPai/tests/test-whitelist.sh"
Task: "Add test case for comment and empty line handling to /workspaces/XPai/tests/test-whitelist.sh"
Task: "Add test case for invalid entry formats to /workspaces/XPai/tests/test-whitelist.sh"

# Launch all integration tests for User Story 1 together:
Task: "Create integration test for firewall behavior in /workspaces/XPai/tests/test-firewall.sh"
Task: "Add test case for whitelisted endpoint accessibility to /workspaces/XPai/tests/test-firewall.sh"
Task: "Add test case for non-whitelisted endpoint blocking to /workspaces/XPai/tests/test-firewall.sh"
Task: "Add test case for container capability verification to /workspaces/XPai/tests/test-firewall.sh"
Task: "Add test case for iptables rules verification to /workspaces/XPai/tests/test-firewall.sh"
Task: "Add test case for network namespace sharing to /workspaces/XPai/tests/test-firewall.sh"
Task: "Add test case for firewall logs validation to /workspaces/XPai/tests/test-firewall.sh"
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup (6 tasks)
2. Complete Phase 2: Foundational (16 tasks) - CRITICAL, blocks all stories
3. Complete Phase 3: User Story 1 (23 tasks)
4. **STOP and VALIDATE**: Run test suite, verify all acceptance scenarios pass
5. Deploy/demo if ready - this delivers core security functionality

**MVP Delivers**:
- Network-isolated AI assistant container
- AWS Bedrock access with deny-by-default firewall
- Zero network capabilities in AI container
- Comprehensive test coverage
- CMMC Level 2 compliance for network access control

### Incremental Delivery

1. **Foundation** (Setup + Foundational): 22 tasks → Infrastructure ready
2. **MVP** (User Story 1): +23 tasks → Network isolation working, independently tested
3. **Enhanced UX** (User Story 2): +13 tasks → VSCode integration working, independently tested
4. **Testing Workflow** (User Story 3): +14 tasks → Whitelist management working, independently tested
5. **Audit Capability** (User Story 4): +18 tasks → Full observability, independently tested
6. **Polish**: +10 tasks → Production ready

Each increment adds value without breaking previous functionality.

### Parallel Team Strategy

With multiple developers:

1. **Team completes Setup + Foundational together** (critical path)
2. **Once Foundational is done, parallelize**:
   - Developer A: User Story 1 (MVP - highest priority)
   - Developer B: User Story 2 (VSCode integration - can start after US1 docker-compose exists)
   - Developer C: User Story 4 (Documentation - can start early)
3. **User Story 3 after US1**: Requires working firewall infrastructure
4. **Team converges for Polish**

---

## Task Summary

### Total Tasks by Phase
- **Phase 1 (Setup)**: 6 tasks
- **Phase 2 (Foundational)**: 16 tasks
- **Phase 3 (User Story 1)**: 23 tasks (12 tests + 11 implementation)
- **Phase 4 (User Story 2)**: 13 tasks (3 tests + 10 implementation)
- **Phase 5 (User Story 3)**: 14 tasks (5 tests + 9 implementation)
- **Phase 6 (User Story 4)**: 18 tasks (3 tests + 15 implementation)
- **Phase 7 (Polish)**: 10 tasks

**Total**: 100 tasks

### Total Tasks by User Story
- **Setup + Foundational**: 22 tasks (prerequisite for all stories)
- **User Story 1 (P1)**: 23 tasks - Deploy AI Assistant with Network Isolation ✅ MVP
- **User Story 2 (P2)**: 13 tasks - VSCode DevContainer Integration
- **User Story 3 (P3)**: 14 tasks - Whitelist Management for Testing
- **User Story 4 (P3)**: 18 tasks - Audit and Troubleshooting
- **Polish**: 10 tasks

### Parallelizable Tasks
- **Phase 1**: 3 parallel groups (6 tasks)
- **Phase 3 Tests**: 12 tasks can run in parallel
- **Phase 4 Tests**: 3 tasks can run in parallel
- **Phase 5 Tests**: 5 tasks can run in parallel
- **Phase 6 Tests/Docs**: 13 tasks can run in parallel
- **Phase 7**: 6 tasks can run in parallel

**Total parallelizable**: ~45 tasks (45% of all tasks)

### Suggested MVP Scope
**Minimum Viable Product = Setup + Foundational + User Story 1**
- Total tasks: 45 tasks
- Delivers: Network-isolated AI assistant with AWS Bedrock access
- Time estimate: 2-3 days for single developer
- Validation: Full test suite for security properties

---

## Notes

- [P] tasks = different files, no dependencies, can run in parallel
- [Story] label maps task to specific user story for traceability (US1, US2, US3, US4)
- Each user story is independently testable after completion
- All tests follow TDD: write test → verify failure → implement → verify success
- Tests are mandatory per specification acceptance criteria
- Commit after each logical group of tasks (e.g., after completing a test script)
- Stop at any checkpoint to validate story independently
- Performance goals tracked throughout (startup <2min, tests <3min, whitelist update <1min)
- Security properties validated at multiple checkpoints (capabilities, network isolation, firewall rules)

---

## Format Validation

✅ **All tasks follow required format**:
- Checkbox: `- [ ]`
- Task ID: Sequential (T001-T100)
- [P] marker: Present where tasks are parallelizable
- [Story] label: Present for all user story tasks (US1, US2, US3, US4)
- Description: Clear action with exact file path
- Example: `- [ ] T023 [P] [US1] Create contract test for whitelist file format validation in /workspaces/XPai/tests/test-whitelist.sh`
