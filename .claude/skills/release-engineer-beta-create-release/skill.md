---
name: release-engineer-beta-create-release
description: Create a release for a directory (starter/, image/, etc). Handles changelog generation, publishing, and PR creation. Use when asked to "create release", "publish release", "release starter", or "update changelog and publish".
---

# Create Release

Create a complete release for a directory: generate changelog entries, publish, and create PR.

## Input

**Required**: Directory path (e.g., `starter`, `image`)

## Workflow

### 1. Run prepare-release.py

```bash
./{directory}/scripts/prepare-release.py
```

This script:
- Creates a changelog branch from origin/main
- Validates no non-changelog commits exist on the branch
- Finds undocumented commits on origin/main
- Outputs JSON with commit data

### 2. Handle the Result

Parse the JSON output:

**If `status: "up_to_date"`**: Report that changelog is current, nothing to release.

**If `status: "error"`**: Report the error and stop.

**If `status: "ready"`**: Continue to step 3.

### 3. Generate Changelog Entries

For each commit in the JSON `commits` array, write a changelog entry.

**Goal**: Help users understand changes without reading code. Be descriptive.

**Format**:
```markdown
## {next_date_heading from JSON}

### Changed
- Description of what changed and why it matters ([{sha}]({link}))

### Added
- New feature description ([{sha}]({link}))

### Fixed
- Bug fix description ([{sha}]({link}))

### Security
- CVE-XXXX: Description ([{sha}]({link}))

---
```

**Categorization rules**:
- `fix:` in message → Fixed
- `feat:` in message → Added
- `security:` or CVE in message → Security
- Default → Changed

**Writing guidelines**:
- Present tense: "Add feature" not "Added feature"
- User value focus: What changed and why it matters
- Group related commits when it improves clarity

### Base Container Updates (CRITICAL)

For "Auto-update" commits that update base container SHAs, you MUST describe what changed:

**BAD** (tells users nothing):
```markdown
- Updated base container to latest image ([abc1234](link))
```

**GOOD** (tells users what they're getting):
```markdown
- Updated AI assistant container software with new capabilities ([abc1234](link)):
  - **Claude Code 2.1.1 → 2.1.12** ([changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)): Setup hook, MCP tool search auto mode, wildcard Bash permissions, security fixes
  - **OpenCode 1.1.42 → 1.2.0** ([changelog](https://github.com/anomalyco/opencode/releases)): New provider support, improved UI
  - Config persistence: ~/.claude/ now survives container rebuilds
```

**How to find what changed**:
1. Look at commits to `image/` directory between the old and new SHA
2. Check `image/Dockerfile` for version changes (ARG lines)
3. Fetch upstream changelogs for tools that were updated
4. Summarize the key user-facing changes

### 4. Edit the Changelog

Insert the new entries into `{changelog_path from JSON}`:
- After the header/instructions section
- Before the previous date entries
- Maintain existing format

### 5. Commit the Changelog

```bash
git add {changelog_path}
git commit -m "docs({directory}): update CHANGELOG.md with {date} changes"
```

### 6. Publish

```bash
./{directory}/scripts/publish-release.sh
```

### 7. Push and Report

```bash
git push -u origin {branch from JSON}
```

Provide the PR creation link:
```
https://github.com/{owner}/{repo}/pull/new/{branch}
```

## Example

User: "create a release for starter"

1. Run `./starter/scripts/prepare-release.py`
2. Get JSON with commits needing documentation
3. Generate descriptive changelog entries
4. Edit `starter/CHANGELOG.md`
5. Commit the changelog
6. Run `./starter/scripts/publish-release.sh`
7. Push and provide PR link

## Error Handling

| Error | Action |
|-------|--------|
| "Branch has non-changelog changes" | User needs to create fresh branch from main |
| "No undocumented commits" | Nothing to release - inform user |
| Publish script fails | Read error message, provide guidance |
