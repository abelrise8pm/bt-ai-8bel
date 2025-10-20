# Update Software Versions in Dockerfile

## Parameters
DOCKERFILE_TO_UPDATE: $ARGUMENTS

## Purpose
Updates all software versions in the `DOCKERFILE_TO_UPDATE` to their latest available versions by systematically identifying, checking, and updating all version variables, SHA digests, and inline versions.

## Instructions

You are tasked with updating all software versions in the `DOCKERFILE_TO_UPDATE` to their latest releases using a systematic, comprehensive approach to prevent missed updates.

If you do not get a `DOCKERFILE_TO_UPDATE`, ask the user.

**CRITICAL: Skip updating "ghcr.io/rise8-us/xpai/ai-assistant-home" container image. It will be done by another process.**

### Phase 1: Comprehensive Component Discovery

1. **Read and analyze the entire Dockerfile** at `DOCKERFILE_TO_UPDATE`:
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

### Phase 2: Update URL Discovery and Validation

4. **Extract update URLs from comments** and match them to components:
   - Parse all comment lines for URLs
   - Map each URL to its corresponding component
   - Verify that every identified component has an associated update method

5. **Validate completeness** - ensure no component is orphaned:
   - Every ARG variable has a comment explaining how to update it
   - Every SHA digest has instructions for obtaining the latest digest
   - Every inline version has a traceable source
   - **FAIL FAST**: If any component lacks update instructions, report it immediately

### Phase 3: Version Fetching and Comparison

6. **Fetch latest versions** using ONLY the URLs specified in comments:
   - Use curl/wget to fetch source pages
   - Parse version information using the exact methods specified in comments
   - For SHA digests, use the exact commands specified (e.g., `crane digest image:latest`)
   - Record both current and latest versions for comparison

7. **Identify actual updates needed**:
   - Compare current vs latest versions
   - Create a change plan listing only components that need updating
   - Document components that are already current

### Phase 4: Systematic Updates with Verification

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

### Phase 5: Comprehensive Reporting

10. **Provide detailed summary**:
    ```
    COMPONENT INVENTORY:
    - Component1: Pattern A, Line 5, Current: 1.0.0
    - Component2: Pattern C, Line 12, Current: sha256:abc123...

    VERSION UPDATES APPLIED:
    - Component1: 1.0.0 → 1.1.0 (Updated ARG at line 5)
    - Component2: sha256:abc123... → sha256:def456... (Updated COPY --from at line 12)

    ALREADY CURRENT:
    - Component3: 2.0.0 (no update needed)

    VALIDATION:
    ✓ All 3 components identified and processed
    ✓ All updates verified by re-reading modified lines
    ✓ No orphaned components found
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

## Expected Behavior

- **Systematic approach**: Follow all phases in order, don't skip steps
- **Complete coverage**: Every version-related element must be identified and processed
- **Explicit validation**: Verify every step before proceeding to the next
- **Detailed reporting**: Account for every component found, whether updated or not
- **Fail-safe operation**: Stop if any validation step fails rather than risk missed updates
- **Preserve structure**: Maintain exact Dockerfile formatting and comments

## Notes

- The Dockerfile comments contain authoritative update methods - never guess or assume
- Different components use different versioning schemes - follow the specific instructions for each
- SHA digests require specific tools (crane, docker) as specified in comments
- Some versions may already be current - this is normal and should be reported
- Always preserve the comment structure that documents update methods
- Comments starting with "Use `crane digest`" indicate container image SHA updates
- Comments starting with "curl https://" indicate where to check for new versions