---
name: release-engineer-beta-update-changelog
description: Generate CHANGELOG.md entries for undocumented commits in a directory. Use before publishing/releasing to ensure all changes are documented.
---

# Changelog Update

Generate CHANGELOG.md entries for commits not yet documented, scoped to a specific directory.

## Input

**Required**: Directory path containing the CHANGELOG.md (e.g., `starter/`, `packages/core/`, `.`)

Example invocations:
- "Update changelog for starter/"
- "Document recent changes in packages/api/"

## Workflow

### 1. Validate Input

Confirm the directory exists and contains a CHANGELOG.md:
```bash
ls {directory}/CHANGELOG.md
```

If no CHANGELOG.md exists, ask user if they want to create one.

### 2. Get Repository Information

```bash
git remote get-url origin
# Parse to extract: https://github.com/{owner}/{repo}
```

### 3. Read the Changelog

Read `{directory}/CHANGELOG.md` to:
- Understand the existing format and structure
- Find the most recent date heading (format: `## Month Day, YYYY`)
- Extract documented commit SHAs from commit links

### 4. Find Undocumented Commits

Get commits affecting this directory since the last changelog date:

```bash
git log --pretty=format:"%h|%ad|%s" --date=short -- {directory}/ --since="YYYY-MM-DD"
```

Where `YYYY-MM-DD` is the day AFTER the latest changelog date.

**Filter out changelog-only commits**: Skip commits that ONLY modified CHANGELOG.md - these are previous changelog updates and don't need to be documented.

```bash
# For each commit, check what files changed
git diff-tree --no-commit-id --name-only -r {hash} -- {directory}/
```

### 5. Analyze Each Commit

For each undocumented commit:

#### Standard Commits
```bash
git show --stat {hash}
git show {hash}
```

#### Automated Update Commits

For commits matching patterns like "Auto-update:", "chore: update", or dependency bumps:

1. **Find what triggered the update**:
```bash
git log --pretty=format:"%h|%ad|%s" --date=short --since="{previous_update}" --until="{this_update}" | grep -v "{directory}/"
```

2. **For software version updates**, compare versions:
```bash
git show {hash}^:{version_file} | grep -E "VERSION|version"
git show {hash}:{version_file} | grep -E "VERSION|version"
```

3. **Fetch upstream changelogs** and summarize ALL changes between versions

4. **Incorporate details** into a single update entry - do NOT create separate entries for underlying commits outside this directory

### 6. Categorize Changes

| Category | Use When |
|----------|----------|
| **Added** | New features or capabilities |
| **Changed** | Updates to existing functionality |
| **Fixed** | Bug fixes |
| **Security** | Security updates, CVE fixes |
| **Removed** | Deprecated or removed features |

### 7. Generate Entries

Create a new date section:

```markdown
## {Month} {Day}, {Year}

### Added
- Description ([{hash}](https://github.com/{owner}/{repo}/commit/{hash}))

### Changed
- Description ([{hash}](https://github.com/{owner}/{repo}/commit/{hash}))

### Fixed
- Description ([{hash}](https://github.com/{owner}/{repo}/commit/{hash}))

### Security
- CVE-XXXX-XXXXX: Description ([{hash}](https://github.com/{owner}/{repo}/commit/{hash}))

---
```

#### Writing Guidelines

- **Present tense**: "Add feature" not "Added feature"
- **User value focus**: What changed and why it matters
- **Commit links**: Always include for traceability
- **Group related commits**: Combine related changes when appropriate

#### Version Updates Format

```markdown
### Changed
- Updated dependencies with new capabilities ([{hash}](link)):
  - **Package X.X.X → Y.Y.Y** ([changelog](url)): Key changes summary
  - **Package A.B.C → D.E.F** ([changelog](url)): Key changes summary
```

### 8. Insert into Changelog

- Place after any header/instructions section
- Before previous date entries
- Maintain existing format and structure

### 9. Show Diff and Next Steps

Display the changes:
```bash
git diff {directory}/CHANGELOG.md
```

Then provide next steps:
```
Next steps:
1. Review the changes above
2. Commit: git add {directory}/CHANGELOG.md && git commit -m "docs({scope}): update CHANGELOG.md with {date} changes"
3. Continue with release process
```

## Examples

### Simple Changes
```markdown
## December 22, 2025

### Fixed
- Corrected AWS SSO configuration values in CUI Bedrock setup documentation that prevented successful authentication ([c47d3e4](https://github.com/owner/repo/commit/c47d3e4))

---
```

### Dependency Updates with Versions
```markdown
## December 17, 2025

### Changed
- Updated AI assistant container software with new capabilities and fixes ([be21127](https://github.com/owner/repo/commit/be21127)):
  - **Claude Code 2.0.65 → 2.0.71** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): `/config` toggle for prompt suggestions, Enter key to accept suggestions, wildcard MCP permissions, 3x memory improvement
  - **Gemini CLI 0.20.0 → 0.21.0** ([changelog](https://github.com/google-gemini/gemini-cli/releases)): Fuzzy search in settings, hooks system with lifecycle management, auto-generated session summaries

---
```

### Security Fixes
```markdown
## December 5, 2025

### Security
- Fixed CVE-2025-66414 (HIGH severity DNS rebinding vulnerability) via Claude Code 2.0.57 and Gemini CLI 0.19.1 updates ([2243b07](https://github.com/owner/repo/commit/2243b07))

---
```

## Edge Cases

### No Undocumented Commits
> No undocumented commits found for {directory}/ since {last_date}. The changelog is up to date.

### No CHANGELOG.md
> No CHANGELOG.md found in {directory}/. Would you like me to create one?

### Unclear Commit Purpose
Investigate the diff to write a meaningful description:
```bash
git show {hash}
```

## Notes

- Do NOT add "View all changes" links - these are added at month-end
- For version updates: Always show version ranges, include changelog links, summarize ALL changes
- Skip commits that only touch CHANGELOG.md (previous changelog updates)

## Scope

**Do**:
- Require directory path upfront
- Only analyze commits affecting that directory
- Investigate automated updates for underlying changes
- Show diff before any commit
- Provide clear next steps for release workflow

**Don't**:
- Auto-detect changelog location
- Include commits outside the specified directory
- Document changelog-only commits
- Commit without user confirmation
