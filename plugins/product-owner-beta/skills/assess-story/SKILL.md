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

### Outcome Orientation Check

- [ ] **Behavior change stated**: Describes how users or systems will act differently, not just what will be built
- [ ] **Measurable outcome**: Has success criteria beyond "feature works" (leading indicator or metric)
- [ ] **Clear "why"**: The "so that" clause describes value/impact, not the feature itself

### INVEST Check

- [ ] **Independent**: Can be delivered without blocking on other incomplete work
- [ ] **Valuable**: Delivers clear value to user or business
- [ ] **Estimable**: Scope is clear enough that a developer could estimate it
- [ ] **Small**: Completable in one sprint or less
- [ ] **Testable**: Acceptance criteria can be verified

## Fail Signals

### Needs Refinement (tactical gaps)

Fail signals that indicate missing details but clear intent:
- No acceptance criteria at all
- Vague scope words without specifics ("improve", "enhance", "optimize", "better")
- Multiple unrelated objectives in one story
- Missing edge case handling
- Unclear scope boundaries

### Needs Outcome Framing (strategic gaps)

Fail signals that indicate the story lacks outcome orientation:
- Only describes solution, not the problem being solved
- Missing "why" - no stated value or benefit
- "So that" clause describes the feature, not the impact (e.g., "so that I can export" instead of "so that I can share reports with stakeholders in half the time")
- No behavior change articulated - describes what users will *have*, not how they'll *act differently*
- No measurable success criteria beyond "it works"
- Solution stated without underlying problem or hypothesis

## Output Format

### Assessment Outcomes

| Result | Meaning | Next Step |
|--------|---------|-----------|
| **PASS** | Ready for implementation | Implement |
| **NEEDS REFINEMENT** | Tactical gaps (AC, scope, edge cases) | Fill in missing details |
| **NEEDS OUTCOME FRAMING** | Output-focused, no behavior change stated | Frame the problem and hypothesis first |

### If PASS

```markdown
## Assessment: PASS

**Title:** {title}

This story is ready for implementation.

**Summary:**
- Problem: {one line summary of the problem}
- User: {who benefits}
- Outcome: {behavior change or measurable impact}
- Scope: {what will be delivered}
```

### If NEEDS REFINEMENT

```markdown
## Assessment: NEEDS REFINEMENT

**Title:** {title}

This story has clear intent but needs tactical details filled in.

**Gaps:**
1. {Specific gap - e.g., "No acceptance criteria defined"}
2. {Specific gap - e.g., "Scope boundaries unclear"}

**Questions to Answer:**
1. {Question that addresses gap #1}
2. {Question that addresses gap #2}

**What's Working:**
- {Positive aspect - e.g., "Clear problem statement and outcome"}
```

### If NEEDS OUTCOME FRAMING

```markdown
## Assessment: NEEDS OUTCOME FRAMING

**Title:** {title}

This story describes a solution but lacks outcome orientation. Before refining details, frame the underlying problem and desired behavior change.

**Missing:**
- {What's missing - e.g., "No behavior change stated - describes what users will have, not how they'll act differently"}
- {What's missing - e.g., "Success defined as 'feature works' rather than measurable impact"}

**Questions to Answer:**
1. What problem is this solving? Who experiences it and when?
2. What behavior will change if this works? How will users act differently?
3. How will we measure success beyond "the feature works"?
4. What's our hypothesis connecting this solution to the desired outcome?

**What's Working:**
- {Positive aspect if any - e.g., "Clear technical scope"}
```

## Examples

### Good Acceptance Criteria
```
GIVEN a logged-in user on the dashboard
WHEN they click the "Export" button
THEN a CSV file downloads containing their usage data from the last 30 days
```

### Vague (Needs Refinement)
- "Improve the export feature"
- "Make it faster"
- "Better error handling"

### Specific but Output-Focused (Needs Outcome Framing)
- "Add CSV export to the dashboard with columns: date, action, duration"
- "As a user, I want to export data so that I can export data"
- "Implement caching for the API"

These describe *what* to build but not *why* or *what behavior changes*.

### Outcome-Oriented (Passes)
- "Add CSV export so that managers can share weekly metrics with stakeholders without manual data entry, reducing report prep time from 2 hours to 10 minutes"
- "Reduce export generation time from 10s to under 2s so that users complete their reporting workflow without context-switching, increasing export completion rate from 60% to 90%"
- "Show user-friendly error message when export fails so that users can self-resolve issues, reducing support tickets for export failures by 50%"

### Side-by-Side Comparison

**Output-focused (Needs Outcome Framing):**
```
As a user,
I want a search feature
so that I can search for items.
```
- Circular "so that" - describes the feature, not the outcome
- No behavior change stated
- No success metric

**Outcome-oriented (Passes):**
```
As a warehouse worker,
I want to search inventory by SKU
so that I can locate items in under 30 seconds instead of walking the floor for 5 minutes.

Success Metrics:
- Item lookup time reduced from 5 min to 30 sec
- Floor walking distance reduced by 80%
```
- Specific persona with context
- Clear behavior change (how they'll act differently)
- Measurable outcome

## Scope

**Do**: Evaluate story against criteria, identify specific gaps, generate targeted questions
**Don't**: Modify the story, assume missing information, start refinement process
