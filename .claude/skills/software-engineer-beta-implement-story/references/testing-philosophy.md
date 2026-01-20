# Testing Philosophy

Automated tests are the first-line defense for software quality. They serve as living documentation that communicates system behavior to other developers.

## Core Principles

- **Tests validate expected behavior**: Write tests that clearly express what the code should do
- **Tests should fail for the right reasons**: A failing test should pinpoint exactly what's broken
- **Tests enable safe refactoring**: With good test coverage, confidently improve code structure
- **Tests are as important as production code**: They preserve flexibility, maintainability, and reusability

## Testing Pyramid

Follow a graduated approach based on scope and speed:

| Level | Quantity | Speed | Purpose |
|-------|----------|-------|---------|
| **Unit tests** | Most | Fast | Isolated component validation |
| **Integration tests** | Moderate | Medium | Component interactions |
| **End-to-end tests** | Fewest | Slow | Complete workflow validation |

As workflow scope increases, test quantity should decrease to balance coverage with maintainability.

## Test-Driven Implementation Cycle

1. **Write test** capturing acceptance criterion
2. **Run test** (should fail - red)
3. **Implement** minimum code to pass
4. **Run test** (should pass - green)
5. **Refactor** if needed (maintain green)
6. **Repeat** for next criterion

## Writing Good Tests

### Test Structure

Follow Arrange-Act-Assert (AAA) pattern:

```
# Arrange - Set up test data and preconditions
# Act - Execute the code under test
# Assert - Verify the expected outcome
```

### Test Naming

Test names should describe:
- What is being tested
- Under what conditions
- What the expected result is

Examples:
- `test_user_login_with_valid_credentials_returns_token`
- `test_payment_with_insufficient_funds_raises_error`
- `test_empty_cart_checkout_shows_warning`

### Test Independence

- Each test should be independent and not rely on other tests
- Tests should be able to run in any order
- Clean up test data after each test

### Test Coverage Priorities

1. **Happy paths** - Normal, expected usage
2. **Edge cases** - Boundary conditions
3. **Error cases** - Expected failure modes
4. **Integration points** - External service interactions

## Common Testing Antipatterns

### Avoid These

- **Testing implementation details**: Test behavior, not how it's implemented
- **Overly complex tests**: If a test is hard to understand, simplify it
- **Flaky tests**: Tests that sometimes pass and sometimes fail destroy confidence
- **Testing too much at once**: Each test should verify one thing
- **Ignoring test maintenance**: Treat test code with the same care as production code

### Prefer These

- **Descriptive test names**: Make failures self-documenting
- **Fast tests**: Slow tests get run less often
- **Deterministic tests**: Same input always produces same result
- **Isolated tests**: No shared state between tests

## Running Tests

```bash
# Run all tests
{test_command}  # e.g., npm test, pytest, go test ./...

# Run specific test file
{test_command} {path/to/test}

# Run tests matching pattern
{test_command} -k "{pattern}"

# Run with coverage
{coverage_command}  # e.g., npm test -- --coverage, pytest --cov
```

## When to Skip Tests

Tests should rarely be skipped, but valid reasons include:

- Feature is behind a feature flag not yet enabled
- Test requires external service not available in CI
- Known bug being tracked separately

Always document why a test is skipped and create tracking issue.
