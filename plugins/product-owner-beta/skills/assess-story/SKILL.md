---
name: assess-story
description: Assess stories for implementation readiness using INVEST criteria. Use when triaging stories, evaluating backlog items, or before refinement sessions.
allowed-tools: Read, Grep, Glob, Bash
---

# Story Assessment

Evaluate a story to determine if it's ready for implementation or needs refinement.

## Input

A story with at minimum:
- **Title**: The story title
- **Body**: The story description/content

## Evaluation Criteria

### Must Have (all required)

- [ ] **Clear problem/need**: States what problem is being solved or what user need is addressed
- [ ] **Defined user**: Identifies who benefits (persona, role, or user type)
- [ ] **Acceptance criteria**: Has testable conditions for "done" (GIVEN/WHEN/THEN preferred)
- [ ] **Bounded scope**: Clear what IS and IS NOT included

### INVEST Check

- [ ] **Independent**: Can be delivered without blocking on other incomplete work
- [ ] **Valuable**: Delivers clear value to user or business
- [ ] **Estimable**: Scope is clear enough that a developer could estimate it
- [ ] **Small**: Completable in one sprint or less
- [ ] **Testable**: Acceptance criteria can be verified

## Fail Signals

Automatic **fail** if any of these are present:
- No acceptance criteria at all
- Vague scope words without specifics ("improve", "enhance", "optimize", "better")
- Multiple unrelated objectives in one story
- Only describes solution, not the problem being solved
- Missing "why" - no stated value or benefit

## Output Format

### If PASS

```markdown
## Assessment: PASS

**Title:** {title}

This story is ready for implementation.

**Summary:**
- Problem: {one line summary of the problem}
- User: {who benefits}
- Scope: {what will be delivered}
```

### If FAIL

```markdown
## Assessment: NEEDS REFINEMENT

**Title:** {title}

This story needs refinement before implementation.

**Gaps:**
1. {Specific gap - e.g., "No acceptance criteria defined"}
2. {Specific gap - e.g., "User/persona not identified"}

**Questions to Answer:**
1. {Question that addresses gap #1}
2. {Question that addresses gap #2}

**What's Working:**
- {Positive aspect if any - e.g., "Clear problem statement"}
```

## Examples

### Good Acceptance Criteria
```
GIVEN a logged-in user on the dashboard
WHEN they click the "Export" button
THEN a CSV file downloads containing their usage data from the last 30 days
```

### Vague (Fails)
- "Improve the export feature"
- "Make it faster"
- "Better error handling"

### Specific (Passes)
- "Add CSV export to the dashboard with columns: date, action, duration"
- "Reduce export generation time from 10s to under 2s for datasets up to 10k rows"
- "Show user-friendly error message when export fails due to timeout"

## Scope

**Do**: Evaluate story against criteria, identify specific gaps, generate targeted questions
**Don't**: Modify the story, assume missing information, start refinement process
