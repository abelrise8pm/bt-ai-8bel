# Feedback Categorization Guide

## Categories

### Fix

Apply the change when feedback identifies:
- Clear bug or error
- Improvement to clarity without changing behavior
- Security concern
- Violation of project standards
- Unused code/variables that should be removed

### No Fix Needed

Document but don't change when:
- Feedback based on misunderstanding of code behavior
- Suggestion doesn't apply to this context
- Code is already correct but not obvious to reviewer
- Change would introduce unnecessary complexity

**Critical**: Always include "How I verified this":
- Show the test run to confirm current behavior
- Provide concrete examples or command output
- Explain why the suggested change would be incorrect or unnecessary
- This helps human reviewers understand the reasoning

### Why (Explain, Don't Fix)

Explain without changing when:
- Architectural decisions requiring rationale
- Trade-offs that were intentional
- Constraints not visible in the PR

## Decision Making Without Human Input

When uncertain about a fix:

1. **Lean towards fixing** - If reasonable and safe, apply it
2. **Test behavior** - Verify bash/script behavior before deciding
3. **Document reasoning** - Explain decision in commit message
4. **Trust project standards** - Use CLAUDE.md as decision guide

Humans will review on GitHub. Better to apply a fix that might need tweaking than to block on questions.

## Bash Command Verification

When feedback suggests using bash commands differently:

1. **Test the suggestion** in a controlled environment first
2. **Verify behavior** with actual examples
3. **Document the correct behavior** in analysis
4. **Don't blindly apply** suggestions that may be incorrect

Example: `printf` with array expansion (`printf '%s\n' "${array[@]}"`) is correct; a suggested loop may be unnecessary.

## Reference Git History

Before fixing issues, check if similar feedback was addressed before:

```bash
# Look for related commits
git log --grep="<keyword>" --oneline -20
git show <commit-hash>
```

This helps:
- Understand how similar issues were resolved
- Maintain consistency with past decisions
- Include references in analysis

## Project Standards to Apply

When making fixes, follow these standards:

### Shell Scripts
```bash
#!/usr/bin/env bash
set -eu  # Exit on error, fail on undefined variables
```

### Dockerfiles
- Pin base images with SHA digests
- Run as non-root user
- Clean up apt lists and package manager caches

### Security
- No credentials in code
- Principle of least privilege
- Validate external inputs

### Code Quality
- Remove unused variables/code completely
- Clear, descriptive variable names
- Comments explain "why" not "what"
