---
name: implement-story
description: Implement a GitHub issue following clean code principles with strong emphasis on automated testing. Use when implementing issues, building features, or starting development work on a story.
---

# Story Implementation

Implement a GitHub issue following clean code principles with automated testing as a first-line defense for quality.

## Input

GitHub issue URL: `https://github.com/owner/repo/issues/123`

## Workflow

### 1. Fetch and Understand the Story

```bash
gh issue view {number} --repo {owner}/{repo} --json title,body,labels,comments
```

Extract from the issue:
- **Story statement**: The "As a... I want... so that..." or problem description
- **Acceptance criteria**: Any GIVEN/WHEN/THEN conditions or requirements
- **Out of scope**: What's explicitly excluded
- **Technical notes**: Any implementation hints or constraints

If the story lacks clear acceptance criteria, work with what's available and clarify with the user as needed during implementation.

### 2. Create Implementation Plan

Use TodoWrite to create a task list based on acceptance criteria:

1. Map each acceptance criterion to one or more implementation tasks
2. Order tasks by dependency (foundational work first)
3. Identify which tasks need tests vs. structural changes

**Task Naming Convention:**
- Tests: "Write test: [what it verifies]"
- Implementation: "Implement: [capability]"
- Refactor: "Refactor: [what's being improved]"

### 3. Explore the Codebase

Before writing code, understand existing patterns:

```bash
# Find related files
git ls-files | grep -i {relevant_terms}

# Search for similar patterns
grep -r "{pattern}" --include="*.{ext}"

# Read existing implementations
```

Identify:
- **Existing patterns**: How similar functionality is implemented
- **Test patterns**: How tests are structured in this codebase
- **File locations**: Where new code should live
- **Naming conventions**: How things are named

### 4. Automated Testing

Automated tests are your first-line defense for software quality. They serve as living documentation that communicates system behavior to other developers.

#### Testing Philosophy

- **Tests validate expected behavior**: Write tests that clearly express what the code should do
- **Tests should fail for the right reasons**: A failing test should pinpoint exactly what's broken
- **Tests enable safe refactoring**: With good test coverage, you can confidently improve code structure
- **Tests are as important as production code**: They preserve flexibility, maintainability, and reusability

#### Testing Pyramid

Follow a graduated approach based on scope and speed:

| Level | Quantity | Speed | Purpose |
|-------|----------|-------|---------|
| **Unit tests** | Most | Fast | Isolated component validation |
| **Integration tests** | Moderate | Medium | Component interactions |
| **End-to-end tests** | Fewest | Slow | Complete workflow validation |

As workflow scope increases, test quantity should decrease to balance coverage with maintainability.

#### Writing Tests

1. Write tests that capture acceptance criteria
2. Run tests frequently during implementation
3. Ensure tests fail meaningfully when behavior breaks
4. Keep tests focused and readable

```bash
# Run tests
{test_command}  # e.g., npm test, pytest, go test
```

### 5. Refactor

After tests pass, clean up:

1. Improve code quality without changing behavior
2. Remove duplication
3. Improve naming and structure
4. Run tests to ensure still passing

### 6. Commit Strategy

Follow atomic commit principles:

**Structural changes** (refactoring, moving code):
```bash
git add {files}
git commit -m "refactor: {what changed structurally}"
```

**Behavioral changes** (new functionality):
```bash
git add {files}
git commit -m "feat: {what capability was added}"
```

**Never mix structural and behavioral changes in the same commit.**

### 7. Verify Acceptance Criteria

Before completing, verify each acceptance criterion:

| Criterion | Test | Status |
|-----------|------|--------|
| GIVEN/WHEN/THEN #1 | `test_name` | PASS/FAIL |
| GIVEN/WHEN/THEN #2 | `test_name` | PASS/FAIL |

### 8. Final Verification

Run the full test suite:
```bash
{full_test_command}
```

Run linters if available:
```bash
{lint_command}
```

## Commit Message Format

Use Conventional Commits:

```
<type>(<scope>): <description>

[optional body explaining why]

[optional footer with issue reference]
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `refactor`: Code restructuring (no behavior change)
- `test`: Adding or updating tests
- `docs`: Documentation only
- `chore`: Maintenance tasks

Example:
```
feat(export): add CSV export to dashboard

Implements the export functionality requested in #123.
Users can now download their usage data as CSV.

Closes #123
```

## Progress Updates

Keep the user informed at key milestones:
- After understanding the story
- After creating the implementation plan
- After completing major implementation steps
- When all acceptance criteria are verified

## Edge Cases

### Story is Too Large
If implementation reveals the story is larger than expected:
> This story is larger than initially scoped. I recommend pausing and splitting it. The natural boundaries I see are:
> 1. [First smaller piece]
> 2. [Second smaller piece]
>
> Should I continue with just the first piece?

### Missing Test Infrastructure
If the project lacks test setup:
> I don't see existing test infrastructure. Before implementing, we should set up testing. Want me to:
> 1. Add basic test configuration for {framework}
> 2. Proceed without tests (not recommended)

### Unclear Acceptance Criteria
If criteria are ambiguous:
> The acceptance criterion "{criterion}" is ambiguous. Specifically: {what's unclear}. How should I interpret this?

## Scope

**Do**:
- Write tests that validate acceptance criteria
- Create atomic commits
- Verify all acceptance criteria
- Keep user informed of progress
- Ask clarifying questions when blocked

**Don't**:
- Add features not in acceptance criteria
- Skip tests for "simple" changes
- Make assumptions about unclear requirements
- Mix refactoring with feature changes in commits
