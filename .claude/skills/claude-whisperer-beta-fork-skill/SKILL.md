---
name: claude-whisperer-beta-fork-skill
description: Copy a marketplace skill locally for iteration and improvement. Use when you want to customize an existing skill, fix issues, or experiment with changes without affecting the original.
---

# Fork Skill for Local Iteration

Copy a marketplace skill to your local development environment so you can iterate on it with Claude.

## Input

The user specifies which skill they want to fork:
- By name: "fork the assess-story skill"
- From a specific plugin: "fork assess-story from user-story plugin"

## Workflow

### 1. Identify the Source Skill

Locate the skill the user wants to fork:

1. Check installed plugins for the skill name
2. If ambiguous (skill name exists in multiple plugins), ask which one
3. Read the current skill content to understand what's being forked

**If you cannot find the skill:**
> "I couldn't find a skill named '{name}'. Here are the installed plugins and their skills: [list them]. Which skill did you mean?"

### 2. Check Local Dev Environment

Verify the user has a local development marketplace set up:

**Required structure:**
```
.claude/
├── .claude-plugin/
│   └── marketplace.json    # Local marketplace definition
└── skills/            # Where forked skills will live
```

**If not set up, create it:**

1. Create directories:
   ```bash
   mkdir -p .claude/.claude-plugin
   mkdir -p .claude/skills
   ```

2. Create `.claude/.claude-plugin/marketplace.json`:
   ```json
   {
     "name": "local-dev",
     "metadata": {
       "description": "Local development marketplace"
     },
     "owner": {
       "name": "Local"
     },
     "plugins": []
   }
   ```

3. Inform the user:
   > "I've set up a local development marketplace. You'll need to add it once:
   > ```
   > /plugin marketplace add ./.claude
   > ```"

### 3. Determine Target Location

Decide where to put the forked skill:

**Option A: New local plugin** (default for first fork)
```
.claude/skills/local-skills/
├── .claude-plugin/
│   └── plugin.json
└── skills/
    └── {skill-name}-local/
        └── SKILL.md
```

**Option B: Existing local plugin** (if user already has one)
```
.claude/skills/{existing-plugin}/skills/{skill-name}-local/
```

**Naming the forked skill:**
- Append `-local` to distinguish from the marketplace version
- Example: `assess-story` → `assess-story-local`

### 4. Create the Forked Skill

1. **Create plugin structure** (if new plugin):

   Create `.claude/skills/local-skills/.claude-plugin/plugin.json`:
   ```json
   {
     "name": "local-skills",
     "version": "0.1.0-dev",
     "description": "Local skill development and customization",
     "author": {
       "name": "Local"
     }
   }
   ```

2. **Copy and rename the skill:**
   - Copy SKILL.md to new location
   - Update the `name` in frontmatter to include `-local` suffix
   - Update the `description` to indicate it's a local version
   - Preserve all other content

3. **Update the description** to differentiate from original:
   ```yaml
   ---
   name: assess-story-local
   description: (Local) Customized story assessment. Use when explicitly requested with "assess-story-local".
   ---
   ```

4. **Add to local marketplace** (if new plugin):

   Update `.claude/.claude-plugin/marketplace.json`:
   ```json
   {
     "plugins": [
       {
         "name": "local-skills",
         "source": "./skills/local-skills",
         "description": "Local skill development and customization"
       }
     ]
   }
   ```

### 5. Provide Next Steps

Output clear instructions:

```markdown
## Skill Forked

**Source:** `{original-plugin}:{original-skill}`
**Location:** `.claude/skills/local-skills/skills/{skill-name}-local/SKILL.md`

**Next steps:**

1. If this is your first local skill, add the local marketplace:
   ```
   /plugin marketplace add ./.claude
   ```

2. Install your local plugin:
   ```
   /plugin install local-skills@local-dev
   ```

3. Test the forked skill:
   ```
   Use {skill-name}-local to...
   ```

4. Edit `.claude/skills/local-skills/skills/{skill-name}-local/SKILL.md` to customize

5. When happy with changes, see [Contributing Back](docs/SKILL-DEVELOPMENT.md#contributing-back)

**Tip:** You now have both versions available:
- `{original-skill}` - Original marketplace version
- `{skill-name}-local` - Your customized version
```

## Scope

**Do:**
- Copy marketplace skills to local development environment
- Set up local-dev marketplace structure if missing
- Rename skills to avoid conflicts with originals
- Provide clear next steps for iteration

**Don't:**
- Modify the original marketplace skill
- Automatically install plugins (user should do this explicitly)
- Delete or replace the original skill
