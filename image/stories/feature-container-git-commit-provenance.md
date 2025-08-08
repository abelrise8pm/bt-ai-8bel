# User Story: Container Image Git Commit Provenance

**As a** container image consumer using Docker or Podman
**I want** to view Git commit SHA and build metadata embedded in container images
**So that** I can trace any running container back to its exact source code and verify the software supply chain integrity

## Acceptance Criteria

**Given** a container image has been built through our CI/CD pipeline
**When** I run `docker inspect <image>` or `podman inspect <image>`
**Then** I should see the following OCI metadata labels:
- `org.opencontainers.image.revision` containing the Git commit SHA
- `org.opencontainers.image.created` containing the build timestamp
- `org.opencontainers.image.source` containing the repository URL
- `org.opencontainers.image.url` containing the project or CI/CD pipeline URL

**Given** I have the Git commit SHA from a container image
**When** I look up that SHA in the source repository
**Then** I should be able to find the exact commit that produced that container

**Given** our CI/CD pipeline builds any container image
**When** the build process completes
**Then** all required OCI metadata labels must be embedded in the image before publication

**Given** a multi-platform container image
**When** I inspect platform-specific images
**Then** each platform-specific image should contain the same OCI metadata labels

**Given** the container manifest is digitally signed
**When** signature verification is performed
**Then** any tampering with the image or metadata should cause verification to fail

## Definition of Done
- [ ] CI/CD pipeline (.github/workflows/build-ai-assistant-container.yml) automatically embeds all required OCI metadata labels
- [ ] Metadata follows OCI standards:
  - [ ] `org.opencontainers.image.revision` - Git commit SHA
  - [ ] `org.opencontainers.image.created` - Build timestamp in RFC 3339 format
  - [ ] `org.opencontainers.image.source` - [Repository URL](https://github.com/rise8-us/XPai/tree/main/ai-assistant-container)
  - [ ] `org.opencontainers.image.url` - Project or CI/CD pipeline URL
- [ ] Multi-platform images correctly include metadata in all platform-specific variants
- [ ] Container images cannot be published without this metadata
- [ ] Manual verification can be performed using standard Docker/Podman inspect commands