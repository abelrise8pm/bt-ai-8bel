
# XPai Base Container

## Overview
This base container is designed to be shared across multiple projects. It includes pre-configured AI assistant tools (claude-code, gemini-cli, goose) and Node.js runtime, providing a consistent development environment while maintaining security standards for CUI and Federal customers.

For security rationale and compliance details, see our [security stance document](https://docs.google.com/document/d/1LJNSA-MnrNvUikE__-_G9JgEF6GE66cjUUPOWMoag0o/edit?tab=t.0#heading=h.3uxz91ih8lr2).

## Using as a Base Container for Other Projects

This container can be used as a base for other projects that would like an AI pair.

See [starter repo](https://github.com/rise8-us/xpai-ai-assistant-container-starter/blob/main/README.md) for details.

## Available AI Assistants

The container comes pre-installed with:
- **[Claude Code](https://www.anthropic.com/claude-code)**: Type `claude` to get started.
- **[Gemini CLI](https://github.com/google-gemini/gemini-cli)**: Type `gemini` to get started.
- **[Goose](https://github.com/block/goose)**: Type `goose` to get started.

> Currently Claude Code is the industry leading AI coding assistant but you are free to try others.

## Available Claude Code Slash Commands

The container includes helpful slash commands for structured development workflows:

### `/commit`
Creates conventional commits based on staged files. Located in `/home/aiAssistant/.claude/commands/commit.md`.

Usage:
1. Stage your changes: `git add <files>`
2. In Claude Code, type: `/commit`
3. Claude will analyze changes and create a proper commit message

Projects can override this command by creating their own `.claude/commands/commit.md` file.

## Known Issues

- Zscaler internet security may cause pulling issues. See [issue #210](https://github.com/rise8-us/XPai/issues/210) for workarounds.
