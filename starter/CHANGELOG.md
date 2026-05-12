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

## May 12, 2026

### Changed
- Updated AI assistant container software with new base image ([883e217](https://github.com/rise8-us/xpai-ai-assistant-container/commit/883e217)):
  - **Base image: UBI9 9.7 → UBI10 10.1 (Red Hat UBI minimal)**: Pulls in RHEL 10's updated package set, which is expected to clear the inherited UBI9 CVEs that had no RHEL 9 errata path (gnutls DTLS CVE-2026-33845/33846, krb5 NegoEx CVE-2026-40356, libcap CVE-2026-4878, OpenSSH CVE-2026-35385) and resolve the skopeo bundled-Go-stdlib CVE backlog en masse. OpenSSL FIPS provider activation is unchanged — FIPS-validated cryptography continues to be enforced regardless of host kernel `fips_enabled` state, in support of CMMC SC.L2-3.13.11. RHEL 10 CMVP cert is TBD pending Red Hat publication.
  - **`.trivyignore` reduced from 148 lines to 10 lines**: All UBI9-pinned suppressions cleared so the pipeline scan re-surfaces anything still relevant on UBI10. Only CVEs that cannot be patched will be re-added with full risk-reasoning context going forward.
  - AI tool versions (Claude Code, OpenCode, Pi) unchanged from the May 6 release.

---

## May 6, 2026

### Changed
- Rebased AI assistant container onto UBI9 with FIPS 140-3 compliance ([c9350cf](https://github.com/rise8-us/xpai-ai-assistant-container/commit/c9350cf), [79fa0a3](https://github.com/rise8-us/xpai-ai-assistant-container/commit/79fa0a3), [ec140ff](https://github.com/rise8-us/xpai-ai-assistant-container/commit/ec140ff)):
  - **Base image: Ubuntu 24.04 → UBI9 9.7 (Red Hat UBI minimal)**: OpenSSL FIPS provider is forced on at all times so FIPS-validated cryptography is used regardless of host kernel `fips_enabled` state. Supports CMMC SC.L2-3.13.11 on macOS dev laptops and AWS GovCloud alike.
  - **Claude Code 2.1.109 → 2.1.129** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): `--plugin-url` flag for fetching plugin `.zip` archives, `CLAUDE_CODE_PACKAGE_MANAGER_AUTO_UPDATE` for background Homebrew/WinGet upgrades, `claude project purge` to delete project state, `claude ultrareview` subcommand for non-interactive CI review, `${CLAUDE_EFFORT}` variable in skills, `alwaysLoad` MCP option to skip tool-search deferral, `claude plugin prune` for orphaned dependencies, type-to-filter search in `/skills`, PostToolUse `updatedToolOutput` for all tools (not just MCP), scrollable overflow dialogs, `/resume` finds sessions by PR URL (GitHub/GitLab/Bitbucket), `ANTHROPIC_BEDROCK_SERVICE_TIER` env var for Bedrock service tier selection, Vertex AI mTLS Workload Identity Federation support, Windows PowerShell tool no longer requires Git Bash, multiple security fixes (Bash `mkdir/touch *` allow rules, `allowManagedDomainsOnly` enforcement, `deniedMcpServers` mixed-case host matching), large memory leak fixes in `/usage` and image processing, EnterWorktree now branches from local HEAD instead of `origin/<default>`
  - **OpenCode 1.4.5 → 1.14.39** ([changelog](https://github.com/anomalyco/opencode/releases)): Major version jump spanning the 1.5–1.14 release line — see upstream releases for the full feature set
  - **Pi coding agent 0.67.2 → 0.73.0** ([releases](https://github.com/badlogic/pi-mono/releases))
  - 5 inherited UBI9 base CVEs suppressed in `.trivyignore` with full risk justifications and 2026-08-04 re-evaluation deadline (libcap CVE-2026-4878, OpenSSH CVE-2026-35385, gnutls DTLS CVE-2026-33845/33846, krb5 NegoEx CVE-2026-40356) — none exploitable in this container's runtime context
- Updated firewall manager to latest build ([324c2a4](https://github.com/rise8-us/xpai-ai-assistant-container/commit/324c2a4)): Patches nghttp2-libs CVE-2026-27135 via Alpine 3.23.4 base bump
- Restructured CUI Bedrock documentation around project-scoped permission sets ([0160bff](https://github.com/rise8-us/xpai-ai-assistant-container/commit/0160bff)):
  - Replaces blanket `ClaudeBedrock` permission set references with project-scoped `BedrockAccess-{Project}` (e.g. `BedrockAccess-TAK`)
  - Profile names now match permission sets (e.g. `bedrockaccess-tak`) so users on multiple projects can switch profiles cleanly
  - **Migration required**: `refresh-credentials.sh` now requires the `AWS_PROFILE` env var instead of hardcoding a profile name — set it in your `.env` file

### Fixed
- Migrated starter project-container template to UBI9 microdnf ([7991ce2](https://github.com/rise8-us/xpai-ai-assistant-container/commit/7991ce2)):
  - Mirrors the base-container UBI9 rebase so teams consuming the starter template don't inherit a broken `apt-get` baseline
  - Replaces `apt-get`/`dpkg`/`wget` with `microdnf` and `uname -m` arch detection in the GitHub CLI example
  - Refreshes starter `.trivyignore` for the UBI9 base: drops stale Hono CVE entries (those came from Node-based tools the previous Ubuntu base shipped — UBI9 ships Claude Code and OpenCode as binary distributions with no transitive Node deps), adds 3 inherited UBI9 base CVEs (gnutls DTLS x2, krb5 NegoEx) so downstream teams' first scan passes out of the box, documents the skopeo/Go-stdlib gotcha and UBI10 expectation

---

## April 21, 2026

### Added
- Skip devcontainer configuration when `devcontainer.json` already exists ([d805d0d](https://github.com/rise8-us/xpai-ai-assistant-container/commit/d805d0d)): Onboarding Phase 4 now returns early if `.devcontainer/devcontainer.json` is already present, avoiding unnecessary template comparison and backup logic. All other onboarding phases still run normally.

### Changed
- Update AI assistant container software ([7aae1c6](https://github.com/rise8-us/xpai-ai-assistant-container/commit/7aae1c6)):
  - **Claude Code 2.1.78 → 2.1.109** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): Session recap on return (`/recap`), `/powerup` interactive feature lessons, `/team-onboarding` ramp-up guide generation, flicker-free rendering (`CLAUDE_CODE_NO_FLICKER=1`), transcript search (`/` to search, `n`/`N` to navigate), Bedrock/Vertex setup wizards, 1-hour prompt caching (`ENABLE_PROMPT_CACHING_1H`), default effort level raised to high, `/resume` up to 67% faster on large sessions, OS CA certificate store trusted by default for enterprise TLS proxies, multiple security fixes (Bash permission bypass via backslash-escaped flags, compound command forced-prompt bypass, `find -exec`/`-delete` no longer auto-approved, dangerous-path `rm` safety check, command injection in LSP `which` fallback, `permissions.deny` now overrides PreToolUse hooks)
  - **OpenCode 1.2.27 → 1.4.5** ([changelog](https://github.com/anomalyco/opencode/releases)): GitLab Agent Platform with WebSocket local tools, git-backed session review for uncommitted changes and branch diffs, TUI plugins, Node.js runtime support, full HTTP proxy support, OTLP telemetry export, macOS MDM managed preferences, `opencode export --sanitize` for PII redaction, new providers (Poe, Venice AI, Alibaba, LLM Gateway), Claude Opus 4.7 adaptive reasoning, fast mode variants, TypeScript LSP memory leak fix, token usage double-counting fix for Anthropic/Bedrock
  - **Pi coding agent 0.67.2** (new) ([releases](https://github.com/badlogic/pi-mono/releases)): Terminal-based AI coding agent supporting 15+ LLM providers with file and bash tooling, configurable keybindings, session cloning, and TypeScript-based extensions. Pre-installed with fd 10.4.2 for filesystem search.
  - Ubuntu 24.04 base image updated to latest digest
- Make Zscaler certificate configuration optional ([bb61f18](https://github.com/rise8-us/xpai-ai-assistant-container/commit/bb61f18)): Onboarding now skips Zscaler certificate setup when Zscaler is not installed, allowing the script to work on machines without Zscaler.
- Update firewall manager to latest build ([2f1e0f7](https://github.com/rise8-us/xpai-ai-assistant-container/commit/2f1e0f7))

---

## April 13, 2026

### Changed
- Update AI assistant container software ([afe970c](https://github.com/rise8-us/xpai-ai-assistant-container/commit/afe970c), [48741ed](https://github.com/rise8-us/xpai-ai-assistant-container/commit/48741ed), [8779da0](https://github.com/rise8-us/xpai-ai-assistant-container/commit/8779da0)):
  - **Claude Code 2.1.78 → 2.1.96** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): PowerShell tool preview for Windows, Amazon Bedrock setup wizard, MCP elicitation dialogs for structured input, sandbox hardening (subprocess credential scrubbing, Linux PID namespace isolation, stricter network isolation), Bash tool permission bypass fixes (backslash-escaped flag and env-var prefix exploits), `--resume` performance improvements (up to 45% faster on fork-heavy sessions), 10 additional voice mode STT languages, MCP OAuth metadata discovery (RFC 9728), security fixes for managed settings `deny` rule downgrades and LSP `which` command injection
  - **OpenCode 1.2.27 → 1.4.0** ([changelog](https://github.com/anomalyco/opencode/releases)): Fast mode variants for Claude and GPT models, PDF drag-and-drop attachments, OTLP observability export, full HTTP proxy support, macOS MDM managed preferences, Venice AI provider, TypeScript LSP memory leak fixes, auto-accept permissions moved to Settings. Note: SDK diff metadata format changed (`to`/`from` → `patch`)
  - Ubuntu 24.04 base image updated to latest digest across updates
- Update firewall manager to latest builds ([b50046b](https://github.com/rise8-us/xpai-ai-assistant-container/commit/b50046b), [7f06303](https://github.com/rise8-us/xpai-ai-assistant-container/commit/7f06303)): Patches bind CVE-2026-1519 and CVE-2026-3104, plus libssl3/libcrypto3 CVE-2026-28390 via Alpine package upgrades

### Fixed
- Pin all GitHub Actions in starter workflows by SHA and update to Node 24 runtime ([b460c11](https://github.com/rise8-us/xpai-ai-assistant-container/commit/b460c11)): Eliminates Node 20 deprecation warnings and protects against tag-based supply chain attacks. Updates `actions/checkout`, `actions/create-github-app-token`, and the full `docker/*` action suite (`setup-qemu-action`, `setup-buildx-action`, `login-action`, `metadata-action`, `build-push-action`) to their latest SHA-pinned releases
- Skip starter base container update workflow when a PR already exists for the current SHA ([af60d2b](https://github.com/rise8-us/xpai-ai-assistant-container/commit/af60d2b)): Adds an early-exit check that prevents dirty working tree failures when `create-automated-pr` attempts to checkout an existing branch, matching the behavior already in the project-container workflow

---

## March 20, 2026

### Changed
- Update AI assistant container software ([0794d32](https://github.com/rise8-us/xpai-ai-assistant-container/commit/0794d32)):
  - **Claude Code 2.1.72 → 2.1.78** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md))
  - **OpenCode 1.2.24 → 1.2.27** ([changelog](https://github.com/anomalyco/opencode/releases))
  - Ubuntu 24.04 base image updated to latest digest
- Update firewall manager to latest build ([3ac40f3](https://github.com/rise8-us/xpai-ai-assistant-container/commit/3ac40f3))

### Fixed
- Update `aquasecurity/trivy-action` to v0.35.0 to fix nightly security scan failures ([a35a74b](https://github.com/rise8-us/xpai-ai-assistant-container/commit/a35a74b)): The previously pinned version internally referenced `aquasecurity/setup-trivy@v0.2.1` by tag, which was deleted upstream. The new version pins setup-trivy by commit SHA, preventing this class of breakage.

---

## March 16, 2026

### Changed
- Update AI assistant container software ([d31356e](https://github.com/rise8-us/xpai-ai-assistant-container/commit/d31356e), [e924a21](https://github.com/rise8-us/xpai-ai-assistant-container/commit/e924a21)):
  - **Claude Code 2.1.55 → 2.1.72** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): `/loop` command for recurring prompts on intervals, cron scheduling tools, `/plan` with description argument, `ExitWorktree` tool, `modelOverrides` setting for custom provider model IDs, `autoMemoryDirectory` setting, `/effort` slash command, `/color` command for prompt-bar customization, `/reload-plugins` command, `${CLAUDE_SKILL_DIR}` variable for skills, `PostCompact` hook event, `Elicitation` and `ElicitationResult` hooks, MCP elicitation support, `worktree.sparsePaths` for monorepos, 1M context window for Opus 4.6 by default on Max/Team/Enterprise, multiple memory leak fixes (streaming buffers, REPL render scopes, in-process teammates, hook events), security fixes (symlink bypass in acceptEdits mode, nested skill discovery loading from gitignored directories), improved compaction with image preservation, RTL text rendering fix, voice mode improvements (10 new languages, push-to-talk rebinding)
  - **OpenCode 1.2.11 → 1.2.24** ([changelog](https://github.com/anomalyco/opencode/releases)): Initial workspace support in TUI, GPT-5.4 model support, GitLab 1M context window enablement, SIGHUP signal handling, desktop deep link support, line ending preservation in edit tool, memory leak fixes (fsmonitor daemons), MCP toggling restored in TUI, Windows compatibility improvements
- Update firewall manager to latest build ([c3dda05](https://github.com/rise8-us/xpai-ai-assistant-container/commit/c3dda05))

---

## February 26, 2026

### Changed
- Updated AI assistant container software ([676264f](https://github.com/rise8-us/xpai-ai-assistant-container/commit/676264f), [18f6341](https://github.com/rise8-us/xpai-ai-assistant-container/commit/18f6341)):
  - **Claude Code 2.1.45 → 2.1.55** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): `--worktree` flag for isolated git worktree sessions, `claude remote-control` subcommand for external builds, Opus 4.6 fast mode now includes full 1M context window, `claude agents` CLI command, WorktreeCreate/WorktreeRemove hook events, `isolation: worktree` support in agent definitions, background agent support with Ctrl+F kill, plugin marketplace improvements (custom npm registries, configurable git timeout), managed settings via macOS plist or Windows Registry, MCP OAuth step-up auth, multiple memory leak and performance fixes (long sessions, agent teams, LSP diagnostics, compaction cache cleanup), security fix for statusLine/fileSuggestion hook commands executing without workspace trust
  - **OpenCode 1.2.6 → 1.2.11** ([changelog](https://github.com/anomalyco/opencode/releases)): Adaptive thinking support for Claude Sonnet 4.6, Julia language server support, Kilo as native provider, custom tool and MCP call responses now visible and collapsible, performance improvements (structuredClone replacing deep clones), Windows compatibility fixes

---

## February 18, 2026

### Added
- 1Password SSH agent setup and troubleshooting documentation ([adae1ce](https://github.com/rise8-us/xpai-ai-assistant-container/commit/adae1ce)):
  - SSH agent forwarding configuration for using 1Password-stored SSH keys inside the container
  - Critical "fully quit everything" restart step for reliable agent forwarding
  - Verification steps and troubleshooting for common SSH agent issues

### Changed
- Updated AI assistant container software ([c77d563](https://github.com/rise8-us/xpai-ai-assistant-container/commit/c77d563), [b576151](https://github.com/rise8-us/xpai-ai-assistant-container/commit/b576151)):
  - **Claude Code 2.1.39 → 2.1.45** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): Claude Sonnet 4.6 support, `claude auth` CLI subcommands (login/status/logout), `/rename` auto-generates session names from conversation context, guard against launching nested Claude Code sessions, Agent Teams fixes for Bedrock/Vertex/Foundry users, startup and memory performance improvements, sandbox "operation not permitted" fix on macOS, AWS auth refresh timeout fix, improved model error messages with fallback suggestions
  - **OpenCode 1.1.56 → 1.2.6** ([changelog](https://github.com/anomalyco/opencode/releases)): SQLite database migration for improved session management (auto-migrated on first run), adaptive reasoning for Claude Opus 4.6, `--continue` and `--fork` flags for session attach, show all project sessions from any working directory, database inspection command, improved Amazon Bedrock variant handling, PartDelta SDK events for incremental streaming
  - Updated Ubuntu 24.04 base image to latest security patches

---

## February 13, 2026

### Fixed
- Add workaround for Bedrock 400 error caused by `x-anthropic-billing-header` reserved keyword ([539fe01](https://github.com/rise8-us/xpai-ai-assistant-container/commit/539fe01), [8957412](https://github.com/rise8-us/xpai-ai-assistant-container/commit/8957412)):
  - Claude Code v2.1.36+ unconditionally injects billing header text into the system prompt, which Bedrock rejects as a reserved keyword ([upstream bug](https://github.com/anthropics/claude-code/issues/24168))
  - `CLAUDE_CODE_ATTRIBUTION_HEADER=0` added to `.env.example` CUI section so new projects get the fix automatically
  - Troubleshooting entry added to CUI setup docs for existing projects

---

## February 12, 2026

### Added
- Container clock drift detection and auto-fix for Podman on macOS ([be6ffba](https://github.com/rise8-us/xpai-ai-assistant-container/commit/be6ffba)):
  - Detects Podman VM clock skew on terminal login and auto-corrects when possible
  - Fixes SSL/TLS certificate validation failures caused by macOS sleep/wake clock drift
  - **Migration required** to enable auto-fix:
    - **Non-CUI users**: add `"--cap-add=SYS_TIME"` to `runArgs` in devcontainer.json, then rebuild container
    - **CUI users**: add `SYS_TIME` to `cap_add` for firewall-manager in docker-compose.firewall.yml, then pull latest images and restart

### Changed
- Updated AI assistant container software ([297ba4e](https://github.com/rise8-us/xpai-ai-assistant-container/commit/297ba4e), [a52ed85](https://github.com/rise8-us/xpai-ai-assistant-container/commit/a52ed85)):
  - **Claude Code 2.1.34 → 2.1.39** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): Fast mode for Opus 4.6, Agent Teams fixes for Bedrock/Vertex/Foundry users, guard against nested Claude Code sessions, improved model error messages with fallback suggestions, sandbox security improvements (blocked writes to `.claude/skills`, heredoc delimiter parsing), terminal rendering performance improvements, process hang and crash fixes
  - **OpenCode 1.1.53 → 1.1.56** ([changelog](https://github.com/anomalyco/opencode/releases)): Claude agent SDK structured outputs, custom API URLs per model, MCP listTools performance improvement via Promise.all, memory leak fix for platform event fetching, task tool rendering fix, free usage limit messaging
  - Pre-install tzdata to prevent derived container build failures
- Updated firewall manager to latest version with NTP sync at startup for clock drift correction ([15d0294](https://github.com/rise8-us/xpai-ai-assistant-container/commit/15d0294))
- Consolidate VS Code crash troubleshooting into single "VS Code Window Crashed (Code 5)" section covering both file handle exhaustion and V8 heap memory exhaustion, with guidance for monorepo sub-project node_modules volumes and crash report diagnostics ([2ab26ae](https://github.com/rise8-us/xpai-ai-assistant-container/commit/2ab26ae))
- Add reference to upstream project-container .trivyignore for Go stdlib CVE suppressions when enabling GitHub CLI ([97dc0b9](https://github.com/rise8-us/xpai-ai-assistant-container/commit/97dc0b9))

---

## February 6, 2026

### Changed
- Persist Claude Code configuration (`~/.claude/`) across container rebuilds ([4ceef0e](https://github.com/rise8-us/xpai-ai-assistant-container/commit/4ceef0e)):
  - Settings, conversation history, and preferences now survive container restarts
  - Non-CUI: volume auto-namespaced per project folder (`${localWorkspaceFolderBasename}-claude-config`)
  - CUI: follows existing naming pattern (`YOURPROJECT-claude-config`)
  - Init script now idempotent - safely merges config instead of overwriting
- Updated AI assistant container software with new capabilities ([034c4c4](https://github.com/rise8-us/xpai-ai-assistant-container/commit/034c4c4), [d48c86a](https://github.com/rise8-us/xpai-ai-assistant-container/commit/d48c86a)):
  - **Claude Code 2.1.23 → 2.1.34** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): Claude Opus 4.6 model support, agent teams (research preview) for multi-agent collaboration, automatic memory recording and recall, PDF page-range reading, `/debug` command, PR-linked sessions (`--from-pr` flag, auto-link via `gh pr create`), partial conversation summarization, improved sandbox security, mTLS/proxy fixes, performance improvements
  - **OpenCode 1.1.42 → 1.1.53** ([changelog](https://github.com/anomalyco/opencode/releases)): Skills invokable as slash commands, prompt caching for Claude Opus on AWS Bedrock, session search and restore across restarts, file tree kept in sync with filesystem, plugin system improvements (user plugins override built-ins), reasoning support for Copilot and SAP AI Core providers
  - Add ripgrep 15.1.0 for Claude Code's Grep tool
  - Suppress autoupdater and native install self-check warnings
- Rewrite release scripts as Python with improved error handling and consolidated workflow ([3d5465b](https://github.com/rise8-us/xpai-ai-assistant-container/commit/3d5465b), [8180254](https://github.com/rise8-us/xpai-ai-assistant-container/commit/8180254), [f35f0ae](https://github.com/rise8-us/xpai-ai-assistant-container/commit/f35f0ae), [ae7302c](https://github.com/rise8-us/xpai-ai-assistant-container/commit/ae7302c), [bd4ebe6](https://github.com/rise8-us/xpai-ai-assistant-container/commit/bd4ebe6)):
  - Consolidated release workflow into single prepare-release.py + publish-release.py pipeline
  - Internal tooling only - does not affect published template

### Fixed
- Use Sonnet for subagent model in GovCloud Bedrock ([9df6247](https://github.com/rise8-us/xpai-ai-assistant-container/commit/9df6247)):
  - Haiku is not available as an inference profile in AWS GovCloud, causing the Explore tool to fail with "model identifier is invalid"
  - Both `ANTHROPIC_SMALL_FAST_MODEL` and `ANTHROPIC_DEFAULT_HAIKU_MODEL` now point to the Sonnet inference profile
  - Both variables set for compatibility across Claude Code versions

---

## January 29, 2026

### Added
- AWS credential refresh script (`scripts/refresh-credentials.sh`) for CUI projects using AWS Bedrock ([5533821](https://github.com/rise8-us/xpai-ai-assistant-container/commit/5533821), [3b0175c](https://github.com/rise8-us/xpai-ai-assistant-container/commit/3b0175c), [dd1e2f6](https://github.com/rise8-us/xpai-ai-assistant-container/commit/dd1e2f6)):
  - Automates complete AWS credential lifecycle: stop containers, refresh SSO, export to .env.bedrock, rebuild
  - `--vscode` flag for VS Code users (opens VS Code instead of exec)
  - `--help` flag for usage information
  - Restrictive file permissions (600) for credential files
  - Health check polling instead of magic sleep for reliability

### Changed
- Replaced Gemini CLI and Goose with OpenCode in base container ([7cd6de7](https://github.com/rise8-us/xpai-ai-assistant-container/commit/7cd6de7)):
  - **OpenCode 1.1.42** ([changelog](https://github.com/anomalyco/opencode/releases)): Alternative AI assistant with multi-provider support
  - Removed Node.js dependency (~150MB+ image size reduction)
  - Claude Code now uses binary install with SHA256 verification instead of npm
  - Removed Gemini CLI and Goose (neither support GovCloud)
- Updated base container with latest security patches and software versions ([5ae3611](https://github.com/rise8-us/xpai-ai-assistant-container/commit/5ae3611))
- Updated firewall manager to latest version ([d63ef69](https://github.com/rise8-us/xpai-ai-assistant-container/commit/d63ef69))
- Split publish-release.sh into separate check and push scripts for better workflow integration ([020180c](https://github.com/rise8-us/xpai-ai-assistant-container/commit/020180c))

### Fixed
- Use Claude 3 Haiku for subagents in GovCloud - Claude Haiku 4.5 is not available in AWS GovCloud Bedrock, causing Explore tool failures ([19c08e4](https://github.com/rise8-us/xpai-ai-assistant-container/commit/19c08e4))

---

## January 22, 2026

### Added
- macOS notification hooks for user attention alerts - get notified when Claude Code needs input (permission dialogs, questions) or finishes working ([49ddf56](https://github.com/rise8-us/xpai-ai-assistant-container/commit/49ddf56))
  - `.claude/hooks/notify-attention.sh` - fires on PermissionRequest and AskUserQuestion events
  - `.claude/hooks/notify-stop.sh` - fires when Claude Code session stops
  - `scripts/osxStopListener/` - macOS LaunchAgent listener with install/uninstall scripts
  - Different sounds distinguish events: "Ping" for attention needed, "Glass" for completion

### Changed
- Updated base container with multi-arch image fixes and latest software versions ([ee763f9](https://github.com/rise8-us/xpai-ai-assistant-container/commit/ee763f9))

---

## January 21, 2026

### Changed
- Updated firewall manager to latest version with security improvements ([12048e1](https://github.com/rise8-us/xpai-ai-assistant-container/commit/12048e1))

### Fixed
- Resolved multi-architecture container build issues that caused "exec format error" on AMD64 systems ([1d0e84f](https://github.com/rise8-us/xpai-ai-assistant-container/commit/1d0e84f))
  - Reordered platform build priority to AMD64 first for CI reliability
  - Added explicit platform verification before container tests
  - Fixed architecture detection to fail fast with clear error messages
  - Ensured AMD64 images are correctly pulled on GitHub Actions runners

---

## January 20, 2026

### Added
- Devcontainer setup examples documentation with real-world implementations demonstrating multi-language runtimes, database services, and CI/CD patterns ([347059a](https://github.com/rise8-us/xpai-ai-assistant-container/commit/347059a))

### Changed
- Updated AI assistant container software with security patches and new capabilities ([d14fe57](https://github.com/rise8-us/xpai-ai-assistant-container/commit/d14fe57)):
  - **Claude Code 2.1.1 → 2.1.12** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): Setup hook for repository initialization/maintenance (--init flag), search in /config command, MCP tool search auto mode enabled by default for efficient context usage, release channel toggle (stable/latest), merged slash commands and skills into unified model, Windows Package Manager (winget) support, large bash outputs saved to disk instead of truncated for full access, plan file cleanup after /clear, VS Code plugin install counts and trust warnings, external editor in AskUserQuestion fields, session URL attribution in commits/PRs, multiple security fixes (command injection, wildcard permissions, permission bypass via line continuation), performance improvements (memory leak fixes, typing responsiveness), OAuth URL updates (platform.claude.com), temporary directory customization (CLAUDE_CODE_TMPDIR), improved terminal rendering, status line context percentage fields, file suggestion enhancements, background task management improvements, skill duplicate detection fixes, unreachable permission rule warnings
  - **Gemini CLI 0.23.0 → 0.24.5** ([changelog](https://github.com/google-gemini/gemini-cli/releases)): Gemini 3 Flash model with automatic persistence, agent skills infrastructure with autonomous activation and tiered discovery, remote agents support with multi-agent TOML files, folder trust support for hooks with enhanced security (defaults to untrusted), tool input modification support, context injection via SessionStart hook, /auth logout command to clear credentials, official ACP SDK with HTTP/SSE-based MCP servers, Windows clipboard image support and Alt+V paste, automatic background color detection, OSC 52 paste support, experimental in-CLI extension install/uninstall, JIT context memory loading, .geminiignore support for SearchText tool, hooks enhancements (friendly names, clearcut logging, visual indicators, granular stop/block behavior, STOP_EXECUTION), policy engine improvements (mode-aware evaluation, granular shell allowlisting, unified security policy), model persistence opt-in toggle, improved error messages and UI refinements, admin settings with secureModeEnabled/mcpEnabled, skills CLI management command (/skills reload)

### Security
- Fixed CVE-2026-23745 (HIGH severity path traversal vulnerability in node-tar) via Claude Code 2.1.12 and Gemini CLI 0.24.5 updates which include tar@7.5.4 ([5622622](https://github.com/rise8-us/xpai-ai-assistant-container/commit/5622622))

---

## January 15, 2026

### Added
- Comprehensive troubleshooting documentation for 403 Forbidden errors when pushing container images to GitHub Container Registry, including step-by-step package permission configuration, inline workflow comments with actionable guidance, and updated first-time setup instructions for enabling automatic builds ([6771918](https://github.com/rise8-us/xpai-ai-assistant-container/commit/6771918))

### Security
- Added CVE-2026-22817 and CVE-2026-22818 suppressions to project-container .trivyignore for Hono JWT algorithm confusion vulnerabilities. These HIGH severity CVEs affect hono@4.11.3 (transitive dependency from base image), but risk is LOW in deployment context as the container provides CLI tools without web services, HTTP endpoints, or JWT authentication. Awaiting upstream fix in hono@4.11.4+. ([aa1cd00](https://github.com/rise8-us/xpai-ai-assistant-container/commit/aa1cd00))

---

## January 12, 2026

### Added
- Troubleshooting guide for VS Code window crashes caused by file handle limits, with instructions to enable cache volumes and file watcher exclusions ([7c08a09](https://github.com/rise8-us/xpai-ai-assistant-container/commit/7c08a09))

### Changed
- Updated AI assistant container software with new capabilities and fixes ([6f72e79](https://github.com/rise8-us/xpai-ai-assistant-container/commit/6f72e79)):
  - **Claude Code 2.0.76 → 2.1.1** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): Automatic skill hot-reload, forked sub-agent contexts, unified skills/commands model, Shift+Enter iTerm2 support, enhanced Vim motions (yank/paste with text objects), `/plan` and `/teleport` commands, wildcard Bash permissions, security fix for command injection, performance optimizations
  - **Gemini CLI 0.22.5 → 0.23.0** ([changelog](https://github.com/google-gemini/gemini-cli/releases)): Gemini 3 Flash model with automatic persistence, remote agent infrastructure, `/auth logout` command, enhanced hook system with granular controls, Windows clipboard image support, improved model statistics display
  - **Goose 1.18.0 → 1.19.1** ([changelog](https://github.com/block/goose/releases)): Shell completion generation (bash/zsh/fish), OpenAI Codex provider support, MCP servers from Zed honored (stdio + http), app renderer for richer UI, improved tool call handling, JSONL streaming option
- Updated base container to latest Ubuntu 24.04 image with GnuPG security patches ([f2281a5](https://github.com/rise8-us/xpai-ai-assistant-container/commit/f2281a5))
- Simplified onboarding script by extracting devcontainer configuration to external template file, removing 90+ lines of embedded JSON for better maintainability ([22cfaba](https://github.com/rise8-us/xpai-ai-assistant-container/commit/22cfaba))
- Improved onboard.sh stat check ordering for better validation reliability ([0008a1d](https://github.com/rise8-us/xpai-ai-assistant-container/commit/0008a1d))

### Security
- Fixed CVE-2025-68973 (HIGH severity GnuPG out-of-bounds write vulnerability) via Ubuntu 24.04 base image update to patched version ([117c2f9](https://github.com/rise8-us/xpai-ai-assistant-container/commit/117c2f9))
- **Action Required for project-container users**: CVE-2026-0621 (HIGH severity ReDoS in @modelcontextprotocol/sdk@1.25.1) added to base image trivyignore ([0fe8d64](https://github.com/rise8-us/xpai-ai-assistant-container/commit/0fe8d64)). If you run Trivy scans on your project-container, add `CVE-2026-0621` to your `.trivyignore`. This is a transitive dependency via Gemini CLI 0.23.0 with medium actual risk (requires attacker-controlled input). Upstream will monitor and push a new base image when a patched version is available.

---

## January 7, 2026

### Changed
- Simplify troubleshooting by making "re-run onboard.sh" the universal fix ([0c60143](https://github.com/rise8-us/xpai-ai-assistant-container/commit/0c60143)):
  - Embed devcontainer.json configuration directly in onboard.sh as single source of truth
  - Script now validates existing devcontainer.json and auto-repairs if misconfigured
  - Updated docs to recommend onboard.sh as first troubleshooting step
- Updated base container to latest image ([a763a0b](https://github.com/rise8-us/xpai-ai-assistant-container/commit/a763a0b))

### Removed
- Removed diagnose.sh diagnostic script (functionality now built into onboard.sh)
- Removed devcontainer.no-cui.json template (configuration now embedded in onboard.sh)

### Security
- **Action Required for project-container users**: CVE-2026-0621 (HIGH severity ReDoS in @modelcontextprotocol/sdk@1.25.1) added to base image trivyignore ([0fe8d64](https://github.com/rise8-us/xpai-ai-assistant-container/commit/0fe8d64)). If you run Trivy scans on your project-container, add `CVE-2026-0621` to your `.trivyignore`. This is a transitive dependency via Gemini CLI with medium actual risk (requires attacker-controlled input). Upstream will monitor and push a new base image when a patched version is available.

---

## December 30, 2025

### Added
- Documentation about auto-compaction behavior, trade-offs (22.5% buffer reservation, potential context loss, rule forgetting), and how to disable via `/config` ([1aeea2f](https://github.com/rise8-us/xpai-ai-assistant-container/commit/1aeea2f))

### Changed
- Improved template creation guidance with explicit "Use this template" button location, "you're not done yet!" reminder, and corrected step numbering to reduce onboarding confusion ([5e54e05](https://github.com/rise8-us/xpai-ai-assistant-container/commit/5e54e05))
- Updated base container to disable non-essential traffic to Anthropic (Sentry error reporting, Statsig telemetry, /bug command) while preserving API functionality and Rise8 OTEL observability ([5a9832c](https://github.com/rise8-us/xpai-ai-assistant-container/commit/5a9832c))

---

## December 29, 2025

### Added
- Security model documentation explaining three-layer protection (firewall, container contents, permissions deny list) with recommended `settings.json` deny rules for environment variable protection ([054d03a](https://github.com/rise8-us/xpai-ai-assistant-container/commit/054d03a), [6c16c3e](https://github.com/rise8-us/xpai-ai-assistant-container/commit/6c16c3e))
- Git worktree directory (`.worktrees/`) to `.gitignore` for isolated story implementation workflows ([b27b4d5](https://github.com/rise8-us/xpai-ai-assistant-container/commit/b27b4d5))

### Changed
- Enable prompt caching by default for CUI projects - FedRAMP High authorized with ~90% faster responses and 50-80% cost reduction ([6d84692](https://github.com/rise8-us/xpai-ai-assistant-container/commit/6d84692))
- Clarify AWS Bedrock token expiration and container rebuild requirement in CUI setup documentation, adding prominent troubleshooting section for common "403 expired token" error ([e256ba4](https://github.com/rise8-us/xpai-ai-assistant-container/commit/e256ba4))

---

## December 25, 2025

### Changed
- Updated AI assistant container software with new capabilities and fixes ([73ba0e4](https://github.com/rise8-us/xpai-ai-assistant-container/commit/73ba0e4)):
  - **Claude Code 2.0.71 → 2.0.76** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): LSP tool for go-to-definition and code intelligence, Claude in Chrome (Beta) browser control, `/terminal-setup` for additional terminals, clickable image links, improved file suggestion performance (~3x faster), alt-y yank-pop for kill ring cycling, plugin search filtering, reduced terminal flickering, thinking toggle moved to Alt+T
  - **Gemini CLI 0.21.0 → 0.21.3** ([changelog](https://github.com/google-gemini/gemini-cli/releases)): Automatic model persistence across sessions, official ACP SDK support, HTTP/SSE-based MCP servers, experimental in-CLI extension install/uninstall, unified secrets sanitization, hook enhancements with friendly names and clearcut logging, modifyOtherKeys protocol for tmux, .geminiignore support for SearchText tool
  - **Goose 1.16.1 → 1.18.0** ([changelog](https://github.com/block/goose/releases)): New slash commands (/prompts, /compact, /clear), Code Mode MCP platform extension, MCP elicitation support for interactive prompts, recipe search and filtering, OpenRouter and Xai streaming support, privacy-aware analytics, canonical model system with pricing integration, improved tool calling and code execution

---

## December 22, 2025

### Changed
- Updated publish scripts to support new role-based plugin architecture with beta skills organized by job function ([1bcfeeb](https://github.com/rise8-us/xpai-ai-assistant-container/commit/1bcfeeb))

### Fixed
- Corrected AWS GovCloud region from us-gov-east-1 to us-gov-west-1 in .env.example file for CUI Bedrock configuration ([413b5d7](https://github.com/rise8-us/xpai-ai-assistant-container/commit/413b5d7))
- Corrected AWS SSO configuration values in CUI Bedrock setup documentation that prevented successful authentication - updated SSO start URL, SSO region, and default client region to correct values ([c47d3e4](https://github.com/rise8-us/xpai-ai-assistant-container/commit/c47d3e4))

---

## December 20, 2025

### Added
- Claude Code plugin marketplace for distributing shared project skills ([823f822](https://github.com/rise8-us/xpai-ai-assistant-container/commit/823f822)):
  - Install centralized plugins via: `/plugin marketplace add rise8-us/xpai-ai-assistant-container`
  - Included plugins: cve-triage (CVE investigation with POA&M generation), gh-actions-triage (GitHub Actions failure diagnosis), user-story (INVEST-compliant story writing)
  - Documentation: docs/PLUGIN-DEVELOPMENT.md for contribution guide

### Changed
- Enhanced project-container workflow to update digests in both devcontainer.json and docker-compose.firewall.yml files, preventing version drift across standard and CUI development environments ([f9c2296](https://github.com/rise8-us/xpai-ai-assistant-container/commit/f9c2296))

---

## December 18, 2025

### Added
- Troubleshooting guide for Claude Code login prompt when `.env` file or `ANTHROPIC_API_KEY` is missing, with screenshot and step-by-step resolution ([0431150](https://github.com/rise8-us/xpai-ai-assistant-container/commit/0431150))

### Changed
- Expanded file watcher exclusions in CUI devcontainer config to match non-CUI config, preventing "too many files open" (ulimit) errors when VS Code watches large directories ([d0210e6](https://github.com/rise8-us/xpai-ai-assistant-container/commit/d0210e6))

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
