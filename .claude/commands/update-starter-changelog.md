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
   - Review each commit message
   - **For automated base container updates** (commits like "Auto-update: project container base SHA changed..."):
     - Run: `git show --stat <commit-hash>` to see which files changed
     - Check what triggered the update: `git log --pretty=format:"%h|%ad|%s" --date=short --since="<previous-update-date>" --until="<this-update-date>" | grep -v "starter/"`
     - Look for security fixes (CVE updates), tool version updates, or other base image changes
     - Run: `git show <underlying-commit>` to get full details of what changed
     - Document both the container update AND the underlying changes
   - Categorize into:
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

### Base Container Updates with Security Fixes
When an automated base container update includes security patches, document both the update and the underlying fix:

```markdown
## December 5, 2025

### Changed
- Updated devcontainer configurations and project container to use latest base image with security patches ([4a5d61d](https://github.com/rise8-us/xpai-ai-assistant-container/commit/4a5d61d))

### Security
- Fixed CVE-2025-66414 (HIGH severity DNS rebinding vulnerability) via Claude Code 2.0.57 and Gemini CLI 0.19.1 updates ([2243b07](https://github.com/rise8-us/xpai-ai-assistant-container/commit/2243b07))

---
```

**Investigation steps used:**
1. Identified container update commit: `4a5d61d`
2. Found underlying changes: `git log --since="2025-12-02" --until="2025-12-05" | grep -E "(CVE|security)"`
3. Discovered security fix: `2243b07` (CVE-2025-66414)
4. Got details: `git show 2243b07` revealed Claude Code and Gemini CLI version updates
5. Created two entries: one for Changed (container update), one for Security (CVE fix)

After generating the entries, remind the user to:
1. Review the changes
2. Commit with: `git add starter/CHANGELOG.md && git commit -m "docs(starter): update CHANGELOG.md with recent changes"`
3. Run the publish script again
