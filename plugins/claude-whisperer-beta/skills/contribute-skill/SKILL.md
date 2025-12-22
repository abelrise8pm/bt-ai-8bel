---
name: contribute-skill
description: Prepare a locally-developed skill for contribution to the marketplace. Use when you're ready to share your skill improvements with others via a pull request.
---

# Contribute Skill to Marketplace

Prepare a local skill for contribution to the Rise8 AI Assistant marketplace.

## Input

The user specifies which local skill they want to contribute:
- By name: "contribute my assess-story-local skill"
- By path: "contribute the skill in .claude/plugins-dev/local-skills/skills/assess-story-local"

## Workflow

### 1. Identify the Local Skill

Locate the skill the user wants to contribute:

1. Look in `.claude/plugins-dev/` for the skill
2. Read the skill content
3. Identify if this is a new skill or an improvement to an existing marketplace skill

**Determine contribution type:**
- **Improvement**: Skill name ends in `-local` or `-beta` and a marketplace version exists
- **New skill**: No corresponding marketplace skill exists

### 2. Analyze the Skill

**For improvements**, compare with the original:

1. Find the original marketplace skill
2. Identify key differences:
   - What was added?
   - What was changed?
   - What was removed?
3. Summarize the improvement for the PR description

**For new skills**, verify it's contribution-ready:

- Has valid frontmatter (name, description only)
- Description includes trigger keywords
- Content is concise (<100 lines preferred)
- Follows naming conventions (lowercase, hyphens)

### 3. Prepare the Skill Content

**Clean up for contribution:**

1. **Remove local suffixes** from name:
   - `assess-story-local` → `assess-story`
   - `assess-story-beta` → `assess-story` (if replacing stable)

2. **Update description** to remove local/beta indicators:
   - Remove "(Local)" or "(Beta)" prefixes
   - Remove "only use when explicitly requested" (unless it's truly a beta)
   - Ensure description has clear trigger keywords

3. **Remove project-specific content:**
   - Paths specific to user's project
   - References to local files that won't exist in marketplace
   - Team-specific terminology (unless generally useful)

4. **Verify structure:**
   ```yaml
   ---
   name: skill-name
   description: Clear description with trigger keywords. Use when...
   ---
   ```

### 4. Determine Target Location

**For improvements to existing skills:**
```
plugins/{original-plugin}/skills/{skill-name}/SKILL.md
```

**For new skills**, ask the user:
> "This appears to be a new skill. Which plugin should it belong to?
>
> Existing plugins:
> - `cve-triage` - Security and vulnerability analysis
> - `gh-actions-triage` - GitHub Actions debugging
> - `user-story` - User story writing and assessment
> - `claude-whisperer` - Meta-skills for skill development
>
> Or should this be a new plugin?"

### 5. Generate Contribution Content

Output the prepared skill content:

```markdown
## Ready for Contribution

### Skill Content

**Target location:** `plugins/{plugin}/skills/{skill-name}/SKILL.md`

\`\`\`markdown
---
name: {skill-name}
description: {cleaned description}
---

{skill content with local references removed}
\`\`\`

### Changes Summary

{For improvements: bullet list of what changed from original}
{For new skills: brief description of what the skill does}

### Contribution Steps

1. **Clone the marketplace repo** (if you haven't already):
   \`\`\`bash
   git clone git@github.com:rise8-us/xpai-ai-assistant-container.git
   cd xpai-ai-assistant-container
   \`\`\`

2. **Create a branch:**
   \`\`\`bash
   git checkout -b {branch-name}
   \`\`\`

3. **Create/update the skill file:**
   Copy the skill content above to:
   \`\`\`
   plugins/{plugin}/skills/{skill-name}/SKILL.md
   \`\`\`

4. **Commit and push:**
   \`\`\`bash
   git add plugins/{plugin}/skills/{skill-name}
   git commit -m "{commit-message}"
   git push origin {branch-name}
   \`\`\`

5. **Open a PR** with:
   - What: {brief description}
   - Why: {what problem it solves}
   - Testing: Describe how you tested in your project
```

### 6. Generate PR Details

Suggest appropriate git branch name and commit message:

**For improvements:**
- Branch: `improve-{skill-name}`
- Commit: `fix(plugins): improve {skill-name} with {change summary}`

**For new skills:**
- Branch: `add-{skill-name}`
- Commit: `feat(plugins): add {skill-name} skill to {plugin}`

## Scope

**Do:**
- Prepare local skills for marketplace contribution
- Clean up local-specific content
- Generate ready-to-use skill content
- Provide clear contribution steps
- Suggest appropriate git branch/commit conventions

**Don't:**
- Actually clone repos or create PRs (user does this)
- Modify the original local skill
- Make assumptions about which plugin without asking
- Include project-specific content in contribution
