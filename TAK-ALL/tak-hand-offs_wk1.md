# TAK UI Migration — Session Hand-offs

## Session: May 6, 2026 — Sprint 3 Demo and Product Update

### Summary

**Sprint 3 Demo — Pre-Recorded Walkthrough (Zach)**

Zach's pre-recorded demo walked through the pre-caching imagery status feature. The plugin now fetches high-quality imagery tiles before building detection runs and surfaces a status message to operators across five scenarios: full success, minor failure, significant failure, full failure, and no connection. Detection runs in every scenario. A slide showing all five scenarios and their corresponding messages was presented after the recording.

---

**Sprint Accomplishments — Sprint 3: April 20 to May 4**

- **[4.3.1]** User manual delivered and accessible within the plugin. App-crashing defect on GRG export resolved. Both 5.4 and 5.6 builds stable for Development Testing.
- **[4.3.2]** Radial Menu confirmed as Rise8's first TAK UI contribution with Booz Allen. Component built and submitted to Nathan for review. Migration assessment underway.
- **[4.3.3]** Plugin now surfaces imagery status before building detection runs. Operators get a clear status update so they can assess conditions before proceeding.
- **[4.3.4]** GOTS Evaluation: Maneuver Domain scoped and aligned. Operator input from a working session with SOCOM validated how TAK domains interconnect across real mission phases, informing the shared capabilities framework.

---

**Work in Progress — Sprint 4: May 4 to May 15**

- **[4.3.1]** DT feedback triaged. Priority fixes focused on issues that prevent operators from completing GRGs. Feature requests documented for future development.
- **[4.3.2]** Migration assessment on track for May 15. Running first end-to-end TAK UI contribution cycle with Booz Allen. Kevan finalizing cost and timeline estimates.
- **[4.3.3]** Operator improvements and new capabilities documented and prioritized for future development.
- **[4.3.4]** Kevan leading the GOTS and MOSA evaluation report covering current and target state of the plugin ecosystem. Final report targeted for May 13.

---

**Issue Resolution**

Two issues surfaced:

1. **DT Feedback Scope and Process Alignment** — DT feedback arrived across two documents with overlap, missing expected behavior in several reports. Rise8 triaging and aligning with Chad and Nik's team on priority. Rise8 providing a standard reporting template to improve the feedback loop going forward.

2. **TAK UI Contribution Review Pending** — Rise8 submitted its first TAK UI contribution. Nathan is out this week. Booz Allen responded via Kelly and offered Malachi as an alternate reviewer. Thursday call proposed. Rise8 working to complete the review and contribution cycle before May 15.

---

**Post-Demo: Pre-Caching Feature Concern**

During the demo, Nik raised a concern about the pre-caching feature going online to fetch imagery. Kevan flagged the same concern internally via Slack during the presentation.

The post-demo standup surfaced two things to address:
1. Clarify the behavior — the plugin only goes online when the operator explicitly selects mobile as their map source. DDIL and local imagery scenarios are completely unaffected.
2. Own the process miss — Rise8 built the connected/mobile path without confirming the direction with Nik first.

Abel organized three talking points and got on a call with Nik the same day.

---

**Call with Nik — May 6, Outcome**

Nik acknowledged the team was caught off guard but appreciated Rise8's initiative and drive to improve the operator experience. His direction: the feature must be off by default and only activate through explicit user action, given the AI GRG plugin operates across classified and disconnected networks.

Abel committed to bringing new development opportunities to Nik before work begins going forward. Nik closed satisfied — his primary concern was that nothing was reaching out to external servers or the web by default. That was confirmed as not the case.

**Feature path forward:** Default off. Explicit user action required to enable.

---

### Handoff Prompt

```
Picking up TAK Bridge PM work after the May 6 Sprint 3 Demo.

Key items to pick up:

- Pre-caching feature: Direction confirmed with Nik. Feature must be default off, explicit
  user action to enable. Needs to be logged as a story and assigned. No development proceeds
  without a formal ticket.

- BAH/Nathan contribution: Thursday call proposed with Malachi. Confirm it is on the calendar.
  MR 314 needs review and feedback so Josh can address comments before May 15.

- DT feedback process: Rise8 to provide a standard reporting template to Chad and Nik's team.
  Not yet drafted or sent.

- GOTS and MOSA report: Kevan leading. Outline due Friday May 8. Final report targeted May 13.

- Migration assessment: Content target was May 7/8. Confirm with Kevan and Thomas where things
  stand before end of day.

- Nik process commitment: Abel committed to bringing new development opportunities to Nik before
  development starts. This should be reflected in how sprint scope decisions get made going forward.

Reference files:
- TAK-ALL/tak-demos/tak-demo-sprint3.md — full demo slide content and scripts
- TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-may_4-8.md — this week's notes including post-demo standup
- TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/db-wk6.md — current drumbeat
```

---

## Session: May 6-7, 2026

### Summary

#### /takui-stories — Workflow Story Spikes

**Story 3: Detect and Label Buildings Within Grid Sections**
Phases 1-4 completed. Written to `TAK-ALL/takui-migration-workflows.md`. Two scenarios: AI building detection (Scenario 1) and review/correct building labels (Scenario 2).

**Story 4: Manually Label Building Placement**
Phases 1-4 completed. Written to `TAK-ALL/takui-migration-workflows.md`. One scenario. "So that" clause rewritten from circular to: "field operators have an accurate and complete set of labeled buildings on the final GRG."

**Story 5: Export GRG Artifact for Distribution**
Phase 1 and Phase 2 completed — stopped before Phase 3 and 4 because session pivoted to spikes. Story and component tables drafted in conversation but **not yet written to `takui-migration-workflows.md`.**

---

#### /tak-issuedrafting — TAK UI Assessment Spikes Drafted

| Spike | Story | Scenario |
|---|---|---|
| InferenceAndroidGrgRuntime + ATAK Marker + MapGroup | Story 3 | Scenario 1 |
| SwipeRelabelManager | Story 3 | Scenario 2 |
| Manual Map Touch / MapEventListener | Story 4 | Scenario 1 |
| Configure Export Modal / android.app.AlertDialog | Story 5 | Scenario 1 |
| GRG Export Engine / ImportExportMapComponent | Story 5 | Scenario 2 |

All five spike artifacts drafted in conversation — **not yet entered into the project tracker.**

---

#### Sec. 03 Developer Guidance — Drafted in Conversation

Guidance for engineers filling out the Migration Scope and Estimates table. All fields defined:
- **Component** — specific class name, never a description
- **Story Ref** — all stories where it appears; cross-story coverage is one factor in estimation
- **Sprint Est** — expressed in SOCOM 2-week sprint fractions; one-time vs. per-story implementation work is an engineer judgment call; `TBD — pending BAH` if unconfirmed
- **Confidence Level** — tied to evidence source: High = multiple consistent sources or BAH confirmed; Medium = at least one source but not fully validated; Low = Unknown or incomplete
- **Details** — no length limit; Thomas's format is the reference: current implementation, what TAK UI provides, what's missing, specific gaps bulleted
- **Open Items** — Y if classification or estimate cannot be finalized; if Y, add a row to Sec. 04
- **Sec. 04 format** — Thomas's format: component name, describe the gap, direct questions for Nathan

**This guidance has not been saved anywhere** — lives in conversation only.

---

### Handoff Prompt

```
Continuing TAK UI migration assessment work. Context:

SOURCE FILES:
- TAK-ALL/takui-migration-workflows.md — completed Stories 1-4 fully written;
  Story 5 component tables drafted in prior session but NOT yet written to this file
- .claude/skills/tak-issuedrafting/SKILL.md — TAK UI Assessment Spike template updated
  with Sec. 03/04 column names
- .claude/skills/takui-stories/SKILL.md — workflow story spike skill

PENDING WORK:
1. Story 5 (Export GRG Artifact for Distribution) — Phase 3 and Phase 4 not yet done
   (Story Assessment and Nathan Decision Points). Then write to takui-migration-workflows.md.
   Story statement: "As a GRG Creator, I need to export a GRG artifact for distribution,
   So that the SOF team can execute the mission with accurate labeled buildings."
   Two scenarios: Scenario 1 (open Configure Export settings), Scenario 2 (complete the export).
   Key escape hatch components: ActionBarView, DropDownReceiver, android.app.AlertDialog
   (Configure Export modal), GRGExporter/ImportExportMapComponent, Toast/AlertDialog
   (export complete). TAK UI native confirmed: Tab, Button (both inside DropDownReceiver container).

2. Sec. 03 developer guidance — fully drafted in prior session conversation but NOT saved
   to any file. Needs to be written somewhere accessible to the team. Covers all table
   fields: Component, Story Ref, Sprint Est (SOCOM 2-week sprints), Confidence Level
   (High/Medium/Low tied to evidence, not just BAH), Details (Thomas's format — no length
   limit), Open Items (Y/N with pointer to Sec. 04 Technical Risk and Open Items).
   Sec. 04 format: component name, describe the gap, direct questions for Nathan
   (Thomas's format as reference).

3. Five TAK UI Assessment Spikes drafted in prior session — not yet entered in project tracker:
   - Story 3 Scenario 1: InferenceAndroidGrgRuntime + ATAK Marker + MapGroup
   - Story 3 Scenario 2: SwipeRelabelManager
   - Story 4 Scenario 1: Manual Map Touch / MapEventListener
   - Story 5 Scenario 1: Configure Export Modal / android.app.AlertDialog
   - Story 5 Scenario 2: GRG Export Engine / ImportExportMapComponent

SKILLS IN USE:
- /takui-stories — for Phase 1-4 workflow story spike work
- /tak-issuedrafting — for TAK UI Assessment Spike artifacts (artifact type 5)
```
////////////////
---

## Session: May 7, 2026 — DT Triage Closeout, Bug Reclassification, and DT Meeting Prep

### Summary

#### DT Triage Completed and Daily Notes Updated

Closed out the week's DT issue triage. The DONE section in `tak-daily-may_4-8.md` now reflects all resolved items: #45, #46, #57, #59, #62, #63, #70. The HIGH PRIORITY entry for SDT-70 was updated to "FIXED — resolved by Zach, May 5, delivered to DTs for confirmation."

ALREADY CAPTURED bucket populated with all confirmed duplicates and non-actionable items: SDT-54 (user manual fix, no GitLab number), SDT-58/01/v5.4 (not reproducible), SDT-59/02/v5.4 (not reproducible), SDT-67/10/v5.4 (improvement), SDT-68/11/v5.4 (map layer limitation).

NOT CONCLUSIVE: 04/v5.4 / SDT-60 still needs DT follow-up. The repro attempt led to a separate finding logged as #73.

LOW PRIORITY: 08/v5.4 logged with Jonathan's Medium impact noted inline; Abel called Low because it's v5.4 only with a workaround.

---

#### Bug #72 → User Story #80 Reclassification

#72 (Building detection labels bleed between GRGs) was originally drafted as a bug. Thomas argued in IPM it was a training/design issue, not a bug. Jonathan emailed operator "P" (Pete Wagner) to validate.

**Wagner's response:**
- Multiple GRGs over the same AOI is a real operational need
- Duplicate labels across GRGs are NOT acceptable — causes confusion in command coordination during concurrent operations or when units are geographically collocated

This contradicted Thomas's training-issue framing. Jonathan's interpretation: GRG 2 should start where GRG 1 left off (e.g., GRG 1 ends at C305, GRG 2 starts at D401). He flagged the edge case of letters past Z and numbers past 999.

**#72 was closed and replaced by #80** — a placeholder user story:

> As a SOF Team Leader, I want building labels to increment continuously when creating multiple GRGs within the same mission AOI, so that no two buildings across GRGs share the same label, preventing confusion during mission execution and coordination across units and command levels.

The story's Notes section captures the full evidence trail (DT source, Wagner's email exchange, Jonathan's interpretation, edge cases) and four open unknowns including feasibility (Thomas confirmed the plugin has no current capability for cross-GRG label tracking). **Scenarios and acceptance criteria are not written — pending feasibility spike.**

---

#### Bug #73 Logged — Skip Sections Behavior

During reproduction of 04/v5.4 / SDT-60, Abel and Jonathan found a distinct behavior worth its own ticket:

> Second building detection runs inside a marked section and reports a building count despite "Skip sections with existing markers" being enabled.

Repro is intermittent — three test runs produced different results (1 building leaked, 0 buildings/correct, 15 buildings reported with no visible labels added). The 15-buildings-with-no-labels case matches what Jonathan and Abel originally observed during the v5.6 repro attempt that surfaced the issue.

**#73 needs sprint assignment.** The original DT-reported 04/v5.4 / SDT-60 still sits in NOT CONCLUSIVE pending DT follow-up.

---

#### SKILL.md Update — No Acceptance Criteria on Bug Tickets

`tak-issuedrafting/SKILL.md` updated with explicit Don't rule:

> Include Acceptance Criteria in bug tickets — verification is done by reproducing the steps and confirming the Expected Behavior (Intended); no AC block belongs in a bug

Bugs are verified by reproducing the steps and confirming the Expected Behavior. Templates A/B/C remain for chores only.

---

#### Email to DTs — Drafted

Drafted email to Chad notifying that 4 fixes are available for review at the package registry (https://git.tak.gov/rise8/aigrg/-/packages/455488):
- #62, #63, #70 (recently resolved)

And two items resolved prior to May 1 still needing DT confirmation:
- #54 (user manual), #59 (export crash)

Email closes by noting full triage is complete and a follow-up will happen after the May 6 demo. **Send status not confirmed in this session.**

---

#### DT Meeting Prep — May 8, 11:30 AM ET

Drafted agenda and a message to Jonathan for the DT call. Attendees: Chad (required), Jonathan, Abel, Mary; Nik and Kevan optional. No devs.

**Agenda (sequenced to lead with curiosity):**
1. Their testing process — open-ended question, listen for gaps before referencing examples (~10 min)
2. Close the loop on 3 reports: SDT-70, SDT-71, SDT-58/01/v5.4 — framed around what Rise8 needed, not what they got wrong (~15 min)
3. Our support: bug template + observation/suggestion template + tracker discussion (~15 min)

**Templates proposed for Jonathan's review:**
- Bug: Title, Steps to Reproduce, Current Behavior, Expected Behavior, Impact, Version/Device, Severity (Crash / Data Loss / Workaround Exists / Observation)
- Observation/Suggestion: What I Saw, What I Expected, Who Is Affected, Value to Operator or Program, Type (Observation / Feature Request / Tech Concern)

**Tracker discussion:** Abel surfaced three reasons against introducing a new shared spreadsheet (8 days left on bridge, eventual shared Jira board, parity-of-truth concern). Reframed as: structure matters more than tool. The DTs already submitted their own spreadsheet — the path forward may be modifying theirs to add a Bug tab and an Observation/Suggestion tab with the columns above. **Final call deferred to Jonathan.**

---

### Handoff Prompt

```
Picking up TAK Bridge PM work after May 7 DT triage closeout.

Key items to pick up:

- DT meeting on May 8 at 11:30 AM ET. Agenda is drafted and shared with Jonathan
  for review. Three sections: their testing process (lead with curiosity), close the
  loop on 3 reports (SDT-70, SDT-71, SDT-58/01/v5.4), our support (templates and
  tracker discussion). Templates for bug and observation/suggestion are drafted but
  not finalized — Jonathan to weigh in before the call.

- Email to Chad about the 4 fixes (#62, #63, #70 in the new build; #54 and #59 from
  prior to May 1) is drafted. Confirm send status. Package registry link:
  https://git.tak.gov/rise8/aigrg/-/packages/455488

- #80 (User Story: Building labels increment continuously across GRGs) is logged as
  a placeholder. Scenarios and acceptance criteria are NOT written — pending feasibility
  spike. Thomas confirmed the plugin has no current capability for cross-GRG label tracking.
  Edge case to validate: section letters past Z, building numbers past 999.

- #73 (Skip sections detection behavior) needs sprint assignment. Repro is intermittent.
  Engineers should treat the reported building count and the visible label state as two
  separate signals when diagnosing.

- 04/v5.4 / SDT-60 still sits in NOT CONCLUSIVE in tak-daily-may_4-8.md. DT follow-up
  needed before any ticket is logged for the original DT-reported behavior.

- Pre-caching feature: direction confirmed with Nik on May 6. Default off, explicit
  user action to enable. Story not yet logged. No development proceeds without a formal
  ticket.

- BAH contribution: Malachi alternate reviewer proposed for Thursday. Confirm calendar.
  MR 314 needs review and feedback before May 15.

Reference files:
- TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-may_4-8.md — full week notes,
  triage section updated
- TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/db-wk7.md — current drumbeat
- .claude/skills/tak-issuedrafting/SKILL.md — bug ticket rule updated (no AC)

Skills in use:
- /tak-issuedrafting — for bug, story, and spike artifacts
```

---

## Session: May 7-8, 2026 — BAH Call Run-up, Outcome, and Post-Call Synthesis

### Summary

#### Pre-Call Prep with Abel — PM-Level Engineering Translation

Worked through Abel's mental model of the TAK UI assessment in plain language. Covered:
- **Classification statuses** — TAK UI Native, ATAK Escape Hatch, Pending Validation
- **Platform gaps** — TAK UI's "write once, works everywhere" promise vs. the reality that ATAK is ahead, WinTAK lags, TAK-X is largely unknown
- **WinTAK C# gap** — TAK UI is Kotlin; WinTAK is C#. For radial menu submenus to work on WinTAK, someone has to write the C# equivalent in a separate codebase. Josh would need a Windows machine and BAH has no example to follow. It is effectively a second contribution.
- **Enabled/visible pattern** — Old ATAK radial menus used string flags like `pairingline_on` to control button states. Josh's new TAK UI version requires explicit booleans. Plugins relying on the old strings need refactoring. Josh confirmed in the MR that there is a known path to replace those strings.
- **Josh's "not a worthwhile investment" comment** — Surfaced as a flag worth understanding before the call. Abel confirmed Kevan is aware of Josh's opinions; not a crisis.

---

#### BAH Call Outcomes (Thursday, May 7, 1400 ET)

Three agenda items, all closed or progressed:

1. **MR 314 / Radial Menu** — Nathan called it "really great work" and said he is looking forward to more contributions. Only minor surface-level comments. One open item: Malachi verifying no breaking changes in Combat Swim. Nathan's final look-over remaining before merge. Rise8 is not expected to implement WinTAK submenus; Nathan only asked Josh's MR not break existing WinTAK code.

2. **Grid Labels / Marker API (Thomas)** — TAK UI Marker API exists but the label parameter is a not-implemented stub. Nathan endorsed the contribution path: add a label parameter and allow setting the icon to null. Thomas assessed it as low effort. **Team decided not to contribute it given the week-and-a-half remaining.** Nathan said it could be revisited in next PI.

3. **Composite Map Items (Legend Bar / Custom Rendering)** — Confirmed as WinTAK-specific with no TAK UI equivalent. Nathan's "ideal" answer is a generic OpenGL layer rendering API, but that is TAK UI 2.0 territory and not on the next PI roadmap unless Rise8 leads it.

**Cross-cutting findings:**
- API Stability page: `tak-ui.docs.tak.gov/tak-ui-docs/api-stability` — to be bookmarked and referenced regularly during assessment work
- Pattern Nathan named explicitly: ATAK ahead, WinTAK behind, TAK-X unknown — should be reflected explicitly in the assessment document
- Nathan's goal: use the TAK UI baseline to push TPC to standardize minimum platform capabilities; TAK UI v1 stable target is August

---

#### Slack Post Drafted — First TAK UI Contribution Status

Cleaned-up Slack post written to share the BAH call outcome with the team and stakeholders. Names Nathan's positive review, Malachi's Combat Swim verification, and frames the merge as imminent.

---

#### /tak-outcomes Started — Enabling Outcome Work in Progress

Began articulating the Enabling Outcome for the TAK UI contribution milestone using the `/tak-outcomes` skill. **Did not follow the collaboration workflow properly the first time** — skipped the clarifying-question and title-confirmation steps. Restarted the sequence; one clarifying question asked. **Pending:** confirm whether the framing should stay as "Rise8 team shifted from TAK UI consumer to key contributor" or pivot to something more specific (cycle completion, BAH relationship establishment).

---

### Handoff Prompt

```
Picking up TAK Bridge PM work after the May 7 BAH/Nathan call. MR 314 is in
final review territory — Malachi verifying Combat Swim, then Nathan's last
look-over. Today is Friday, May 8.

Key items to pick up:

- /tak-outcomes Enabling Outcome — work in progress. The skill collaboration
  sequence requires clarifying questions, title proposal, and approval before
  drafting. One clarifying question is open: keep the current framing
  ("Rise8 team shifted from TAK UI consumer to key contributor") or pivot to
  something more specific. Resume from there.

- TAK UI Migration Assessment updates from the BAH call findings need to land
  in the document:
  * Radial Menu — update Sec. 3 row with MED confidence, ATAK = TAK UI Native
    confirmed. WinTAK and TAK-X classifications confirmed by Nathan's
    "ATAK ahead, WinTAK behind, TAK-X unknown" pattern.
  * Marker API / Grid Labels — Sec. 3 row with the contribution path Nathan
    endorsed but team declined due to timeline. Sec. 4 entry capturing the
    decision and the path-forward for future engagement.
  * Composite Map Items / Legend Bar — Sec. 3 row classified as no TAK UI
    equivalent. Sec. 4 entry capturing the OpenGL layer ideal state Nathan
    described and that it is TAK UI 2.0 territory.
  * Add the API Stability page reference (tak-ui.docs.tak.gov/tak-ui-docs/api-stability)
    as a source citation in the assessment.
  * Reflect the ATAK ahead / WinTAK behind / TAK-X unknown pattern explicitly
    somewhere in the document — Nathan named it, Gemini summary flagged it
    as a key finding.

- Connect Nathan's TPC standardization comments with Kevan's MOSA pitch in
  the assessment report. Both threads point at the same need.

- Slack post about the BAH call has been drafted and cleaned up. Confirm send
  status if not yet posted.

- Story 5 (Export GRG Artifact) — Phase 3 and 4 still not written to
  takui-migration-workflows.md. Five TAK UI Assessment Spikes drafted in a
  prior session not yet entered in the project tracker.

- Sec. 3 developer guidance from a prior session is still not saved anywhere.

- DT meeting on May 8 at 11:30 AM ET. Agenda drafted with Jonathan. Templates
  for bug and observation/suggestion drafted, not finalized.

- Pre-caching feature: direction confirmed with Nik on May 6. Story not yet
  logged.

- #80 (cross-GRG label increment) needs feasibility spike. #73 needs sprint
  assignment.

Reference files:
- TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-may_4-8.md — full week notes
  including BAH call raw notes (lines 955-1046) and Gemini transcript reference
- TAK-ALL/takui-1st-mr.md — full MR 314 activity log and Josh's comment responses
- TAK-ALL/takui-migration-assessment.md — assessment document needing the
  three new Sec. 3 rows and Sec. 4 entries
- TAK-ALL/takui-migration-workflows.md — Stories 1-4 written; Story 5 pending
- TAK-ALL/tak-hand-offs_wk1.md — prior session hand-offs

Today's known meetings:
- DT call at 11:30 AM ET

Skills in use:
- /tak-outcomes — for Enabling Outcome articulation
- /tak-issuedrafting — for the spikes still pending entry
- /takui-stories — for Story 5 Phase 3-4 work
```

---


