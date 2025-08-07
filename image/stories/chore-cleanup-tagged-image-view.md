# CHORE: Container Registry Cleanup for AI Assistant Images

## Story
As a **DevOps engineer**, I want **automated cleanup of tagged container images in the GitHub Container Registry** so that **the registry only contains the 5 most recently promoted production images and the image list is clean and manageable**.

## Background
The GitHub Container Registry for `xpai/ai-assistant-home` currently contains 78 tagged images including staging tags, buildcache tags, and commit SHA tags. This creates clutter and makes it difficult to identify the current production images.

## What
Implement automated cleanup logic that:
- Retains only the top 5 images that have completed the "Promote staging image to production tags" workflow step
- Tags the most recent promoted image as `latest`
- Tags the other 4 retained images with their commit SHA only
- Removes all other tagged images (staging tags, buildcache, older production tags)
- Integrates this cleanup as a step in the existing promotion workflow

## Why
- Reduces registry clutter from 78 tagged images to 5 meaningful production tags
- Makes it easy to identify current and recent production images
- Ensures `latest` tag always points to the most recently promoted image
- Maintains registry hygiene automatically without manual intervention

## Acceptance Criteria
- [ ] Cleanup logic integrated into `.github/workflows/build-ai-assistant-container.yml` after the "Promote staging image to production tags" step
- [ ] Registry contains exactly 5 tagged images after cleanup runs
- [ ] Most recent promoted image is tagged as `latest`
- [ ] Other 4 retained images are tagged with their commit SHA only
- [ ] All staging tags, buildcache tags, and older production tags are removed
- [ ] Cleanup only runs after successful promotion to avoid removing images during failed deployments
- [ ] Solution handles edge cases (fewer than 5 promoted images exist)

## Technical Notes
- Use GitHub CLI or API to interact with Container Registry
- Query images by promotion timestamp/workflow completion rather than publish time
- Implement safeguards to prevent accidental deletion of all images