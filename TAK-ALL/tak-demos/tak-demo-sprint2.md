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

**Wednesday, April 22, 2026**

---

## Sprint Accomplishments
Sprint 2: April 6 to April 19

| Week | SOW Section | Task / WorkStream | Deliverables |
|---|---|---|---|
| Week 2 | [4.3.1] SDK Updates | First signed .mil plugin built, validated, and delivered to SOCOM | Produced and delivered the first signed .mil AI GRG plugin for ATAK 5.6, completing Rise8's side of the government release process. Build is in Chad Molyet and Nik's hands for SOCOM acceptance review. |
| Weeks 1-2 | [4.3.2] TAK UI Migration | Rise8 and BAH established a TAK UI migration collaboration plan | Agreed on migration approach. For each workflow, Nathan confirms native TAK UI support. Where native support is absent, both teams determine the path: BAH roadmap, escape hatch, or TAK UI contribution. |
| Week 1 | [4.3.3] AI/ML Model Improvements | Two building detection bugs resolved and validated at SOCOM demo | Detection now performs consistently regardless of zoom level and across repeated runs. Both fixes were demonstrated live at the April 8 SOCOM demo in front of program stakeholders. |
| Week 2 | [4.3.4] GOTS Evaluation | GOTS evaluation scoped and initial findings documented | Scope agreed with SOCOM. Initial review of Trailblazer, Combat Swim, and SpotPlot produced early findings: plugins built in isolation with inconsistent schemas and disconnected workflows across the portfolio. |

---

## Demo: Before and After — Building Detection Improvement

**Pre-conditions to confirm before demo day:**
- Legacy build loaded in Android Studio emulator, new build on mirrored physical device
- AppGate running for device mirroring
- Tiles pre-cached on new version — run detection once beforehand for a clean live run
- Same AOI staged on both devices, same grid spacing (60m), same zoom level (234m)
- **Validate with team before Monday:** building count and avg time across X runs for each version — have numbers ready before you take the stage

**Beat 1 — Legacy version (emulator, 5.5)**

1. Introduce the results: X runs, how many buildings detected, avg time, flag any interesting finding
2. Confirm setup live: AOI, 60m grid spacing, 234m zoom level
3. Run detection (Detect All from toolbar)
4. Present results: call out height and detection count

**Beat 2 — New version (physical device, 5.6)**

1. Introduce the results: X runs, how many buildings detected, avg time, flag any interesting finding
2. Confirm setup live: same AOI, 60m grid spacing, 234m zoom level
3. Run detection (Detect All from toolbar)
4. Present results: call out height and detection count differences vs. legacy

**Known risks:**
- Run a full dry run before Wednesday with both environments staged — do not test setup live on demo day
- Have the pre-run numbers (count, avg time) written down before you start — do not rely on memory

---

## Work in Progress and Planned Effort
Sprint 3: April 20 to May 2

| Dates | Work Stream | Progress and Plans |
|---|---|---|
| April 20-25 | [4.3.1] SDK Updates | Delivered 5.4 and 5.6 builds -- both in SOCOM's hands for acceptance review and testing. Embedding the user manual into the plugin is the top priority this sprint. SDK 5.7 development begins once 5.6 is confirmed. |
| April 20-May 2 | [4.3.2] TAK UI Migration | First working session with Booz Allen complete. ActionBarView and nested radial menu API identified as the first native TAK UI contribution candidates. Drafting the API proposal to share with Nathan for review and next steps. |
| April 20-May 2 | [4.3.3] AI/ML Model Improvements | Working on operator experience improvements across the plugin -- correcting a detection timing issue, fixing an inaccurate status message, and cleaning up process handling after each detection run. Each fix brings the plugin closer to behaving exactly as operators expect. |
| April 20-May 2 | [4.3.4] GOTS Evaluation | Initial findings shared with Nik. Maneuver confirmed as the starting domain for the shared library model. Evaluation continues across the broader plugin portfolio, building the case for what a connected ecosystem could look like. |
| April 20-May 2 | [4.5] Release Pipeline | Every handoff to Chad and Nik requires a manual step to confirm the build is targeting the right version. Building an automated pipeline that validates every supported version in a single run, so we're not relying on someone catching it before it goes out the door. |

**Talking Track — Sprint 3 WIP**

*[4.3.1] SDK Updates*
We delivered both the 5.4 and 5.6 builds -- they're in Chad and Nik's hands for review and testing. The thing we're moving on right now is getting the user manual into the plugin. Chad asked about it on day one, and Kevan flagged it as our top priority. Once 5.6 clears, 5.7 development is next.

*[4.3.2] TAK UI Migration*
We wrapped up our first real working session with Booz -- working through four user stories to determine what's native TAK UI, what's on their roadmap, and what we need to contribute. Two components came out of that as strong contribution candidates: the floating toolbar and the nested radial menu. We're drafting the API proposal now to share with Nathan. Once he weighs in, we'll know exactly what we're building.

*[4.3.3] AI/ML Model Improvements*
This sprint is about making the plugin behave the way operators expect. We're resolving a bug where detection could trigger before the map is ready, fixing a status label that surfaces incorrect text in a delete confirmation, and closing out a process issue where background threads weren't shutting down cleanly after a detection run. Individually these are small. Together, they're what separates a tool operators trust from one they have to work around.

*[4.3.4] GOTS Evaluation*
The evaluation has moved from inventory to insight. Nik heard the early findings and confirmed the Maneuver domain as the right starting point for the shared library model. That's a meaningful signal -- SOCOM is already thinking about the connected ecosystem. We'll keep running the evaluation across the remaining plugins and document what a shared core could look like.

*[4.5] Release Pipeline*
Every handoff to Chad and Nik currently requires a manual step to confirm the build is targeting the right version. This past sprint, a version was targeting the wrong release -- we caught it internally. We're building an automated pipeline that validates every supported version in a single run, so we're not relying on someone catching it before it goes out the door.

---

## PI Planning: Forecasted Sprint Schedule

**Sprint 3 (April 20 – May 2):**
- [4.3.1] 5.4 and 5.6 builds in SOCOM review; user manual embedding underway; 5.7 baseline next
- [4.3.2] First Booz Allen working session complete; scoping contribution roadmap
- [4.3.3] Operator experience improvements across three targeted defects
- [4.3.4] Initial findings with SOCOM; Maneuver domain confirmed as starting point
- [4.5] Automated pipeline replacing manual branch confirmation before each release

**Sprint 4 (May 3 – May 15):**
- [4.3.1] Validated 5.6 delivery closed out; 5.7 development underway
- [4.3.2] TAK UI development started on priority workflows; migration assessment delivered
- [4.3.3] Operator feedback incorporated; detection performance documented in release notes
- [4.3.4] GOTS evaluation findings delivered to PMO as a briefing

**Extension Sprints (post-May 15) — Proposed:**
Proposal submitted to the customer. Operating as if the work continues through June 15.
- Maintain compatibility across ATAK versions in active use
- Advance TAK UI contributions based on confirmed roadmap with Booz Allen
- Incorporate operator field feedback into model improvements
- Continue GOTS evaluation and MOSA framework development

**Talking Track — PI Planning**
Sprint 3 is what you just saw. Sprint 4 wraps the current contract: the 5.6 delivery is closed, 5.7 is the next development baseline, and we're delivering the GOTS evaluation to the PMO as a briefing. On the extension past May 15 -- we submitted the proposal. We haven't heard back yet. If there's any update on your end, we'd welcome it.

---

## Issue Resolution

**Issue:** Operator Feedback Timeline
**Description:** This is the first time Rise8 has run the full government delivery process with SOCOM. The timeline from acceptance review to field deployment -- and when Rise8 can expect to hear back from operators -- is not yet established.
**COA:** Nik has agreed to walk Rise8 through the complete post-handoff process. Once we have that map, we'll have a clearer picture of what the full delivery cycle looks like.
**Notes:**

---

## Cheat Sheet Q&A

**Sprint Accomplishments**

Q: "When do you expect feedback on the 5.6 build from field users?"
> This is the first time we've run the full government review cycle, so we don't have a timeline yet. Nik has agreed to walk us through the complete post-handoff process -- from acceptance review to field deployment. That's what gives us a clearer picture of the feedback loop end to end.

**Demo**

Q: "How confident are you in those detection numbers -- were these controlled conditions?"
> Five runs each, same area, same grid spacing, same zoom level. 66 buildings on the legacy version, 148 on the new one -- consistently, across every run. Kevan and Zach can walk through the methodology in detail if that's helpful.

**PI Planning**

Q: "Is the extension past May 15 confirmed?"
> The proposal is in the customer's hands -- submitted to Nizme. We haven't heard back, so we're planning and operating as if the work continues through June 15. If there's any update on where that stands, we'd welcome it.

**Issue Resolution**

Q: "Is there anything blocking you while the timeline is unclear?"
> No -- we're moving forward on everything within scope. What we're asking for is visibility into what happens after we hand off, so we can plan the feedback loop. Nik walking us through the process closes that gap.
