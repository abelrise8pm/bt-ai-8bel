# Claude Code Agents

This directory contains custom Claude Code sub-agents that provide specialized functionality for specific tasks.

## Available Agents

### gh-actions-triage

**Purpose**: Automatically triages GitHub Actions workflow failures by analyzing logs and providing detailed diagnostics with remediation steps.

**When to use**: Whenever you encounter a failed GitHub Actions run and need to understand what went wrong and how to fix it.

**Input**: A GitHub Actions run URL or run ID

**Output**: A comprehensive failure analysis report including:
- Run overview and metadata
- Failed jobs and steps summary
- Detailed error analysis with log excerpts
- Root cause identification
- Step-by-step remediation instructions
- Code examples and best practices

## Usage

### Automatic Invocation

Claude Code will automatically invoke the `gh-actions-triage` agent when you:

1. Provide a GitHub Actions run URL:
```
Analyze this failed run: https://github.com/owner/repo/actions/runs/12345
```

2. Ask about a workflow failure:
```
Can you help me understand why run 12345 failed in owner/repo?
```

3. Request CI/CD debugging:
```
Debug the latest GitHub Actions failure in my repository
```

### Manual Invocation

You can explicitly request the agent:
```
Use the gh-actions-triage agent to analyze this failure: [URL]
```

## Prerequisites

The `gh-actions-triage` agent requires:

1. **GitHub CLI (gh)** installed and available in PATH
   ```bash
   gh --version
   ```

2. **Authentication** with GitHub
   ```bash
   gh auth login
   ```

3. **Repository access** for the workflow you want to analyze

4. **Permissions** to view workflow runs and logs

## Example Usage

### Example 1: Basic URL Analysis
```
Triage this failed run: https://github.com/myorg/myrepo/actions/runs/123456789
```

The agent will:
- Extract the run ID and repository info
- Fetch all run metadata
- Identify failed jobs
- Retrieve failure logs
- Analyze error patterns
- Generate a detailed report with fixes

### Example 2: Recent Failure Investigation
```
Check the most recent failed workflow run in this repository
```

The agent will:
- List recent runs
- Identify the most recent failure
- Perform full triage analysis

### Example 3: Specific Job Analysis
```
Analyze job 987654321 in run 123456789 for owner/repo
```

The agent will focus on the specific job you're interested in.

## Report Structure

The agent generates reports with the following sections:

1. **Run Overview**
   - Workflow name, run ID, trigger event
   - Branch, commit SHA, timestamps
   - Overall status

2. **Failed Jobs Summary**
   - List of all failed jobs
   - Failed steps within each job

3. **Detailed Failure Analysis**
   - Error summaries
   - Root cause identification
   - Relevant log excerpts
   - Impact assessment

4. **Remediation Steps**
   - Immediate actions to take
   - Required code changes (with examples)
   - Verification steps

5. **Additional Recommendations**
   - Best practices
   - Prevention strategies
   - Related resources

## Common Failure Patterns Detected

The agent is trained to identify and diagnose:

- **Build/Compile Errors**: Missing dependencies, syntax errors, compilation failures
- **Test Failures**: Failed assertions, test timeouts, flaky tests
- **Environment Issues**: Missing variables, configuration problems
- **Dependency Problems**: Version conflicts, package resolution failures
- **Permission Errors**: Insufficient access, token expiration
- **Timeout Issues**: Long-running jobs, resource exhaustion
- **Integration Failures**: External API failures, service connectivity

## Troubleshooting

### Agent not being invoked?
- Ensure you mention "GitHub Actions", "workflow failure", or provide a valid run URL
- Try explicitly mentioning the agent: "Use gh-actions-triage to analyze..."

### Authentication errors?
```bash
gh auth status
gh auth login
```

### Can't access repository?
- Verify you have read access to the repository
- Check that the repository path is correct (owner/repo)

### Rate limiting?
- Wait a few minutes
- Use a GitHub token with higher rate limits
- Check rate limit status: `gh api rate_limit`

## Customization

To customize the agent behavior, edit `.claude/agents/gh-actions-triage.md`:

- **Modify the description** to change when the agent is invoked
- **Adjust the tools list** to add or remove capabilities
- **Edit the prompt** to change analysis focus or report format
- **Change the model** to use a different Claude model

Example modifications:

```yaml
---
name: gh-actions-triage
description: Your custom description here
tools: Bash, Read, Grep, Glob, Write, WebFetch  # Added WebFetch
model: opus  # Use Claude Opus instead
---
```

## Tips for Best Results

1. **Provide complete URLs** when possible
2. **Specify the repository** if analyzing a run ID
3. **Mention specific jobs** if you want focused analysis
4. **Ask follow-up questions** to dive deeper into specific failures
5. **Request code examples** if you need implementation help

## Integration with Development Workflow

This agent works great with:

- **Pull Request Reviews**: Analyze failed PR checks
- **Release Processes**: Debug failed deployment workflows
- **CI/CD Pipelines**: Troubleshoot test and build failures
- **Monitoring**: Investigate recurring failures

## Additional Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [GitHub CLI Documentation](https://cli.github.com/manual/)
- [Claude Code Sub-agents Documentation](https://docs.claude.com/en/docs/claude-code/sub-agents)
- [Debugging GitHub Actions](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows)

## Contributing

To improve this agent:

1. Edit `.claude/agents/gh-actions-triage.md`
2. Test with various failure scenarios
3. Refine the analysis patterns
4. Add handling for new error types
5. Update this README with your improvements

## Support

If you encounter issues:
- Check the prerequisites are met
- Verify gh CLI is working: `gh run list --repo owner/repo`
- Ensure the agent file is in `.claude/agents/`
- Review Claude Code logs for errors
- File an issue with example URLs that fail
