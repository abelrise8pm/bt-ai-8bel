## SOW REFS:

Task 1 — SDK Update to v5.6
4.3.1 — Modernize the AI/ML GRG plug-in to the most current SDK release, while maintaining SOCOM compatibility.

Task 2 — TAK UI Research and Migration
4.3.2 — Research and provide a cost and timeline estimate for rewriting the plug-in into the TAK UI framework. Goal is to establish TAK UI Bridge language cross-compatibility.

Task 3 — AI/ML Model Improvements
4.3.3 — Research and make improvements to the AI/ML model for the GRG plug-in.

Task 4 — GOTS Evaluation
4.3.4 — Evaluate existing GOTS software capabilities for modularity and scalability as directed by the Government.
4.3.4.1 — Deliver an assessment of those capabilities in a briefing to the PMO.

Supporting/Overarching Deliverable Sections:

4.4.2 — TAK Forge Fortify scan thresholds (zero critical, zero high, <10 moderate, <20 low)
4.5 — Software delivery expectations
8.1.4 — Sprint demo and performance metrics
8.1.5 — Application demonstration to USSOCOM TPOC
8.1.6 — Deliver application code to USSOCOM TPOC
8.1.7 — Weekly status meetings with prepared progress reports

# TAK Bridge — Demo and Product Update

**Wednesday, May 6, 2026**

---

## Sprint Accomplishments
Sprint 3: April 20 to May 4, 2026

| Week | SOW Section | Task / WorkStream | Deliverables |
|---|---|---|---|
| Week 1 | [4.3.1] SDK Updates | User Manual Delivered; GRG Export Crash Resolved | User manual accessible within the plugin. App-crashing defect on GRG export in 5.6 resolved, keeping both 5.4 and 5.6 builds stable for Development Testing. |
| Week 1 | [4.3.2] TAK UI Migration | Radial Menu Confirmed as TAK UI Contribution; Migration Assessment Underway | Rise8 and BAH confirmed the Radial Menu as a TAK UI contribution. Radial menu component built and submitted to Nathan. Migration assessment documentation underway. |
| Week 1 | [4.3.3] AI/ML Model Improvements | Operator Imagery Status Improvements | Plugin now keeps operators informed of imagery availability before building detection. When map imagery cannot be fully retrieved, operators receive a status notification giving them the context to assess imagery quality before proceeding with building detection. |
| Week 1 | [4.3.4] GOTS Evaluation | Maneuver Domain Working Session with SOCOM Completed | [CONFIRM WITH KEVAN AND JONATHAN] Operator input from a working session with SOCOM validated TAK domain connections across real mission phases, informing the shared capabilities framework the GOTS evaluation is building toward. |

---

## Script — Sprint Accomplishments

Now, for our Sprint 3 accomplishments.

**[4.3.1]**
Chad asked for the user manual on day one.
It's in the plugin now.
Operators can access it directly, no separate document needed.
We also resolved a crash on GRG export in 5.6.
Both the 5.4 and 5.6 builds are stable and in your team's hands for Development Testing.

**On the TAK UI side,**
**[4.3.2]**
We confirmed our first TAK UI contribution with Booz Allen.
The Radial Menu is the component operators use when they tap the center of a placed grid.
The component is built and submitted to Nathan for review.
The migration assessment is in progress and on track for the May 15 delivery.

**On the plugin and model detection improvements..**
**[4.3.3]**
We wanted operators to have full context before detection runs, not after.
The plugin now surfaces imagery status upfront.
If imagery couldn't be fully retrieved, operators get a notification so they can assess conditions before they proceed.
You'll get to see that in detail during the demo.

**And on the GOTS evaluation,**
**[4.3.4]** *[CONFIRM WITH KEVAN AND JONATHAN BEFORE USING THIS CUE]*
We held a working session with your team on the Maneuver domain.
Operator input confirmed how TAK domains interconnect across real mission phases.
Those findings are feeding into the shared capabilities framework we're building toward.

---

## Work in Progress and Planned Effort
Sprint 4: May 4 to May 15, 2026

| Dates | Work Stream | Progress and Plans |
|---|---|---|
| May 4-15 | [4.3.1] SDK Updates | DT feedback received last Friday. Triage underway. Prioritizing fixes that prevent operators from completing GRGs by May 15. Feature requests and new functionality drafted as prioritized issues for future development. |
| May 4-15 | [4.3.2] TAK UI Migration | Working through a first end-to-end TAK UI contribution cycle with BAH. Remaining workflow analysis and assessment scope wrapping this week. Cost and timeline estimates delivered to SOCOM by May 15. |
| May 4-15 | [4.3.3] AI/ML Model Improvements | Documenting a prioritized set of operator improvements and new capabilities based on government testing feedback and operator input. Feature requests and improvements captured as prioritized issues for future development. |
| May 4-15 | [4.3.4] GOTS Evaluation | *[CONFIRM WITH KEVAN — deliverable format and scope for May 15 still TBD]* Evaluation work in progress. Assessment findings and shared capabilities framework targeted for delivery by May 15. |

---

## Script — Work in Progress and Planned Effort

Any questions before we take a look at what's ahead?
CHANGE TABS!

Sprint 4 runs May 4th through May 15th.
Here's where we are across each work stream.

On the SDK and operator stability side,
Chad and Nik's team submitted testing feedback last Friday.
We are working through those reports now.
Our focus for the remaining sprint is the issues that prevent operators from completing GRGs.
Feature requests and new functionality are being captured and documented for future development.

Moving over to TAK UI.
We are running our first end-to-end contribution cycle with BAH.
The Radial Menu is in Nathan's hands for review.
Remaining workflow analysis wraps this week.
Kevan is finalizing cost and timeline estimates.
The full migration assessment is on track for delivery by May 15th.

On the model and plugin side,
We are putting together a prioritized backlog of operator improvements and new capabilities.
This pulls from the government testing feedback and operator input we've gathered this sprint.
The goal is to have that documented and organized by May 15th.

*[CONFIRM WITH KEVAN BEFORE USING THIS CUE]*
And on the GOTS evaluation.
Kevan can speak to the specifics.
The assessment findings and the shared capabilities framework are targeted for delivery by May 15th.

Any questions before we take a look at PI Planning?

---

## PI Planning: Forecasted Sprint Schedule

**Sprint 3 (April 20 – May 4):**
- [4.3.1] User manual delivered; app-crash on GRG export resolved; 5.4 and 5.6 builds stable for DT testing
- [4.3.2] Radial Menu confirmed as first TAK UI contribution; migration assessment underway
- [4.3.3] Operator imagery status improvements delivered
- [4.3.4] Maneuver domain working session with SOCOM completed *[CONFIRM WITH KEVAN AND JONATHAN]*

**Sprint 4 (May 4 – May 15):**
- [4.3.1] Priority defects resolved; 5.6 stable for operators; v5.7 development baseline established
- [4.3.2] Migration assessment completed and delivered to SOCOM
- [4.3.3] Operator improvements and new capabilities documented and prioritized for future development
- [4.3.4] Plugin capability assessment delivered to PMO as a briefing

---

## Script — PI Planning: Sprint Forecast

Great, here's how the rest of the next couple of weeks will pan out.

This slide shows the full forecasted schedule.
We just saw Sprint 3 in depth, so I'll keep that brief.

Sprint 4 runs through May 15th.
5.6 is stable for operators, and we get v5.7 established as the active development baseline.
TAK UI, the migration assessment is completed and delivered.
On the model and plugin side, operator improvements are documented and prioritized for future development.
And GOTS wraps up as a formal briefing to the PMO.

---

## Script — Demo Transition

Any questions on the sprint forecast?
CHANGE TABS!

This is a pre-recorded walkthrough of one of the improvements we delivered in Sprint 3.
The plugin pre-caches imagery before building detection runs.
Depending on whether operators are working from a local file or pulling imagery from the web, they now see a clear status update before they proceed.
Let's take a look.

---

## Issue Resolution

**Issue:** TAK UI Contribution Review Pending
**Description:** Rise8 submitted the first TAK UI contribution for Nathan's review. The Monday sync with Booz Allen was cancelled and the contribution has not yet entered review. Nathan's active participation is needed to complete the review cycle before May 15.
**COA:** Rise8 is following up with Nathan to reschedule and confirm review support. If the review extends past May 15, the contribution experience will be documented as part of the assessment findings.
**Notes:**

---

**Issue:** DT Feedback Scope and Process Alignment
**Description:** Government testers submitted feedback across two separate documents with overlap between them. Reports mix defects, observations, and suggestions, and some lack the expected behavior needed to confirm priority or scope against May 15.
**COA:** Rise8 will work with Chad and Nik's team to align on priority and confirm expected behavior for open items. Rise8 will provide a standard reporting template to support future testing rounds and shorten the feedback loop between testing and development.
**Notes:**
