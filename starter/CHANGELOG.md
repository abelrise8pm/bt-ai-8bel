# Starter Template Changelog

This changelog tracks all notable changes to the AI Assistant Container Starter Template.

> **For the latest updates:** Visit the [starter template repository](https://github.com/rise8-us/xpai-ai-assistant-container-starter)
>
> **Source repository:** This template is published from [xpai-ai-assistant-container](https://github.com/rise8-us/xpai-ai-assistant-container)

## How to Check for Updates

Projects created from this template start with a snapshot of files. To see what's changed since you created your project:

1. **Find your starting point** - Note the date you created your project from this template
2. **Review changelog** - Look at all entries after your creation date
3. **Identify relevant updates** - Determine which changes apply to your project
4. **Apply updates manually** - Follow the process below

### Applying Updates to Your Project

Since your project doesn't share git history with this template, you'll need to manually apply updates:

1. **Click the commit link** in the changelog to view the change on GitHub
2. **Review the diff** - You'll see changes with the `starter/` path prefix
   - Example: `starter/README.md` in the diff corresponds to `README.md` in your project
3. **Apply changes manually**:
   - Open the corresponding file(s) in your project
   - Copy relevant changes from the diff
   - Adapt as needed for your customizations
4. **Test thoroughly** - Ensure the updates work with your project configuration
5. **Commit your changes** - Document what you integrated from the template

**Note:** You don't need to apply every update. Choose only the changes that benefit your project.

**Path Translation:**
- Diff shows: `starter/scripts/setup.sh` → Your project: `scripts/setup.sh`
- Diff shows: `starter/CLAUDE.md` → Your project: `CLAUDE.md`

---

## December 17, 2025

### Added
- Diagnostic script (`scripts/diagnose.sh`) that checks all onboarding phases and provides actionable fix commands for self-service troubleshooting ([7c6d183](https://github.com/rise8-us/xpai-ai-assistant-container/commit/7c6d183))
- "Tools Overview" section in README explaining when to use GitHub Desktop, VS Code, and Terminal for different tasks ([7c6d183](https://github.com/rise8-us/xpai-ai-assistant-container/commit/7c6d183))
- Warning about opening repository ROOT directory to ensure "Reopen in Container" appears ([7c6d183](https://github.com/rise8-us/xpai-ai-assistant-container/commit/7c6d183))

### Changed
- Firewall manager now uses prebuilt Alpine container image instead of runtime script mounting, improving deployment simplicity and reproducibility ([60a2539](https://github.com/rise8-us/xpai-ai-assistant-container/commit/60a2539), [f9f6cb2](https://github.com/rise8-us/xpai-ai-assistant-container/commit/f9f6cb2))
- Updated AI assistant container software with new capabilities and fixes ([be21127](https://github.com/rise8-us/xpai-ai-assistant-container/commit/be21127)):
  - **Claude Code 2.0.65 → 2.0.71** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): `/config` toggle for prompt suggestions, `/settings` alias, Enter key to accept prompt suggestions immediately, wildcard MCP permissions (`mcp__server__*`), `plan_mode_required` spawn parameter for teammates, 3x memory usage improvement for large conversations, thinking mode enabled by default for Opus 4.5, `/permissions` search with `/` shortcut, IME support for CJK languages, enterprise managed settings support
  - **Gemini CLI 0.20.0 → 0.21.0** ([changelog](https://github.com/google-gemini/gemini-cli/releases)): Fuzzy search in settings interface, message bus integration enabled by default, hooks system with lifecycle management and compression, auto-generated session summaries, extension hooks with security warnings, schema-validated settings, MCP dynamic tool updates via `notifications/tools/list_changed`
- Base container now includes OpenTelemetry configuration for telemetry export to Rise8's monitoring infrastructure ([7f2f7ae](https://github.com/rise8-us/xpai-ai-assistant-container/commit/7f2f7ae))

---

## December 16, 2025

### Added
- Multi-repository mounting guide to Advanced Topics documentation, enabling teams to work across multiple codebases simultaneously in the same container ([149052c](https://github.com/rise8-us/xpai-ai-assistant-container/commit/149052c))
  - Use cases for code migration, shared libraries, and dependent services
  - Step-by-step devcontainer.json configuration with bind mounts
  - Real-world examples and access patterns

---

## December 15, 2025

### Changed
- Simplified CUI container configuration by hard-coding container names and removing non-functional PROJECT_NAME variable ([d32f414](https://github.com/rise8-us/xpai-ai-assistant-container/commit/d32f414))

### Fixed
- Publish script now properly cleans up temporary split branches after execution by returning to original directory before deletion ([8d50d6b](https://github.com/rise8-us/xpai-ai-assistant-container/commit/8d50d6b))
- Resolved git diff-index race condition in publish script that could cause stale CHANGELOG validation warnings ([665ba77](https://github.com/rise8-us/xpai-ai-assistant-container/commit/665ba77))

---

## December 14, 2025

### Added
- Security rationale section explaining supply chain attack risks and benefits of containerized AI assistants ([9f9277c](https://github.com/rise8-us/xpai-ai-assistant-container/commit/9f9277c))
- Linting and quality checks guidance to CLAUDE.md for deterministic tooling alongside AI-generated code ([9f9277c](https://github.com/rise8-us/xpai-ai-assistant-container/commit/9f9277c))

### Changed
- Enhanced onboarding documentation with GitHub template tips, Rippling timeout warnings, and Claude tutor guidance ([1c2f13d](https://github.com/rise8-us/xpai-ai-assistant-container/commit/1c2f13d))

### Fixed
- Onboarding script idempotency bug that prevented re-running after interruptions like GitHub auth timeout ([1c2f13d](https://github.com/rise8-us/xpai-ai-assistant-container/commit/1c2f13d))

---

## December 12, 2025

### Added
- Enhanced changelog update process with software version tracking and comprehensive feature summaries ([01683ea](https://github.com/rise8-us/xpai-ai-assistant-container/commit/01683ea))

### Changed
- Updated AI assistant container software with new capabilities and fixes ([2372dd1](https://github.com/rise8-us/xpai-ai-assistant-container/commit/2372dd1)):
  - **Claude Code 2.0.59 → 2.0.65** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): Model switching during prompts (alt+p/option+p), named session support (/rename and /resume commands), background agent execution, context window info in status line, instant auto-compacting, .claude/rules/ directory support for memory management, custom file search commands via fileSuggestion setting, CLAUDE_CODE_SHELL environment variable, improved /resume screen with keyboard shortcuts, image dimension metadata for accurate coordinates
  - **Gemini CLI 0.19.4 → 0.20.0** ([changelog](https://github.com/google-gemini/gemini-cli/releases)): Hook system integration for tool execution and LLM requests/responses, policy-driven model fallback mechanism, auto-execute simple slash commands on Enter, JIT context manager, configurable inactivity timeout for shell commands, improved session browser with empty session hiding, enhanced request token calculation
  - **Goose 1.15.0 → 1.16.1** ([changelog](https://github.com/block/goose/releases)): Native terminal support (@goose in terminal), recipe deeplink parameters with ActionRequired functionality, automatic update installation, math/science symbology via KaTeX, SKILLS.md implementation for Claude compatibility, improved MCP-UI proxy, slash commands, configurable maximum active agents, fixed Linux SSL/TLS error, resolved Anthropic trailing whitespace errors

---

## December 10, 2025

### Added
- CUI data warning, decision tree navigation, and comprehensive troubleshooting section with 62% README size reduction (717→270 lines) ([5066936](https://github.com/rise8-us/xpai-ai-assistant-container/commit/5066936))
- GovCloud Infrastructure Setup guide for FedRAMP and DoD IL4/5 compliant deployments in CUI section ([aeeec1e](https://github.com/rise8-us/xpai-ai-assistant-container/commit/aeeec1e))
- Navigation aids, table of contents, and Quick Help section with common error messages mapped to solutions in README for non-technical users ([de4e58d](https://github.com/rise8-us/xpai-ai-assistant-container/commit/de4e58d))
- Performance optimization comments in all devcontainer configs for cache persistence and file watcher exclusions ([c15662f](https://github.com/rise8-us/xpai-ai-assistant-container/commit/c15662f))

### Changed
- Zscaler certificate configuration now installs in Podman system trust store to support all container registries (ghcr.io, docker.io, etc.) rather than registry-specific directories ([b6e56aa](https://github.com/rise8-us/xpai-ai-assistant-container/commit/b6e56aa))

### Removed
- GitHub Codespaces support to simplify maintenance and focus on local Podman development ([c15662f](https://github.com/rise8-us/xpai-ai-assistant-container/commit/c15662f))

---

## December 8, 2025

### Added
- Comprehensive troubleshooting guide for devcontainer rebuild failures with screenshot reference and step-by-step diagnostics ([1e684fc](https://github.com/rise8-us/xpai-ai-assistant-container/commit/1e684fc))

---

## December 5, 2025

### Changed
- Updated devcontainer configurations and project container to use latest base image with security patches ([6a50af7](https://github.com/rise8-us/xpai-ai-assistant-container/commit/6a50af7))
- Updated devcontainer configurations and project container to use latest base image with security patches ([4a5d61d](https://github.com/rise8-us/xpai-ai-assistant-container/commit/4a5d61d))

### Security
- Fixed CVE-2025-65945 and CVE-2025-61729 (Go stdlib DoS vulnerability) via Claude Code 2.0.59, Gemini CLI 0.19.4, and GitHub CLI 2.83.1 updates ([e9e5947](https://github.com/rise8-us/xpai-ai-assistant-container/commit/e9e5947))
- Restored CVE-2024-52308 trivyignore entry for false positive in GitHub CLI version detection ([1b4252e](https://github.com/rise8-us/xpai-ai-assistant-container/commit/1b4252e))
- Fixed CVE-2025-66414 (HIGH severity DNS rebinding vulnerability) via Claude Code 2.0.57 and Gemini CLI 0.19.1 updates ([2243b07](https://github.com/rise8-us/xpai-ai-assistant-container/commit/2243b07))

---

## December 2, 2025

### Added
- Comprehensive CHANGELOG.md for template tracking with complete history ([1e9f41e](https://github.com/rise8-us/xpai-ai-assistant-container/commit/1e9f41e))
- CHANGELOG validation and history preservation to publish workflow ([14f88ff](https://github.com/rise8-us/xpai-ai-assistant-container/commit/14f88ff))
- Performance optimization templates for container setup ([2feb688](https://github.com/rise8-us/xpai-ai-assistant-container/commit/2feb688))
- Podman macOS networking troubleshooting guide ([5bdd379](https://github.com/rise8-us/xpai-ai-assistant-container/commit/5bdd379))
- Comprehensive Zscaler certificate troubleshooting with 6-step self-service fix procedure ([1e12f45](https://github.com/rise8-us/xpai-ai-assistant-container/commit/1e12f45))

### Changed
- Enhanced CHANGELOG update instructions for template users ([bcba1ac](https://github.com/rise8-us/xpai-ai-assistant-container/commit/bcba1ac))
- Updated container base image to latest security patches ([437ea8f](https://github.com/rise8-us/xpai-ai-assistant-container/commit/437ea8f))

### Security
- Cleaned up outdated CVE entries in .trivyignore files ([0bca889](https://github.com/rise8-us/xpai-ai-assistant-container/commit/0bca889))

[View all December changes](https://github.com/rise8-us/xpai-ai-assistant-container/commits/main/starter)

---

## November 2025

### Added
- CLAUDE.md now provided by default for all new projects ([efcf283](https://github.com/rise8-us/xpai-ai-assistant-container/commit/efcf283))
- Zscaler CA certificate support for SSL inspection environments ([8dccf8b](https://github.com/rise8-us/xpai-ai-assistant-container/commit/8dccf8b))
- Podman machine auto-start on macOS login feature ([e816ed8](https://github.com/rise8-us/xpai-ai-assistant-container/commit/e816ed8))
- Auto-install Claude Code extension in all containers ([b072bcc](https://github.com/rise8-us/xpai-ai-assistant-container/commit/b072bcc))
- Automated onboarding setup script for new developers ([08495ce](https://github.com/rise8-us/xpai-ai-assistant-container/commit/08495ce))

### Changed
- Updated Claude model references to official Sonnet 4.5 naming ([69af42f](https://github.com/rise8-us/xpai-ai-assistant-container/commit/69af42f))
- Improved onboarding clarity based on user feedback ([79079cd](https://github.com/rise8-us/xpai-ai-assistant-container/commit/79079cd))
- Improved onboarding README for non-technical users ([899effc](https://github.com/rise8-us/xpai-ai-assistant-container/commit/899effc))
- Synced CI/CD workflow improvements from root project ([809d591](https://github.com/rise8-us/xpai-ai-assistant-container/commit/809d591))
- Migrated from MCP server to slash commands ([3022655](https://github.com/rise8-us/xpai-ai-assistant-container/commit/3022655))

### Fixed
- Skip API key prompt when .env file already exists ([1cab908](https://github.com/rise8-us/xpai-ai-assistant-container/commit/1cab908))
- Prevent premature deletion of devcontainer template during onboarding ([d2c1c58](https://github.com/rise8-us/xpai-ai-assistant-container/commit/d2c1c58))

### Removed
- Outdated Claude Code UI access instructions ([99a9fe6](https://github.com/rise8-us/xpai-ai-assistant-container/commit/99a9fe6))

[View all November changes](https://github.com/rise8-us/xpai-ai-assistant-container/commits/main/starter?since=2025-11-01&until=2025-11-30)

---

## October 2025

### Added
- Codespaces-specific setup instructions for no-CUI configuration ([1601a44](https://github.com/rise8-us/xpai-ai-assistant-container/commit/1601a44))
- GitHub spec-kit as alternative for spec-driven development ([57920a7](https://github.com/rise8-us/xpai-ai-assistant-container/commit/57920a7))
- spec-kit and 8gents integration guidance ([0935d51](https://github.com/rise8-us/xpai-ai-assistant-container/commit/0935d51))
- Troubleshooting guide for GitHub App 404 errors ([7f345e7](https://github.com/rise8-us/xpai-ai-assistant-container/commit/7f345e7))

### Changed
- Improved base image update script with dynamic file discovery ([7029a43](https://github.com/rise8-us/xpai-ai-assistant-container/commit/7029a43))
- Simplified publish script to create single commit in starter repo ([21a6e52](https://github.com/rise8-us/xpai-ai-assistant-container/commit/21a6e52))

### Fixed
- Implemented configurable force-push for automated PR action ([d65ed12](https://github.com/rise8-us/xpai-ai-assistant-container/commit/d65ed12))

[View all October changes](https://github.com/rise8-us/xpai-ai-assistant-container/commits/main/starter?since=2025-10-01&until=2025-10-31)

---

## September 2025

### Added
- Comprehensive Claude Code + AWS Bedrock GovCloud infrastructure ([1065c19](https://github.com/rise8-us/xpai-ai-assistant-container/commit/1065c19))
- PRD documentation for AI Assistant Container Starter ([12835bc](https://github.com/rise8-us/xpai-ai-assistant-container/commit/12835bc), [95ca4a2](https://github.com/rise8-us/xpai-ai-assistant-container/commit/95ca4a2))
- Container runtime settings instructions ([439fc5e](https://github.com/rise8-us/xpai-ai-assistant-container/commit/439fc5e))

### Changed
- Reorganized README with improved setup flow and auth instructions ([943b7e4](https://github.com/rise8-us/xpai-ai-assistant-container/commit/943b7e4))
- Updated software versions and automation commands ([8a9de3d](https://github.com/rise8-us/xpai-ai-assistant-container/commit/8a9de3d))

[View all September changes](https://github.com/rise8-us/xpai-ai-assistant-container/commits/main/starter?since=2025-09-01&until=2025-09-30)

---

## August 2025

### Added
- Initial starter template release ([7ffba06](https://github.com/rise8-us/xpai-ai-assistant-container/commit/7ffba06))
- Codespaces setup instructions ([9fb3745](https://github.com/rise8-us/xpai-ai-assistant-container/commit/9fb3745))
- Documentation for obtaining API keys ([f8b6da6](https://github.com/rise8-us/xpai-ai-assistant-container/commit/f8b6da6))
- Base container information and source links ([9239f99](https://github.com/rise8-us/xpai-ai-assistant-container/commit/9239f99), [5bed424](https://github.com/rise8-us/xpai-ai-assistant-container/commit/5bed424))

### Changed
- Streamlined adoption flow for project teams ([943dcaf](https://github.com/rise8-us/xpai-ai-assistant-container/commit/943dcaf), [192b4cf](https://github.com/rise8-us/xpai-ai-assistant-container/commit/192b4cf))

### Fixed
- Resolved broken image references ([8faaa9a](https://github.com/rise8-us/xpai-ai-assistant-container/commit/8faaa9a), [179c137](https://github.com/rise8-us/xpai-ai-assistant-container/commit/179c137))
- Fixed broken build issues ([8d620f6](https://github.com/rise8-us/xpai-ai-assistant-container/commit/8d620f6))

[View all August changes](https://github.com/rise8-us/xpai-ai-assistant-container/commits/main/starter?since=2025-08-01&until=2025-08-31)

---

## Legend

- **Added** - New features or capabilities
- **Changed** - Updates to existing functionality
- **Fixed** - Bug fixes
- **Security** - Security updates and patches
- **Removed** - Deprecated or removed features

---

**Questions or Issues?** Open an issue in the [main repository](https://github.com/rise8-us/xpai-ai-assistant-container/issues).
