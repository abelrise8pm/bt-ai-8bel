# User Story: Container Image Git Commit Provenance

**As a** container image consumer using Docker or Podman  
**I want** to view the Git commit SHA embedded as metadata in container images  
**So that** I can trace any running container back to its exact source code and verify the software supply chain integrity

## Acceptance Criteria

**Given** a container image has been built through our CI/CD pipeline  
**When** I run `docker inspect <image>` or `podman inspect <image>`  
**Then** I should see the `org.opencontainers.image.revision` label containing the Git commit SHA

**Given** I have the Git commit SHA from a container image  
**When** I look up that SHA in the source repository  
**Then** I should be able to find the exact commit that produced that container

**Given** our CI/CD pipeline builds any container image  
**When** the build process completes  
**Then** the `org.opencontainers.image.revision` metadata label must be embedded in the image before publication

**Given** a multi-platform container image  
**When** I inspect platform-specific images  
**Then** each platform-specific image should contain the same Git commit SHA metadata

**Given** the container manifest is digitally signed  
**When** signature verification is performed  
**Then** any tampering with the image or metadata should cause verification to fail

## Definition of Done
- [ ] CI/CD pipeline (.github/workflows/build-ai-assistant-container.yml) automatically embeds Git commit SHA
- [ ] Metadata follows OCI standard (`org.opencontainers.image.revision`)
- [ ] Multi-platform images correctly include metadata in all platform-specific variants
- [ ] Container images cannot be published without this metadata
- [ ] Manual verification can be performed using standard Docker/Podman inspect commands