---
name: user-story
description: Write actionable user stories following INVEST principles. Use when creating user stories, refining requirements, or writing acceptance criteria.
---

# User Story Writer

Write well-structured user stories following INVEST principles.

## INVEST Criteria

- **Independent**: Releasable once delivered
- **Negotiable**: Open to refinement
- **Valuable**: Delivers clear user value
- **Estimable**: Clear enough to discuss in ~5 minutes
- **Small**: Completable in one day (max one week)
- **Testable**: Has verifiable acceptance criteria

## Story Types

| Type | Format |
|------|--------|
| **Feature** | As a [persona], I want [capability] so that [impact] |
| **Bug** | Current behavior / Expected behavior / Impact |
| **Chore** | Technical work / Rationale / Benefit |

## Acceptance Criteria Format

```
GIVEN [starting conditions]
WHEN [user actions]
THEN [expected results]
```

## Output Structure

```markdown
## [Story Title]

**Type:** [Feature|Bug|Chore]

**Story:**
[Story in appropriate format]

**Acceptance Criteria:**

1. **GIVEN** [condition]
   **WHEN** [action]
   **THEN** [result]

2. **GIVEN** [condition]
   **WHEN** [action]
   **THEN** [result]

**Notes:**
- [Additional context, design links, technical considerations]

**Size Estimate:** [Small (< 1 day) | Medium (1-2 days) | Large (needs splitting)]
```

## Process

1. Ask clarifying questions to understand the requirement
2. Identify story type (feature, bug, chore)
3. Draft story in appropriate format
4. Write comprehensive acceptance criteria
5. Check INVEST principles
6. Suggest splitting if too large
