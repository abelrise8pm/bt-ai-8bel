# Feature Story: Pre-configured MCP Dev-Commands Server Integration

**As a** Rise8 developer using the AI assistant container  
**I want** the mcp/dev-commands server to be pre-installed and pre-configured in Claude Code  
**So that** I can immediately use structured agentic workflows instead of ad hoc prompting without any manual setup

## Background
Rise8 developers want to transition from ad hoc prompting to structured agentic workflows. The mcp/dev-commands server provides the first step in this transition by offering predefined development workflow prompts (create-story, plan-implementation, implement, etc.).

## Acceptance Criteria

**GIVEN** I start the ai-assistant-container  
**WHEN** I run Claude Code inside the container  
**THEN** the mcp/dev-commands server should be automatically available and configured

**GIVEN** the mcp/dev-commands server is installed  
**WHEN** I use Claude Code  
**THEN** I should have access to all dev-commands prompts (create-story, implement, quality-review, etc.) without any manual configuration

**GIVEN** the container is built via the build-ai-assistant-container pipeline  
**WHEN** the build process completes successfully  
**THEN** the mcp/dev-commands server should be included and configured in the resulting image

**GIVEN** the feature is implemented  
**WHEN** a Rise8 developer starts using the container  
**THEN** they should be able to immediately begin using structured agentic workflows

## Technical Requirements
- Install the mcp/dev-commands server as part of the Dockerfile build process
- Modify `claude_code_init.sh` to automatically configure the MCP server connection
- Ensure the configuration persists across container restarts
- Integration should work with the existing build-ai-assistant-container.yml pipeline
- No manual configuration steps should be required by developers

## Definition of Done
- [ ] MCP dev-commands server is installed in the ai-assistant-container Dockerfile
- [ ] Claude Code is automatically configured to connect to the MCP server via claude_code_init.sh
- [ ] Build pipeline (build-ai-assistant-container.yml) successfully creates containers with the integration
- [ ] Container tests verify that MCP server is accessible from Claude Code
- [ ] Documentation is updated if needed (README)
- [ ] Rise8 developers can immediately use dev-commands prompts without setup