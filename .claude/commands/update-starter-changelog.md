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
   - Categorize into:
     - **Added** - New features or capabilities
     - **Changed** - Updates to existing functionality
     - **Fixed** - Bug fixes
     - **Security** - Security updates and patches
     - **Removed** - Deprecated or removed features

4. **Generate changelog entries**:
   - Create a new date section for today: `## December 2, 2025`
   - Format each entry as:
     ```markdown
     ### Added
     - Description of change ([commit-hash](https://github.com/rise8-us/xpai-ai-assistant-container/commit/commit-hash))
     ```
   - Write user-friendly descriptions (not just commit messages)
   - Group related commits together if appropriate
   - Add the monthly "View all changes" link:
     ```markdown
     [View all December changes](https://github.com/rise8-us/xpai-ai-assistant-container/commits/main/starter)
     ```

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

## Example Entry Format

```markdown
## December 2, 2025

### Added
- Performance optimization templates for container setup ([2feb688](https://github.com/rise8-us/xpai-ai-assistant-container/commit/2feb688))
- Podman macOS networking troubleshooting guide ([5bdd379](https://github.com/rise8-us/xpai-ai-assistant-container/commit/5bdd379))

### Changed
- Updated container base image to latest security patches ([437ea8f](https://github.com/rise8-us/xpai-ai-assistant-container/commit/437ea8f))

[View all December changes](https://github.com/rise8-us/xpai-ai-assistant-container/commits/main/starter)

---
```

After generating the entries, remind the user to:
1. Review the changes
2. Commit with: `git add starter/CHANGELOG.md && git commit -m "docs(starter): update CHANGELOG.md with recent changes"`
3. Run the publish script again
