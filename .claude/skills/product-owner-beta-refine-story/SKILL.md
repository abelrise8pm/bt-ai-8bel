---
name: product-owner-beta-refine-story
description: Interactively refine a GitHub issue by asking clarifying questions and posting a refined story comment. Use after assess-story identifies gaps.
---

# Story Refinement

Interactively gather missing information for a GitHub issue and post a refined story as a comment.

## Scope

This skill handles **tactical refinement** - filling in missing details for stories that have clear intent and outcome orientation. It addresses gaps like:
- Missing acceptance criteria
- Unclear scope boundaries
- Unspecified edge cases
- Ambiguous requirements

**This skill does NOT handle strategic gaps.** If a story lacks outcome orientation (no behavior change stated, no measurable success criteria, solution without problem), outcome framing must happen first. See "When to Stop and Frame Outcomes First" below.

## Workflow

1. **Parse input**: Accept GitHub issue URL or `owner/repo#number` format
2. **Fetch issue**: `gh issue view {number} --repo {owner}/{repo} --json title,body,labels,comments`
3. **Search codebase**: If issue mentions existing functionality (commands, features, code), search for it before asking questions:
   - `ls .claude/commands/` for slash commands
   - `grep -r` for related code patterns
   - Read existing implementations to understand current behavior
4. **Identify gaps**: Determine what information is missing (or use gaps from assess-story)
5. **Ask questions**: Ask ONE question at a time, wait for answer before next question
6. **Draft story**: When all gaps filled, draft refined story following INVEST principles
7. **Post comment**: Add refined story as comment on the GitHub issue

## Question Strategy

### Ask ONE Question at a Time
Do not overwhelm with multiple questions. Ask the most important gap-filling question, wait for the answer, then ask the next.

### External References First
If the issue links to inaccessible content (Slack messages, private docs, Confluence, etc.), ask the user to paste the relevant content BEFORE asking other refinement questions. This context often answers multiple gaps at once.

### Question Priority Order
1. **Problem/Need**: "What problem are we solving?" or "What user need does this address?"
2. **User/Persona**: "Who is the primary user that will benefit from this?"
3. **Success criteria**: "How will we know this is working correctly?"
4. **Scope boundaries**: "What should explicitly NOT be included in this work?"
5. **Edge cases**: "Are there any edge cases or error scenarios we should handle?"

### Question Format
Ask direct, specific questions as plain text in your response. Do NOT use the AskUserQuestion tool - it interrupts the conversational flow. Include context from the issue when helpful.

**Good:**
> The issue mentions "improve export performance" - what's the current performance and what target should we aim for?

**Bad:**
> Can you tell me more about this?

### Naming Decisions
If the proposed name for a feature, skill, or component changes during refinement, explicitly confirm: "So we're going with `[new-name]` instead of `[old-name]` - correct?"

## When to Stop and Frame Outcomes First

Before diving into tactical refinement, check if the story has outcome orientation. **Stop refinement** if you detect these signals:

| Signal | Example | What's Missing |
|--------|---------|----------------|
| Solution without problem | "Implement caching" | Why? What problem does this solve? |
| Circular "so that" | "so that I can export data" | Describes feature, not outcome |
| No behavior change | "Users will have a dashboard" | How will users act differently? |
| No success criteria | "Improve performance" | How will we measure success? |
| Feature-only description | "Add search functionality" | What outcome does this enable? |

**When these signals appear:**

1. Pause tactical refinement
2. Inform the user: "This story describes a solution but I don't see the underlying problem or desired outcome. Before refining the details, let's establish:
   - What problem are we solving?
   - What behavior will change if this works?
   - How will we measure success?"
3. Work through outcome framing before returning to tactical refinement

**Do not** attempt to bolt outcomes onto an output-focused story during refinement. The outcome framing needs to happen first, then refinement can fill in tactical details.

## INVEST Principles

The refined story MUST satisfy all INVEST criteria:

| Principle | Definition | Validation Question |
|-----------|------------|---------------------|
| **Independent** | Releasable once delivered; no blocking dependencies | Can this ship on its own? |
| **Negotiable** | Open to refinement; not a rigid spec | Is there flexibility in implementation? |
| **Valuable** | Delivers clear user or business value | Who benefits and how? |
| **Estimable** | Clear enough to discuss scope in ~5 minutes | Can a developer estimate this? |
| **Small** | Completable in one day (max one week) | Should this be split? |
| **Testable** | Has verifiable acceptance criteria | How do we prove it works? |

## Story Types

| Type | Format | Use When |
|------|--------|----------|
| **Feature** | As a [persona], I want [capability] so that [impact] | Adding new functionality |
| **Bug** | Current behavior / Expected behavior / Impact | Fixing broken functionality |
| **Chore** | Technical work / Rationale / Benefit | Refactoring, upgrades, debt |

## Acceptance Criteria Format

Use GIVEN/WHEN/THEN format for clear, testable criteria:

```
GIVEN [starting conditions]
WHEN [user actions]
THEN [expected results]
```

**Good Example:**
```
GIVEN a logged-in user on the dashboard
WHEN they click the "Export" button
THEN a CSV file downloads containing their usage data from the last 30 days
```

## Refined Story Output Structure

**IMPORTANT:** The output MUST always start with `## Refined Story` as the heading. This consistent naming is required for automated tools and search patterns to detect refined stories; using a different heading may cause downstream scripts and reviewers to fail to recognize or process the refined story correctly.

```markdown
## Refined Story

**Type:** Feature | Bug | Chore

**Story:**
As a [persona], I want [capability] so that [behavior change / measurable impact].

**Acceptance Criteria:**

1. **GIVEN** [starting condition]
   **WHEN** [user action]
   **THEN** [expected result]

2. **GIVEN** [starting condition]
   **WHEN** [user action]
   **THEN** [expected result]

**Success Metrics:**
- Leading: [Early signal that predicts success - e.g., "Feature adoption rate reaches 50% within 2 weeks"]
- Lagging: [Confirmation of impact - e.g., "Support tickets reduced by 30% within 60 days"]

**Out of Scope:**
- [What's explicitly NOT included]

**Notes:**
- [Technical considerations, dependencies, or context]

**Size Estimate:** Small (< 1 day) | Medium (1-3 days) | Large (needs splitting)
```

### If Story is Too Large

If the refined story would take longer than one week, suggest splitting:

> This story seems large. I recommend splitting it into:
> 1. [First smaller story]
> 2. [Second smaller story]
>
> Want me to refine these as separate stories?

## Posting the Comment

After drafting the refined story, confirm with the user before posting:

> Here's the refined story I've drafted. Should I post this as a comment on the issue?

If confirmed, post using:
```bash
gh issue comment {number} --repo {owner}/{repo} --body "{refined_story}"
```

## Skill Boundaries

**Do**:
- Ask clarifying questions one at a time
- Gather tactical details (AC, scope, edge cases)
- Draft refined story following INVEST with success metrics
- Post comment with user approval

**Don't**:
- Make assumptions about missing info
- Ask multiple questions at once
- Post without confirmation
- Attempt tactical refinement on stories lacking outcome orientation (frame outcomes first)
