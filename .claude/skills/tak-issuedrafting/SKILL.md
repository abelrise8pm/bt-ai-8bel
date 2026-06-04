---
name: tak-issuedrafting
description: Collaboratively draft well-formed agile artifacts — user stories (INVEST + Gherkin), developer chores, research spikes, bugs, and TAK UI Assessment Spikes. Abel describes the need, Claude asks clarifying questions, proposes the title first, then drafts the full artifact after approval.
argument-hint: "[optional: paste your draft story, chore, spike, or bug description here]"
---

# TAK Issue Drafting

A collaborative skill for drafting four agile artifact types: user stories, developer chores, research spikes, and bugs. Abel brings the raw description or draft; this skill shapes it into a well-formed backlog item following agile best practices.

---

## Output Formatting Rules (apply to every artifact and every reply)

- **Never use the em dash character (—). Not in artifacts, not in replies, not anywhere.** Abel does not write that way. Use a period, a comma, parentheses, or "e.g." / "i.e." instead. Rewrite the sentence if needed so no em dash appears.

- **Do not introduce technical terms, jargon, or names the engineers have not already used.** Every artifact must be defensible in front of the engineers. Abel is a PM and cannot walk into an engineer sync carrying vocabulary that Claude coined or imported for the first time (real examples to avoid: "generic sync api," "seam," "program," "sync schemas," an "(a) vs (b) which layer" framing). Lead with plain, PM-level descriptions of the WHAT and the WHY. The HOW, and the precise technical terms, are for the engineers to define with Abel.
  - Use only the engineers' own words (quoted and attributed) or plain layman language. Keep an engineer's term as theirs (e.g. Thomas's "command contract"); never restyle it into your own.
  - It is fine to suggest a term or a structure, but label it clearly as a suggestion to confirm. Never bake an unvalidated term into the artifact body as if it were settled.
  - Artifacts carry WHAT and WHY firmly and leave the HOW as open questions for the engineers. Do not fill technical gaps to make an artifact look complete.

---

## Collaboration Workflow

Follow this sequence every time, for every artifact type:

1. **Abel shares context** — a rough description, partial draft, or just an idea. Accept it as-is and work with it.
2. **Ask clarifying questions** — ask the minimum needed to draft a strong artifact. Ask ONE at a time. Do not overwhelm.
3. **Propose the title only** — output the artifact name/title and stop. Wait for Abel to confirm or adjust before proceeding.
4. **Draft the full artifact** — only after Abel approves the title, ask "Ready to draft the full content?" then proceed.

Never skip to the full draft without title confirmation. Never ask more than one question at a time.

---

## Artifact Types

### 1. User Story

**Format:**
```
As a {persona or group},
I want {capability or functionality in the app},
So that {I receive X benefit or value in the real world}.
```

**INVEST Checklist (all must pass):**

| | Principle | What It Means |
|---|---|---|
| **I** | Independent | Deliverable without blocking on other incomplete work |
| **N** | Negotiable | Open to refinement; not a rigid spec |
| **V** | Valuable | Delivers real value to the user or business |
| **E** | Estimable | Clear enough that a developer could estimate it |
| **S** | Small | Completable in one sprint or less |
| **T** | Testable | Has verifiable acceptance criteria |

**Scenarios (Gherkin format):**
- 4 to 5 scenarios maximum; fewer for simple stories
- Each scenario covers a distinct user path or meaningful edge case
- `And` steps are optional; max 3 per scenario

```
Scenario: [Short descriptive name]
  Given [starting condition]
  When [user action]
  Then [expected result]
  And [additional result — only if needed]
```

**Full Story Output Structure:**
```markdown
**Type:** User Story

**Story:**
As a [persona or group],
I want [capability/functionality],
So that [real-world benefit or value].

**Scenarios:**

Scenario 1: [Name]
  Given [condition]
  When [action]
  Then [result]

Scenario 2: [Name]
  Given [condition]
  When [action]
  Then [result]
  And [additional result]

[Continue up to 5 scenarios]

**Out of Scope:**
- [What is explicitly NOT included]

**Notes:**
- [Dependencies, open questions, or context]
```
---

### 2. Developer Chore

Chores are work that has no direct user value but is necessary — pipeline fixes, tech debt cleanup, dependency upgrades, configuration changes, test scaffolding, etc.

**Output Structure:**
```markdown
**Type:** Chore

**Title:** [Action verb + specific technical task — e.g., "Upgrade Node to v20 LTS across all services"]

**Why:**
[One to two sentences on why this is needed and what breaks or degrades without it]

**Acceptance Criteria:**
- [ ] [Specific, verifiable condition a dev or PM can confirm — e.g., "CI pipeline passes with Node 20"]
- [ ] [Second condition if needed]
- [ ] [Third condition if needed]

**Notes:**
- [Risks, dependencies, or relevant context]
```

---

### 3. Research Spike

Spikes are time-boxed research tasks. They exist to reduce uncertainty — they are not implementation work.

**Output Structure:**
```markdown
**Type:** Spike

**Title:** [Investigate / Evaluate / Assess + specific question — e.g., "Investigate TAK UI native support for floating toolbar interactions"]

**Time Box:** [e.g., 2 days, half a sprint, 4 hours]

**Context:**
[One to two sentences on what triggered this spike — what decision or implementation is blocked until we have the answer]

**What We Are Doing:**
[Specific research activities — what will be examined, read, tested, or interviewed]

**Why:**
[The decision or risk this spike will inform. What is at stake if we get this wrong?]

**Expected Deliverable:**
[What the team will have at the end — a documented finding, a recommendation, a proof-of-concept, a go/no-go decision, etc.]

**Done When:**
- [ ] [Specific, verifiable output that signals the spike is complete]
- [ ] [Second condition if needed]
```

---

### 4. Bug

Bugs are defects — the system does something it should not, or fails to do something it should.

**Output Structure:**
```markdown
**Type:** Bug

**Title:** [What is broken + where — e.g., "Export button fails silently when no rows are selected"]

**Steps to Reproduce:**
1. [Starting state]
2. [Action]
3. [Additional action if needed]
4. [The action that triggers the defect]

**Current Behavior (Undesired):**
[What actually happens — specific and observable]

**Expected Behavior (Intended):**
[What should happen — specific and tied to documented or implied behavior]

**Impact:**
[Who is affected, how frequently, and what workflow is blocked or degraded]

**Environment / Context:**
[Device, OS, browser, version, feature flag state, or user role — whatever scopes the defect]

**Claude Code Notes:**
- [Assumptions, inferences, or observations Claude Code is making — labeled so developers know these are not confirmed facts from the reporter]
```

---

### 5. TAK UI Assessment Spike

TAK UI Assessment Spikes are time-boxed research tasks tied directly to the TAK UI Migration Assessment (SOW 4.3.2). They exist to classify a specific component or interaction against the TAK UI framework and produce a finding that slots into the assessment document. They are not implementation work and do not authorize code contributions.

Every spike closes in two stages: Stage 1 when the finding is documented and ready for BAH discussion, Stage 2 after Nathan confirms or revises the classification and the assessment document is updated.

**Naming convention:** `TAK UI Assessment Spike: [Component or Interaction Name]`

Examples: `TAK UI Assessment Spike: Floating Toolbar / ActionBarView`, `TAK UI Assessment Spike: Radial Menu`

**Output Structure:**
```markdown
**Type:** TAK UI Assessment Spike

**Title:** TAK UI Assessment Spike: [Component or Interaction Name]

**Time Box:** [Confirm with engineer before assigning — e.g., 1 day, 2 days]

---

### General Info

**Associated Stories:**
- [Story name and scenario/step number where this component appears as Unknown or needs validation]
- [Add rows if the component appears across multiple stories]

**Context:**
[What the component is and what it currently does in the plugin — one sentence. What is known vs. unknown, what Nathan or BAH pointed to as the path to validate, and what the go/no-go finding means for Sec. 03 and Sec. 04 of the assessment. Keep to 3-4 sentences total — no separate Why or What We Are Researching sections.]

---

### Requirements

**Done When**

**Round 1 — Internal** *(Research concluded — ready to close loops with BAH and SOCOM)*
- [ ] Brought to internal team discussion before Monday BAH session
- [ ] Added to BAH agenda for Nathan
- [ ] Sec. 03 (Migration Scope and Estimates) — Add this component as a new row in the table: fill in Component, Story Ref, Sprint Est, Confidence Level, Details, and flag Open Items (Y/N).
- [ ] If Open Items = Y, note the specific risk or open item in this ticket as a note for the Round 2 pairing session.

**Round 2 — Closed** *(After BAH confirmation — PM and Engineer)*
- [ ] Sec. 03 (Migration Scope and Estimates) — PM and Engineer review the table together; confirm or update Sprint Est, Confidence Level, and Details based on BAH confirmation. Update Open Items flag if resolved.
- [ ] Sec. 04 (Technical Risk and Open Items) — PM and Engineer pair to complete the Technical Risk and Program and Dependency Risk sections. Sec. 04 is not closed until this pairing is complete.
```

---

## TAK-Specific Acceptance Criteria Templates

Use these templates when the chore involves the TAK build, device, or pipeline — not UI or workflow behavior. These apply to chores only. Bugs do not have Acceptance Criteria — the Expected Behavior (Intended) field is the verification standard for bugs.

---

### Template A: Device and APK Validation (PM-run)

Use when the chore requires validating the correct APK is installed and running on a physical device. Abel runs these steps directly.

```markdown
**Acceptance Criteria — Device and APK Validation:**
- [ ] AppGate is running and TAK Forge is accessible
- [ ] Latest build pulled from Artifactory (direct APK download) or via Android Studio Gradle sync while connected to AppGate
- [ ] APK variant confirmed: .civ for functional testing, .mil for production validation
- [ ] Existing version of the plugin uninstalled from the physical device before installing the new APK
- [ ] Device is running the correct ATAK version matching the build target (e.g., 5.6.0.16)
- [ ] For ATAK-MIL: CIV core APK installed first, then MIL flavor plugin installed in sequence
- [ ] New APK installed on physical Android device without INSTALL_FAILED_UPDATE_INCOMPATIBLE error
- [ ] ATAK loads the plugin without a signing or incompatibility error
- [ ] Basic plugin workflow confirmed functional on device
```

---

### Template B: Pipeline and Build Validation (Dev-run, PM verifies completion)

Use when the chore involves pipeline configuration, build jobs, or producing a clean artifact. The dev executes the work; Abel checks the signals to confirm done.

```markdown
**Acceptance Criteria — Pipeline and Build Validation:**
- [ ] All six assemble jobs pass in the TAK Forge pipeline: assembleCivOdk, assembleCivSdk, assembleMilOdk, assembleMilSdk, assembleProduction, buildUserManual
- [ ] Fortify scan thresholds met: zero critical, zero high, fewer than 10 moderate, fewer than 20 low
- [ ] APK artifact is available in Artifactory after pipeline completes
- [ ] Correct branch used: master for development builds, protected branch (e.g., maintenance-5.6) for .mil production builds requiring a trusted signing cert
- [ ] No manually-set CI/CD variables overriding auto-injected pipeline credentials (takrepo.user, takrepo.password, CI_JOB_ARTIFACTORY_TOKEN, GITLAB_USER_EMAIL)
- [ ] Engineer confirms the change is merged to master with two approvals
```

---

### Template C: Back-end and Infrastructure Bug Validation (Dev-diagnosed, PM tracks and verifies restoration)

Use when the bug lives in build tooling, pipeline configuration, or the local environment — not in the app's UI or behavior. The PM cannot reproduce this type of bug directly. Validation requires two layers: the pipeline signal and the behavioral signal.

```markdown
**Acceptance Criteria — Back-end and Infrastructure Bug:**

Pipeline / Build Signal:
- [ ] The specific job or step that was failing now passes in the TAK Forge pipeline
- [ ] APK artifact is available in Artifactory (confirms the build completed end to end)
- [ ] Engineer explicitly confirms root cause is resolved — not just the symptom

Behavioral Signal (downstream effects cleared):
- [ ] Any feature or capability that regressed as a result of the root cause is confirmed restored on device
- [ ] No related cascade issues remain open on the board
- [ ] PM installs and validates the new build using Template A criteria above
```

**Claude Code Note:** Infrastructure bugs often cascade. Closing the ticket when the pipeline passes but the downstream behavior is still broken is premature. Both signals must be confirmed before the ticket is closed.

---

## Clarifying Question Guide

Ask only what is genuinely missing. Use this table to decide:

| Artifact | Ask if missing |
|---|---|
| User Story | Who the persona is; what the real-world benefit is (the "so that"); whether a key scenario is missing |
| Chore | Why this work is needed now; how done will be confirmed |
| Spike | The time box; what decision or risk this informs; what the deliverable looks like |
| Bug | Steps to reproduce; what the expected behavior should be |
| TAK UI Assessment Spike | Which story and scenario the component appears in; whether any prior findings exist from Josh's prototype or BAH sessions |

If you are making an assumption to move forward, call it out explicitly: "I'm assuming the persona is the GRG Creator — is that right?"

---

## Fail Signals

Check for these before drafting. Surface them rather than working around them.

| Signal | Artifact | What to Do |
|---|---|---|
| Circular "so that" — e.g., "so that I can export data" | Story | Ask what real-world benefit the user gains |
| Generic persona — e.g., "user" or "admin" | Story | Ask who specifically benefits |
| More than 5 scenarios | Story | Suggest splitting into two stories |
| No acceptance criteria | Chore | Ask how done will be confirmed |
| No time box | Spike | Ask how long this research should take |
| No expected deliverable | Spike | Ask what the team will have at the end |
| No steps to reproduce | Bug | Ask for a reproducible sequence |
| Vague current behavior | Bug | Ask what specifically happens — error, silence, wrong output |
| No associated story or scenario | TAK UI Assessment Spike | Ask which workflow story and step this component appears in |
| Assessment doc not updated at Stage 1 close | TAK UI Assessment Spike | Do not close Stage 1 until Sec. 03 is updated in the assessment doc |
| Contribution work included in the finding | TAK UI Assessment Spike | Flag it and log as a separate artifact — contribution work does not belong inside the spike |

---

## Scope

**Do:**
- Accept Abel's rough draft and improve it
- Ask one clarifying question at a time
- Propose the title first and wait for approval
- Draft the full artifact only after the title is confirmed
- Flag when a story should be split into two

**Don't:**
- Skip the title confirmation step
- Ask multiple questions at once
- Assume a missing outcome without surfacing it
- Add implementation detail to stories — that belongs in tasks or subtasks
- Draft a bug without steps to reproduce
- Include Acceptance Criteria in bug tickets — verification is done by reproducing the steps and confirming the Expected Behavior (Intended); no AC block belongs in a bug
- Include steps, paths, or activities that were not explicitly stated in the source material — do not fill gaps to make an artifact look more complete
- Tell engineers how to do the work — "What We Are Doing" names the research question, not the implementation approach
- Fabricate referenced sources — every component name, API, or class cited in an artifact must trace back to session notes, migration workflows, or other confirmed source material
- Introduce tech terms or jargon the engineers have not used, or restyle their words into your own. Lead with plain WHAT and WHY, and leave the HOW and the precise terms for the engineers to define with the PM.
