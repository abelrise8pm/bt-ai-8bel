# Plugin Development Guide

This guide covers how to develop, test, and contribute plugins for the AI Assistant marketplace.

> **Official Documentation**: For complete plugin reference, see [Claude Code Plugins Reference](https://code.claude.com/docs/en/plugins-reference)

## Overview

Plugins are distributed via a marketplace hosted in this repository. Teams can:

1. **Use plugins** - Install from the marketplace
2. **Customize plugins** - Override behavior with project-specific config
3. **Improve plugins** - Contribute enhancements to existing plugins
4. **Create plugins** - Develop new plugins and contribute them upstream

## Marketplace Structure

```
xpai-ai-assistant-container/
├── .claude-plugin/
│   └── marketplace.json        # Lists available plugins
└── plugins/
    ├── cve-triage/
    │   ├── .claude-plugin/
    │   │   └── plugin.json     # Plugin metadata
    │   └── skills/
    │       └── cve-triage/
    │           └── SKILL.md    # Skill definition
    ├── gh-actions-triage/
    └── user-story/
```

## Using Plugins

### Subscribe to the Marketplace

```bash
/plugin marketplace add rise8-us/xpai-ai-assistant-container
```

### Install Plugins

```bash
/plugin  # Browse and install from the menu
```

### Project-Specific Customization

Some plugins support project-specific configuration without modifying the plugin itself.

Example: The `cve-triage` plugin reads `.claude/cybersecurity/context.md` if it exists:

```markdown
# .claude/cybersecurity/context.md

## Component Risk Levels
| Component | Risk | Reason |
|-----------|------|--------|
| my-api | HIGH | Internet-facing, processes user input |
| worker | LOW | Internal only |

## Remediation Timelines
| Severity | Deadline |
|----------|----------|
| CRITICAL | 7 days |
| HIGH | 30 days |
```

This lets you customize behavior without forking the plugin.

---

## Contributing Improvements to Existing Plugins

When you find ways to improve an existing plugin (better prompts, new capabilities, bug fixes), contribute them upstream so everyone benefits.

### Step 1: Clone the Main Repository

```bash
git clone git@github.com:rise8-us/xpai-ai-assistant-container.git
```

### Step 2: Symlink the Specific Plugin

Symlink only the plugin you want to improve. Other plugins continue to come from the stable marketplace.

```bash
# From your project directory
mkdir -p .claude/plugins
ln -s /path/to/xpai-ai-assistant-container/plugins/cve-triage .claude/plugins/cve-triage
```

Your structure:
```
your-project/
└── .claude/
    └── plugins/
        └── cve-triage -> /path/to/.../plugins/cve-triage

xpai-ai-assistant-container/
└── plugins/
    └── cve-triage/           # Edit here - changes ready for PR
```

### Step 3: Iterate in Your Daily Workflow

Make changes while working in your project. Edits go directly to the main repo clone, ready for a PR.

### Step 4: Submit a PR

When your improvements are ready:

1. **Update version** in `plugin.json`:
   ```json
   {
     "version": "1.1.0"  // Bump appropriately
   }
   ```

2. **Commit and push** from the main repo clone:
   ```bash
   cd /path/to/xpai-ai-assistant-container
   git checkout -b improve-cve-triage
   git add plugins/cve-triage
   git commit -m "feat(plugins): improve cve-triage prompts"
   git push origin improve-cve-triage
   ```

3. **Open a PR** with:
   - Description of the improvement
   - How you tested it
   - Any breaking changes

4. **After merge**, remove the symlink and use the marketplace version:
   ```bash
   rm .claude/plugins/cve-triage
   ```

### What Makes a Good Plugin Improvement

- Fixes bugs or edge cases you encountered
- Adds capabilities useful to multiple teams
- Improves prompts based on real-world usage
- Better error handling or output formatting
- Performance improvements

---

## Creating New Plugins

When you develop a new plugin that would benefit other teams, contribute it to the marketplace.

### Step 1: Develop Locally

Create the plugin structure in your project:

```bash
mkdir -p .claude/plugins/my-plugin/.claude-plugin
mkdir -p .claude/plugins/my-plugin/skills/my-plugin
```

Create the plugin metadata (`.claude-plugin/plugin.json`):

```json
{
  "name": "my-plugin",
  "version": "1.0.0-dev",
  "description": "Brief description of what the plugin does",
  "author": {
    "name": "Your Team"
  }
}
```

Create the skill (`skills/my-plugin/SKILL.md`):

```markdown
---
name: my-plugin
description: What it does and when to use it. Be specific about triggers.
---

# My Plugin

[Skill content - keep it concise, focus on what Claude doesn't already know]
```

### Step 2: Follow Skill Design Principles

**Keep skills concise** - Only include information Claude doesn't already know:
- Project-specific context
- Specific workflows or output formats
- Tool-specific instructions

**Use progressive disclosure** - For complex plugins:
```
my-plugin/
├── .claude-plugin/plugin.json
└── skills/
    └── my-plugin/
        ├── SKILL.md              # Core workflow (<100 lines)
        └── references/           # Detailed docs loaded on-demand
            └── advanced.md
```

**Support customization** - Read project-specific config when it makes sense:
```markdown
## Project Context (Optional)

If `.claude/my-config/context.md` exists, use it for project-specific settings.
```

### Step 3: Test Thoroughly

Use the plugin in real workflows before contributing:
- Does it trigger at the right times?
- Is the output useful?
- Does it handle edge cases?

### Step 4: Contribute Upstream

1. **Clone** the main repository:
   ```bash
   git clone git@github.com:rise8-us/xpai-ai-assistant-container.git
   ```

2. **Copy** your plugin to the clone:
   ```bash
   cp -r .claude/plugins/my-plugin /path/to/xpai-ai-assistant-container/plugins/
   ```

3. **Finalize version** - Remove `-dev` suffix:
   ```json
   {
     "version": "1.0.0"
   }
   ```

4. **Add to marketplace.json**:
   ```json
   {
     "plugins": [
       // ... existing plugins
       {
         "name": "my-plugin",
         "source": "./plugins/my-plugin",
         "description": "Brief description for marketplace listing"
       }
     ]
   }
   ```

5. **Commit and push**:
   ```bash
   cd /path/to/xpai-ai-assistant-container
   git checkout -b add-my-plugin
   git add plugins/my-plugin .claude-plugin/marketplace.json
   git commit -m "feat(plugins): add my-plugin"
   git push origin add-my-plugin
   ```

6. **Open a PR** with:
   - What problem the plugin solves
   - Example use cases
   - How you've tested it

### New Plugin Checklist

Before submitting:

- [ ] Plugin has `.claude-plugin/plugin.json` with name, version, description
- [ ] Skill has valid YAML frontmatter (name, description only)
- [ ] Description clearly states when to use the plugin
- [ ] SKILL.md is concise (<100 lines preferred)
- [ ] No `allowed-tools` in frontmatter (invalid field)
- [ ] Tested in real workflows
- [ ] Version is release-ready (no `-dev` suffix)

---

## Maintainer Workflow

For maintainers of the main repository.

### Local Development Setup

### Versioning

| Phase | Version Format | Example |
|-------|---------------|---------|
| After publish | Add `-dev` | `1.1.0-dev` |
| Iterating | Keep `-dev` | `1.1.0-dev` |
| Ready to publish | Remove `-dev`, bump | `1.1.0` |

**When to bump:**
- PATCH: Bug fixes, wording improvements
- MINOR: New capabilities, non-breaking changes
- MAJOR: Breaking changes, renamed skills

### Publishing

1. Finalize versions (remove `-dev`)
2. Update `starter/CHANGELOG.md`
3. Commit and merge to main
4. Run `./starter/publish-to-external-repo.sh`
5. Bump versions to next `-dev`

---

## Plugin Structure Reference

### Minimal Plugin

```
my-plugin/
├── .claude-plugin/
│   └── plugin.json
└── skills/
    └── my-plugin/
        └── SKILL.md
```

### Plugin with References

```
my-plugin/
├── .claude-plugin/
│   └── plugin.json
└── skills/
    └── my-plugin/
        ├── SKILL.md
        └── references/
            ├── patterns.md
            └── examples.md
```

### Plugin with Multiple Skills

```
my-plugin/
├── .claude-plugin/
│   └── plugin.json
└── skills/
    ├── skill-one/
    │   └── SKILL.md
    └── skill-two/
        └── SKILL.md
```

### plugin.json Schema

```json
{
  "name": "plugin-name",
  "version": "1.0.0",
  "description": "What the plugin does",
  "author": {
    "name": "Team Name"
  }
}
```

### SKILL.md Frontmatter

```yaml
---
name: skill-name
description: What it does and when to use it.
---
```

Only `name` and `description` are valid. Do not include `allowed-tools` or other fields.

---

## Additional Resources

- [Claude Code Plugins Reference](https://code.claude.com/docs/en/plugins-reference) - Official plugin documentation
- [Plugin Marketplaces](https://code.claude.com/docs/en/plugin-marketplaces) - How marketplaces work
- [Anthropic Claude Code Plugins](https://github.com/anthropics/claude-code/tree/main/plugins) - Official plugin examples
