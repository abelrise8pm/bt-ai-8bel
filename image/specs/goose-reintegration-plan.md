# Goose Reintegration Implementation Plan

**GitHub Issue**: #226 - Add Goose back to AI Assistant container

## Overall Design Approach

The approach will be to incrementally add Goose back to the AI Assistant container using the latest version installation method, starting with minimal dependencies and only adding what's proven necessary through testing. The strategy involves:

1. **Iterative Dependency Discovery**: Start with the latest Goose installation and test what dependencies are actually needed
2. **Clear Documentation**: Document each dependency's purpose in the Dockerfile for maintainability
3. **Robust Testing**: Extend the existing test.sh framework to validate Goose functionality
4. **Configuration Management**: Restore Goose configuration based on the previous setup but updated for latest version

## Implementation Milestones

### Milestone 1: Install Latest Goose and Test Dependencies
**Goal**: Install the latest Goose version and identify minimal required dependencies through testing
**Duration Estimate**: 1-2 hours
**Dependencies**: None
**Steps**:
1. Add latest Goose installation to Dockerfile using the latest github release. Pin the version number.
2. Document the Goose installation section with comments explaining its purpose
3. Build container and test if Goose runs without additional dependencies
4. If libxcb1 or other dependencies are needed, add them with clear documentation of why each is required
5. Test Goose basic functionality (version check, help command)
6. Document all findings about which dependencies are actually required

**Exit Criteria**:
- Goose installs successfully in container
- Basic Goose commands run without errors
- All dependencies are documented with their purpose
- Container builds successfully
- No functionality regressions for existing tools

### Milestone 2: Restore and Update Goose Configuration
**Goal**: Create updated Goose configuration file based on previous setup and latest requirements
**Duration Estimate**: 30-60 minutes
**Dependencies**: Milestone 1 completed
**Steps**:
1. Create new goose-config.yaml based on previous configuration structure
2. Update model references to use latest available models (claude-sonnet-4, claude-opus-4)
3. Review and update extension configurations for latest Goose version
4. Add configuration file copying to Dockerfile
5. Set proper file permissions and ownership for aiAssistant user
6. Test configuration loading with `goose info -v` equivalent

**Exit Criteria**:
- Configuration file is properly formatted and valid
- Goose loads configuration without errors
- All extensions are properly configured
- Configuration follows latest Goose standards
- File permissions allow aiAssistant user to read config

### Milestone 3: Documentation and Cleanup
**Goal**: Update documentation and ensure clean implementation
**Duration Estimate**: 30 minutes
**Dependencies**: Milestone 3 completed
**Steps**:
1. Add clear comments in Dockerfile explaining each dependency's purpose
2. Verify all dependency comments specify which tool they support
3. Review Dockerfile for any cleanup opportunities
4. Ensure consistent formatting and style
5. Validate final container size impact
6. Test complete build-to-run workflowCan we install goose after we switch to aiAssistant user in Dockerfile? Does this improve our security stance?

**Exit Criteria**:
- Dockerfile has clear documentation for all dependencies
- Dependencies are clearly attributed to specific tools (Claude Code/Goose)
- No unused dependencies or configurations remain
- Container builds and runs successfully
- All existing functionality preserved

## Risk Assessment

**Potential Blockers & Mitigation Strategies**:

1. **Dependency Conflicts**: Latest Goose may require dependencies that conflict with existing tools
   - *Mitigation*: Test incrementally, document conflicts, use specific package versions if needed

2. **Container Size Growth**: Adding dependencies may significantly increase container size
   - *Mitigation*: Use multi-stage builds if necessary, clean up package cache, monitor size impact

3. **Configuration Format Changes**: Latest Goose may have different config requirements
   - *Mitigation*: Reference official documentation, test configuration loading, use backward-compatible options

4. **Architecture Compatibility**: ARM64 support may have different dependency requirements
   - *Mitigation*: Test on both architectures, use architecture-specific package selection if needed

5. **New GUI Dependencies**: Latest Goose may introduce new X11/GUI requirements
   - *Mitigation*: Test in headless environment first, add minimal GUI libraries only if absolutely required

## Testing Strategy

**Comprehensive Testing Approach**:
- **Container Tests**: Full build-to-run workflow validation. Already present in test.sh.
- **Regression Tests**: Ensure existing tools (Claude Code, Gemini CLI) remain functional
- **Dependency Isolation Tests**: Verify each dependency's necessity through selective testing

The testing strategy leverages the existing robust test.sh framework, extending it with Goose-specific validations while maintaining the same error handling patterns and output formatting conventions.

## Technical Context

**Previous Goose Configuration** (from git history):
```yaml
GOOSE_PROVIDER: anthropic
GOOSE_MODEL: claude-sonnet-4-20250514
GOOSE_PLANNER_PROVIDER: anthropic
GOOSE_PLANNER_MODEL: claude-opus-4-20250514
extensions:
  developer:
    bundled: true
    display_name: Developer
    enabled: true
    name: developer
    timeout: 300
    type: builtin
```

**Current Container State**:
- Base: Ubuntu 24.04 LTS (ARM64/AMD64 support)
- Tools: Node.js 22.17.0, Claude Code 1.0.51, Gemini CLI 0.1.12
- User: aiAssistant with npm global directory setup
- Dependencies: git, curl, jq, ca-certificates, openssh-client, gnupg2, bzip2

**Latest Goose Installation Method** (2025):
```bash
curl -fsSL https://github.com/block/goose/releases/download/stable/download_cli.sh | bash
```

## Implementation Notes

- Follow existing Dockerfile patterns for tool installation and documentation
- Maintain the security-focused minimal utilities approach
- Ensure all installations include SHA verification where possible
- Use the established pattern of apt-get clean && rm -rf for package cache cleanup
- Follow the existing user permission and ownership patterns for aiAssistant user