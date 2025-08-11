#!/usr/bin/env bash

# !!! This script may overwrite your current config. Don't blindly execute !!!

# https://ainativedev.io/news/configuring-claude-code
# https://gist.github.com/jedi4ever/762ca6746ef22b064550ad7c04f3bd2f

# Script to automate Claude Code after installation
# install via `npm install -g @anthropic-ai/claude-code`

# Key features:
# - gets the onboarding wizard out of the way
# - configure API keys
# - trust current directory
# - configure MCP and permission
#  -set timeouts and opt out on things


##################################
# Setting up the API access :
# - claude code has two modes : either via Claude Max or using an API
# - claude max opens an oauth flow, which we can't use
# - we use the ANTHROPIC_API_KEY environment variable directly
# - this is the standard approach and avoids auth conflicts
##################################

##################################
# Configuring claude code
##################################
# - on the one hand claude code wants us to use claude config
# - but for example I was not able to configure the theme using it:
# the command executed with no errors, but kept asking for the theme
# also see https://github.com/anthropics/claude-code/issues/434
# and https://github.com/anthropics/claude-code/issues/441

#
# - https://docs.anthropic.com/en/docs/claude-code/settings#settings-files
# - on the other hand the docs mentions it'd deprecating that command
# - we resort to creating a skeleton json file
#

# for the API key to work without prompts, we need to mark it as approved
# - the approval is based on the last 20 chars of the key
# - we use the ANTHROPIC_API_KEY environment variable directly
##################################
ANTHROPIC_API_KEY_LAST_20_CHARS=${ANTHROPIC_API_KEY: -20}

# We write the global config to ~/.claude.json
# Warning this overwrites your existing
cat <<EOM > ~/.claude.json
{
    "customApiKeyResponses": {
        "approved": [ "$ANTHROPIC_API_KEY_LAST_20_CHARS"],
        "rejected": [  ]
    }
}
EOM

##################################
# Trust the current dir/project
# - when you enter a new directoy, claude asks it you trust it
# - we use the claude config to trust it
##################################
claude config set hasTrustDialogAccepted true

# We turn off autoupdates because we want to control the
# versions people are using for security.
claude config set --global autoUpdates false

# - hasCompletedOnboarding indicates configuration is done
# claude config set hasCompletedProjectOnboarding true

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
