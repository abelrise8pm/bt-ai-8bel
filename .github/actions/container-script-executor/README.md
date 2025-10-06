# Container Script Executor

A composite GitHub Action that executes bash scripts inside a container environment with Claude Code CLI available.

## Purpose

This action provides a reusable way to run automation scripts that require Claude Code commands in a consistent containerized environment. It's particularly useful for automated code updates, version bumps, and other repository maintenance tasks.

## Usage

### Basic Example

```yaml
name: My Automation Workflow

permissions:
  contents: write
  packages: read      # Required!
  pull-requests: write

jobs:
  automate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Run automation script
        uses: ./.github/actions/container-script-executor
        with:
          script-content: |
            #!/bin/bash
            set -e
            claude -p "/your-command" --dangerously-skip-permissions
          anthropic-api-key: ${{ secrets.ANTHROPIC_API_KEY }}
          github-token: ${{ secrets.GITHUB_TOKEN }}
```

## Inputs

| Input | Required | Default | Description |
|-------|----------|---------|-------------|
| `script-content` | Yes | - | The bash script content to execute |
| `anthropic-api-key` | Yes | - | Anthropic API key for Claude Code CLI |
| `github-token` | Yes | - | GitHub token for package authentication. **Must use `secrets.GITHUB_TOKEN`** (not GitHub App tokens) |
| `container-image` | No | `ghcr.io/rise8-us/xpai/dev-container:latest` | Container image to use for execution |
| `workspace-path` | No | `/workspaces/XPai` | Workspace mount path inside container |
| `timeout-seconds` | No | `600` | Timeout for script execution in seconds |

## Outputs

| Output | Description |
|--------|-------------|
| `result` | Execution result: `success` or `failure` |
| `log-file` | Path to the output log file (if execution completed) |

## Prerequisites

### Required Workflow Permissions

The calling workflow **must** declare these permissions:

```yaml
permissions:
  contents: write       # If script modifies files
  packages: read        # REQUIRED for pulling container images
  pull-requests: write  # If script creates PRs
```

### Required Token Configuration

**IMPORTANT:** Always pass `secrets.GITHUB_TOKEN` to the `github-token` input:

```yaml
- uses: ./.github/actions/container-script-executor
  with:
    github-token: ${{ secrets.GITHUB_TOKEN }}  # ✅ Correct
```

**DO NOT** pass GitHub App tokens:

```yaml
- uses: ./.github/actions/container-script-executor
  with:
    github-token: ${{ steps.app-token.outputs.token }}  # ❌ Wrong - will fail
```

### Why `secrets.GITHUB_TOKEN` is Required

- `secrets.GITHUB_TOKEN` automatically has access to packages in the same repository
- GitHub App tokens do not inherit repository-level package access
- The composite action uses this token to authenticate to GitHub Container Registry
- With `packages: read` permission in the workflow, GITHUB_TOKEN can pull container images

### Repository Package Access

The repository must have access to the container packages. This is typically configured automatically, but if you encounter access issues:

1. **Navigate to the package settings:**
   - Go to `https://github.com/orgs/rise8-us/packages/container/xpai%2Fdev-container/settings`
   - Or: Repository → Packages → Select the package → Package settings

2. **Verify repository access:**
   - Scroll to "Manage Actions access" section
   - Confirm `rise8-us/XPai` is listed with at least "Read" permission
   - If not listed, click "Add Repository" and add it

3. **Verify access:**
   ```bash
   # This should succeed in GitHub Actions with GITHUB_TOKEN
   docker pull ghcr.io/rise8-us/xpai/dev-container:latest
   ```

**Note:** With `secrets.GITHUB_TOKEN` and proper workflow permissions, no additional configuration is typically needed.

## Architecture

This action is designed to be **self-contained** with no external dependencies:

- Handles its own Docker authentication
- Pulls required container images
- Mounts the workspace and executes the script
- Captures all output for debugging

The calling workflow only needs to provide valid credentials - no additional setup steps required.

## Example Workflows

### Automated Version Update

```yaml
- name: Update software versions
  uses: ./.github/actions/container-script-executor
  with:
    script-content: |
      #!/bin/bash
      set -e
      echo "Updating software versions..."
      claude -p "/update-software-versions .devcontainer/Dockerfile" \
        --dangerously-skip-permissions
    anthropic-api-key: ${{ secrets.ANTHROPIC_API_KEY }}
    github-token: ${{ secrets.GITHUB_TOKEN }}  # Always use GITHUB_TOKEN
```

### Multi-Command Script with GitHub App for Git Operations

```yaml
jobs:
  update:
    permissions:
      contents: write
      packages: read        # Required for container-script-executor
      pull-requests: write

    steps:
      # Generate app token for git operations (checkout, PR creation)
      - name: Generate GitHub App Token
        id: app-token
        uses: actions/create-github-app-token@v1
        with:
          app-id: ${{ secrets.APP_ID }}
          private-key: ${{ secrets.APP_PRIVATE_KEY }}

      - name: Checkout repository
        uses: actions/checkout@v4
        with:
          token: ${{ steps.app-token.outputs.token }}  # App token for git

      - name: Run multiple updates
        uses: ./.github/actions/container-script-executor
        with:
          script-content: |
            #!/bin/bash
            set -e
            # Update base image
            NEW_SHA="${{ steps.get-sha.outputs.sha }}"
            claude -p "/update-base-image-sha $NEW_SHA" \
              --dangerously-skip-permissions

            # Update versions
            claude -p "/update-software-versions .devcontainer/Dockerfile" \
              --dangerously-skip-permissions

            echo "All updates completed"
          anthropic-api-key: ${{ secrets.ANTHROPIC_API_KEY }}
          github-token: ${{ secrets.GITHUB_TOKEN }}  # GITHUB_TOKEN for packages
          timeout-seconds: 900

      - name: Create PR
        env:
          GITHUB_TOKEN: ${{ steps.app-token.outputs.token }}  # App token for PR
        run: |
          git add -A
          git commit -m "Automated updates"
          gh pr create --title "Updates" --body "Automated changes"
```

## Troubleshooting

### "docker: Error response from daemon: denied"

This means the token doesn't have access to pull the container image.

**Solution:**
1. Verify you're using `secrets.GITHUB_TOKEN` (not a GitHub App token)
2. Ensure workflow has `packages: read` permission
3. Verify repository has access to the package (see "Repository Package Access" above)

**Common mistake:**
```yaml
# ❌ Wrong - GitHub App token lacks package access
github-token: ${{ steps.app-token.outputs.token }}

# ✅ Correct - Use GITHUB_TOKEN
github-token: ${{ secrets.GITHUB_TOKEN }}
```

### "timeout: the monitored command dumped core"

The script execution exceeded the timeout limit.

**Solution:** Increase `timeout-seconds` input or optimize your script.

### Script exits with errors but no clear message

Check the action outputs:
```yaml
- name: Check execution logs
  if: failure()
  run: cat ${{ steps.my-step.outputs.log-file }}
```

## Security Considerations

- Never commit API keys or tokens directly to the repository
- Use GitHub Secrets for sensitive credentials
- The `--dangerously-skip-permissions` flag bypasses Claude Code's permission checks - use only in trusted automation contexts
- Review container image contents before using in production workflows
- Use specific image tags instead of `latest` for reproducible builds

## Contributing

When modifying this action:

1. Test changes in a feature branch workflow first
2. Ensure the action remains self-contained (no external setup dependencies)
3. Update this README with any new inputs/outputs
4. Document any new permission requirements
