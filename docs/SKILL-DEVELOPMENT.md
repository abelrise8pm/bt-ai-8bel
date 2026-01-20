# Skill Development Guide

Build your Iron Man suit: create skills from pairing sessions, improve existing marketplace skills, and contribute back.

> **Official Documentation**: For complete plugin reference, see [Claude Code Plugins Reference](https://code.claude.com/docs/en/plugins-reference)

## Quick Start

**What do you want to do?**

| Goal | Section |
|------|---------|
| Understand the philosophy | [Building Your Iron Man Suit](#building-your-iron-man-suit) |
| Install and use existing plugins | [Using Plugins](#using-plugins) |
| Create a new skill from a pairing session | [Starting from Scratch](#starting-from-scratch) |
| Improve an existing marketplace skill | [Improving a Skill](#improving-a-skill) |
| Contribute improvements back | [Contributing Back](#contributing-back) |
| Create a new plugin for your team | [Creating Plugins](#creating-plugins) |
| Contribute your plugin to the marketplace | [Contributing Upstream](#contributing-upstream) |
| Fix a bug or improve an existing plugin | [Improving Existing Plugins](#improving-existing-plugins) |
| Publish plugins (maintainers only) | [For Maintainers](#for-maintainers) |

---

## Building Your Iron Man Suit

> "Build Iron Man suits, not Iron Man robots."
> — Andrej Karpathy

Skills are how you build your personal Iron Man suit—AI augmentation that fits your specific work, not autonomous robots that replace you. The suit still has a human making decisions.

### The Autonomy Slider

Think of skill development as adjusting an "autonomy slider" over time:

```
┌─────────────────────────────────────────────────────────────────────────┐
│  1. WE DO (Synchronous Pairing)                                          │
│     You and Claude work together in real-time                            │
│     You provide direction, Claude executes, you refine together          │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│  2. ENCODE TO SKILL                                                      │
│     Capture patterns from the session                                    │
│     "Update the instructions so you can reproduce this next time"        │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│  3. REFINE THROUGH USE                                                   │
│     Continue pairing with the skill                                      │
│     Feedback loop: use → observe → refine                                │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│  4. AI DOES (Async Oversight)                                            │
│     Claude works autonomously                                            │
│     You review output rather than co-produce                             │
└─────────────────────────────────────────────────────────────────────────┘
```

### Three Paths to Building Skills

**Path 1: Starting from Scratch** — You've been pairing with Claude on a task, refined the output together, and want to capture that workflow as a reusable skill.

**Path 2: Improving a Skill** — A marketplace skill almost works for you but needs refinement. Copy it locally, iterate with Claude, make it fit your needs.

**Path 3: Contributing Back** — Your improvements could help others. Prepare your changes for a PR to the marketplace.

### Supporting Skills

The `claude-whisperer` plugin provides meta-skills to help with this workflow:

| Skill | Use When |
|-------|----------|
| `create-skill` | Starting from scratch—encode a pairing session into a new skill |
| `fork-skill` | Copying a marketplace skill locally for iteration |
| `contribute-skill` | Preparing your improved skill for contribution |

Install the helper skills:
```bash
/plugin marketplace add rise8-us/xpai-ai-assistant-container
/plugin install claude-whisperer
```

---

## Starting from Scratch

When you've had a successful pairing session with Claude and want to capture that workflow:

### The "We Do, You Do" Pattern

Skip the demonstration phase—Claude doesn't need to watch you work. Instead:

1. **Do a task with Claude** — Work through the problem together
2. **Refine the output together** — Iterate until it's right
3. **Encode to skill** — "Update the instructions so you can reproduce this next time"

Claude just went through the process, so it knows what to capture.

### Using the `create-skill` Skill

After a successful pairing session:

```
Use the create-skill skill to capture what we just did as a reusable skill.
```

The skill will:
- Extract the repeatable workflow from your conversation
- Analyze whether it should be one skill or multiple composable skills
- Identify what should be deterministic checks vs. LLM judgment
- Create the skill in `.claude/skills/` in your project
- Guide you on testing and refinement

### What Makes a Good Skill

**Include only what Claude doesn't already know:**
- Your project-specific context
- Your preferred workflows and output formats
- Domain knowledge unique to your work

**Keep it concise:**
- <100 lines preferred
- Put detailed reference docs in a `references/` subfolder

---

## Improving a Skill

When a marketplace skill almost works but needs refinement for your use case.

### The Workflow

```
Your Project Repo                 Marketplace Repo
─────────────────                 ────────────────
.claude/
├── skills/                  ← Copy skill here
│   └── my-improved-skill/
└── .claude-plugin/
    └── marketplace.json          ← Local-dev marketplace

          ↓ iterate with Claude ↓

When ready: contribute back →     PR to marketplace
```

### Step 1: Set Up Your Local Dev Environment

First time only—create a local marketplace in your project:

```bash
mkdir -p .claude/.claude-plugin
mkdir -p .claude/skills
```

Create `.claude/.claude-plugin/marketplace.json`:

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

Add your local marketplace:

```bash
/plugin marketplace add ./.claude
```

### Step 2: Fork the Skill

Use the `fork-skill` skill:

```
Use fork-skill to copy the assess-story skill locally so I can improve it.
```

Or manually:

1. Find the skill in the installed marketplace plugin
2. Copy it to `.claude/skills/my-plugin/skills/`
3. Add the plugin to your local `marketplace.json`
4. Install from local: `/plugin install my-plugin@local-dev`

### Step 3: Iterate with Claude

Use the skill in your real work. When it doesn't behave as expected:

1. Discuss what went wrong with Claude
2. Edit the skill together
3. Try again
4. Repeat until solid

This is the "refine through use" phase—you're still pairing, but now you're improving the skill itself.

### Keeping Both Versions

You can have both the stable marketplace skill and your local version:

- **Stable version**: `assess-story` (from marketplace)
- **Your version**: `assess-story-local` or `assess-story-beta` (from local-dev)

The naming difference lets you choose which to use:
- "Assess this story" → Claude picks the marketplace version
- "Use assess-story-local to assess this story" → Claude picks your version

---

## Contributing Back

When your improvements could help others, contribute them to the marketplace.

### When to Contribute

**Contribute when:**
- The improvement is generally useful (not just your project)
- You've tested it in real work
- Others would benefit from the same fix/enhancement

**Keep it local when:**
- It's specific to your project's context
- It's experimental and not yet proven
- You've diverged significantly from the original purpose

### Using the `contribute-skill` Skill

```
Use contribute-skill to prepare my improved assess-story skill for contribution.
```

The skill will:
- Help you identify what changed from the original
- Clean up the skill for contribution (remove local paths, etc.)
- Generate the content ready for a PR
- Guide you through the contribution process

### Manual Contribution Process

1. **Clone the marketplace repo:**
   ```bash
   git clone git@github.com:rise8-us/xpai-ai-assistant-container.git
   cd xpai-ai-assistant-container
   ```

2. **Copy your improved skill:**
   ```bash
   cp -r /path/to/your-project/.claude/skills/my-plugin/skills/improved-skill \
         plugins/existing-plugin/skills/
   ```

3. **Create a branch and PR:**
   ```bash
   git checkout -b improve-skill-name
   git add plugins/
   git commit -m "fix(plugins): improve skill-name with better X"
   git push origin improve-skill-name
   ```

4. **Open a PR with:**
   - What you changed and why
   - How you tested it
   - Example use cases where the improvement helped

---

## Beta Skills

Sometimes you want to experiment with a new approach while keeping the stable version available.

### Naming Convention

Use a `-beta` suffix to indicate experimental skills:

```
plugins/product-owner/skills/
├── assess-story/           # Stable version
│   └── SKILL.md
└── assess-story-beta/      # Experimental version
    └── SKILL.md
```

### Frontmatter for Beta Skills

Make the description prevent accidental invocation:

**Stable skill:**
```yaml
---
name: assess-story
description: Assess user stories for implementation readiness. Use when evaluating stories.
---
```

**Beta skill:**
```yaml
---
name: assess-story-beta
description: (Beta) Experimental story assessment with new scoring. Only use when explicitly requested.
---
```

The "(Beta)" prefix and "only use when explicitly requested" in the description prevents Claude from auto-selecting it over the stable version.

---

## Using Plugins

### Subscribe to the Marketplace

```bash
/plugin marketplace add rise8-us/xpai-ai-assistant-container
```

### Browse and Install

```bash
/plugin  # Opens the plugin menu
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

## Creating Plugins

Develop plugins in your own codebase first. This lets you use and refine them in real work before contributing upstream.

### Step 1: Set Up a Local Dev Marketplace

Create a local marketplace in your project:

```bash
mkdir -p .claude/.claude-plugin
mkdir -p .claude/skills
```

Create `.claude/.claude-plugin/marketplace.json`:

```json
{
  "name": "local-dev",
  "metadata": {
    "description": "Local development marketplace"
  },
  "owner": {
    "name": "Local"
  },
  "plugins": [
    {
      "name": "my-plugin",
      "source": "./skills/my-plugin",
      "description": "My work-in-progress plugin"
    }
  ]
}
```

Add your local marketplace:

```bash
/plugin marketplace add ./.claude
```

> **Tip**: You can use both marketplaces. Add the production marketplace too:
> ```bash
> /plugin marketplace add rise8-us/xpai-ai-assistant-container
> ```

### Step 2: Create Your Plugin

```bash
mkdir -p .claude/skills/my-plugin/.claude-plugin
mkdir -p .claude/skills/my-plugin/skills/my-skill
```

Create `.claude/skills/my-plugin/.claude-plugin/plugin.json`:

```json
{
  "name": "my-plugin",
  "version": "0.1.0-dev",
  "description": "Brief description of what the plugin does",
  "author": {
    "name": "Your Name"
  }
}
```

Create `.claude/skills/my-plugin/skills/my-skill/SKILL.md`:

```markdown
---
name: my-skill
description: What it does and when to use it. Be specific about triggers.
---

# My Skill

[Skill content - keep it concise, focus on what Claude doesn't already know]
```

### Step 3: Install and Test

```bash
/plugin install my-plugin@local-dev
```

Use the plugin in your daily work. Iterate until it's solid.

### Step 4: Design Tips

**Keep skills concise** - Only include information Claude doesn't already know:
- Project-specific context
- Specific workflows or output formats
- Tool-specific instructions

**Use progressive disclosure** - For complex plugins, put detailed docs in a `references/` folder:

```
my-plugin/
├── .claude-plugin/plugin.json
└── skills/
    └── my-skill/
        ├── SKILL.md              # Core workflow (<100 lines)
        └── references/           # Detailed docs loaded on-demand
            └── advanced.md
```

**Support customization** - Let projects override behavior without modifying the plugin:

```markdown
## Project Context (Optional)

If `.claude/my-config/context.md` exists, use it for project-specific settings.
```

---

## Contributing Upstream

Once your plugin is refined and working well, contribute it to the marketplace so other teams can use it.

### Step 1: Clone the Main Repository

```bash
git clone git@github.com:rise8-us/xpai-ai-assistant-container.git
cd xpai-ai-assistant-container
```

### Step 2: Copy Your Plugin

```bash
cp -r /path/to/your-project/.claude/skills/my-plugin plugins/
```

### Step 3: Finalize for Release

Update `plugins/my-plugin/.claude-plugin/plugin.json`:
- Remove `-dev` suffix from version
- Ensure description is clear for the marketplace listing

```json
{
  "name": "my-plugin",
  "version": "1.0.0",
  "description": "Clear description for marketplace listing",
  "author": {
    "name": "Your Name"
  }
}
```

### Step 4: Add to Marketplace

Edit `.claude-plugin/marketplace.json` to add your plugin:

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

### Step 5: Submit a PR

```bash
git checkout -b add-my-plugin
git add plugins/my-plugin .claude-plugin/marketplace.json
git commit -m "feat(plugins): add my-plugin"
git push origin add-my-plugin
```

Open a PR with:
- What problem the plugin solves
- Example use cases
- How you've tested it (mention you've been using it in your project)

### Contribution Checklist

Before submitting:

- [ ] Plugin has `.claude-plugin/plugin.json` with name, version, description
- [ ] Skill has valid YAML frontmatter (see [agentskills.io spec](https://agentskills.io/specification))
- [ ] Description clearly states when to use the plugin
- [ ] SKILL.md is concise (<100 lines preferred)
- [ ] Tested in real workflows in your project
- [ ] Version is release-ready (no `-dev` suffix)

---

## Improving Existing Plugins

Found a bug or want to improve an existing plugin? Here's how to contribute fixes.

### Step 1: Set Up for Development

Clone the main repo and set up the local dev marketplace:

```bash
git clone git@github.com:rise8-us/xpai-ai-assistant-container.git
cd xpai-ai-assistant-container

# Add the local-dev marketplace (already configured in this repo)
/plugin marketplace add ./.claude
/plugin install cve-triage@local-dev  # or whichever plugin you're improving
```

### Step 2: Make Your Changes

Edit the plugin directly in `plugins/your-plugin/`. Changes take effect immediately.

### Step 3: Test in Real Work

Use the improved plugin in your daily workflow. Verify it handles edge cases.

### Step 4: Submit a PR

```bash
git checkout -b improve-cve-triage
git add plugins/cve-triage
git commit -m "fix(plugins): handle edge case in cve-triage"
git push origin improve-cve-triage
```

**Good improvements include:**
- Bug fixes or edge case handling
- Better prompts based on real-world usage
- New capabilities useful to multiple teams
- Improved output formatting
- Performance improvements

---

## Plugin Reference

### Directory Structure

**Minimal plugin:**
```
my-plugin/
├── .claude-plugin/
│   └── plugin.json
└── skills/
    └── my-skill/
        └── SKILL.md
```

**Plugin with references:**
```
my-plugin/
├── .claude-plugin/
│   └── plugin.json
└── skills/
    └── my-skill/
        ├── SKILL.md
        └── references/
            ├── patterns.md
            └── examples.md
```

**Plugin with multiple skills:**
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

See the [agentskills.io specification](https://agentskills.io/specification) for all valid frontmatter fields.

---

## Troubleshooting

### Plugin not appearing after install

1. Verify marketplace is added: `/plugin` should show your marketplace
2. Check `marketplace.json` syntax (valid JSON, correct `source` path)
3. Ensure plugin directory exists at the path specified in `source`

### Skill not triggering

1. Check the `description` in SKILL.md frontmatter - Claude uses this to decide when to invoke the skill
2. Make triggers specific: "Use when analyzing CVE scan results" vs "Use for security"
3. Try invoking explicitly: "use the cve-triage skill to analyze this"

### Changes not reflected

1. Skills are loaded when invoked - just save and try again
2. For plugin.json changes, you may need to reinstall: `/plugin install my-plugin@local-dev`

### "Source must start with ./" error

Marketplace sources must be relative paths starting with `./`. You cannot use `../` paths. If you need to reference a parent directory, use a symlink.

---

## For Maintainers

This section is for core maintainers of the xpai-ai-assistant-container repository.

### Repository Structure

This repo uses two marketplaces:

```
xpai-ai-assistant-container/
├── .claude-plugin/
│   └── marketplace.json        # Production (what users install from)
└── .claude/
    ├── .claude-plugin/
    │   └── marketplace.json    # Local-dev (for testing before merge)
    └── skills/                 # Work-in-progress plugins and production plugins
```

All plugins are now consolidated under `.claude/skills/` for simpler organization.

### Versioning

| Phase | Version | Example |
|-------|---------|---------|
| Development | Include `-dev` | `1.1.0-dev` |
| Release | Remove `-dev` | `1.1.0` |
| Post-release | Bump + add `-dev` | `1.2.0-dev` |

**When to bump:**
- PATCH: Bug fixes, wording improvements
- MINOR: New capabilities, non-breaking changes
- MAJOR: Breaking changes, renamed skills

### Publishing Workflow

1. Finalize versions (remove `-dev` suffix)
2. Update `plugins/CHANGELOG.md`
3. Merge to main
4. Bump versions to next `-dev` for continued development

---

## Additional Resources

- [Claude Code Plugins Reference](https://code.claude.com/docs/en/plugins-reference) - Official plugin documentation
- [Plugin Marketplaces](https://code.claude.com/docs/en/plugin-marketplaces) - How marketplaces work
- [Anthropic Claude Code Plugins](https://github.com/anthropics/claude-code/tree/main/plugins) - Official plugin examples
- [agentskills.io](https://agentskills.io) - Emerging spec for portable AI agent skills (our skill format aligns with this)
