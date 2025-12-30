## Moving XPai AI Assistant Container to GitHub

This document explains how to move the `xpai-ai-assistant-container` project to GitHub, what pipelines exist, target deployment(s), and upstream/downstream dependencies in Rise8's GitHub deployment.

---

### Project Summary

- Repository: `xpai-ai-assistant-container` (monorepo)
- Key directories:
  - `image/` — Base AI assistant container (Claude Code, Gemini CLI, Goose)
  - `firewall-manager/` — Firewall sidecar (network isolation for CUI)
  - `project-container/` — Project-specific container extensions
  - `starter/` — Starter template published to a read-only external repo

This repository is designed for multi-architecture container builds and CMMC Level 2 compliance. Containers are published to GitHub Container Registry (GHCR).

---

### Pipelines (Workflows)

The repository contains multiple GitHub Actions workflows. These are the main pipelines you should know about.

1. Build and Publish AI Assistant Base Container
   - File: `.github/workflows/build-ai-assistant-container.yml`
   - Triggers: push/PR to `image/` files and `workflow_dispatch`
   - Steps: build multi-arch staging image, run `image/scripts/test.sh`, run Trivy scan, publish to GHCR
   - Image: `ghcr.io/rise8-us/xpai/ai-assistant-home`

2. Build Firewall Manager Container
   - File: `.github/workflows/build-firewall-manager.yml`
   - Triggers: push/PR to `firewall-manager/`
   - Steps: multi-arch build, integration tests (network isolation), publish to GHCR
   - Image: `ghcr.io/rise8-us/xpai/firewall-manager`

3. Build Project Container
   - File: `.github/workflows/build-project-container.yml`
   - Triggers: push/PR to `project-container/`
   - Steps: multi-arch build and tests, publish to GHCR
   - Image: `ghcr.io/<owner>/<repo>/project-container` (repo-specific)

4. Nightly Security Scans (reusable template + per-image jobs)
   - Files: `.github/workflows/reusable-nightly-scan.yml`, `nightly-*-scan.yml`
   - Purpose: nightly Trivy scans, create issues on failures

5. Automated Version / Dependency Update Workflows
   - Files: `.github/workflows/ai-assistant-container-software-version-update.yml`, `update-project-container-base-on-new-version.yml`
   - Purpose: detect new upstream tool versions (Claude Code, Gemini, Goose) or base image updates and create PRs

6. Starter repository workflows (external-readonly repo)
   - Files under `starter/.github/workflows/` (some triggers disabled by default)
   - Purpose: build or update starter artifacts; typically disabled to avoid running in forks

Notes:
- Most build workflows run on `ubuntu-latest` runners and use `docker/setup-buildx` and `docker/build-push-action` for multi-arch builds.
- Workflows rely on secrets for API keys and sometimes an app token for automated PRs.

---

### Target Deployment

- Primary registry: GitHub Container Registry (GHCR) at `ghcr.io`.
- Images published by pipelines:
  - `ghcr.io/rise8-us/xpai/ai-assistant-home` (base container)
  - `ghcr.io/rise8-us/xpai/firewall-manager`
  - `ghcr.io/<owner>/<repo>/project-container` (project-specific)

- Architecture: multi-arch builds for `linux/arm64` and `linux/amd64`.
- Publishing credentials: workflows use `GITHUB_TOKEN` for registry login and package write permissions.

---

### Upstream Dependencies (what this repo depends on)

- GHCR and GitHub Actions (for storing images and running pipelines)
- External service keys required in workflows/secrets:
  - `ANTHROPIC_API_KEY` — for Claude Code functional tests
  - `GEMINI_API_KEY` — for Gemini CLI functional tests
  - `AI_ASSISTANT_PR_BOT_APP_ID` and `AI_ASSISTANT_PR_BOT_PRIVATE_KEY` — for automated PR bot operations (starter updates)
- Base OS images and pinned digests (e.g. `ubuntu:24.04@sha256:...`)
- Third-party CLI packages and release artifacts (Claude Code, Gemini CLI, Goose)
- DevContainer features (ghcr.io/devcontainers/* and vendor features)

Security controls in place:
- Pinned base image digests
- Trivy scanning in CI
- Nightly scans and automated issue creation on failure

---

### Downstream Dependencies (who uses this repo)

1. Starter repository (external, read-only)
   - The `starter/` directory is synchronized to an external repo via `starter/publish-to-external-repo.sh` using git subtree.
   - Purpose: provide a project starter template that references the base container.

2. Project repositories across Rise8
   - Teams integrate the base container via `./scripts/integrate-ai-assistant-no-cui.sh <target-repo>` which copies `.devcontainer`, optional workflows, and MCP files.

3. CUI-handling projects within Rise8
   - Use the `firewall-manager` sidecar and specific CUI setup guides (`starter/docs/SETUP-CUI.md`) for network-isolated deployments.

Notes on synchronization:
- The publish script validates `starter/CHANGELOG.md` coverage and refuses to publish if changes are undocumented.
- The external starter repo contains disabled workflows by default; enabling them usually requires repo-level secrets and app credentials.

---

### GitHub Migration / Conversion Checklist

When moving this project into (or creating) a GitHub organization repository, follow these steps:

1. Create repositories
   - Main monorepo: `rise8-us/xpai-ai-assistant-container`
   - Starter external repo: `rise8-us/xpai-ai-assistant-container-starter` (read-only target)

2. Push code
   - Push full monorepo to `rise8-us/xpai-ai-assistant-container` preserving history.

3. Configure GitHub secrets for the main repo
   - `ANTHROPIC_API_KEY`, `GEMINI_API_KEY` (if you want functional tests in CI)
   - `GITHUB_TOKEN` (automatically provided by Actions for the repo)
   - Bot app secrets: `AI_ASSISTANT_PR_BOT_APP_ID` and `AI_ASSISTANT_PR_BOT_PRIVATE_KEY` (for automated PRs that may require higher privileges)

4. Enable/adjust workflows
   - Review `.github/workflows/*` files. Some workflows (starter) are intentionally disabled; decide if you want to enable schedules/triggers.
   - Check `permissions:` blocks to ensure least privilege and that `packages: write` is present where required.

5. Configure GHCR visibility and access
   - Decide whether images are public or organization-internal.
   - Grant any necessary read/write permissions to CI users or service accounts.

6. Configure branch protection and release policies
   - Protect `main` branch and require required checks (build, test, scan) before merges.

7. Configure starter repo sync
   - Edit `starter/publish-to-external-repo.sh` if the external repo name differs.
   - Ensure the account running the publish has push access to the external repo (SSH key or GitHub app)

8. Validate CI runs
   - Trigger `workflow_dispatch` runs for build and scan workflows; confirm builds, tests, scans complete, and images are published to GHCR.

9. Document onboarding and integration steps
   - Keep `README.md`, `CLAUDE.md`, and `starter/README.md` up to date with how teams should integrate the base container into their projects.

---

### Quick Commands / Example Verification Steps

Build & test base container locally (host machine):

```bash
cd image
# Build (podman or docker on the host)
podman build -t ghcr.io/rise8-us/xpai/ai-assistant-home:local .

# Run tests (example expects keys in .env or env vars)
CONTAINER_RUNTIME=podman IMAGE_TAG=ghcr.io/rise8-us/xpai/ai-assistant-home:local ./scripts/test.sh
```

Publish starter subtree to external repo (from monorepo root):

```bash
./starter/publish-to-external-repo.sh
```

Trigger a workflow manually from the Actions tab or use `workflow_dispatch` event.

---

### Notes & Recommendations

- Keep secrets scoped to the minimum environments (avoid exposing API keys in forks).
- Consider limiting functional test steps that require external API keys on PR workflows; run those only on `main` or via manual triggers.
- Keep the Trivy rules and `.trivyignore` up to date to avoid noisy failures while still catching critical issues.
- Use branch protection to require the build-test-and-scan job to pass before merges.

---

If you want, I can:
- Commit this file to the repository (already done),
- Create a small PR template or issue templates for repo maintainers to follow after migration, or
- Run a quick checklist to validate workflows (requires permission to run/trigger workflows).

File created: `GH_to_GL_conversion.md`
