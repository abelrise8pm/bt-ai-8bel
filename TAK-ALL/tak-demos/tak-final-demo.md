# TAK Bridge — Final Demo and Product Update

**Friday, May 15, 2026**

---

## Sprint Accomplishments — Task 1 [4.3.1] SDK Update to v5.6

| Sprint | SOW Section | Task / WorkStream | Deliverables |
|---|---|---|---|
| Sprint 2 | [4.3.1] SDK Updates | Signed .mil production-ready AI GRG plugin on v5.6 | First production-signed .mil build of the AI GRG plugin accepted into the TAK Plugin Master List and delivered directly to Chad and Nik. Plugin loads on ATAK 5.6 without signing or compatibility error, opening the official TAK distribution path. |
| Sprint 3 | [4.3.1] SDK Updates | v5.4 build delivered alongside v5.6 | AI GRG plugin builds for both ATAK 5.4 and 5.6 handed off to Chad and Nik. Multi-version support keeps currently-fielded devices covered while the production build matures on the latest SDK. |
| Sprint 3 | [4.3.1] SDK Updates | Development baseline established on v5.7 | Plugin source builds against v5.7 from the same single source as 5.4, 5.5, and 5.6, positioning the team to deliver on the next ATAK version on the same cadence TPC ships it. |
| Sprint 2 | [4.3.1] SDK Updates | `pads-fast` publish service | Rise8-built publish service replaces the upstream PADS sidecar in the release pipeline. Publish time for all five supported ATAK version builds cut from 50–60 minutes per run to under 4 minutes, with zero manual interventions required since April 22. |
| Sprint 2 | [4.3.1] SDK Updates | Parallel matrix pipeline | All supported ATAK versions (5.4, 5.5, 5.6, 5.7) build from a single source by swapping variables. The three-branch maintenance model is retired, eliminating manual branch sync and the wrong-version targeting error class that surfaced in Sprint 2. |
| Sprint 3 | [4.3.1] SDK Updates | In-plugin user manual | User documentation now opens directly inside the plugin, closing Chad's first documentation request. Operators access reference material from the same device running the mission build, without a separate handoff path. |

---

## Sprint Accomplishments — Task 2 [4.3.2] TAK UI Migration

| Sprint | SOW Section | Task / WorkStream | Deliverables |
|---|---|---|---|
| Sprint 1 | [4.3.2] TAK UI Migration | TAK UI framework coverage findings | Phase 1 research output. Josh rebuilt the AI GRG plugin against the TAK UI framework in a prototype environment to surface what the framework provides natively, which components still require ATAK-native escape hatches, and the technical gotchas only visible through hands-on use. The findings document is the technical foundation the migration assessment is built on. |
| Sprint 3 + 4 | [4.3.2] TAK UI Migration | Nested, hierarchical radial menu native TAK UI contribution merged | Rise8's first end-to-end TAK UI contribution merged into the framework. The nested, hierarchical radial menu component is now available to AI GRG and any plug-in going forward. |
| Sprint 4 | [4.3.2] TAK UI Migration | TAK UI Migration Assessment Document | Cost and timeline assessment delivered to SOCOM on May 15. Covers research findings, the end-to-end GRG workflow breakdown that informed migration scope, sprint estimates by scope category, technical risks and open items, and recommendations for TAK UI updates required to support AI GRG and any plug-in going forward. |

---

## Sprint Accomplishments — Task 3 [4.3.3] AI/ML Model Improvements

| Sprint | SOW Section | Task / WorkStream | Deliverables |
|---|---|---|---|
| Sprint 1 + 2 | [4.3.3] AI/ML Model Improvements | Detection accuracy and reliability improvements | Two model issues resolved: building detection now performs consistently regardless of zoom level, and repeated detection runs produce stable results. The April 22 sprint demo quantified a 124% improvement in building detection accuracy, validated through side-by-side comparison with SOCOM. |
| Sprint 3 | [4.3.3] AI/ML Model Improvements | Imagery pre-caching and operator status messaging | Plugin now pre-caches imagery before building detection runs and surfaces a status notification based on the result: full success, partial completion, or fetch failure. Operators see the imagery state up front and can assess conditions before committing to detection, with accurate messaging across all three pre-caching states. |
| Sprint 3 + 4 | [4.3.3] AI/ML Model Improvements | Operator stability fixes across 5.4 and 5.6 | Three stability defects resolved across both builds: the radial menu delete crash, the GRG export crash on scale bar/meters selection, and a silent-failure issue in release builds where obfuscation was breaking detection paths in production but not in development. Both versions confirmed stable for ongoing DT testing. |
| Sprint 3 | [4.3.3] AI/ML Model Improvements | Plugin behavior and operator-experience fixes | Seven operator-experience defects resolved across the plugin: detection no longer triggers before the map finishes loading; background threads now shut down cleanly after each detection run; detection no longer runs on backup imagery when tile capture fails; delete section confirmations now display the section name correctly; closed grids no longer reappear on map tap; and building labels clear properly when a GRG is closed, including labels placed outside named sections. |
| Sprint 4 | [4.3.3] AI/ML Model Improvements | Prioritized operator improvements backlog | Government testing feedback and operator input from Sprints 3 and 4 captured into a structured, prioritized set of operator improvements ready for follow-on development. Becomes the starting point for any continuation work after May 15. |

### 4.3.3 — Things we delivered across the bridge (context for the table above)

**Detection / model improvements**
1. Building detection consistency across zoom levels
2. Stable results across repeated detection runs
3. 124% accuracy improvement (validated at April 22 demo with side-by-side comparison)
4. Detection timing fix — no longer triggers before the map finishes loading
5. Background thread cleanup after each detection run (memory leak resolved)
6. No more false detections on backup imagery when tile capture fails

**Pre-caching and imagery feedback to operators**

7. Pre-caching feature added
8. Imagery status messaging — full success, partial completion, fetch failure
9. "Tile Capture Failed" warning popup when capture fails

**App stability fixes (across 5.4 and 5.6)**

10. Radial menu delete crash fix
11. GRG export crash fix (scale bar / meters selection)
12. ProGuard / reflection silent-failure fix in release builds

**Plugin behavior and UX bug fixes**

13. Delete section confirmation now shows section name correctly (was "undefined")
14. Closed grids no longer reappear on map tap
15. Building labels clear when a GRG is closed
16. Labels outside named sections clear on save and close

**Forward-looking artifact**

17. Prioritized operator improvements backlog (delivered May 15 — captures DT and operator input as a structured set for follow-on development)

---

## Sprint Accomplishments — Task 4 [4.3.4] GOTS Evaluation

| Sprint | SOW Section | Task / WorkStream | Deliverables |
|---|---|---|---|
| Sprint 2 | [4.3.4] GOTS Evaluation | Initial GOTS findings presented to SOCOM | Initial review of Trailblazer, Combat Swim, and SpotPlot presented at the April 22 sprint demo. Findings surfaced duplicate capabilities built in isolation across plugins, with inconsistent schemas and disconnected workflows. Nik endorsed the domain ownership model and identified Maneuver as the starting focus for the shared library framework. |
| Sprint 4 | [4.3.4] GOTS Evaluation | GOTS / MOSA Evaluation Report and PMO briefing | Single consolidated report delivered to SOCOM covering the current state of the plugin ecosystem, the target state, and the MOSA scorecard against Trailblazer, Combat Swim, and Spot Plot. Operator input from the Sprint 3 Maneuver domain working session and TAK UI synthesis are woven through. PMO briefing closes out the evaluation by May 15. |

---

## Sprint 4 Accomplishments — May 4 to May 15

| Week | SOW Section | Task / WorkStream | Deliverables |
|---|---|---|---|
| Week 1–2 | [4.3.1] SDK Updates | 5.4 and 5.6 operator stability fixes | Two stability defects resolved: radial menu delete crash on both 5.4 and 5.6 (delivered to DTs May 5), and grid configuration via the radial menu now functioning on 5.4. Closes parity gaps between the 5.4 and 5.6 builds for Development Testing. |
| Week 1–2 | [4.3.1] SDK Updates | User manual updates published | User manual revised to incorporate Jonathan's review feedback and re-published in the plugin. In-plugin documentation reflects the latest plugin behavior and operator-facing flows. |
| Week 2 | [4.3.2] TAK UI Migration | Nested radial menu TAK UI contribution merged | Rise8's first end-to-end TAK UI contribution merged into the framework. The nested, hierarchical radial menu component is now available to AI GRG and any plug-in going forward. |
| Week 2 | [4.3.2] TAK UI Migration | TAK UI Migration Assessment Document delivered | Cost and timeline assessment delivered to SOCOM on May 15. Covers research findings, GRG workflow migration scope, sprint estimates by category, technical risks, and TAK UI recommendations. |
| Week 2 | [4.3.3] AI/ML Model Improvements | Prioritized operator improvements backlog | Structured, prioritized set of operator improvements from Sprints 3 and 4 captured for follow-on development. Becomes the starting point for any continuation work after May 15. |
| Week 1–2 | [4.3.4] GOTS Evaluation | GOTS / MOSA Evaluation Report and PMO briefing | Single consolidated report delivered May 13 covering current state, target state, and MOSA scorecard against Trailblazer, Combat Swim, and Spot Plot. PMO briefing closes out the evaluation by May 15. |

---

## Next Steps: Handoff and Dependencies

> **🟡 ABEL TO REVIEW TOMORROW** — Replaces the standard "Issue Resolution / Risks" closing slide. Framing is momentum and readiness, not problems with COAs. Workshopping draft below contains all 9 candidates across three buckets (Rise8-ready, SOCOM/BAH-owned, forward-looking moments). Trim, reframe, or reorder before locking. Recommendation when fresh: aim for ~5 items total to keep the closing slide tight.

### A. Ready to go when we re-engage (Rise8-owned momentum)

1. **Prioritized operator improvements backlog** — Sprint 4 deliverable. Day-one ready. Captures DT and operator input as a structured set, sequenced for follow-on execution.
   - *Source:* db-wk7, May 11 hand-off

2. **Next TAK UI contribution candidates identified** — The migration assessment recommendations call out what TAK UI needs to support AI GRG and other plug-ins. Recurring sync channel with Nathan and Malachi is active.
   - *Source:* TAK UI Migration Assessment Section 3.2, BAH sync notes

3. **Maneuver Domain shared library framework, ready to advance** — The GOTS evaluation surfaced duplicate capabilities and bespoke schemas across Combat Swim, Trailblazer, and SpotPlot (routes, waypoints, data entities defined custom per plugin with no interoperability). Sprint 3 Maneuver Domain working session laid the groundwork for a shared core library and schema standard. Next session with Nik queued once he returns May 15.
   - *Source:* db-wk6, tak-daily-april_27-may1.md (GOTS findings), tak-daily-may_11-15.md Category 3

4. **5.7 development baseline established** — Plugin source already builds against 5.7 from the same single source as 5.4, 5.5, and 5.6. Positions Rise8 to deliver on upcoming ATAK releases on the same cadence TPC ships them, with no separate upgrade scramble.
   - *Source:* db-wk2, db-wk5, OOR matrix pipeline outcome, db-wk4 extension proposal Work Stream 1

### B. What can advance while we're off contract (SOCOM / BAH-owned threads)

5. **Operator field validation of the 5.6 build** — Chad and Nik conducting user assessment testing. Feedback closes the loop on the mission outcome hypothesis we're building toward.
   - *Source:* tak-oor.md production .mil outcome, db-wk5 DT cycle

6. **BAH WinTAK roadmap consideration** — The migration assessment flagged composite map items, OpenGL render, and C# radial menu work as the gaps. The "ATAK ahead, WinTAK behind" pattern is documented for joint scoping.
   - *Source:* TAK UI Migration Assessment, May 7 BAH sync notes

7. **SOCOM CAC and production access path** — Nik's plan from the April 24 meeting. Would unblock Rise8 contributing directly to production TAK systems when we re-engage.
   - *Source:* tak-daily-april_27-may1.md, tak-daily-may_11-15.md Category 4
   - *Tone flag for Abel:* could read as a lingering open thread rather than a momentum item. Reframe or hold?

### C. Forward-looking moments (Abel approved for the slide; verbal as well)

8. **June 15 and September 1 PI Planning windows** — Nik mentioned both. Rise8 may take a larger TAK UI scope (potentially WinTAK ownership) once back on contract.
   - *Source:* tak-daily-may_11-15.md Category 4

9. **TAK Offsite August 17–21** — Nik recommended Rise8 attendance.
   - *Source:* tak-daily-may_11-15.md Category 4

---

### Open workshop questions for Abel's review

1. **Final count** — Currently 9 candidates. Recommendation: trim to ~5 for the slide. Which to keep, which to drop?
2. **Bucket structure** — A/B/C as drafted, or fold C into A as "what's lined up next"?
3. **Item #7 (SOCOM CAC / production access)** — keep as a momentum item, reframe, or hold for verbal-only?
4. **Order** — anything that should lead the slide for impact?

---

## Proposed: Prioritized operator improvements backlog

> **🟡 ABEL NEEDS TO REVIEW** — Preliminary review doc, not a finalized backlog. 40 candidate items merged from `dt-defect-report-spreadsheet-v5.4-v5.6.csv`, `dt-issues-doc-v5.4.md`, daily notes across the bridge (March 3 to May 15), and the extension proposal. Sourced inline. Three buckets per Abel's framing: **Done or In-Progress** (already declared done or WIP), **Triage in Progress** (Abel has reviewed/discussed/flagged), **Not Started or Unknown** (no record of Abel discussing). Cross-reference each item against current GitLab status before locking. See placement-call notes at the bottom.

### Bucket 1 — Done or In-Progress (9 items)

| Source ID(s) | Title | Brief context | Latest status / next action |
|---|---|---|---|
| SDT-54 | Embed User Manual | User Manual now accessible inside the plugin | DONE — Fixed April 28–May 1. Sprint 4 also incorporated Jonathan's review feedback. Confirm closure in GitLab. |
| SDT-63 / GitLab #59 | Export crashes on Scale Bar / Meters | Crash on GRG export flow when selecting meters in Scale Bar | DONE — Fixed May 1. Confirm DT verification. |
| SDT-70 / GitLab #70 | Radial menu delete crash on 5.4 and 5.6 | ATAK crashed when operators used radial delete after detection | DONE — Fixed by Zach May 5, delivered to DTs. Confirm DT verification. |
| GitLab #45 | Closed Grid reappears on map tap | Grid reappears without center point or radial menu controls | DONE per May 4 triage. Confirm closure in GitLab. |
| GitLab #46 | Delete section confirmation shows "undefined" | Section name displayed as "undefined" after AI detection | DONE per May 4 triage. Confirm closure in GitLab. |
| GitLab #57 | Detection runs on backup imagery after tile capture fails | Plugin produced false detections from failed-capture backup image | DONE — Fixed via TIFF/backup image work in Sprint 3. Confirm closure in GitLab. |
| SDT-56 / GitLab #62 | Closing GRG leaves building labels on map | Grid disappears on close but labels persist | DONE per May 4 triage. Confirm closure in GitLab. |
| GitLab #63 | Labels outside named sections remain after save/close | Labels placed outside named sections persist on save and close | DONE per May 4 triage. Confirm closure in GitLab. |
| SDT-72 | 5.4 radial column/row/spacing adjustments don't work | Grid configuration via radial menu fails on 5.4 only | IN PROGRESS — In Abel's GitLab backlog, Sprint 4 fix. Confirm closure once shipped. |

  SDT-63 / GitLab #59: https://gitlab.gl.rise8.us/rise8-all/delivery/engagements/socom/tak/grg-plugin/rise8-atak-grg-plugin/-/issues/59


### Bucket 2 — Triage in Progress (18 items)

| Source ID(s) | Title | Brief context | Latest status / next action |
|---|---|---|---|
| 03/v5.4 / SDT-71 | Duplicate building labels after reopening saved GRG | Labels 002, 003, 004 duplicate on save → close → reopen | Confirmed on 5.6 May 4. Need to check with Zach/Josh whether SDT-71 shares the same root cause. |
| 08/v5.4 | Grid doesn't load when GRG re-saved under new name | Re-saving GRG under new name then loading newest fails to populate grid (5.4 only) | Triaged Low priority — workaround documented (don't re-save under new name). Confirm whether to log or defer. |
| SDT-65 / 07/v5.4 | Center Point shifts 20–50m when adjusting grid spacing | Center point moves with spacing change instead of staying anchored | Jonathan flagged as feature request, not bug. Need to scope as a feature ask or close as intended. |
| SDT-57 | Deleting Manual Label marker creates a new one | Workaround documented (de-select Manual Label icon before deleting) | Need to discuss with SOCOM / SOF Team Leads — does current behavior meet operational needs? |
| SDT-67 / 10/v5.4 | X icon closes toolbar, not AI GRG | Operators expect X to close AI GRG entirely or at least the open menu | Triaged as improvement, not bug. Need to scope as a UX change. |
| SDT-68 | Building Detection picks non-buildings (wood piles, pools, driveways) | Model labels parking lots, cars, large items not buildings | Triaged as improvement, map layer accuracy. Likely overlaps SDT-55 and SDT-66. Need to consolidate. |
| 06/v5.4 | Buildings outside the Grid after save/close/reopen | Buildings appear outside grid boundaries after lifecycle | Abel noted as captured in #62/#63 area. Need engineers to confirm whether existing fix covers this lifecycle path. |
| SDT-60 / 04/v5.4 | Section Building Detection inconsistent across runs | First detection in section returned 26 buildings, second returned 1 | Need DTs to confirm consistent repro — what device, area, build? |
| 01/v5.4 / SDT-58 | AI GRG prompts to install while already running | DTs couldn't reproduce | Triaged: no ticket until repro confirmed. Close out or hold. |
| 02/v5.4 / SDT-59 | Grid resizes to 2–3 grid squares unexpectedly | DTs couldn't reproduce | Triaged: no ticket until repro confirmed. Close out or hold. |
| 05/v5.4 | Detected buildings not visible at certain zoom levels | Standard TAK label/marker behavior at various zooms | Triaged: standard TAK behavior, not plugin issue. Close out. |
| GitLab #72 | Building labels bleed across collocated GRGs | Operator P confirmed via Jonathan that duplicate alpha-numerics across GRGs are unacceptable | Need engineering scope and sprint inclusion decision (originally against May 15 window — now Sprint 5+). |
| GitLab #73 | Skip-sections still reports building counts when no new buildings should be detected | New defect from May 5–7 testing | Need engineering scope and sprint inclusion decision. |
| SDT-55 | Automated Labeling has issues finding/making buildings | Double-labels large buildings; labels parking lots, cars, wood piles | Likely overlaps SDT-66 and SDT-68. Need to consolidate into a single model-improvement track. |
| Pre-caching threshold calibration (currently 25%) — [tak-daily-april_27-may1.md:931](TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-april_27-may1.md#L931) | Pre-caching failure threshold tunability | Zach set threshold at "anything over 25% missing tiles." Open to changing based on operator feedback. | Need operator validation — does 25% match what operators experience as "too few tiles to trust"? |
| Mission-window-aware detection messaging — [tak-daily-may_11-15.md:624](TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-may_11-15.md#L624) | Messaging calibrated to mission window (weeks vs hours) | May 12 hypothesis: operators triage detection trust differently based on mission window length. Plugin messaging doesn't differentiate today. | Hypothesis-stage. Need to draft as a research opportunity, depends on operator field validation. |
| Post-mission GR effectiveness reporting — [tak-daily-may_11-15.md:628](TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-may_11-15.md#L628) | Operators report which labels worked / what they changed post-mission | Abel called this a "gold mine" in May 12 discussion — no capability today for operators to feed back post-mission. | Need to scope as a research/discovery item — depends on operator field validation first. |
| Codified model training pipeline — [tak-daily-march_9-13.md:111](TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-march_9-13.md#L111); [db-wk4.md:92](TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/db-wk4.md#L92) | Repeatable model training pipeline | Kevan's ask, now formally in the extension proposal as Work Stream 3 scoping item. Unlocks faster operator-feedback-driven model improvements. | Need scope discussion with Kevan once back on contract. |

- 03/v5.4 / SDT-71: building labels to increment continuously when creating multiple GRGs within the same mission AOI, (https://gitlab.gl.rise8.us/rise8-all/delivery/engagements/socom/tak/grg-plugin/rise8-atak-grg-plugin/-/issues/80)
- 08/v5.4: https://gitlab.gl.rise8.us/rise8-all/delivery/engagements/socom/tak/grg-plugin/rise8-atak-grg-plugin/-/issues/81
- 07/v5.4 / SDt-65: https://gitlab.gl.rise8.us/rise8-all/delivery/engagements/socom/tak/grg-plugin/rise8-atak-grg-plugin/-/issues/82
- SDT-57: https://gitlab.gl.rise8.us/rise8-all/delivery/engagements/socom/tak/grg-plugin/rise8-atak-grg-plugin/-/issues/83
- SDT-67: https://gitlab.gl.rise8.us/rise8-all/delivery/engagements/socom/tak/grg-plugin/rise8-atak-grg-plugin/-/issues/84

### Bucket 3 — Not Started or Unknown (13 items)

| Source ID(s) | Title | Brief context | Latest status / next action |
|---|---|---|---|
| SDT-42 | Wand re-order tool doesn't re-sequence numbers | Subsequent numbers not reordered after wand changes (v5.5 only) | Need to review — is v5.5 in scope or out? Possible regression of the bakeoff "swipe to relabel" feature. |
| SDT-62 | Sections not labeled correctly | Section A reports 9 buildings detected but more exist; not all visible without extreme zoom | Need to review and reproduce. May be related to SDT-60. |
| SDT-64 | Export menu customization issues | Point List numbers default-checked uneditable; Compass color can't change; Info Box placement tied to Points list | Need to review — scope as a UX improvement set. |
| SDT-66 | Buildings assigned more than one number/label | Larger buildings get as many as 5 labels assigned | Need to review. Overlaps SDT-55. Consolidate into model-improvement track. |
| SDT-69 | De-selecting [SHOW ABC123 Labels] populates Grid | Toggle behavior counter to operator expectation | Need to review and reproduce. |
| SDT-73 | Drawing shapes doesn't label buildings automatically | Polyline polygon shape names section but doesn't label buildings inside | Need to review — scope as expected behavior or defect. |
| SDT-74 | Polyline shapes (Circle, Rectangle, Oval) don't relabel buildings | After automated labeling, polyline shapes create section but don't relabel buildings | Need to review — likely overlaps SDT-73. Consolidate. |
| SDT-75 | Unit of Measure menu greyed out | In Edit Scale Bar menu, Unit of Measure menu greyed out when Cell Range selected | Need to review and scope. |
| 09/v5.4 | ATAK folder labeled "GR8" should be "AI GRG" | Naming inconsistency in folder where ATAK saves files | Need to review — naming change vs operator confusion. |
| Swipe-to-relabel ("wand") feature — [tak-daily-march_3-6.md:50,106](TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-march_3-6.md#L50) | The bakeoff "wow" feature: swipe a path across buildings to relabel in sequence | Highly praised by operators at bakeoff. SDT-42 may indicate v5.5 regression. | Need to confirm with Josh/Zach: is this feature still functional on 5.6? Is SDT-42 a regression? |
| Section drawing and naming flow automation — [tak-daily-march_16-20.md:243,279](TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-march_16-20.md#L243) | Automation for grid placement, section sizing, naming flow | "Time pressure is the critical pain point... no automation exists for placing the grid or drawing sections" | Need to talk to Jonathan — scope as feature epic or break into smaller items? |
| Iconography and flow improvements — [tak-daily-april_20-24.md:151](TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-april_20-24.md#L151) | UX risks within the plugin needing iconography and flow work | Jonathan flagged as needing prioritization in larger growth plan, pending end-user access | Need to pair with Jonathan to break down into reviewable items. |
| Hardcoded zoom level 19 for model — [tak-daily-april_13-17.md:684](TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-april_13-17.md#L684); [tak-daily-april_27-may1.md:380](TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-april_27-may1.md#L380) | Model requires zoom level 19 imagery; fails when only zoom 18 available | Hardcoded constraint not configurable today. Caused some of the pre-caching failures Zach worked through. | Need to scope as a future improvement — could the model adapt to zoom 18 with confidence flag? |

---

### Placement calls to verify with Abel

1. **Pre-caching threshold (25%)** — placed in Bucket 2 (Zach/Jonathan/Abel discussed in late April stand-ups). Move to Bucket 3 if not actively triaged.
2. **Mission-window messaging** and **Post-mission GR effectiveness** — placed in Bucket 2 (Abel led the May 12 hypothesis session). Both are hypothesis-stage, not bugs.
3. **Codified model training pipeline** — placed in Bucket 2 (formally in the extension proposal as Work Stream 3). Move to Bucket 3 if you'd rather treat as "not started yet."
4. **Iconography and flow improvements** — placed in Bucket 3 (Jonathan raised it; no record of active Abel triage). Move to Bucket 2 if you've engaged more recently.

### Sources consulted

- `TAK-ALL/r8-internal/dt-defect-report-spreadsheet-v5.4-v5.6.csv` (22 items: SDT-42, SDT-54–75)
- `TAK-ALL/r8-internal/dt-issues-doc-v5.4.md` (10 items: 01/v5.4 through 10/v5.4)
- `TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-march_3-6.md` through `tak-daily-may_11-15.md` (11 daily files)
- `TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/db-wk1.md` through `db-wk7.md`
- `TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-may_4-8.md` (Abel's May 4 DT triage)
- `TAK-ALL/r8-internal/outcome-evidence-data.md`
- Other r8-internal docs scanned but no candidates surfaced: `mary-onboarding-brief.md`, `r8-internal-resources.md`, `tak-ecosystem-guide.md`



> General suggestions for the entire Risks section: "Consider moving the current Risk 2 (Rise8 Strategic Concerns) after Risk 3 (Architectural Direction) and Risk 4 (WinTAK Kernel). Risks 3 and 4 are research-grounded observations. Risk 2 is the strategic interpretation that follows from them. Re-ordering signals that the strategic concerns come out of the technical findings, not the other way around."
Risk 3: TAK UI Architectural Direction: UI Primitives Without System Bindings
A recurring pattern across the assessment is that TAK UI provides a visual UI component but does not expose what the plugin needs to make it functional. The pattern divides into two shapes: *feature-completion, where UI components are present but missing configuration properties (Story 1 and Stories 3 and 4 marker properties); and *architectural scope, where components are present but missing system bindings, change listeners, or workflow hooks (Story 2 color picker wiring to drawing preferences, Stories 3 and 4 map group change listener, and Story 5 import resolver auto-import hook). Five spike findings across Stories 1, 2, 3, 4, and 5 inform the pattern.
Decision blocked: BAH confirmation on whether TAK UI's design intent is to keep these system bindings outside the framework (leaving plugins to escape hatch into ATAK directly) or whether the framework will expand to expose them. The two sub-patterns may resolve differently. Until that choice resolves, the sprint estimates for the affected workflows depend on which path BAH takes.
> "This is the strongest intrinsic critique in the assessment because it generalizes. Every Gap where TAK UI shows the widget but does not expose the hook is an instance of this pattern (Gaps 5, 7, 8, 13). Consider elevating its position so reviewers see it before the cross-platform risks. The cross-platform issues are kernel-level (Risk 4) and outside TAK UI's control. This one is design-level and squarely inside it."

*Since Josh called out Gaps, 5, 7 , 8 and 13. I will provide them also for context, parirty and alignment

Gap 5: Color and fill configuration for section drawing
What is missing: TAK UI provides a color picker but no way to wire it to ATAK's drawing preferences, which is how section color and fill are managed today. Research from Story 2 (Section Color spike) confirms a new TAK UI API would be required to access and update drawing preferences.
What it blocks for migration: Migration of section color and fill controls in Story 2. The sprint estimate is unknown until the API scope is defined.
> Same Risk 3 pattern. TAK UI ships a color picker component but no API to read or write ATAK's drawing preferences (`SharedPreferences` keys for line color, fill color, etc.). The plugin has to reach into ATAK's preference store directly.

Gap 7: Map group change listener
What is missing: TAK UI provides map group creation but does not expose a change listener for managing markers and sections as the group updates. Research from Stories 3 and 4 (Building Detection Map Group spike) confirms; the spike remains an open item.
What it blocks for migration: Migration of building detection map group management in Stories 3 and 4. The sprint estimate is unknown until the listener scope is defined.
> These are the cleanest Risk 3 examples. TAK UI exposes the map group creation API and the map view via its `MapWidgets` surface, but does not expose change listeners or direct view access. Grouping these explicitly under Risk 3 helps the reader see the pattern repeating.

Gap 8: Map view access for custom overlays
What is missing: TAK UI does not expose the map view the plugin uses to manage custom overlays. Research from Stories 3 and 4 (Swipe Relabel Manager spike) also notes the swipe overlay itself is Android-specific and not provided through TAK UI; the spike remains an open item with MED confidence.
What it blocks for migration: Migration of the swipe relabel workflow in Stories 3 and 4. Custom overlay management on TAK UI has no current path.
> no comment left

Gap 13: GRG auto-import hook and WinTAK import resolver.
What is missing: TAK UI exposes an ATAK-specific import resolver but does not expose a hook to automatically import a created GRG, and WinTAK has no equivalent import resolver binding. The Story 5 GRG Auto-import spike confirms.
What it blocks for migration: the automatic GRG registration step in Story 5. Cross-platform parity for import resolving on WinTAK has no current path.
> "Two different gaps are getting wrapped into one here. First, the ATAK auto-import hook is missing in TAK UI even though the underlying ATAK API supports it. Second, WinTAK has no import resolver binding at all. Those need different remediation paths (TAK UI feature work versus WinTAK kernel or binding work), so splitting them into two gaps gives cleaner scoping."

---

## PM LEVEL RECAP OF TAK UI MIGRATION ASSESSMENT




## PM Script & Talking Points for the Final Presentation Demo

01. Openining/Welcome Slide [ABEL]
>  greetings

02. Agenda [ABEL]
> callout what we are gonna be presenting

03. Acknowledge their Milestone Schedule [ABEL]
> Quick callout

04. `2.0` SPRINT 4 ACCOMPLISHMENTS [ABEL]
> Go over what we got done the past two weeks across the 4 tasks

05. `3.0` SOW Deliverables: 4.3.1 - 4.3.4 [ABEL]
> highlight the complete set of deliverables that we have provided throughout the bridge contract AND what were complete during this sprint
06. Tie it the enabling outcomes and future mission outcomes [ABEL]
> how the work relates, and there is a causal chain to the broader organizational, partnership objectives and the mission.

05. `4.0` TAK UI Migration Assessment
>  


`5.0` [JON] ==> Nizme framing.. "Nik wanted us to evalute" - evaluate, architecutre.
///my question: current state learning, fits where?
- add "a slide" to lead into it..  tie it in.. 
KEVAN "maneuvers is highest-friction, dont say that
// my question: future sate vision -- "the bets"
* And 

00. Next Steps + Handoff / Dependencies [ABEL]
> 
00. 


--

PoP Summary
- 

How do they want us to send this to them?


to Nik Focus - DONT `SOFMC`
dont lean on what we are gonna do

We wanna hadn off a prioritized list
for yall ti take
Close the loop hand of