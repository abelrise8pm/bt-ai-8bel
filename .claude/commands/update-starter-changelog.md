Generate CHANGELOG.md entries for recent commits to the starter/ directory.

## Task

You are helping maintain the starter template changelog. Follow these steps:

1. **Find the latest changelog date**:
   - Read `starter/CHANGELOG.md`
   - Find the most recent date heading (format: `## Month Day, YYYY`)
   - Note this date

2. **Get uncommitted changes**:
   - Run: `git log --pretty=format:"%h|%ad|%s" --date=short -- starter/ --since="YYYY-MM-DD"`
   - Where YYYY-MM-DD is the day after the latest changelog date
   - This shows commits not yet documented in the changelog

3. **Analyze and categorize commits**:
   - **IMPORTANT**: Only commits from step 2 (that touched `starter/` files) should become changelog entries
   - Review each commit message from step 2
   - **For automated base container updates** (commits like "Auto-update: project container base SHA changed..."):
     - Run: `git show --stat <commit-hash>` to see which files changed
     - Check what triggered the update: `git log --pretty=format:"%h|%ad|%s" --date=short --since="<previous-update-date>" --until="<this-update-date>" | grep -v "starter/"`
     - Look for security fixes (CVE updates), tool version updates, or other base image changes
     - Run: `git show <underlying-commit>` to get full details of what changed
     - **For software version updates**: Find the previous versions by running: `git show <commit-hash>^:image/Dockerfile | grep -E "VERSION"`
     - Fetch changelogs for each updated tool (URLs are documented in image/Dockerfile comments) and summarize ALL changes between old and new versions
     - **These underlying commits are for investigation only** - incorporate their details into the container update entry description
     - Do NOT create separate changelog entries for underlying commits that didn't touch `starter/` files
   - Categorize commits from step 2 into:
     - **Added** - New features or capabilities
     - **Changed** - Updates to existing functionality
     - **Fixed** - Bug fixes
     - **Security** - Security updates and patches
     - **Removed** - Deprecated or removed features

4. **Generate changelog entries**:
   - Create a new date section for today: `## December 5, 2025`
   - Format each entry as:
     ```markdown
     ### Added
     - Description of change ([commit-hash](https://github.com/rise8-us/xpai-ai-assistant-container/commit/commit-hash))
     ```
   - Write user-friendly descriptions (not just commit messages)
   - Group related commits together if appropriate
   - Do NOT add "View all changes" links (these are added once per month at month-end)

5. **Insert into CHANGELOG.md**:
   - Place the new section after the "How to Check for Updates" section
   - Before the previous date entries
   - Maintain the existing format and structure

6. **Show the diff**:
   - Display what you added to CHANGELOG.md
   - Confirm entries are accurate

## Notes

- Use present tense for descriptions
- Focus on user value (what changed, why it matters)
- Include commit links for detailed viewing
- Maintain consistent formatting with existing entries
- If a commit is just a changelog update itself, you can skip it
- **Do NOT add "View all changes" links for new date sections** - these links are added once per month at the END of the month's final entry to avoid duplicates
- **For software version updates**: Always show version ranges (old → new), include changelog links, and summarize ALL changes across all versions between the range

## Example Entry Formats

### Simple Changes
```markdown
## December 2, 2025

### Added
- Performance optimization templates for container setup ([2feb688](https://github.com/rise8-us/xpai-ai-assistant-container/commit/2feb688))
- Podman macOS networking troubleshooting guide ([5bdd379](https://github.com/rise8-us/xpai-ai-assistant-container/commit/5bdd379))

### Changed
- Updated container base image to latest security patches ([437ea8f](https://github.com/rise8-us/xpai-ai-assistant-container/commit/437ea8f))

---
```

### Base Container Updates with Software Version Changes
When an automated base container update includes software version updates, show version ranges and summarize ALL changes:

```markdown
## December 12, 2025

### Changed
- Updated AI assistant container software with new capabilities and fixes ([2372dd1](https://github.com/rise8-us/xpai-ai-assistant-container/commit/2372dd1)):
  - **Claude Code 2.0.59 → 2.0.65** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): Model switching during prompts (alt+p/option+p), named session support (/rename and /resume commands), background agent execution, context window info in status line, instant auto-compacting, .claude/rules/ directory support
  - **Gemini CLI 0.19.4 → 0.20.0** ([changelog](https://github.com/google-gemini/gemini-cli/releases)): Hook system integration, policy-driven model fallback, auto-execute slash commands, JIT context manager, improved session browser
  - **Goose 1.15.0 → 1.16.1** ([changelog](https://github.com/block/goose/releases)): Native terminal support, recipe deeplink parameters, automatic update installation, math/science symbology via KaTeX, fixed Linux SSL error

---
```

**Investigation steps used:**
1. Identified container update commit: `2372dd1`
2. Found underlying changes: `git log --since="2025-12-10" --until="2025-12-12" | grep -v "starter/"`
3. Discovered version update: `6f720d2` (updated Claude Code, Gemini CLI, Goose)
4. Got previous versions: `git show 6f720d2^:image/Dockerfile | grep -E "VERSION"`
5. Fetched changelogs for each tool and summarized ALL changes between versions
6. Created single entry showing version ranges with comprehensive summaries and changelog links

### Base Container Updates with Security Fixes
When security patches are included, add them in a Security section:

```markdown
## December 5, 2025

### Changed
- Updated devcontainer configurations and project container to use latest base image with security patches ([4a5d61d](https://github.com/rise8-us/xpai-ai-assistant-container/commit/4a5d61d))

### Security
- Fixed CVE-2025-66414 (HIGH severity DNS rebinding vulnerability) via Claude Code 2.0.57 and Gemini CLI 0.19.1 updates ([2243b07](https://github.com/rise8-us/xpai-ai-assistant-container/commit/2243b07))

---
```

After generating the entries, remind the user to:
1. Review the changes
2. Commit with: `git add starter/CHANGELOG.md && git commit -m "docs(starter): update CHANGELOG.md with recent changes"`
3. Run the publish script again
