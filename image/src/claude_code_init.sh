#!/usr/bin/env bash
set -eu

# Claude Code non-interactive initialization
# Idempotent — safe to run on every login (merges config, never overwrites user state)
#
# References:
# - https://ainativedev.io/news/configuring-claude-code
# - https://gist.github.com/jedi4ever/762ca6746ef22b064550ad7c04f3bd2f
# - https://docs.anthropic.com/en/docs/claude-code/settings#settings-files

##################################
# ~/.claude.json — global config (outside ~/.claude/ volume)
##################################
# This file is ephemeral (not in the persisted volume) but may accumulate
# state during a session (tool approvals, onboarding flags). We merge keys
# instead of overwriting to preserve any existing state.
#
# hasTrustDialogAccepted: skip the "trust this directory?" prompt
# customApiKeyResponses: pre-approve ANTHROPIC_API_KEY (non-CUI only)

CLAUDE_JSON=~/.claude.json

# Ensure the file exists with valid JSON
if [ ! -f "$CLAUDE_JSON" ]; then
    echo '{}' > "$CLAUDE_JSON"
fi

# Always set trust dialog accepted
CLAUDE_JSON_CONTENT=$(jq '.hasTrustDialogAccepted = true' "$CLAUDE_JSON")

# Approve API key if ANTHROPIC_API_KEY is set (non-CUI/direct API mode)
if [ -n "${ANTHROPIC_API_KEY:-}" ]; then
    LAST20=${ANTHROPIC_API_KEY: -20}
    CLAUDE_JSON_CONTENT=$(echo "$CLAUDE_JSON_CONTENT" | jq \
        --arg key "$LAST20" \
        '.customApiKeyResponses.approved = ((.customApiKeyResponses.approved // []) + [$key] | unique)')
fi

echo "$CLAUDE_JSON_CONTENT" > "$CLAUDE_JSON"

# Note: DISABLE_AUTOUPDATER is set via ENV in the Dockerfile.
# No need to write ~/.claude/settings.json — user owns that file.

#################################
# Configuring MCP servers
# - it has an claude mcp subcommand
# - I prefer to add it through the json command at is has more options
# - also beware that the env vars you set are visible using the claude mcp
# - ideally you limit the read access to the .claude.json or ~/.claude with umask or similar
#################################

#################################
# Configuring MCP dev-commands server
# - uses direct node execution to avoid npm symlink issues
# - implements error handling and graceful conflict resolution
# - verifies successful registration
#################################

# Registration does not seem to work whe devcontainers
# so we will just manually register them for each project.
# This seems like a better idea because it let's the projects
# determine what MCP servers they want to use.

# echo "Configuring MCP dev-commands server..."

# # Check if dev-commands server is already configured
# if claude mcp list 2>/dev/null | grep -q "dev-commands"; then
#     echo "MCP dev-commands server already configured, skipping..."
# else
#     # Generate MCP server configuration using direct node execution
#     # This avoids npm symlink issues as recommended in MCP documentation
#     read -r -d '' MCP_DEV_COMMANDS_JSON <<'EOF'
# {
#     "command": "node",
#     "args": ["/home/aiAssistant/.npm-global/lib/node_modules/@rise8-us/dev-commands-mcp-server/dist/index.js"]
# }
# EOF

#     # Register the MCP server with Claude Code
#     echo "Registering MCP dev-commands server..."
#     claude mcp add-json dev-commands "$MCP_DEV_COMMANDS_JSON" 2>/dev/null || {
#         echo "Warning: Failed to register MCP dev-commands server during init"
#     }
# fi

#################################
# Setting up permissions
# - we can config it using claude config add
# - though it says that's soon deprecated
# - we use add instead of set because it's an array
# - it writes the settings to ~/.claude/settings.json
# - mcp servers use the mcp__ prefix in the settings
# https://docs.anthropic.com/en/docs/claude-code/settings
#################################
# claude config add allowedTools "Edit,Bash"

#################################
# IDE extension:
# - Claude code comes with a VSCODE/Cursor extension
# - this extension is not available through the marketplace
# - it is part of the npm package
# - Note: this only works in an IDE terminal , not in postcreate commands , I set it in my .bashrc
#################################
# set the IDE code for `vscode` , `cursor` for cursor
# IDE_CMD=vscode

# Do this in a tempdir
# tempdir=$(mktemp -d)
# cd $tempdir

# downloads the package
# npm pack @anthropic-ai/claude-code
# tar -xzvf anthropic-ai-claude-code-*.tgz
# Install the extension
# requires a reload of the editor
# $IDE_CMD --install-extension package/vendor/claude-code.vsix

#################################
# Interesting (undocumented settings)
#################################
# found via https://github.com/Helmi/claude-simone?tab=readme-ov-file#enabling-parallel-task-execution
# claude config set --global  parallelTasksCount 3

#################################
# Handy env vars
#################################

# enable debug logging
# export ANTHROPIC_LOG=debug

# disable non-essential traffic and disable telemetry
# - Equivalent of setting DISABLE_AUTOUPDATER, DISABLE_BUG_COMMAND, DISABLE_ERROR_REPORTING, and DISABLE_TELEMETRY
# export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=true

# define frequency of api helper refresh
# CLAUDE_CODE_API_KEY_HELPER_TTL_MS

# set/increase the bash timeout for longer commands
# BASH_DEFAULT_TIMEOUT_MS

# set the mcp timeout
# MCP_TIMEOUT
