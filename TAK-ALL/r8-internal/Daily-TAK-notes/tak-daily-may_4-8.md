# TAK Bridge — Week of May 4 to May 8
---
## Hand-Off Summary and Monday Prompt

You are picking up TAK Bridge PM work as of Monday, May 4, 2026.
> Sprint 3 closed the week with the ProGuard and reflection fix resolved, the app-crashing export bug fixed, and the user manual delivered to SOCOM, all awaiting DT feedback. The TAK UI migration assessment is the primary in-flight deliverable, with a content target of May 7/8 and a May 15 delivery date, and Stories 3, 4, and 5 still to be assessed internally. The first priority Monday morning is the BAH sync with Nathan to close Story 2's open component questions and confirm Nathan's support for the radial menu contribution, followed by getting Thomas's feedback on the assessment document structure.

**Open threads to be aware of:**
- DTs submitted `dt-defect-report-spreadsheet-v5.4-v5.6.csv` with 22-23 issues late Friday, May 2; triage with Jonathan needed before Sprint 3 scope is finalized
- 5.6 operator stability scope against May 15 vs. extension not yet defined; depends on DT triage results
- GOTS and MOSA eval WIP visibility: Abel needs a status read from Kevan and Jonathan before May 15

**Reference files:**
- Outcomes: TAK-ALL/tak-oor.md
- Latest drumbeat: TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/db-wk6.md
- Last week's discussions and notes: TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-april_27-may1.md
- This week's notes: TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-april_27-may1.md

---

## Focus for the Week of May 4 to May 8

1. The BAH sync Monday morning with Nathan closes Story 2's open component questions and confirms whether the Radial Menu contribution has Nathan's support through review and merge. Those two answers determine how much of the migration assessment can be locked down before the end of the week. 
- Thomas's feedback on the TAK UI Migration Assesment document structure comes Monday morning as well. Get both before the week loads up.
*Outcome: Rise8 team shifted from TAK UI consumer to key contributor*

2. Complete the internal assessment on TAK UI workflow Stories 3, 4, and 5, and get all content into the document before Thursday. The content window closes May 7/8 so Kevan has what he needs to write the cost and timeline section. Seven to eight working days is what's left to the May 15 delivery.
*Outcome: Rise8 team shifted from TAK UI consumer to key contributor*

3. Triage `dt-defect-report-spreadsheet-v5.4-v5.6.csv` and `dt-issues-doc-v5.4.md` with support from Jonathan before end of day Tuesday. Getting a scope decision on what is realistic for week of May 11th vs. the extension is what keeps Sprint 3 from absorbing unbounded bug work on top of the assessment.

4. Prepare and run the Sprint 3 demo on Wednesday, May 6. The pre-caching and imagery status feature is the story: operators now get a signal before building detection runs instead of launching into it blind. The PM update runs the same day and will need prep time.

5. Get a current read from Kevan and Jonathan on where the GOTS and MOSA eval stands. The eval is primarily theirs to drive, but knowing the state of the deliverables before May 15 is Abel's responsibility to confirm.

6. Move the outcomes work forward with Jonathan. The April 29 session produced a measurable target. Getting the hypothesis into GitLab and connecting with Michael Maye about Claude Code's GitLab integration turn the session output into something the team and leadership can track.
*Outcome: Special Operation Forces Team Leaders produce GRGs with accurate building labels in less time and with less effort.*

---

## Resolved/Open Issues and Matters: Week of April 27 to May 1

### CATEGORY 1: Completed, Awaiting DT/SOCOM Feedback

**ProGuard and Reflection Fix**
Description: Zach removed reflection usage causing silent failures in .mil builds. Fix addresses pre-caching timeouts and any other affected paths. Submitted to DTs. Awaiting confirmation that .mil builds are stable in the field.
- Resolution: SOLVED
> COA: Abel to confirm stability with DTs when they respond.
---
**App-Crashing Export Bug (5.6)**
Description: App-crashing defect on GRG export resolved. Both 5.4 and 5.6 builds confirmed stable for DT testing per drumbeat. No further Rise8 action required pending SOCOM acceptance.
- Resolution: SOLVED
> COA: DT to confirm in acceptance review. No Rise8 action pending.
---
**User Manual Delivery**
Description: User manual merged and published to the Package Registry. Jonathan has reviewed content and submitted suggested revisions. Awaiting external confirmation from SOCOM that the manual is accessible and acceptable.
- Resolution: WIP
> COA: Abel to confirm receipt with Chad once SOCOM acknowledges.
---
### CATEGORY 2: In Backlog, Prioritized for Sprint 3

**DT Bug Backlog Items #62 and #63**
Description: Two GRG-closing behavior bugs from DT Cliff formally logged. #62: closing GRG removes grid but leaves building labels on map. #63: building labels outside named sections remain after saving and closing.
- Resolution: OPEN
> COA: Engineering to address in Sprint 3. Abel to confirm sprint assignment and priority with Kevan.
---
### CATEGORY 3: Needs Review, Triage, and Scope Decision

**`dt-defect-report-spreadsheet-v5.4-v5.6.csv`**
Description: DTs submitted a spreadsheet with 22-23 defect reports late Friday, May 2. Three to five items may already be logged. Overlap with `dt-issues-doc-v5.4.md` not yet assessed. Full PM triage required before sprint inclusion.
- Resolution: OPEN
> COA: Abel to triage full spreadsheet, identify duplicates, and scope against May 15 vs. extension. Jonathan to assist.
---
**`dt-issues-doc-v5.4.md`**
Description: DT Josh's separate document covering 5.4 issues. Not fully triaged. May overlap with `dt-defect-report-spreadsheet-v5.4-v5.6.csv`. Jonathan offered to help Abel work through it.
- Resolution: OPEN
> COA: Abel and Jonathan to complete triage. Scope against May 15 to be determined.
---
**5.6 Operator Stability: DT Feedback Scope**
Description: Drumbeat calls for scoping priority fixes for 5.6 over the next two weeks. What is realistic for May 15 vs. the extension month is not yet defined.
- Resolution: OPEN
> COA: Abel to define scope with Kevan after DT triage is complete.
---
**`assembleProduction` Job Slowness**
Description: Job intermittently exceeds GitLab 60-minute limit, failing before a release-ready APK is produced. Parked as lower priority than TAK UI work. No confirmed resolution or timeline.
- Resolution: OPEN
> COA: Kevan to confirm conditions for reprioritizing. No action until confirmed.
---
### CATEGORY 4: Top Priority 1, TAK UI Migration and BAH Sync

**TAK UI Migration Assessment Document**
Description: Assessment report covering cost and timeline estimate for migrating AI GRG to TAK UI. Content target is May 7/8. Thomas feedback needed Monday. Section 3/4 structure still being finalized.
- Resolution: WIP
> COA: Abel to get Thomas feedback Monday. Kevan to complete cost and timeline section. Deliver to SOCOM by May 15.
---
**Remaining TAK UI Workflow Stories for Assessment (Stories 3, 4, 5)**
Description: Three user story workflows not yet assessed for TAK UI component coverage. BAH sync on May 4 expected to close open component findings on Story 2 first.
- Resolution: WIP
> COA: Abel to complete Stories 3, 4, and 5 internal assessment this week. BAH sync May 4 closes Story 2 open findings.
---
**Radial Menu TAK UI Contribution (First End-to-End)**
Description: Josh building the radial menu contribution. Nathan alignment on Monday May 4 required to confirm review and merge support. First-time contribution process is a flagged risk.
- Resolution: WIP
> COA: Rise8 to align with Nathan on Monday to confirm review support. Josh owns implementation.
---
**`ActionBarView` Spike (Thomas)**
Description: Thomas testing Nathan's shared MR to determine if `ActionBarView` covers Rise8's use case. Finding feeds directly into the migration assessment document.
- Resolution: WIP
> COA: Thomas to complete testing and document findings. Abel to incorporate into the assessment document.
---

### Category 5: Top Priority 2, Demo and PM Update, May 6

**Sprint 3 Demo, May 6**
Description: Demo scheduled May 6 at 11am. Pre-caching and imagery status feature is the demonstration focus. Demo script preparation noted as needed.
- Resolution: OPEN
> COA: Abel to prepare demo script. Jonathan to assist. Team to coordinate setup before Wednesday.
---
**Tile Caching Messaging: User Story and Documentation**
Description: Team agreed no development proceeds until tile caching messaging improvements are captured as a formal story. Story and documentation not yet created. Demo on May 6 will showcase current messaging behavior.
- Resolution: OPEN
> COA: Jonathan to help Abel create documentation and a formal story before development begins.
---

### Category 6: Top Priority 3, GOTS Evals

**GOTS Maneuver Domain Follow-Up**
Description: Maneuver domain working session with SOCOM completed last week. Follow-up session to advance the shared capabilities framework is not yet scheduled. Nik is out of town until May 15.
- Resolution: OPEN
> COA: Abel to follow up with Kevan on the next step. Nik unavailable until May 15.
---
**GOTS and MOSA Eval WIP Visibility**
Description: Kevan and Jonathan are the primary drivers on GOTS and MOSA evaluations. Abel needs a current status read from both before the final stretch to May 15.
- Resolution: TBD
> COA: Abel to get a status update from Kevan and Jonathan this week.

---

### Category 7: Lowest Priority
**Post-Mortem and Retro**
Description: Sprint 2 post-mortem was never held. Lower priority given the May 15 deadline. Abel considering folding it into a regular retro. Format and date not confirmed.
- Resolution: TBD
> COA: Abel to decide whether to fold into a regular retro or defer. No owner or date confirmed.
---

### Category 8: Top Priority 4, Outcomes

**Outcomes in Prod: Hypothesis and Metric Formalization**
Description: April 29 session established 50% time reduction for labeling 200 buildings as the measurable target. Standardized Figma template in use. GitLab documentation and formal stories not yet created.
- Resolution: WIP
> COA: Abel to create GitLab documentation and stories. Jonathan to contribute insights from user mapping and Nik's ideal state conversation. Abel to conTAKt Michael Maye (as directed by Jeff Wills) to explore how Claude Code can write issues directly into the GitLab backlog.
---

### Category 9: Low Priority, Post-May 15 Discussion

**Contracting: Production Access**
Description: Nik indicated in the April 24 meeting that contributing code to production TAK systems would require a SOCOM email and CAC. No action or owner assigned on Rise8's side.
- Resolution: OPEN
> COA: Abel to clarify scope and path with Kevan. No action expected until post-May 15.
---
**TAK Offsite, August 17-21**
Description: Nik recommended Rise8 make hotel reservations for the TAK Offsite conference. Attendee list from Rise8 is not confirmed.
- Resolution: OPEN
> COA: Abel to confirm attendee list with Kevan and Sharon before reservations are made.

---

## TAK UI Assessment — Session Handoff, May 4, 2026

**HANDOFF PROMPT — TAK Bridge PM, May 4-5, 2026**

You are picking up TAK Bridge PM work. The primary in-flight deliverable is the TAK UI Migration Assessment document (`TAK-ALL/takui-migration-assessment.md`), due May 15. Content target is May 7/8 so Kevan has time to finalize Section 5.

**Read these files before doing anything else:**
- `TAK-ALL/takui-migration-assessment.md` — assessment document, current state
- `TAK-ALL/takui-migration-workflows.md` — Stories 1–4 with scenario tables, Story Assessment, and Nathan Decision Points
- `TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-may_4-8.md` — this week's open threads and priorities
- `TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/db-wk6.md` — current customer drumbeat

**What was completed in the last session:**
- Section 3 restructured: one consolidated Plugin Component Reference table replaces the old split format. Three entries confirmed (CustomGrid, GridTransformer, MapMenuWidget/MapMenuFactory). Remaining rows fill in as spikes complete.
- Section 4 restructured: workflow-level scope summaries replace component bullet lists. Two entries confirmed (Radial Menu under "Requires a TAK UI Component", Grid Parameters under "Stays in Plugin by Design"). Remaining entries fill in as spikes and BAH sessions complete.
- Section 5 restructured: revised headers (Sprints ATAK / Sprints WinTAK / Confidence / Notes), four rows aligned with Section 4 scope categories, hypothetical estimates populated.
- Section descriptions for 3, 4, and 5 updated to make the causal chain explicit: Section 3 is the evidence, Section 4 is the scope decisions, Section 5 is the sprint estimates that follow from those decisions.
- Old format comparison blocks removed from Sections 3 and 4.

**The causal workflow — how everything connects:**
1. `/takui-stories` skill + engineer review fills out `takui-migration-workflows.md` (Stories 1–4 done; Story 5 Export GRG not yet written)
2. TAK UI Assessment Spikes validate individual components — engineers document findings in Sections 3 and 4
3. BAH/Nathan sessions confirm or revise findings — spikes close Round 2 after Nathan alignment
4. PM closes spikes, Section 3 and 4 entries confirmed
5. Kevan reviews Section 4 and fills in Section 5 sprint numbers — he owns the three WinTAK TBD cells and the final estimates

**What's remaining for the assessment:**
- Stories 3, 4, and 5 workflow analysis not yet complete
- Four pending validation spikes: floating toolbar (Thomas in progress), slider, grid labels, label reordering
- Kevan to scope WinTAK TBD cells and finalize Section 5 numbers

**Nathan call prep — BAH sync Monday May 4:**
Close Story 2's open component questions and confirm Nathan's support for the radial menu contribution. Questions are drafted in `tak-daily-april_27-may1.md` under "QUESTIONS/PREP FOR BAH CALL on MAY 4." Four questions: SET_TOOLBAR/UNSET_TOOLBAR broadcasts, DrawingPreferences, ATAK DrawingTools API, android.app.AlertDialog. Abel also needs to confirm Nathan will grant Josh fork access to the TAK UI repo in the Rise8 group so Josh can submit the radial menu MR.

**Thomas — ActionBarView spike:**
Thomas is testing Nathan's MR 306 to determine if ActionBarView covers Rise8's use case. That finding either moves floating toolbar to Ready to Migrate (adds to Section 4, low sprint estimate) or to Requires a TAK UI Component (adds to Section 4, increases Section 5 estimate and adds a BAH dependency).

**Kevan — Section 5:**
Section 5 has four aggregate rows, one per scope category. Individual workflow items live in Section 4. Kevan's job is to review the Section 4 scope decisions and fill in the sprint numbers. The hypothetical estimates in the file (2–3 sprints Ready to Migrate, 2–3 Requires TAK UI Component, etc.) are placeholders grounded in context — not confirmed numbers.

**Skills to use:**
- `/takui-stories` — for running Story 3, 4, or 5 workflow spikes
- `/tak-issuedrafting` — for drafting TAK UI Assessment Spike artifacts (Type 5)

---

# Monday 8am Prep - Issue Triage (dt-issues-doc-v5.4 anddt-defect-report-spreadsheet-v5.4-v5.6)

### What's already in the our GitLab Backlog

> DONE: resolved and delivered to DTs
- #45: BUG: Closed Grid Reappears on Map Tap Without Center Point or Radial Menu Controls
- #46: BUG: Delete section confirmation dialog displays "undefined" for section name after AI detection is run
- #57: BUG: Plugin runs detection on backup image when tile capture fails, producing false building detections
- #59: BUG: Crash! Plugin Crashes with Data Loss on Scale Bar / Meters Selection During Export GRG Flow
- #62: BUG: Closing GRG removes the grid but leaves building labels visible on the map
- #63: BUG: Building labels outside named sections remain on the map after saving and closing a GRG
- #70: BUG: ATAK crashes when using radial menu delete after building detection has been run

>> Abel initial triage

### Get rid of redundancies
 
 > ALL READY CAPTURED IN OUR GITLAB BACKLOG (regardless of status)
- **06/v5.4: buildings outside of Grid (v5.4 only)** — Note added to #62 and #63 on May 4. Engineers to confirm when in the code for those fixes: does the save/load lifecycle share the same label state management path as the close behavior? If yes, the fix covers this. If no, a separate bug will be logged for the v5.4 reopen behavior.
- **SDT-54 — User manual** — Fixed week of April 28. No GitLab issue number on record.
- **SDT-58 = 01/v5.4 — AI GRG prompts to load GRG when it is already in use** — DTs could not re-create. Jonathan impact: Low. No ticket needed.
- **SDT-59 = 02/v5.4 — AI GRG resizes grid to 2 or 3 grid squares unexpectedly** — DTs could not re-create. Jonathan impact: Medium. No ticket needed until repro is confirmed.
- **SDT-67 = 10/v5.4 — Tapping X closes the toolbar, not AI GRG** — Labeled improvement by DTs, not a bug. No ticket.
- **SDT-68 = 11/v5.4 — GOOGLEHYBRID imagery causes detection to pick non-buildings (driveways, trailers, wood piles)** — Labeled improvement by DTs. Map layer accuracy limitation, not a plugin defect. No ticket.


 > REPORT/FEEDBACK IS NOT CONCLUSIVE, NEED MORE INFO FROM DTs
- **04/v5.4 / SDT-60 — Section Building Detection Inconsistent** — Hard to reproduce on 5.6 but because of their bad instructions. Jonathan impact: Low. Need to follow up with DTs: Can they reproduce consistently? What device, what area, what build? Do not log a bug until reproducion is confirmed, BUT Me and Jonathan did find a different behavior on 5.6 when attempting to reproduce their issue:
- first run got 32 buildings
- second run got 11, but we were expecting 0 despite checking the box to skip sections with detections, and it already detected 32, why now 11?


### Ruthless Prioritization - reporduce and determine priority for backlog

 > ASSUMED HIGH PRIORITY [6 to 10 hours],(negatively impacts the user and prevents them from executing their mission effectively)

- **SDT-70 — Deleting Grid from Radial crashes ATAK (5.4 and 5.6)** — GitLab #70 | **FIXED — resolved by Zach, May 5** | Confirmed on 5.4 by Thomas, confirmed on 5.6 (build 7134bef8) by Abel, both on May 4. Delivered to DTs for confirmation.

 > ASUMMED MEDIUM PRIORITY [2-3 days], (user is impacted but there are work arounds and can be addressed eventually)

- **03/v5.4 — Duplicate building numbers after reopening a saved GRG (5.4 and 5.6)** — Confirmed on 5.6 by Abel on May 4. After save → close → reopen, building labels 002, 003, 004 appear duplicated. Operator must delete map data and restart the labeling flow. Note to engineers: SDT-71 describes a similar symptom triggered by running detection a second time — confirm whether both share the same root cause when in the code.


 > ASSUMED LOW PRIORITY [post-bridge-contract] (on the edge between an observation or potentail issue that has minimal impact on user, there are work arounds)

- **08/v5.4 — Grid does not load when opening a GRG re-saved under a new name (v5.4 only)** — Repro: Create GRG → Save → Re-save as new name → Close → Load newest saved GRG → Grid does not populate. Jonathan impact: Medium. Logging as Low — v5.4 only, workaround is avoid re-saving under a new name.
- **FEATURE REQUEST: Anchor center point when adjusting grid spacing** (07/v5.4 / SDT-65 — duplicate reports across both DT docs) — Currently the center point shifts 20-50m when spacing is adjusted. Jonathan assessed as intended plugin behavior; any change is a feature add, not a bug fix.
- **05/v5.4 — Detected buildings not visible at certain zoom levels** — Jonathan confirmed standard TAK label/marker behavior at various zoom levels. Not a plugin issue. No action.
- **SDT-57 — Deleting a Manual Label marker creates a new one** — Intended plugin behavior, confirmed by Jonathan and Thomas. DTs included the workaround in their own report (de-select Manual Label icon before deleting). Not a bug. FLAG: Discuss with SOCOM and get input from SOF Team Leads on whether current behavior meets operational needs before any change is scoped.
 
 --

 off load them to engineering

 * replicatede it
 * determine next steps

 --

we dont worry about them, documenting

-- 

Zach Scenarios for each message they will see

-

high quality images (tiles) to give us the best detections
goes ON LINE to grab those, however KMZs wont need to do that
they already have to.. 

NO PRE-CACHE REQUIRED (Local hq image)

NO FILES availaable, Mobile Imagery
- Pre Caching Imagery (going on line pulling that data in)
- Will let you know RESULTS (categories)
* 100% = success (pre-catching completed)
* Less than 10% = Some did not cache
* 25% at least = a significantt did not cahce
* over 25% = Fail to fetch tiles properly, lower quality

SIMULATE, Turn off Wifi

If you are on MOBILE< make. a GRG now. pull that mobile tab>

 ----

[MONDAY] May 4th, Daily Stand Up

[THOMAS]
- Friday (training)
- ToolBar and Slider
- No questions for Nathaan 


[ZACH]
- Repo correct?
- Get his passwords done?
> every month, reset his account to pick up his certs

[JONATHAN]

- research effort call with Nik, review feedback from DT
- 
[KEVAN]

---

Cost and Time Line - Not in TAK UI yet that we migth want to add to TAK UI

--

Thomas what might simplify this, intead of categorieze, and Sprints and Confidence
FORE EACH component we research

---


## DAILY STAND UP, May 5th 

### Summary

Team aligned on demo preparation and sprint reporting via coordinated technical updates and onboarding new members.

**Technical Demo Preparation**
The team finished bug triage and confirmed the fix for the critical application error. Demo slides were collaboratively updated to include Sprint 4 work and 4 specific deliverables.

**Onboarding and Workflow**
New team members successfully integrated into the workflow through context gathering meetings. Backlog spikes were assessed to refine current project requirements.

**Finalizing Sprint Reporting**
The team decided to finalize the sprint report content including 4 tasks. Documentation and code review follow-ups were prioritized to ensure progress.

### Next steps
[Abel] Share Pictures: Find and share Cinco de Mayo pictures with the group.
[Abel] Update Backlog: Finish putting non-priority items into the backlog. Prepare items for IPM discussion.
[Jonathan] Onboard Mary: Spend time bringing Mary up to speed on current work.
[Zach] Record Demo: Get the demo recording completed today before the prep meeting.
[Thomas] Complete Training: Complete the overdue security briefing training.
[Abel] Share Deck: Share the demo slide deck link via Gmail.
[The group] Fill Slide Content: Help fill out slide information related to GOTS evaluation and May 15 deliverables. Detail sprint 3 accomplishments, including the maneuver domain discussion.
[Abel] Send Materials: Send Nathan the requested materials.
[Abel] Nudge Reviewer: Ping Nathan to nudge him about reviewing Joshs MR.
[Abel] Schedule Pairing: Ping Mary to schedule pairing sessions for demo stuff and bug triage.


### Details

**Demo Preparation and Immediate Tasks:** Abel provided an update on the AI GRG plugin, mentioning a quick overview was given to Mary Pollin yesterday, including discussions on improving SOCOM's plugin ecosystem. They finished the triage of all incoming bugs, confirming that the one fixed by Zach was the only one that was breaking the application, and the internal release pipeline is now running to verify the fix before sending it to the DT team. Abel also paired with Zach to review the demo slide covering scenarios, posts, and application conditions, and plans to finish their script for a dry run later today.

**UI Support and Research Initiatives:** Jonathan stated their focus this week is on pairing and supporting the UI work. They also met with Nik to research and better understand the context of atTAKk and mission planning. Jonathan committed to spending time bringing Mary Pollin up to speed and meeting with Kevin to discuss the MOSA scorecard and clarify deliverables for GOTS and MOSA requirements.

**Bug Fixes and Demo Recording:** Zach confirmed the resolution of a critical bug, which also inadvertently solved issues related to the panel closing and radial closing by syncing their workflows. Zach plans to get the recording done for the demo today, ideally before the scheduled demo preparation, and informed the team they will be unavailable after 3 PM.

**Backlog Triage and Training Requirements:** Thomas reported that the assessment was filled in for a couple of items, which were drastically slimmed down with Abel and Zach yesterday. Thomas has started going through more spikes in the backlog and also needs to complete a past-due security briefing training.

**Path Forward and Sprint Reporting:** Kevan is working on a few different things, including a potential path for chat, the MOSA scorecard, and determining what content to include in the sprint report. They noted that Nick and others are generally aligned on the direction, meaning the focus is on content for the sprint report and the demo presentation.

**Onboarding and Context Gathering for New Team Member:** Mary Pollin confirmed meeting with Kevin and Abel yesterday to gain context and get up to speed on current activities. Mary Pollin also has calendar invites for meetings today to continue gaining context and requested a meeting with Jonathan if their schedule permits.

**Demo Slide Deck Collaboration and Sprint Documentation:** Abel requested help filling out the demo slide deck with information regarding the current work in progress for Sprint 4 and the expected deliverables for May 15, specifically concerning the GOTS evaluation, which involves four tasks: SDK version 5.6, production TAK UI migration, assessment model plugin improvements, and GOTS evaluation. They also asked for input on accomplishments from the previous sprint (Sprint 3), beyond the maneuver domain discussion with Nick, for slide five, slide seven, and slide eight.

**Upcoming Check-ins and Follow-ups:** Thomas reminded Abel to send the information they promised to Nathan in Mattermost yesterday. Thomas also emphasized the need to push for Nathan to review Josh’s Merge Request (MR), as Josh is likely waiting for that feedback before completing their contribution. Abel acknowledged the necessity of following up with Nathan regarding the MR and sending the promised documentation.


[Jonathan]
- Met with Nik, TAK mission planning
- *Deliverables for GOTS and MOSA*
> GO BACK! MOSA/GOTS Evals

[Kevan]
- working on a few differnet thigns, path to prod, For Chad (quick turn around)
- MOSA ScoreCard, Nik is aloinged no tmuch ocon

[Thomas]
- He got the assessment filled in , 
- started going though more of the spike sin the backlog
- other than those, he needs to do the security briefing!
- *SECURITY BRIEFING*
- NATHAN HAS NOT REMOVED 

[Zach]
- Crash Bug + panel closing an dradial closing were not using the same workflow, sync them now doing the same thing.. solved othrs
- RECORDING DOWN for the demo
- Not available AFTER 3pm

--

# GOTS EVAL: MOSA Scorecard plugin criteria discussion

**Summary*
Team discussed Modular Open Systems Approach evaluation criteria and consolidated report deliverables for contract closure.

**Defining MOSA Evaluation Scope**
Evaluation tracks must define modularity and scalability through 3 specific plugins. Success requires showcasing integrated architecture and functional data sharing.

**Establishing Deliverables and Ownership**
Final deliverable is a single report detailing plugin ecosystems and architecture. Team members agreed to synthesize architecture, user evidence, and user interface content accordingly.

**Final Report Timeline**
Report outline is due by Friday. The final document submission is scheduled for the 13th to ensure completion before the 15th.

### Next steps
[Kevan] Grant Access: Add Mary Pollin to the Google route for share drive access.
[Kevan] Lead Report: Run with the GOTS modularity and scalability evaluation report development.
[Abel] Provide TAK UI Content: Give Kevan the TAK UI synthesis and content.
[Jonathan] Share UX Risk Writing: Share the compendium of user experience risk and design problems writing.
[Kevan] Create Report Outline: Get a first pass rough agenda or outline for the final report submission by Friday.


### Details

**Meeting Logistics and Participant Locations:** The meeting began with a brief discussion about the timing of standups, which was previously scheduled late to accommodate team members in Mountain and California time zones, but now most of the team is on the East Coast (00:00:00). Mary Pollin confirmed that they had recently moved to Florida, near Jacksonville (00:02:37).

**Access to MOSA Scorecard and Project Context:** Jonathan opened the meeting by noting they needed to focus on the Government Off-The-Shelf (GOTS) modularity aspects for the Modular Open Systems Approach (MOSA) (00:03:31). The draft document for the MOSA scorecard was shared via a link, and access needed to be granted to Mary Pollin, who had not yet been added to the Google group for the shared drive (00:04:25).

**Defining the GOTS Modularity and Scalability Evaluation Goal:** The team established that the GOTS modularity and scalability evaluation was a key remaining track of work that needed definition, and they aimed to define what "done" looks like for this evaluation (00:06:10). Jonathan sought to understand the deliverables and ensure proper collaboration and design input, particularly regarding the operator evidence for the evaluation (00:07:14).

**Evaluation Scope and Success Criteria:** Kevan proposed that the evaluation should define modularity and scalability within the project context and evaluate three specific plugins—Trailblazer, Combat Swim, and Spot Plot—against that definition. The success of the evaluation will be defined by showcasing what a good MOSA architecture looks like, specifically how these plugins can share data, communicate, and integrate functionality without acting as silos (00:08:27).

**Defining the Deliverable for GOTS Evaluation:** Jonathan outlined several artifacts related to the evaluation, including the orienting scenario, the MOSA scorecard draft, and a future state journey map with mockups (00:11:08). Kevan clarified that the final deliverable should be a single report that covers the current state of the plugin ecosystem, the target state, and incorporates the MOSA scorecard, effectively detailing the evaluation of modularity and scalability (00:13:32).

**Incorporating TAK UI Assessment into the Evaluation:** Abel questioned how the evaluation would address the potential contention point of the TAK UI (00:14:44). Kevan suggested that while TAK UI poses difficulty in weaving into a single coherent narrative, the evaluation could address it by demonstrating that it increases engineering cost and introduces user risk, which can be underpinned by engineering evidence and user experience risk information (00:15:57) (00:22:28). They agreed that the TAK UI content could be included as part of the broader TAK UI migration assessment and then linked into the GOTS evaluation report, or included as separate documents stapled together as the overall evaluation (00:18:47).

**Ownership and Contribution to the Final Report:** The team discussed who would own the final deliverable for the GOTS evaluation (00:19:55). Kevan offered to run with the ownership, synthesizing the overall architecture and software evaluation. Jonathan confirmed they would contribute design input, focusing on user evidence and the user-centric aspects of the MOSA evaluation and scorecard (00:21:09) (00:28:01). Abel committed to providing the necessary TAK UI synthesis and content, noting that Thomas has also been helpful with that material (00:22:28).

**Report Aggregation and Timeline:** Abel suggested that most of the content for the GOTS evaluation already exists and mainly requires aggregation, while the TAK UI content is still being finalized (00:24:32). Kevan set a target to have a rough agenda or outline of the final submission by Friday to identify any missing data, with the goal of completing the final report by Wednesday, the 13th, to provide a buffer before the contract closure on the 15th (00:25:33).

**Input Submission Method and Demo Focus:** Jonathan asked how to provide input on the MOSA evaluation, and Kevan suggested using comments in the document or creating a separate tab within the existing Google Doc to keep all content collocated (00:26:48). Kevan advised that the upcoming demo should focus on the plugin fixes and work with the Defense Threat Reduction Agency (DTRA) folks, only briefly touching on the GOTS evaluation by mentioning the final report will be submitted for the closeout (00:28:57).

### Abel's MOSA MEETING Raw Notes - 1030 - May 5th

- Kevan sent a draft document for MOSA Scorecard

**TAK MOSA Baseline Architecture Principles**

- modularity AND scalability, evaluate the plugins based on that and showcase what a "good" MOSA architecutre be here, 

> The orienting scenario?

WHAT IS THE DELIVERABLE?
- A REPORT
* Current State
* Target State

**We should talk about TAK UI**
- from a modularity and scalability point of view, hard to LUMP it all

4 separate docs? or a single report?

- reduce cost (nik)
- redude risk (to mission and force)

TAK UI is adding a whoe lot more..
lower visibility and testing func

there is a way to say this.. 
without calling TAK UI "ugly"
TAK UI migration assessment, incosistent support for different compoenents, 

A ROUGHT AGENDA by EOD Thursday, Early Friday

---

# IPM - Tuesday May 5th 

### SUMMARY
Meeting reviewed ongoing bug fixes and Tag UI migration status via status updates and prioritization alignment.

**Bug and Task Reviews**
Floating toolbar task remains in acceptance pending documentation. Teams confirmed fixes for grid reappearance and scale bar crashes while awaiting external validation.

**UI Migration and Prioritization**
Team prioritized Tag UI assessment documentation. Members agreed to defer lower priority building label issues to focus on critical migration and rendering tasks.

**Demo Prep and Cleanup**
Testing version 5.4 remains the final verification priority. Team members confirmed demo content and split remaining technical tasks to maximize productivity.

**Next steps**
[Abel] Confirm Bug Fixes: Follow up with Chad and DTS to verify scale bar and grid reappears bugs are solved on their end.
[Abel, Josh] Update Tag Findings: Ensure migration findings are transferred over to the tag UI migration assessment.
[Abel] Check DTS Manual: Check with DTS today to ensure the AIGRG plugins user manual first implementation is good.
[Abel] Send Triage Findings: Reach out to DTS before end of day with preliminary triage findings grouped into different buckets.
[Abel] Test Bug Fix: Test versions 5.6 and 5.4 to verify resolution of the bug that crashes the radio menu delete.
[Nathan] Review Merge Request: Review the merge request environment opened by Josh and provide required feedback.
[Abel] Run Claude Pairing: Finish running Claude pairing on remaining stories 3, 4, and 5 for tag UI assessment. Cross-check against documentation drafted by Josh Miller.
[Abel] Update Acceptance Criteria: Trim and update acceptance criteria on Tag UI stories to reflect the new format.
[Abel] Check Bug Resolution: Check resolutions for bug 62 and bug 63 during the original issue review.
[Abel] Document GRG Labeling: Document findings regarding multiple GRGs causing label issues and talk to Jonathan about plugin functionality.

### DETAILS

**Initial Check-in and Technical Issues:** Abel started the meeting while struggling with a single-screen setup due to a lack of Wi-Fi at their home office, affecting over 2,000 houses or businesses in their Jupiter, South Florida, area. After confirming that the screen share was visible, they moved to review the acceptance column in GitLab.
Floating Toolbar/Action Bar Acceptance: The team discussed the "floating toolbar/action bar" task, which Thomas noted was simplified and straightforward from an engineering standpoint. Abel decided to leave it in acceptance status until the associated document is complete, confirming there are no risks or open items associated with it.

**Bug Crashes on Scale Bar:** The bug related to crashes with data loss on the scale bar was noted as complete, but Abel needed to follow up with Chad and the DTS team to confirm it was solved on their end, as the team was still referencing it in their assessment as of Friday.

**Grid Reappearance Bug:** The bug where the grid reappears without a center point was discussed and confirmed to be fixed, with Zach clarifying that Thomas had narrowed down the issue after Abel found it. A follow-up with the DTS team is required to confirm the fix.

**Spike: Tag UI Abstraction and Native Rendering Support:** Abel noted that Nathan had not made progress on the "Spike validate tag UI radio abstraction and draft nested radio". Abel planned to follow up with Nick, even though Nick is out, and to ensure that findings regarding the tag UI native rendering support and JRG grid display make it into the Tag UI migration assessment document.

**AIGRG Plugins User Manual and Testing:** Thomas suggested that the team needs to "write up our test plan" to provide to the DTS team, as many items sent to them, including the AIGRG plugins user manual first implementation, have not received a response. Abel agreed and committed to sending a preliminary triage findings report to the DTS team before the end of the day, grouping issues into buckets such as unknown requests, actual bugs, and feature requests.

**In Progress Items and Acceptance Movement:** Abel reviewed items in the "In Progress" column, noting the GOTS evaluation report outline is owned by Kevin and Jonathan. A bug concerning crashes when using the radio menu delete after building detection finished compiling was moved to acceptance so that Abel could test it today before sending it to the DTS team.

**Blocked Tag UI Spike and Grid Labels:** The spike to identify and contribute one Tag UI component is blocked, pending a review and feedback from Nathan on a merge request opened by Josh. Thomas confirmed they are working on the grid labels, legend, render, and map UI tasks, which they expect to finish soon, noting that it will be more complex than other items in the document.

**Tag UI Migration Assessment Prioritization:** Abel explained the process for completing the remaining three stories (three, four, and five) of the Tag UI migration assessment, which involves using Claude for repo scanning and then getting feedback from Thomas, Zach, and Kevin. Abel noted that they still need to trim down acceptance criteria for several prioritized items, including the Tag UI assessment spike on drawing preferences, to reflect the new format.

**Radial Menu Deletion Bug Correction:** Zach confirmed that in solving the radial menu and panel issue, all labels now delete when closing, correcting the issue when labels were inside a section, but the issue with outside labels remaining still needs to be checked. Abel assigned themself to check the remaining issue of outside labels.

**Bug: Building Labels Remaining on Map:** The team discussed a bug where building labels outside of named sections remain visible on the map after saving and closing the GRG. Abel agreed with Thomas' assessment that this issue is not breaking anything and should be left as a lower priority to focus on Tag UI work, especially since workarounds exist.

**Bug: Building Labels Bleed Between GRGs:** Abel reported a new bug where building detection labels from a saved GRG bleed into a newly created GRG. Thomas argued that the duplication of labels (e.g., 002 appearing in both GRGs) is not a bug but a training/design issue because the GRGs do not have different naming schemes by default. The only actual bug identified here is that labels are still showing from the closed grid, which is related to a separate, existing issue.

**Second Building Detection Reporting Issue:** Abel presented a newly found issue where a second building detection run inside a marked section reports a building count (e.g., 15 buildings) despite the "skip sections with existing markings" option being enabled. Thomas suggested this is mostly a design change issue and agreed that it should simply state that the section was skipped instead of reporting a building count.

**Final Tasks and Demo Preparation:** Abel outlined their immediate tasks: testing version 5.4 to verify fixes, writing a message to the DTS team about solved issues, and preparing for the demo dry run. Thomas confirmed they would skip the dry run to focus on Tag UI spikes, which Abel supported. Zach confirmed that their portion of the demo is about four and a half minutes long and shared the link with Abel for review.

## Jonathan and Abel discuss #72-BUG: Building detection labels from a saved GRG bleed into a newly created GRG AND #73-BUG: Second building detection runs inside a marked section and reports a building count despite "Skip sections with existing markers" being enabled

**What Jonathan and Abel discoverd about each**
* #73-
* #72-

**Jonathan email to operators and their responses**

```
> Subject: [Non-DoD Source] Multiple GRGs behavior

Hi "P",

We're trying to evaluate some behavior in the plugin and wanted to confirm a few things with you:

 1. (Referencing #72-BUG: Building detection labels from a saved GRG bleed into a newly created GRG) It's possible / a real user need to sometimes need to  make more than 1 GRG on a single KMZ image/data package map area: (YES / NO) - assumption based on previous talks is YES 
>> P's response: Correct. In larger villages/cities, there is a distinct possibility that there will need to be multiple “8.5x11” areas that must be ‘GRGed’ even if it’s the same overall area.
 

2. (Also referencing #72))When making the second GRG within the image, it's acceptable for the Section letters and label numbers to "restart" and use the same scheme, number starting point as the first GRG: (YES / NO) - assumption is YES

Therefore, both GRG 1 and GRG 2 may have a building labeled "A101" "A102" etc. However, they would be two different GRGs with different names and exports. Confirming that this is acceptable/intended functionality.
>> P's response: Incorrect. If two areas are geographically collocated, even if it’s a different ‘GRG sheet’, it’s still in the larger operational area. Having an ‘A101’ on the west side of town AND on the east side of town would cause undue confusion. To take it a step further, if there are concurrent operations, even if they are in geographically distinct areas, teams/units of action may prefer those GRG alpha-numerics are offset, so when a higher echelon is C2ing, there is no confusion if we’re talking about A101 in Obj Area A, or Obj Area B.

```

---
 # DEMO DRY RUN - Tues, May 5

### SUMMARY
Sprint status reviewed and performance bottlenecks addressed via stakeholder communication strategy and finalized assessment delivery timelines.

**Sprint 3 Progress Review**
Development teams delivered user manuals and resolved critical crash bugs for version 5.6 and 5.4. Tag UI contributions advanced through radio menu component integration.

**Roadblock Resolution Strategy**
Communication delays regarding contribution reviews necessitated an escalation plan to stakeholders. The team decided to notify leadership regarding stalled progress to ensure timeline transparency.

**Future Development Prioritization**
Non-essential user experience feedback will be documented in a backlog to focus upcoming sprints on core operator workflows. Future efforts remain committed to finalizing migration assessments.

**Next steps**
[Kevan] Finalize Estimates: Compile all remaining workflow information; finalize the timeline estimates.
[Abel] ConTAKt Nick: Send Nick an email regarding the BAH contribution roadblock, CC Kevan. Follow up with a direct message confirming the email delivery.
[Abel] Update Presentation: Finalize the presentation content; ensure clarity regarding the demo portion.

### DETAILS

**Sprint 3 Accomplishments and Current Work in Progress:**S Sprint 3 accomplishments include delivering the user manual to chat, which is now accessible directly from the plug-in for operators. A bug causing the plug-in to crash during GRG export was resolved for both 5.6 and 5.4 versions, which are currently undergoing testing by the DT. Additionally, the tag UI side confirmed their first contribution with Nathan, involving the radio menu component which is core to the AIG plug-in and defines grip parameters (00:03:23).

**SMigration Assessment and Plugin Improvements:**S The migration assessment document is in progress and is expected to be completed by the May 15 timeline. The plug-in now has the ability to surface imagery status upfront, notifying operators via toast messages if an image could not be fully retrieved, allowing them to assess conditions before proceeding. Got evaluation included working sessions with Nick focusing on the maneuvers domain, and those findings are contributing to the shared capabilities framework currently being built (00:04:28).

**SSprint 4 Focus Areas and Deliverables:**S Sprint 4 runs from May 4th through the 15th, and the primary focus for 5.6 and 5.4 versions is resolving issues that prevent operators from completing their essential GRG workflows. Feature requests and suggestions for new functionality will be documented for future development considerations. For tag UI, the radio menu is in a merge request for Nathan's review, and the intention is to complete the migration assessment by the 15th (00:05:41).

**May 15th Expected Deliverables:**S The expected deliverables for the end of the contract on May 15th include 5.6 and 5.4 versions being stable and maintaining the current established development baseline (5.7) (00:06:53). On the model and plug-in side, operator improvements must be documented and prioritized for future development (00:07:57). The GOTS evaluation capability assessments report is also targeted for delivery around May 13th (00:06:53).

**SIssue Resolution: Feedback Quality and Reporting Standards:**S The team received feedback in various formats, with some bug reports missing the expected behavior, making it difficult to confirm scope and priority. This is viewed as an opportunity to collaborate with Chad, Cliff, and Josh to improve their testing practices, and the team is interested in providing standard reporting templates to introduce more structure for future sprints (00:10:21) (00:15:47). The goal is to leverage the interest these individuals have expressed in learning how to be better partners and help them adopt better testing practices (00:15:47).

**SIssue Resolution: BAH Contribution Delay and Risk:**S The team submitted their first contribution to BAH for Nathan's review, but a scheduled meeting was canceled, and there has been radio silence, which could negatively affect the fidelity and confidence of the report assessing the timeline and cost to transition to TAK UI. It was agreed that the team needs to communicate this roadblock to Nick because they are trying to complete the contribution cycle to inform their assessment (00:10:21) (00:12:32). It was decided that they must stick to the facts, stating they proposed the contribution and have reached out but have not heard anything back (00:13:48).

**SInternal Communication Strategy for Roadblocks:**S Given that Nick encourages being notified as soon as a roadblock is encountered, the team agreed that they must follow up with Nick before the demo (00:13:48). They decided to send an email to Nick and CC Nisme, and also follow up with a direct text message, as Nick is good with text communication (00:16:50). Even if Nathan responds later, the team still plans to communicate that it took four days for them to receive a response regarding the merge request (00:14:47).

**SFuture Development Backlog and User Intent:**S The team will document anything outside of the essential workflow of operators being able to produce a GRG for future development (00:18:41). Much of the feedback received concerns user experience issues, where the intention of the user needs to be discussed with the customer and operators. The current feedback is primarily coming from people who used to be operators and is not necessarily impacting how operators perform their current job, so this needs to be put into a backlog (00:20:02).

-----

# BUG TESTING

Abel and Jonathan's reproduction attempt for `04/v5.4:Improvement/Issue: When using Section Building detection software seems to be inconsistent.`

1. Create the first GRG over popualted area
2. Ensure "Skip sections with existing markers" is unchecked
2. Run a first auto-detection detection
3. Record/note the number of buildings detected = 58
4. Draw a section (A) over the buildings detected
5. Ensure Skip sections with existing markers" is CHECKED
5. Run a second auto-detection
6. Record/note the number of buildings detected in the second run = 1

**Current Behavior (Undesired):**

**Expected Behavior (Intended)**

1. Create the first GRG over popualted area
2. Ensure "Skip sections with existing markers" is CHECKED
2. Run a first auto-detection detection
3. Record/note the number of buildings detected = 46
4. Draw a section (A) over the buildings detected
5. Ensure Skip sections with existing markers" is CHECKED
5. Run a second auto-detection
6. Record/note the number of buildings detected in the second run = No Buildings detected "SKIPPED"

1. Create the first GRG over popualted area
2. Ensure "Skip sections with existing markers" is CHECKED
2. Run a first auto-detection detection
3. Record/note the number of buildings detected = 43
4. Draw a section (A) over the buildings detected
5. Ensure Skip sections with existing markers" is CHECKED
5. Run a second auto-detection
6. Record/note the number of buildings detected in the second run = 15 buildings detected, but I dont see new labels added?

===

## Phone call with NIK. after hours (Raw Notes)

The TPC pipeline is down.. 
we are waiting on the production contract
Nik plan is to get us on prod and on contract
Nik wants to to do a mini PI
allow us to say
JUNE 15, SEPT 1st Next time they do program Planin
Mini PI to do stuff
sept the big one
Nik plan is (dont sahre)
once we are "up"
Nik is gonna have us take over WinTAK
????

NIk wants tak ui(wintak, atak, takx, and webTak (OSIS)
right now BAH is handling all of it, He wants to separete it
we take over WinTAK focus on that.. Rise8
BlackCape focus on WeBTAK
"divided and conquer"

Nik thinks it will be much easier once we are on contract
we get CAC cards
we have access

----
TAK X eval, he is doing that.. now..
Tak Product center wants to sunset WinTak and replace it with TAKX. "not so fast"
2025 eval, gave em a l

--

## ABEL WEDS-THURS PLAN

1. Demo Script Prep
2. Backlog Priotitization
- TAK UI
    - Story 3
    - Story 4
    - Story 5
3. TAK UI Migration Assessment

4. Mission Outcomes
- Michael Maye, GitLab issues via Claude Code
5. Enabling Outcomes

---

[KEVAN] half out of it last couple of days, no distract from work in progress
white paper submission to CHAD (sept for bridge contract), GOTS eval Thurs/Friday
> Kevan speaking

[ZACH] workflows not lining up, (radial vs tab draw)
- back into TAK UI research

[THOMAS] TAK UI spikes, depending on Zach around , pair again

[JONATHAN] MOSA Score card, GOTS EVal contrinution and future state jourey map
- feedback Pete Wagner, sequenceing, multiple GRGs how label is handle
- He sent me a write up..

-----
# POST DEMO STAND UP - Gemini Transcript  11:45am May 6

##Summary
Imagery pre-caching scope and operator control were clarified amid communication gaps regarding disconnected environment workflows.

## Defining Imagery Pre-caching Scope
System imagery access is limited to user-selected map sources to prevent unauthorized data queries. External imagery fetching only occurs when operators actively select mobile tabs.

## Addressing Communication Workflow Gaps
The team identified a development misalignment regarding connected versus disconnected environment requirements. Previous Sprint 2 pre-caching for AI model optimization was incorrectly conflated with current network-dependent implementations.

## Strategy for Client Coordination
The team decided to explain the current functionality and prioritize disconnected use cases before considering new settings. Using precise terminology will clarify that pre-fetching remains under operator control.

## Next steps
[Abel] Email Nick: Send email to Nick and Nism detailing the mobile imagery pre-caching process.
[Abel] Discuss Pre-caching: Call Nick to directly explain the exact parameters and scope of external imagery pre-caching behavior.


### Details
**Scope of Imagery Pre-caching:** The initial discussion focused on clarifying the scope of imagery sources accessed by the device, particularly concerning pre-caching. The team clarified that the imagery access is dependent on the map selected by the user, such as the ATAK maps, which is the only source the system reaches out to at any time. There was concern that the system might query any source loaded or configured on the user's device if the scope of its access was not clearly articulated.
Distinction Between Local and Mobile Imagery Sources: The conversation transitioned to defining the difference between local and external imagery sources, particularly for the pre-caching function. It was clarified that if the user is viewing locally loaded files or data, no pre-caching occurs, resolving that issue. If the user selects the "mobile tab," they are connecting to external imagery sources like NIP or Google, and the system only reaches out to the specific external source they have selected to download high-quality imagery.

**Operator Control over Online Imagery**: It was established that the operator maintains control over whether external imagery is utilized. Specifically, within the mobile tab, users have the option to allow or disallow online imagery. The plugin's functionality acknowledges the settings already configured in regular ATAK regarding source imagery, meaning the operator selects and is in control of the source that is being used for fetching imagery.

**Communication Gap Regarding Connected Workflow:** The primary issue identified was a communication breakdown regarding the development of functionality for a connected environment, which had not been requested or coordinated with the client, Nick. The team had optimized for a connected workflow by implementing pre-caching from external sources to allow for on-the-fly GRG creation, despite the core requirement being operation in a disconnected (DDL) environment. Kevan Mordan apologized for the communication flow issue and stressed the importance of coordinating new capabilities with the team.

**Strategy for Addressing Nick's Concerns:** The strategy moving forward is to proactively communicate with Nick to explain the exact parameters of the imagery pre-caching and to confirm that the disconnected environment use case remains fully functional. The team concluded that they need to close the loop with Nick to clearly explain that pre-fetching external imagery only occurs if the operator selects a mobile, external map source, as the current capability was not an expected use case in the DDL environment. A commitment was made to discuss the communication gap during process closeouts.

**Clarification of Sprint 2 Pre-caching vs. Current Implementation:** Kevan Mordan clarified that the pre-caching discussed in Sprint 2 was entirely different, involving fetching the highest resolution tiles from local SQLite databases on the device for memory caching to optimize analysis for the on-device AI model. The current pre-caching implementation, which involves connecting to the network, was an extension of this functionality to connected environments and was not requested or previously discussed.

**Proposed Communication Follow-up with Nick:** Abel was tasked with reaching out to Nick via email, looping in Nism, and then calling them directly to discuss the issue. The purpose of the follow-up is to explicitly clarify that the system only reaches out to a data source if the user selects it, ensuring that pre-caching for mobile imagery is tied directly to operator discretion and to achieve feature parity with the local imagery pre-caching. The discussion should seek Nick's input on whether the functionality is acceptable as-is or if a setting should be implemented before the May 15th hand-off.

**Avoiding Immediate Offering of a Setting:** Jonathan recommended against immediately offering a setting for controlling mobile imagery pre-caching, as it might become challenging from a workflow or UI perspective since it crosses into ATAK core functions. Instead, the team should explain the current behavior and ask Nick to describe any risks they want to avoid, which would then inform a suitable solution. Kevan Mordan agreed that they could take a suggestion from Nick and then potentially offer a counter-proposal, acknowledging the tight timeline before the hand-off date.

**Confirming the Scope of a Potential Setting:** In discussing a hypothetical setting, the team confirmed that a setting to disable pre-caching for mobile imagery would likely affect all mobile imagery sources, including both external internet sources (like Bing Maps) and internal intranet sources (like a tax server). They recognized the importance of ensuring Nick understands that distinction if such an option were proposed.

**Terminology and Communication Flow:** The group agreed to lead the discussion with the disconnected use case, emphasizing that no "online pre-caching" happens in that state. It was suggested that they use alternative terminology like "optimizing tiles for inference" instead of "pre-caching" to avoid negative connotations associated with the latter term.

**Next Steps for ConTAKting Nick:** Abel and Kevan Mordan decided that Kevan Mordan would first message Nick on Signal to see if they had time to chat quickly, and then they would coordinate a direct phone call. They decided against setting up a Teams meeting and planned to send a follow-up email to Nism with the conclusion of the discussion after the call with Nick.

> Slack post from Jonathan: just for convo flow here: the concern is fetching online tiles without the operator knowing or approving its happening - we do not believe its a risk because it doesnt happen at all with local imagery, and for mobile, the user has control over the selection. may be acceptable as-is

## POST DEMO STAND UP - Abel Raw Notes
Nik's feedback about source imagery
Wiff on us comm

the entiry DDILL
operating in a disconnected environment
how to optimized for connected

REACH OUT TO NIK, How does he want to close the loop for this
process improvement

It still works in D-DILL despite this pre-caching
It's only in this instance here

--
Map Enginer works
sql
TILE IDs
stich them together.

Hey DDIL MODE
we went the extra mile. We replicated the 
We are NEVER Reaching out, unless the user 

setting 
1. CLARIFY THE BEHAVIOR
2. PROCESS IMPROVEMENT\
> hearing 2 things for nik: - clarify the behaviors 100%, and retro the communication/prioritization process with him

Send an email

Kevan's pitch: 
HERE IS WHAT WE DID, how we are expanding this feature parity
Explicit, the only time i when the operatate selects this as a map asouce
we are never pinning a data sources unless a user slects
show evlution bring parity and pre-caching, find the best tiles abavaible

SECOND
took that same and brought it here
100% directed for what operaters selects (SQ LITE files) IF THEY SELECT MOBILE the operators are opting to REACH OUT TO THE INTENER
parity

We shoul dhad talk to you
consistant paorty - 
> Jonathan: we should lead with stating the DDL use case is top, connected use case was us trying to be complete/consistent

SETTING SUGGESTION?
- do not precache mobile imagery 

Here is exactly how it works
DISCONNECTED STATE
LOAD LOCAL
PRE-CACHING FROM LOCAL
FORGET PRE CACHING
OPTOMIZING DETAILS

Edge cases (we wanted feature partity)

---

### Sync with Joshm 6pm May 6th - raw notes on BAH and MR

C# change (windows machine) I have to set up wintak, doest not have a PC
they (BAH) dont have an example, lots of boiler plate stuff to do it
for him to dig deeper

the good news fom us doing this end to end TAK UI contribution. We are gonna uncover a lot of stuff, under the hood stuff that is not obvious

`BUT JOSH` we know it can be done, requires a C# change
wintak implementaiton.. even if the Kernel supports them for Wintak

developer choice things, (Nathan has been good)
> Nathan: I'm fine with this API, but we might want to add a service interface for this capability in tak-platform-api. This will make it easier to stub out calls with test fakes in unit tests. I know that at the very least ATAK and WinTAK have a comparable capability to this. 

there is good news, clean some of the stuff up


### TAK UI contribution follow ups - Thurs, May 7th

1 and 2 are both Josh conversations, and they are connected.

The Section 3 row and the Section 4 open item are two sides of the same finding. 

Josh is the one who can fill in the technical details — what the ATAK classification is with confidence, what WinTAK and TAK-X status should be, and what the sprint estimate looks like. 

Your ask to Josh is essentially: help me fill in the radial menu row in Section 3 and draft the Section 4 open item for the WinTAK gap. 

He has everything he needs to do both. You are prompting him to write it down in the document, not asking him to figure anything out.

**Malachi Qs**
"Josh, based on Malachi's comments about the enabled and visible button states — does the GRG plugin have any radial menu buttons that use that same old string-based approach? If yes, how much refactor work are we looking at to replace it?"

--
# THURSDAY MAY 7

top of mind:

1. Call with BAH at 1400 ET - 
* I am leaning on the devs to ready any agenda items we need to bring up with them based on your spikes, to help you conducet your research and migration assessments.
* Something that came up yesterday talking to Josh and reading the comments in the MR, The WinTAK gap for the radial menu, Curious what is Nathan's plan/roadmap as far as who owns that work, since is not in scope for this bridge contract
* Josh's MR 314 status, if is marked ready by the time we have the call with BAH, we can just confirm with Nathan and that's one enabling outcome!

2. Call with the DT's at 1130 ET
* Jonathan I'll DM you about my proposed agenda items.

3. Kevan I didn't draft an email for Nizme yesterday after speaking with Nik. I wasn't sure if that was still something you recommend I do...

--

- Enabling Outcome

[Thomas] raw-stand up notes:
- he has been completing the assessment spikes, knocking them out..
- paired with Zach, go over some stuff, 
- He does have some questions for Nathan during the BAH sync later:
> Nathan mentioned it, `renderToMap`
>> tak `Marker` (`Marker API`) for ATAK and WinTAK, BUT on our side we use ATAK `Marker` directly for Grid labels and Legend read only, to only display the labels, not dotMarkers, not editable
ON their side (TAK UI) they dont currently expode any configs
to be config, so we can turn off all the other stubs, not all
The `Marker API` exist..  planneed work? or not reason?


## Daily Stand up Transcrip May 7th Thursday

**Summary**
Meeting reviewed current spike progress and established new reporting expectations for upcoming feedback calls.

**Spike Progress and Gaps**
Team members finalized spike documentation and prioritized ticket assignments. They identified missing configuration properties in the user interface as a key risk for customer discussions.

**Establishing Feedback Standards**
Leadership refined the agenda for the upcoming feedback call. They decided to require specific expected versus actual behavior descriptions to minimize ambiguity in reporting.

**Clarifying Reporting Requirements**
Decision made to formalize feedback requirements by mandating defined starting states for all reported issues. This will eliminate guesswork and ensure all reported bugs are reproducible.

**Next steps**
[Abel] Send Email: Write and send email to Nisme.
[Zachary] Support MR Setup: Pick up ticket previously handled by Josh. This allows Josh to focus on merge request setup.

### Details
**Opening Remarks and Availability Updates**: Abel shared an anecdote about the unexpected speed of service at the social security office, contrasting it with the time it takes for similar tasks in Los Angeles. They confirmed that most people were present and were ready to begin the meeting, noting that all spikes have been input into GitLab issues and prioritized.

**Task Management and Documentation Feedback:** Abel reported that they paired up with Josh and Zach the previous afternoon to review documentation. Zach requested more specific direction on how they should be recording information, which led to temporary reference guidelines being added to the document that Abel intends to remove later.

**Team Assignments and Upcoming Meetings:** Abel planned to meet with Jonathan today regarding an agenda for a call with Cliff, Chad, and possibly Josh. They also confirmed the BAH call later today and suggested taking it even if there are no specific topics, as something may arise. Jonathan confirmed they are looking forward to talking to the DT guys and pairing up.

**Current Assessment and Spike Work:** Zachary is continuing to work on the TAK UI assessments and will be taking on one of Josh's tickets so that Josh can focus on setting up their merge request. Thomas completed the assessment spikes yesterday and is now pulling tickets from the spreadsheet, which Abel finalized. Mary Pollin is focused on continuing to build context and attending relevant meetings.

**Enabling Outcome and Collaboration Question for BAH:** Abel noted that Josh's merge request (MR) submission is an enabling outcome, fulfilling a commitment to be contributors, and they hope to submit several MRs by the end of next week. Thomas shared a specific question for the BAH sync regarding the difference between their team's use of A-TAK markers for grid labels versus TQI's use of the render-to-map feature. Their team requires specific configuration options (like read-only, non-interactable labels) that are not currently exposed or implemented in the TAK UI markers exposed properties.

**Risk Assessment on TAK UI Gaps:** Thomas' primary question for the BAH sync is whether the lack of exposed configuration properties is planned work or if there is a reason they have not exposed those properties. Abel noted this issue aligns with other gaps, like WIN-TAK radio gaps found by Josh. They expressed concern about the risk of bringing up these unimplemented features to the customer, questioning if they will have the bandwidth to complete the work or if the team is expected to handle it.

**Future Contract Planning and Call Attendees:** Abel mentioned that Nick discussed future plans, including a mini-PI planning session and gaining access to Jira. They confirmed that the upcoming BAH sync invite includes Nathan and Malachi, which is beneficial as they have full context on Josh's concerns regarding the WIN-TAK C# programming work and lack of a Windows machine.

#### POST STAND UP SYNC ABOUT THE DTs

*Preparing for the DTS Call:* Feedback Review: Abel and Jonathan discussed the proposed agenda for the DTS call, focusing on setting clear expectations for feedback. Jonathan agreed with the approach, noting that reviewing examples will minimize guesswork and ambiguity when ingesting feedback.

*Improving Feedback Reporting without Dictating a Template:* Jonathan suggested that instead of dictating a template, they should lay out specific asks for information, such as the expectation versus what was received, and any specific data captured. Abel agreed, stating that the spreadsheet sent on Friday is the most complete template they have received, and they plan to guide the team on how to fill it out better with proper expectations.

*Case Study: SDT70 Ambiguity:* Abel provided an example, SDT70, where they were unable to reproduce a crash because the prerequisite step—running a detection—was not explicitly provided in the feedback steps. Jonathan suggested that feedback should specify whether the starting state is "completely clear data" or if certain initial steps must be performed.

*Case Study: SDT71 Confusion and Suggested Improvement:* Abel noted confusion in SDT71, which was worded more as a suggestion rather than a reproducible issue, stating it "recommends looking into having building detection software remove previously detected buildings". Jonathan emphasized that all feedback regarding something that seems wrong should include a comparison between the "expected" behavior and the "reality" received.

*Setting Clear Feedback Expectations:* A key ask for the call is to ensure that future feedback includes an indication of the expected behavior and the impact on operators, which was already requested and Chad confirmed they could include. Jonathan also added that they should ask the DTS team to clarify the starting state for each feedback item, such as whether the map image was empty or if prior actions had been taken.

---

## SYNC WITH THE DTs 12pm (Josh and Cliff)
what are we asking for?

- set expectation
- minimize the guess work
- the ask (as opposed of a template)

Provide a starting state (GIVEN)
Part 1: 

what do we want to get?

--

user accepting test - what do you want it to do?
> we didnt do that
What are the goals of the program
> we are not getting those steps
**F

5.5 buld

SHARING: A Test Report (Plugin Test Requirements Evaluated)

1. REPORT (UAT Steps)
2. GOIND DOWN USER MANUAL (from the plugin)
3. 4 separate devices they test on

- on two devices = sent
- one devices = "


> 
OPERATIONAL TESTING

-- change colors
-- the document is gonna have all the thing we found
-- 

A GRG = secitons no dupes

Jonathan TRACK AS A TEAM = Jon wants better understand
when you overlap your GRGs? 

--
# TAK UI meeting with BAH, raw notes

Hi Nathan, thanks for making time, I know yall are busy.. So we truly appreciate yall making this work.. - 

MALAH-KAY
- Great work, standard conventions, 
- josh address feedback
- quick look again
- ONLY THING TRACKING, MALAKAY QUESTIONS, Refactor

* Malakay surface level, Comment WinTAK

WINTAK GAP
- PI planning, iron out the roadmpa
- at the moment, Not expecting us to do it n WinTak,
- not view as a required at ths mmoment
> making changes to exisitn WinTAK..
> verify WinTAK changes.. very it
- There is nothing break

THOMAS - shared GRG Capture
`renderToMap  `
looking the labels , ABCD, 1234
he discovered
basical ATAK markers
not much for WInTAK side

static labels, he did not see anyway to CONFIG
he saw stubs.. not implemented yet.. 
More complicated wintak

IS THAT WORK YALL ARE PLANNING? OR POST PONNED?
whats your thohhts?

**Nathant** Left side, ATAK markers, Something they ultimatelly liek to add, not planned for this PI, If is something we want to contribute, He says go for it. We sould be able to speifcy a marker has no icon by null.. `YOU HAVE TO ADD, ADD a Param in the markers to set a label`, Less of an effort - THomas low effort.. can do it..  

**Nathan** Next PI, stabalize TAK UI to release the prod version.. could be smoeting they work.. BUT IF YOU WANT TO CONTRIBUTE NOW>. 

`THOMAS, we will take it back with our team to discuss -- Thomas, WinTAK graph.. talking about the same thing about the Labels and he didnt see anything in TAK UI, for Composite Map ittems, rectables or makers is that something yall are tracking?`

**Nathan** looking for something to share.. have yall
tak-ui.docs.tak.gov/tak-ui-docs/api-stability, This is where we can get info.. They should have the Map item API implemented in WinTAK same as in other platforms.
Composite Map Items, not supported.. Is a WinTAK specific thing.. not TAK UI supported.. -- SO, HOW DO WE MAKE IT TO IMPLEMENT across platfrms?  on the left ther eis a white bar... / SO this kind of Bar at the top, how we would want to do this, Generic API for rending an Open GLA???? and you can just draw.. whatever dimensions.. projected the right way and correctly overlay.. useful capability for the MVP of TAK UI, for TAK UI 2.0.. it wont be something.. 
ATAK, WinTAK, TAKx support routes, markers, poly, shapes, filled in.. more advanced custom render map items is soething we have in the roadmap and would add in the next PI

`THOMAS` - where is parity across the platform.. 

Nathan, ideal state, talk to the TPC , TAK UI 

`thomas will look into the the API stability page`

Jeremy

--

## TAK UI meeting with BAH, Gemini reference

**Summary**
Meeting reviewed merge request status and assessment of technical gaps between WinTAK and TAK UI platforms.

**Merge Request and WinTAK**
Final merge request approval awaits verification of plugin stability. WinTAK sub menu changes remain outside current project scope.

**Grid Marker API Assessment**
Team decided against contributing grid marker parameters due to limited contract time. Current focus remains on TAK UI assessment completion.

**Standardizing Assessment Documentation**
Developers must use the TAK UI API stability page as a mandatory reference. Findings reveal significant feature gaps requiring documentation.

## Next steps
[Nathan] Review Merge: Perform final review of Joshs merge request; merge request if checks pass.
[Malakai] Verify API: Verify new API functionality does not break combat swim plugin downstream refactor.
[Josh, Thomas, Zach] Reference API: Bookmark and regularly reference the TAG UI API stability page during assessment work.
[The group] Connect Dots: Connect Nathans comments about TPC standardization with Kevins MOSA pitch in the assessment report.
[The group] Reflect Pattern: Explicitly reflect the ATAK ahead, WinTAK behind, TAKX unknown pattern in the assessment document.


### Details

**Josh's Merge Request Status:** Josh's merge request has been reviewed by Nathan, who is satisfied with it, requiring only minor surface-level adjustments that Josh is addressing. Nathan needs to perform one final review, and if everything is acceptable, they will merge the request. A dependency requires Mallay to verify that the new API will not break anything downstream, specifically checking the "combat swim plugin refactor".

**WinTAK Sub-menu Scoping:** The scoping for WinTAK sub-menus indicated that they will require C-sharp changes, which Josh and Thomas confirmed is outside the scope of the current engagement. Nathan confirmed that Rise 8 is not expected to implement WinTAK for new features immediately, but requested assurance that existing WinTAK code is not broken by Josh's merge request. Thomas confirmed there are no WinTAK changes in the current road map, with future items to be determined during their next PI planning session.

**Grid Labels and Legend Findings:** Thomas identified two separate issues concerning grid labels, specifically ATAK side markers labels that Rise 8 currently uses as non-interactive, label-only markers. Although a TAK UI marker API exists, the label parameter is not yet implemented, marked with a "not implemented" stub. Nathan suggested that Thomas add a parameter to the marker API for the settings label, possibly including a parameter to hide the icon.

**Decision on Contribution of Grid Marker Parameters:** The team concluded that contributing the suggested grid marker parameters is too risky given the remaining week and a half of the contract, prioritizing the completion of the TAK UI assessment instead. Nathan confirmed that composite map items are WinTAK-specific and lack a cross-platform equivalent in TAK UI. Nathan proposed a generic OpenGL layer rendering API for map view, but this is not on the current road map and is unlikely to be in the next PI unless Rise 8 contributes.

**API Stability Page Reference:** Nathan presented and referenced the TAK UI API stability page, found at doc.tag.gov, which serves as a source of truth for platform implementation coverage. Thomas recommended that the team reference this page regularly during their assessment work. Nathan’s goal is to use the TAK UI baseline to push TPC to standardize minimum platform capabilities, and they also hope to get TAK UI v1 stable by August.

**Key Decisions and Clarifications Recap:** The closure of Josh's merge request is reliant on Nathan's final review and Mallay's verification that "combat swim" does not break. The team has decided not to contribute to the grid label marker API, despite Nathan endorsing it as a low-effort, clean contribution candidate, citing the restricted timeline. WinTAK composite map items and custom OpenGL map rendering are not on the road map, and Rise 8 would need to lead any efforts to pursue them.

**Tag Gaps and Reference Requirements:** Significant gaps exist between WinTAK and TAK UI, as composite map items, legend bars, and sub-menus do not have TAK UI equivalents, which is a key finding for the migration assessment. The API stability page must become a standard reference for all developers performing assessment work, and they should bookmark and use it. A pattern is emerging where ATAK appears ahead, W is behind, and TACX is largely unknown, which the assessment document should explicitly reflect.
---

Good call with the Booz Allen folks!

Nathan's review came back with nly very minor surface-level comments, Josh has been addressing them. Nathan called it "really great work" and that "he's looking forward to more contributions from us in the future". Enabling outcome cooking!!!

Where it stands: Nathan just needs one final look-over, Only open item is Malakay verifying there are no breaking changes in Combat Swim (another plugin he is testing on) from our newly contributed API.

We will continue to keep an eye out for comments in the MR, as soon as we get the thumbs up from Booz Allen, we're officially merging our first TAK UI contribution! 

--
### RETRO

> Assessing what is our can be in TAK UI that work across different platforms to fulfill our plugin's needs

* vastly different ATAK and WinTAK are
* Through.. 
* WebTAK is supposed to replace WinTAK
* TAKX is a mystyery



--

PL: Norman + Steve delivery assistant tool => 
delivery context across teams may be good to look into as well.
> that was also had some value add from Kevan Mordan delivery assistant.

* Ping Ball Accident?

Alloc8 'story'
- Jeff W, Adam and Ethan, help out with Alloc8 for 8 weeks, push it out
- Use AI as much as possible, learn
- Multi-players vs Single-player
--> little by littler learn and tweak it
INCLUDE IN WORKFLOW and DEAL
- record lessongs and progress in our repo, see where it goes
- "use beads" , not integrated 
- evolve, how to use the tools with friciton/

THINGS WERE HELPFUL

BLOCKERS/FRICTIONS

lessons learn

Adam and Ethan are being rolled off ALLOC8

JONATHAN, THE QUESTION IS "What does it look like?"

What does Multi-Player look like

1. Context and keeping the conext "well engineered and freshed"
- each disciplined, context maintained and merged into a centralized place
- HMW normalize the strategic view?
-- "beads"
-- "gitLab" (our agents, GitLab)
-- workaround, gitLab "let me press the button"
Treat context as Code
Norman and Steve ()
Delivery assistant (Kevan)

"Claude is Momento"
Rogue Light - starting over and over again


2. 

