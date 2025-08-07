# Implementation Plan: Pre-configured MCP Dev-Commands Server Integration

## Overall Design Approach

The implementation will integrate the `@rise8-us/dev-commands-mcp-server` into the ai-assistant-container by:

1. **Build-time Installation**: Installing the MCP server as a global npm package during Docker image build
2. **GitHub Packages Authentication**: Configuring npm authentication for GitHub Packages access during CI/CD
3. **Automatic Configuration**: Modifying `claude_code_init.sh` to automatically configure Claude Code with the MCP server
4. **STDIO Transport**: Using the recommended direct node execution approach to avoid npm symlink issues
5. **Container Integration**: Ensuring the server is available immediately when developers start the container

The approach follows the existing container patterns and leverages the commented MCP configuration examples already present in `claude_code_init.sh`.

## Implementation Milestones

### Milestone 1: GitHub Packages Authentication Setup
**Goal**: Configure CI/CD pipeline to authenticate with GitHub Packages for npm package installation  
**Dependencies**: None  
**Steps**:
1. Add GitHub token secret configuration to build pipeline environment
2. Create `.npmrc` configuration in container build context for GitHub Packages access
3. Update Dockerfile to copy and configure `.npmrc` during build process
4. Verify npm can access `@rise8-us` scoped packages during build
5. Add build argument for GitHub token to maintain security best practices
6. Test authentication with a dry-run package installation

**Exit Criteria**:
- CI/CD pipeline can authenticate with GitHub Packages
- Dockerfile can access `@rise8-us/dev-commands-mcp-server` during build
- Security: GitHub token is properly handled as a build secret
- Integration tests verify package accessibility
- No authentication credentials persist in final container image

### Milestone 2: MCP Server Installation in Container
**Goal**: Install and configure the MCP dev-commands server in the ai-assistant-container  
**Dependencies**: Milestone 1 (GitHub Packages authentication)  
**Steps**:
1. Update Dockerfile to install `@rise8-us/dev-commands-mcp-server` globally via npm
2. Pin the MCP server version using ARG variable pattern (following existing CLAUDE_CODE_VERSION approach)
3. Ensure MCP server installation follows existing security patterns (user permissions, path setup)
4. Verify server binary is available at expected global npm path
5. Add MCP server installation to existing npm install layer for efficiency
6. Clean up authentication artifacts after package installation

**Exit Criteria**:
- MCP dev-commands server is installed globally in container
- Server executable is available at `/home/aiAssistant/.npm-global/lib/node_modules/@rise8-us/dev-commands-mcp-server/dist/index.js`
- Installation follows container security best practices
- Container size impact is minimized through layer optimization
- Installation integrates cleanly with existing npm package management

### Milestone 3: Claude Code Auto-Configuration
**Goal**: Modify claude_code_init.sh to automatically configure the MCP server connection  
**Dependencies**: Milestone 2 (MCP server installation)  
**Steps**:
1. Uncomment and modify MCP configuration section in `claude_code_init.sh`
2. Create JSON configuration for dev-commands MCP server using direct node execution
3. Use `claude mcp add-json` command to register the MCP server automatically
4. Implement error handling for MCP server registration
5. Add verification step to ensure MCP server is properly registered
6. Update script to handle potential configuration conflicts gracefully

**Exit Criteria**:
- Claude Code automatically configures MCP dev-commands server on container startup
- MCP server uses recommended STDIO transport with direct node execution
- Configuration persists across container restarts
- Error handling prevents script failures if MCP server is already configured
- Verification confirms successful MCP server registration

### Milestone 4: Container Testing Integration
**Goal**: Update container tests to verify MCP server accessibility from Claude Code  
**Dependencies**: Milestone 3 (Claude Code auto-configuration)  
**Steps**:
1. Add MCP server availability test to `scripts/test.sh`
2. Create test to verify Claude Code can list available MCP prompts
3. Add functional test that executes a simple MCP prompt (e.g., development-workflow-guide)
4. Ensure tests work with existing CI/CD environment variables
5. Update test documentation to reflect new MCP server testing
6. Add timeout and error handling for MCP communication tests

**Exit Criteria**:
- Container test suite verifies MCP server installation
- Tests confirm Claude Code can discover and communicate with MCP server
- Functional test validates end-to-end prompt execution
- Tests pass in CI/CD environment with proper authentication
- Test failures provide clear diagnostic information

### Milestone 5: Documentation and Pipeline Integration
**Goal**: Complete integration with build pipeline and update documentation  
**Dependencies**: Milestone 4 (container testing)  
**Steps**:
1. Update `build-ai-assistant-container.yml` to include GitHub token for package access
2. Add MCP_DEV_COMMANDS_VERSION ARG to Dockerfile following existing version patterns
3. Update container README with MCP dev-commands server information
4. Add troubleshooting section for MCP server issues
5. Document the available development workflow prompts for users
6. Verify full CI/CD pipeline works end-to-end with new integration

**Exit Criteria**:
- CI/CD pipeline successfully builds containers with MCP server integration
- Documentation clearly explains MCP dev-commands availability and usage
- README includes troubleshooting guidance for MCP server issues
- Pipeline security follows existing patterns for sensitive credentials
- Rise8 developers can immediately access structured agentic workflows

## Additional Context

**Key Resources:**
- MCP Dev Commands README: `/workspaces/XPai/mcp/dev-commands/README.md`
- MCP Server Configuration Example: Lines 85-96 in `claude_code_init.sh` show the pattern for MCP configuration
- GitHub Packages Documentation: https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-npm-registry
- Claude Code MCP Integration: https://docs.anthropic.com/en/docs/claude-code/mcp

**MCP Server Details:**
- Package: `@rise8-us/dev-commands-mcp-server`
- Recommended execution: `node /home/aiAssistant/.npm-global/lib/node_modules/@rise8-us/dev-commands-mcp-server/dist/index.js`
- Transport: STDIO (avoids npm symlink issues)
- Available prompts: create-story, implement, quality-review, troubleshoot, commit, refactor, etc.

## Risk Assessment

**High Risk:**
- **GitHub Packages Authentication**: Token management and secret security in CI/CD pipeline
  - *Mitigation*: Use GitHub Actions secrets, build args, and multi-stage builds to avoid credential persistence

**Medium Risk:**
- **Package Version Compatibility**: MCP server package updates breaking container compatibility
  - *Mitigation*: Pin package version with ARG variable, test version updates before deployment

- **MCP STDIO Transport Issues**: Known issues with npm symlinks in MCP communication
  - *Mitigation*: Use direct node execution path as recommended in MCP server documentation

**Low Risk:**
- **Container Size Impact**: Adding npm package increases container size
  - *Mitigation*: Combine with existing npm install layer, clean up artifacts

- **Claude Code Configuration Conflicts**: Existing user MCP configurations
  - *Mitigation*: Implement graceful error handling, check existing configuration before adding

## Testing Strategy

**Unit Testing:**
- Dockerfile build tests with and without GitHub token
- claude_code_init.sh script testing with mock MCP configurations

**Integration Testing:**
- Container functional tests verify MCP server installation
- Claude Code MCP communication tests
- End-to-end prompt execution validation

**CI/CD Testing:**
- Pipeline tests with GitHub Packages authentication
- Multi-architecture build testing (ARM64/AMD64)
- Security scanning includes MCP server package

**User Acceptance Testing:**
- Rise8 developer workflow validation
- Immediate availability of dev-commands prompts without setup
- Documentation accuracy and completeness