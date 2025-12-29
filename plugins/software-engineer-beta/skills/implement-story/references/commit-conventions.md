# Commit Conventions

Follow atomic commit principles and Conventional Commits specification for clear, meaningful history.

## Atomic Commits

### Core Principle

**Never mix structural and behavioral changes in the same commit.**

- **Structural changes**: Refactoring, moving code, renaming - no behavior change
- **Behavioral changes**: New features, bug fixes - changes what the code does

### Why Atomic Commits Matter

- **Easy to review**: Each commit has a single purpose
- **Easy to revert**: Can undo specific changes without side effects
- **Easy to bisect**: Find bugs faster with focused commits
- **Clear history**: Understand project evolution at a glance

## Conventional Commits Format

```
<type>(<scope>): <description>

[optional body explaining why]

[optional footer]
```

### Types

| Type | Purpose | Example |
|------|---------|---------|
| `feat` | New feature | `feat(auth): add OAuth2 login flow` |
| `fix` | Bug fix | `fix(cart): correct total calculation` |
| `refactor` | Code restructuring (no behavior change) | `refactor(api): extract validation logic` |
| `test` | Adding or updating tests | `test(user): add registration tests` |
| `docs` | Documentation only | `docs(readme): update installation steps` |
| `chore` | Maintenance tasks | `chore(deps): update dependencies` |
| `style` | Formatting, whitespace | `style: fix indentation` |
| `perf` | Performance improvement | `perf(query): add database index` |
| `ci` | CI/CD changes | `ci: add staging deployment` |

### Scope

Optional context for the change:
- Feature area: `auth`, `cart`, `payment`
- Component: `api`, `ui`, `db`
- Module: `user`, `order`, `product`

### Description

- Use imperative mood: "add" not "added" or "adds"
- Don't capitalize first letter
- No period at the end
- Keep under 72 characters

### Body

Explain **why** the change was made, not **what** was changed (the diff shows that):

```
feat(export): add CSV export to dashboard

Users requested the ability to export their usage data for
external analysis. CSV format was chosen for broad compatibility
with spreadsheet applications.
```

### Footer

Reference issues and breaking changes:

```
feat(api): change authentication endpoint

BREAKING CHANGE: /auth/login now requires email instead of username

Closes #123
Refs #456
```

## Example Commits

### Feature Addition

```
feat(dashboard): add usage metrics chart

Implements the metrics visualization requested in #123.
Uses Chart.js for rendering with daily/weekly/monthly views.

Closes #123
```

### Bug Fix

```
fix(payment): handle declined cards gracefully

Previously declined cards caused a 500 error. Now properly
catches the PaymentDeclined exception and shows user-friendly
message.

Fixes #456
```

### Refactoring

```
refactor(user): extract email validation to utility

Move email validation logic from User model to shared
EmailValidator utility for reuse across the codebase.

No behavior change - all existing tests pass.
```

### Test Addition

```
test(cart): add edge case tests for empty cart

Cover scenarios:
- Empty cart checkout attempt
- Adding zero quantity
- Removing last item
```

## Commit Workflow

### Before Committing

1. Review staged changes: `git diff --staged`
2. Ensure changes are atomic (single purpose)
3. Verify tests pass
4. Check for debug code or TODOs

### Staging Strategy

Stage related changes together:

```bash
# Stage specific files
git add src/auth/login.ts src/auth/login.test.ts

# Stage specific hunks interactively
git add -p
```

### Commit Commands

```bash
# Simple commit
git add {files}
git commit -m "feat(scope): description"

# Commit with body (using heredoc)
git commit -m "$(cat <<'EOF'
feat(scope): description

Body explaining why this change was made.

Closes #123
EOF
)"
```

## Common Mistakes

### Mixing Changes

**Bad:**
```
refactor and fix: clean up auth code and fix login bug
```

**Good:** Split into two commits:
```
refactor(auth): extract token validation to utility
fix(auth): handle expired tokens on login
```

### Vague Messages

**Bad:**
```
fix stuff
update code
wip
```

**Good:**
```
fix(cart): prevent negative quantities
refactor(api): simplify error handling
feat(user): add profile picture upload
```

### Implementation Details in Subject

**Bad:**
```
feat: add if statement to check user role
```

**Good:**
```
feat(auth): restrict admin panel to admin users
```
