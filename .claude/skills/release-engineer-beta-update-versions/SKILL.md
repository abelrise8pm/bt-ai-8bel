---
name: release-engineer-beta-update-versions
description: Update all software versions in a Dockerfile to their latest releases. Handles ARG variables, SHA digests, and inline versions. Re-triages .trivyignore files. Use when updating dependencies, checking for new versions, or preparing for releases.
---

# Update Software Versions

Update all software versions in a Dockerfile to their latest available versions by systematically identifying, checking, and updating all version variables, SHA digests, and inline versions.

## Input

**Required**: Path to the Dockerfile to update (e.g., `image/Dockerfile`, `.devcontainer/Dockerfile`)

**CRITICAL**: Skip updating "ghcr.io/rise8-us/xpai/ai-assistant-home" container image. It will be done by another process.

## Phase 1: Comprehensive Component Discovery

1. **Read and analyze the entire Dockerfile**:
   - Scan every line for version-related patterns
   - Create a complete inventory using the patterns below

2. **Systematically identify ALL updatable components** using these patterns:

   **Pattern A: ARG Version Variables**
   ```dockerfile
   ARG COMPONENT_VERSION=1.2.3
   ```

   **Pattern B: SHA Digests in FROM statements**
   ```dockerfile
   FROM image@sha256:digest
   ```

   **Pattern C: SHA Digests in COPY --from statements**
   ```dockerfile
   COPY --from=image@sha256:digest /path /dest
   ```

   **Pattern D: Inline versions in download URLs**
   ```dockerfile
   RUN wget https://example.com/v1.2.3/file.tar.gz
   ```

   **Pattern E: Package manager versions**
   ```dockerfile
   RUN apt-get install package=1.2.3*
   RUN npm install package@1.2.3
   ```

3. **Create a comprehensive inventory** listing:
   - Component name
   - Current version/SHA
   - Pattern type (A, B, C, D, or E)
   - Line number where found
   - Associated comment with update URL (if any)

## Phase 2: Update URL Discovery and Validation

4. **Extract update URLs from comments** and match them to components:
   - Parse all comment lines for URLs
   - Map each URL to its corresponding component
   - Verify that every identified component has an associated update method

5. **Validate completeness** - ensure no component is orphaned:
   - Every ARG variable has a comment explaining how to update it
   - Every SHA digest has instructions for obtaining the latest digest
   - Every inline version has a traceable source
   - **FAIL FAST**: If any component lacks update instructions, report it immediately

## Phase 3: Version Fetching and Comparison

6. **Fetch latest versions** using ONLY the URLs specified in comments:
   - Use curl/wget to fetch source pages
   - Parse version information using the exact methods specified in comments
   - For SHA digests, use the exact commands specified (e.g., `crane digest image:latest`)
   - Record both current and latest versions for comparison

7. **Identify actual updates needed**:
   - Compare current vs latest versions
   - Create a change plan listing only components that need updating
   - Document components that are already current

## Phase 4: Systematic Updates with Verification

8. **Apply updates systematically**:
   - Process each component individually
   - Update ARG lines with new version numbers
   - Update SHA digests in FROM and COPY --from lines
   - Update inline versions in RUN commands
   - Preserve all formatting, spacing, and structure exactly

9. **Cross-verify updates**:
   - After each update, re-read the modified line to confirm the change
   - Ensure the new value matches the fetched latest version exactly
   - Verify no unintended changes to surrounding content

## Phase 5: Security Ignore File Re-triage

10. **Locate relevant .trivyignore file(s)**:
    - Check for .trivyignore in same directory as the Dockerfile
    - Check for project-wide .trivyignore in repository root
    - If no .trivyignore files exist, skip to Phase 6

11. **Extract image-specific ignore entries**:
    - Identify which .trivyignore entries apply to the updated image
    - Parse any image-specific ignore patterns or comments
    - Create list of CVEs currently being ignored for this image

12. **Invoke cve-triage agent for systematic CVE analysis**:
    - Provide the agent with:
      - List of all CVEs from .trivyignore for this image
      - Component version updates applied in Phase 4 (old version → new version)
      - Request assessment of which CVEs are resolved by the updates
    - Agent will research each CVE from authoritative sources (NVD, vendor advisories)
    - Agent will determine fixed-in versions and compare with updated versions
    - Agent will provide recommendations on which CVEs can be safely removed
    - Agent will produce documentation explaining resolution status for each CVE

13. **Apply agent recommendations to update .trivyignore file(s)**:
    - Remove CVE entries that the agent confirmed are resolved by version updates
    - Add comment documenting removal: `# Removed YYYY-MM-DD: Resolved by [component] update to v[version] (per CVE analysis)`
    - Preserve entries for CVEs the agent identified as still applicable
    - Maintain file structure and formatting
    - Document agent findings in commit message

14. **Verify ignore changes**:
    - Run Trivy scan on updated Dockerfile to validate changes
    - Confirm removed CVEs no longer appear in scan results
    - Cross-reference Trivy results with agent recommendations
    - Document verification results

## Phase 6: Comprehensive Reporting

15. **Provide detailed summary**:
    ```
    COMPONENT INVENTORY:
    - Component1: Pattern A, Line 5, Current: 1.0.0
    - Component2: Pattern C, Line 12, Current: sha256:abc123...

    VERSION UPDATES APPLIED:
    - Component1: 1.0.0 → 1.1.0 (Updated ARG at line 5)
    - Component2: sha256:abc123... → sha256:def456... (Updated COPY --from at line 12)

    ALREADY CURRENT:
    - Component3: 2.0.0 (no update needed)

    SECURITY IGNORE FILE UPDATES (via cve-triage agent):
    - CVE-2023-12345: Removed (resolved by Component1 update to 1.1.0)
    - CVE-2023-67890: Removed (resolved by Component2 update)
    - CVE-2023-11111: Kept (still applicable per agent analysis)

    VALIDATION:
    ✓ All 3 components identified and processed
    ✓ All updates verified by re-reading modified lines
    ✓ No orphaned components found
    ✓ cve-triage agent analyzed 3 CVEs from .trivyignore
    ✓ .trivyignore re-triaged: 2 CVEs removed, 1 preserved
    ✓ Trivy scan confirms removed CVEs no longer present
    ```

## Validation Requirements

**Pre-update validation:**
- [ ] Every ARG variable has associated update instructions
- [ ] Every SHA digest has crane/docker command for latest digest
- [ ] No components found without update methods
- [ ] All update URLs are accessible

**Post-update validation:**
- [ ] Modified lines contain exact new versions from fetch results
- [ ] Original formatting and structure preserved
- [ ] No unintended changes to other content
- [ ] Summary accounts for all identified components
- [ ] .trivyignore file reviewed and updated (if exists)
- [ ] cve-triage agent invoked for CVE analysis (if .trivyignore exists)
- [ ] Agent recommendations applied to .trivyignore updates
- [ ] Removed CVEs verified as resolved by Trivy scan
- [ ] .trivyignore changes included in git commit/PR

## Error Handling

**If any validation fails:**
1. Stop the update process immediately
2. Report the specific validation failure
3. List all components that were successfully identified
4. Provide guidance on how to resolve the missing information

**If version fetching fails:**
1. Report which URLs/commands failed
2. Continue with successful fetches
3. Mark failed components as "unable to check"
4. Provide the curl/wget commands that failed for manual debugging

## Notes

- The Dockerfile comments contain authoritative update methods - never guess or assume
- Different components use different versioning schemes - follow the specific instructions for each
- SHA digests require specific tools (crane, docker) as specified in comments
- Some versions may already be current - this is normal and should be reported
- Always preserve the comment structure that documents update methods
- Comments starting with "Use `crane digest`" indicate container image SHA updates
- Comments starting with "curl https://" indicate where to check for new versions
- .trivyignore files track security vulnerabilities that are intentionally ignored
- Re-triaging .trivyignore ensures only necessary CVEs remain ignored after updates
- The cve-triage agent provides authoritative CVE research from NVD and vendor sources
- Agent analysis ensures accurate determination of which CVEs are resolved by version updates
- Include .trivyignore changes in the same PR as Dockerfile updates for traceability
- Document why CVEs were removed from .trivyignore (which version update resolved them)
- Agent recommendations should be cross-verified with Trivy scan results
