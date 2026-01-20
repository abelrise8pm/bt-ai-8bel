---
name: claude-whisperer-beta-create-skill
description: Create a reusable skill from the current conversation or pairing session. Use when you want to encode learnings, capture a repeatable workflow, or turn a successful pattern into a skill others can use.
---

# Create Skill from Conversation

Encode learnings from a pairing session into a reusable skill that can be shared with your team.

## Philosophy

This skill implements the "We do → Encode to skill" transition from Rise8's AI pairing model:

> "Do a task once with Claude, refine the output together, then tell Claude: 'Update the instructions so you can reproduce this next time.' Claude just went through the process, so it knows what to capture."

**Composability principle**: Rise8 builds high-cohesion, low-coupling skills that Risers can compose in novel ways. Prefer multiple focused skills over one monolithic skill.

## Workflow

### 1. Identify the Pattern

Review the conversation to extract:
- **The repeatable workflow**: What steps were followed?
- **The trigger**: When should this skill be invoked?
- **The value**: What problem does this solve?
- **Key decisions**: What choices were made and why?

### 2. Analyze for Composability

Before creating one skill, check if the pattern should be multiple smaller skills.

**Split signals** - the pattern might be multiple skills if:
- It has distinct phases that could run independently
- Different triggers could invoke different parts
- Some parts are reusable beyond this specific workflow
- The workflow exceeds 100 lines when drafted

**Example decomposition:**

A "release-component" workflow might split into:
- `update-changelog` - Generate changelog entries (reusable)
- `update-versions` - Bump version numbers (reusable)
- `publish-release` - Run the release script (orchestrates the above)

**Present the analysis:**

> "This pattern has 3 distinct phases. I see two options:
> 1. **One skill**: `{name}` that does A → B → C
> 2. **Three composable skills**: `do-a`, `do-b`, `do-c` that can be used independently or together
>
> Option 2 gives more flexibility - `do-a` could be reused in other workflows.
> Which approach do you prefer?"

**When to keep as one skill:**
- Steps are tightly coupled (B can't run without A's output)
- The workflow is short (<50 lines)
- Splitting would create skills too trivial to be useful

### 3. Identify Deterministic vs Non-Deterministic Parts

Skills guide LLM behavior, but some checks should be deterministic (always the same result for the same input). Analyze the workflow for both.

**Use deterministic mechanisms (hooks, scripts) when:**
- The rule is binary (yes/no, pass/fail)
- Context doesn't change the answer
- Consistency matters more than flexibility
- You want to prevent mistakes, not guide judgment

**Examples of deterministic checks:**
- "Must not be on main branch" → PreToolUse hook
- "Tests must pass before commit" → Script in workflow
- "File must have valid YAML frontmatter" → Validation script
- "Version must follow semver" → Regex check

**Use LLM non-determinism (skill instructions) when:**
- Judgment is required
- Context affects the right answer
- Multiple valid approaches exist
- Creativity or analysis is needed

**Examples of LLM judgment:**
- "Assess if this story is ready for implementation"
- "Determine appropriate skill name based on conversation"
- "Decide if workflow should be split into multiple skills"
- "Analyze PR feedback and categorize as fix/no-fix"

**Present the analysis to the user:**

> "I see some parts of this workflow that could be deterministic checks:
> - '{rule}' could be a PreToolUse hook that blocks {action}
> - '{validation}' could be a script that runs before {step}
>
> The rest requires judgment and should stay in the skill instructions.
> Should I suggest hook/script implementations for the deterministic parts?"

**Where deterministic checks live:**
- `hooks/hooks.json` - PreToolUse, PostToolUse, etc.
- `hooks/*.sh` - Shell scripts for validation
- `scripts/` - Utility scripts the skill can invoke
- Quality gates referenced in skill workflow

### 4. Confirm Key Decisions

Before drafting, confirm critical decisions with the user. Ask ONE question at a time.

**Required confirmations:**

1. **Skill name**: Propose an action-based name and confirm.
   > "Based on this conversation, I'd call this skill `{proposed-name}`. Does that capture it, or would you prefer something different?"

2. **Trigger**: Confirm when the skill should be invoked.
   > "When should someone use this skill? My read: '{proposed trigger}' - accurate?"

3. **Scope boundaries**: Confirm what's explicitly out of scope.
   > "What should this skill NOT do? I'm thinking: {proposed exclusions}"

**Skip questions when:**
- User already stated preference explicitly in conversation
- Answer is unambiguous from context

**Question format**: Ask as plain text in your response. Do NOT use the AskUserQuestion tool - it interrupts conversational flow.

### 5. Draft the Skill

Create a skill following these requirements:

#### Naming (agentskills.io spec)
- **Action-based**: verb-noun format (e.g., `review-pr`, `assess-story`)
- **Lowercase with hyphens**: no underscores, no uppercase
- **1-64 characters**: per the agentskills.io spec, names must be between 1 and 64 characters; keep them concise but descriptive
- **No consecutive hyphens**: `my-skill` not `my--skill`

#### Frontmatter (YAML)
```yaml
---
name: claude-whisperer-beta-create-skill
description: What it does. When to use it (trigger keywords).
---
```

Only `name` and `description` in frontmatter. No other fields.

#### Description Requirements
- **Max 1024 characters**
- **Include trigger keywords**: "Use when...", "Use after...", "Use for..."
- **Be specific**: "Use when reviewing PR feedback" not "Use for code review"

#### Body Structure
```markdown
# Skill Title

Brief purpose statement (1-2 sentences).

## Input

What the skill expects (if any).

## Workflow

Step-by-step process with clear sections.

## Output

What the skill produces.

## Scope

**Do**: What this skill handles
**Don't**: What's explicitly out of scope
```

#### Quality Guidelines
- **Keep it concise**: <100 lines preferred, <500 max
- **Focus on what Claude doesn't know**: Project-specific context, specific workflows
- **Progressive disclosure**: Put detailed docs in `references/` subfolder if needed

### 6. Write the Skill

Create the skill as standalone:

```
.claude/skills/{skill-name}/SKILL.md
```

### 7. Provide Next Steps

After creating the skill, output:

```markdown
## Skill Created

**Location:** `.claude/skills/{skill-name}/SKILL.md`

**Next steps:**
1. Review the skill content
2. Test by invoking: "use the {skill-name} skill to..."
3. Refine based on usage
4. When ready to share, follow [Skill Development Guide](docs/SKILL-DEVELOPMENT.md) to move into a plugin
```

## Validation Checklist

Before writing, verify:

- [ ] Analyzed for composability (could this be multiple skills?)
- [ ] Identified deterministic vs non-deterministic parts
- [ ] Name matches directory name
- [ ] Name is action-based (verb-noun)
- [ ] Name is lowercase with hyphens only
- [ ] Description includes trigger keywords
- [ ] Description under 1024 characters
- [ ] Body under 100 lines (or justified why larger)
- [ ] Has Do/Don't scope section
- [ ] Only includes what Claude doesn't already know

## Scope

**Do**:
- Extract patterns from conversations
- Analyze for composability and suggest splitting when appropriate
- Create standalone skills in `.claude/skills/`
- Follow agentskills.io and Rise8 conventions
- Provide clear next steps for testing and sharing

**Don't**:
- Create plugins (use existing plugin structure)
- Modify existing skills without explicit request
- Add `allowed-tools` or other non-standard frontmatter fields
- Create monolithic skills when smaller composable skills would serve better
