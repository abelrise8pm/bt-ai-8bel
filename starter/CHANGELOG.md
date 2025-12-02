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

## December 2, 2025

### Added
- Comprehensive CHANGELOG.md for template tracking with complete history ([1e9f41e](https://github.com/rise8-us/xpai-ai-assistant-container/commit/1e9f41e))
- CHANGELOG validation and history preservation to publish workflow ([14f88ff](https://github.com/rise8-us/xpai-ai-assistant-container/commit/14f88ff))
- Performance optimization templates for container setup ([2feb688](https://github.com/rise8-us/xpai-ai-assistant-container/commit/2feb688))
- Podman macOS networking troubleshooting guide ([5bdd379](https://github.com/rise8-us/xpai-ai-assistant-container/commit/5bdd379))

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
