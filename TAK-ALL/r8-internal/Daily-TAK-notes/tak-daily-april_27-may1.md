# TAK Bridge — Week of April 27 to May 1

---

## Hand-Off Summary and Monday Prompt

You are picking up TAK Bridge PM work as of Friday, April 25, 2026.

Sprint 2 closed with the April 22 demo, a 124% building detection improvement quantified, and both 5.4 and 5.6 builds in SOCOM's hands for Development Testing. Friday's conversation with Nik surfaced the architectural direction for the SOCOM TAK plugin ecosystem: plugins as services, shared core logic (waypoints, avoidance, data access), and route planning as the primary value stream in the Maneuver domain. First thing Monday: check whether Zach's user manual MR has cleared two approvals and the build is published to the Package Registry.

Open threads to be aware of:
- Post-mortem: not yet scheduled
- DT bug scope against May 15: not yet assessed, no owner assigned
- Grid labels and slider API spikes: no owner assigned

Reference files:
- Outcomes: TAK-ALL/tak-oor.md
- Latest drumbeat: TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/db-wk5.md
- This week's notes: TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-april_20-24.md

---

## Focus for the Week of April 27 to May 1

1. Run the Sprint 2 post-mortem with the team. The week covered the demo, the DT handoff, and several open pipeline and UX threads. A shared close on what worked and what to carry into Sprint 3 keeps the team aligned before the next sprint loads up.

2. Move the four TAK UI research spikes forward. Confirm time boxes with Josh on grid display and radial menu, and assign owners for grid labels and slider API. These four spikes are what determine Rise8's first native TAK UI contribution proposals to Nathan. Progress here is what keeps the BAH collaboration moving.
Outcome: Rise8 team shifted from TAK UI consumer to key contributor

3. Scope the DT-reported bugs against May 15. Determine what is realistic for the current sprint and what goes to the extension. Jonathan to schedule a usability feedback session with Josh and Cliff. A defined target protects Sprint 3 from unbounded bug work.

4. Set up the GOTS and maneuver domain next move. Align internally with Kevan on whether a VSM for route planning is worth pursuing before anything goes to Nik. Then schedule the GOTS follow-up session with Nik. The internal alignment comes first.

---

## Resolved/Open Issues and Matters: Week of April 20 to 24

**User Manual Delivery**
Description: User manual PR rebased and pushed. Pipeline running. MR requires two approvals before merge. After merge and final pipeline run, build publishes to Package Registry. `release_internal` fails silently on this branch; Package Registry must be checked directly.
Resolution: WIP
COA: Zach submits MR and tags two engineers for approval. Abel confirms delivery to Chad after Package Registry confirms the build.

---

**Post-Mortem**
Description: Team post-mortem referenced multiple times this week. Not yet scheduled or completed.
Resolution: Open
COA: Abel to schedule. Date and attendees not confirmed.

---

**TAK-UI GRG Grid Display Spike**
Description: TAK UI grid render spike approach confirmed. Josh going into ATAK JAR to find binding and will attempt a prototype. Scope is ATAK only. WinTAK is a documented known gap. WebTAK strategy is Kevan's call.
Resolution: WIP
COA: Josh executes spike. Abel to confirm time box with Josh.

---

**TAK-UI Radial Menu Spike**
Description: Spike artifact drafted covering two use cases: nested section radials and the center display (grid dimensions, e.g. 10x8). Deliverable is an API proposal sent to Nathan via Mattermost. Time box not yet confirmed with Josh.
Resolution: WIP
COA: Abel to confirm time box with Josh. Josh sends API proposal to Nathan via Mattermost upon completion.

---

**TAK-UI Grid Labels Spike and Slider API Spike**
Description: Two TAK UI research spikes with no update this week. Grid labels covers `renderToMap` API validation. Slider API covers validating Nathan's slider against Rise8's `SeekBar` implementation.
Resolution: Open
COA: Owner TBD. No assignment confirmed this week.

---

**GOTS Evaluation: Maneuver Domain Follow-Up Session**
Description: Initial findings presented at April 22 demo. Maneuver domain confirmed as starting focus by Nik. Follow-up working session with SOCOM not yet scheduled.
Resolution: Open
COA: Abel and Kevan to schedule follow-up session with Nik on maneuver domain.

---

**DT Bug Triage: Scope and Priority Against May 15**
Description: Bugs reported across 5.4 and 5.6 after the April 22 demo. Categories: dense area detection misses, double-labeled large buildings, parking lots labeled, disappearing toolbar (5.4), grid issues (5.4). Scope and priority against May 15 not yet assessed.
Resolution: Open
COA: Abel to assess scope and determine what is realistic for May 15 vs. extension. Jonathan to schedule usability feedback session with Josh and Cliff.

---

**VSM Workshop: Route Planning in the Maneuver Domain**
Description: April 24 Nik meeting surfaced route planning as the primary value stream in the Maneuver domain. VSM workshop plan developed. Workshop requires Nik, Kevan, and ideally a field operator. Abel facilitates. Internal alignment with Kevan required before scheduling with Nik.
Resolution: Open
COA: Abel to align internally with Kevan first. Workshop with Nik to be scheduled after internal alignment.

---

**`assembleProduction` Job Slowness**
Description: Job intermittently exceeds GitLab's 60-minute limit and fails before producing a release-ready APK. Parked as lower priority than TAK UI work. PM card at line 888 of tak-daily-april_20-24.md.
Resolution: Open
COA: Kevan to confirm conditions under which this gets reprioritized. No action until confirmed.

---

**Contracting Blocker: Nik Production Access**
Description: Nik needs a SOCOM email and CAC before he can write code toward the TAKtical Assistant initiative. No action documented on Rise8's side to advance this.
Resolution: Open
COA: Owner TBD. No action taken.

---

**Parallel Matrix Pipeline Chore: Open Question**
Description: Matrix pipeline confirmed live (7 jobs x 5 ATAK versions). GitLab comment drafted documenting the pause and `pads-fast` resolution. One question remains: whether partial matrix work was merged before the chore was paused.
Resolution: WIP
COA: Abel to confirm with Josh whether partial matrix work was merged before the chore was paused.

## Jonathan's User Interview Recap
> WHAT HE GOT FROM THE CALL 4.29 "field signal", quotes, direct lifst from the interview
> AI GRG, NO nothing has meaningfully change
--> 
Quick recap from the Journey discovery portion of the meeting today. Goal was to validate a draft journey across the TAK ecosystem (Intel → C2 → Mission → Maneuver → Fires) using a 72-hour kill/capture scenario as a working example.

**What we heard:**
- The draft journey is a reasonable skeleton, but operators emphasized that it's a web, not a process. The phases bleed heavily. Missions don't always start with Intel, and fires/terrain/commander direction can drive maneuver decisions earlier in the flow. Domains are used as a non-linear web.

- SOF mission shape varies enormously, from a 15-minute reactive raid with little or no GRG, to week-long country-entry planning. Operators flagged this as the dominant variable shaping how the tools get used.

- The GRG itself is a focused inset, not the whole operating surface. TAKtical tasks (rear security, assembly areas, cover and concealment) often sit well outside the GRG boundary while still depending on the same shared picture.

Other highlights:

- Importance of logistics in domain web
- Detail around NIX data flow with TAK
- Reducing uncertainty is the goal. We do this by clearly communicating specific target qualities, age of info, and confidence / coraborration.

Still needed / next steps:

- Further validation of the planning journey (we didn't get through the end), execution and follow on phases.
- Iteration and opportunities to refine the journey to establish domain crossover and domain bleed
- More detail and richer insights with continued discovery sessions

--

## MONDAY PREP

0. USER MANUAL

* TIFF Image Failure, Image capture failed, reached out to JVD - this covers back up image bug, other errors
* Message Board done? 
* A release , internal release job and send them that artifact

ZACH, we are not using a back up image, 
"image detection" error


1. BAH TAK UI 

* Thomas, still trying to get everything back to gether jAMF, 
* depending on their answer, start buildiong that API

2. JVD USER INTERVIEWS NEXT STEPS

3. JVD OUTCOMES

4. KEVAN

---

## TAK UI BAH Meeting Prep: Monday April 27

### Spike Status Snapshot

| Spike | Owner | Status |
|---|---|---|
| Grid render | Josh | DECIDED — stays in the AI GRG plugin, not a TAK UI contribution |
| Radial menu + API proposal | Josh | TAK UI contribution confirmed — Nathan agrees it is general enough |
| ActionBarView / WinTAK | Thomas | In progress, JAMF setup delaying access |
| Slider / SeekBar | TBD | Waiting on Nathan's Mattermost MR link |

---

### Grid Rendering: Decision — April 27 BAH Session

**Decision:** GRG grid rendering stays inside the AI GRG plugin. Not a TAK UI contribution. Not a Core API.

**Josh:** Build it at the plugin level for ATAK now. WinTAK when the path is clearer.

**Nathan's reasoning:** The GRG APIs exist in ATAK core but not in the TAK kernel. Nathan is following up internally on why. His call: GRG rendering is specific to this plugin and has no general applicability beyond it. Contributed a parallel from the Combat Swim plugin — the PDF dive plan report works on ATAK and WinTAK without Core APIs, for the same reason. Not general enough to belong in Core or TAK UI.

**WinTAK:** ATAK bindings exist. WinTAK bindings do not. Nathan was not aware of this gap. WinTAK implementation requires a custom approach — BAH needs to think through the path. Not this sprint.

**TAKX:** Out of scope. Bindings exist in ATAK only, not in the shared TAK kernel.

**All three aligned:** Josh, Nathan, Abel.

---

### What we still need from Josh before or during the call

**RADIAL MENU spike:**
- Does TAK UI have coverage for nested menus? (yes / no)

   > *Nested: menus inside of menus. The GRG radial opens a second ring for Rows and Columns, then a third level for sections.*

- If no: is the API proposal drafted? (TAKUIMenu schema: icon, tooltip, nested menu parameters per Kevan's April 21 IPM outline)
- Both use cases confirmed in scope: nested section radials AND the center display overlay (grid dimensions, e.g. 10x8)?
- Is there a prototype ready to show the team today?

**GRID RENDER spike:**
- Prototype found. Is validation complete, or still in progress?

   > *Developer experience concern: Josh found a working path but flagged it is more verbose and harder to maintain than the team's preferred approach. Not a blocker, but worth flagging to Nathan.*

---

### What Rise8 brings to Nathan, and the ask for each

**Floating toolbar / `ActionBarView`** (Thomas's spike)
The button bar the GRG Creator uses to access all main actions (grid, detect, label, settings). Currently ATAK native, no TAK UI version.
Thomas is still setting up environment access. Finding may not be ready by call time.
*Ask:* Is the Sprint 3 work an `iToolBar` extension or `ActionBarView`? Does it cover Rise8's use case? When is it available?
>> initial, toolbarextenstion" MR, existing plugin.. its NOT, it did not work. ActionBarView API, they are using it now.. that has been merge to TAK UI, 
 the MR: `https://git.tak.gov/tak-ui/tak-ui/-/merge_requests/306/diffs`
 > using the same underline API Now..
 > 

**Radial menu / `MapMenuWidget`** (Josh's spike)
The ring of buttons that appears when the GRG Creator taps the center of the placed grid. Currently ATAK native, no TAK UI version.

   > *Abstraction: a ready-made TAK UI building block. If it exists, Rise8 uses it. If not, Rise8 builds and contributes one.*

Spike in progress. No confirmed finding yet.
*Ask:* Is a native radial menu on BAH's roadmap? If not, Rise8 wants to contribute one. Nathan offered to review a proposal. Is now the right time?
>>

**Center display overlay / `GridParametersDisplayWidget`** (Josh's spike, use case 2)
The readout that appears when the radial opens, showing current grid dimensions (e.g. 10x8 @ 60m). Currently no TAK UI equivalent. Included in Rise8's radial proposal.
Pending radial spike finding.
*Ask:* Does BAH have anything in progress for map overlay widgets of this type?
>>

**Grid rendering / `CustomGrid` + `GridLinesMapComponent`** (Josh's spike)
How the GRG grid lines appear on the map after the GRG Creator places a grid. Currently ATAK native.
Josh has a preliminary prototype using a TAK UI path. Needs validation today. ATAK only. WinTAK and TAKX are stubs for now.

   > *Developer experience concern: the TAK UI path works but is more verbose to write and maintain than the team's preferred approach. Not a blocker. Worth asking Nathan if a cleaner path exists.*

*Ask:* If Josh's prototype validates, Rise8 is moving forward. Any concerns or guidance before we commit? Is this on BAH's roadmap?
>>
**Slider / `SeekBar`** (pending Mattermost)
Used to adjust grid spacing in the settings pane. Nathan said a new TAK UI slider was recently added.
Waiting on Nathan's Mattermost MR link. Cannot confirm native or escape hatch until validated.
*Ask:* Did that link come through?
>>
---

### Spike summaries: quick reference

**RADIAL spike**
Josh is checking whether TAK UI already has a radial menu component, and if not, drafting what one should look like.
*Why:* Rise8 cannot coordinate with Nathan on contributions until we know what exists and what is missing.
*Decide:* Whether Rise8 uses an existing component, contributes a new one, or stays on escape hatch.

**GRID render spike**
Josh found a preliminary TAK UI path for grid rendering. Prototype needs validation today.
*Why:* Nathan confirmed no native path existed. Josh's prototype may change the escape hatch call for Story 1, Scenario 1.
*Decide:* Whether the prototype holds and Rise8 moves to a development story, or whether Nathan input is needed before committing.

--

## KEVAN 1 on 1

Kevan 1:1 — Talking Points

1. Pre-IPM format
I need more time with just you and Jonathan before the full team. The technical depth on pipelines, APK versions, and TAK UI abstractions moves too fast for me to track product decisions in real time. Can we add 30 mins before IPM for just us three?

2. TAK UI and BAH next steps
Josh has the grid display and radial menu spikes. Thomas has ActionBarView. I need your read on: are the time boxes confirmed, and are grid labels and slider API assigned? I want to make sure we have a clear package to bring Nathan before the next BAH sync.

3. Bug and feedback triage
DT bugs are in from Josh and Cliff. I need your help separating ATAK platform instability (not ours to own) from plugin issues we should fix before May 15. What is the filter you want to apply?

4. GOTS next steps
Before I schedule anything with Nik on the maneuver domain, I want your read: is a VSM for route planning worth pursuing internally first, or do we go straight to the follow-up session with Nik?

--

Nathan is login to TAK.GOV


API similar to Jet Pack compose?
component. compose


## Grid rendering is decided — stays in the plugin, Josh builds it. Nothing to close on with Nathan for that one.

## "Nathan, you mentioned checking with TWO PEOPLE [] on why the GRG APIs are in ATAK core but not in the TAK kernel. When do you expect to have that answer, and can you loop us in?"

biggest issue is proguard in the SDK, offescating inside of ATAK
agents cant worj with offescated methods..
programmatically make the functions and the methods

He is gonna move stuff over
Josh is gonna gonna make a FORK of the TAKUI project
push a branch. and later on we can use it as a reference
we have not done any TAK UI
once we do we are gonna see catastrophic 

you saw all the stuff I had to do.. to get it running
there is a lot of hairy stuff
we are not just gonna swap sutff
We got all the KOTLIN stuff out theway

Radial Menu API, they already have it.. 
move it to the next version
depricate a compe and new one
prob gonna do a v2 and deplicate the old one.
right thing to do
> OTHER THING TO BRING UPthey can't. keep up 
> josh wants to move to JetPack.compose

PROS and CONS

---

Thomas and Zach working on the same thing
--

Evidence building
next couple of weeke firm up our position on TAK UI


--

Final Submission, from Jordan's email

TAK UI eval?

Time of Materials

Get some time to talk about how we want to submit this
what is the format and submission 

Include them in the final report, the 
dt-issues-doc-v5.4.md

---

# Zach, Abel and Josh end of Day Monday - April 27

### Summary
TIFF and pre-caching issues were debugged via ProGuard obfuscation and unintended reflection usage discussions with a major decision to correct code.

### TIFF and ProGuard Issues
Debugging of a TIFF issue revealed a ProGuard obfuscation problem that was masking a separate pre-caching failure. The team confirmed that the memory leak investigation is complete and the user manual was submitted.

### Gray Tiles and Caching Failure
Issues with gray tiles and building detection running prematurely were attributed to a common root cause and the gray tiles issue is now considered complete. The pre-caching failure is currently limiting tile caching to zoom level 18 instead of the expected 19, suggesting a release environment-specific issue.

### Reflection Identified and Corrected
Debugging revealed that the system was unintentionally using reflection on line 1882 to prevent ATAK obfuscation, necessitating the use of actual qualified classes instead. The major decision was made to remove the reflection code and use qualified classes to fix the ProGuard obfuscation issue.


### Next steps
[Abel] Draft User Story: Convert the decision regarding building detection running inside the application into a new user story.
[Zac, Josh] Meet with Josh: Meet with Josh to discuss the TIFF issue and verify if the problem is user error. Review the system behavior observed on the APK environment.
[Zac] Collect Error Logs: Gather a full print line of the sTAKk trace and error logs from the release environment. Analyze logs for obfuscated method calls causing caching timeouts.
[Zac] Update Codebase: Instruct Claude to remove reflection use; implement actual qualified classes for ProGard obfuscation. Validate changes in dev environment; test assembly production version.
[Zac] Review Codebase: Search for additional instances of reflection usage. Update all located instances.
[Josh] Fork Project: Fork the TAK UI project. Move the project into the Rise 8 group.
[Josh] Push Changes: Push existing development files to the forked project.
[Josh] Start Development: Begin implementation of the radial menu functionality.


### Details
**Discussion of TIFF Issue and Debugging:** Zac is working on a TIFF issue where the functionality was not working on the release APK, causing an immediate error. They corrected a ProGuard obfuscation issue, which subsequently led to new errors where the map pre-caching failed due to an alleged non-existent zoom level. Zac is currently seeking assistance from Josh to investigate whether the problem is user error or a deeper issue.

**Status Updates on Completed Tasks:** The memory leak investigation during building detection is complete and merged into the latest release. The user manual was submitted today, though Abel plans to keep its status as in-progress until receiving external confirmation.
Progress on Gray Tiles and Building Detection Issues: The issues concerning gray tiles and building detection running before maps finish loading are believed to be related to the same root cause. Zac removed a fallback TIFF, which led to another related issue, and they are verifying the correctness of the fix before pushing it.

**ProgGuard Obfuscation and New Issues:** A previous fix addressed a ProGuard issue that was obfuscating class names and preventing data retrieval for pre-caching. Once that was fixed, a new issue appeared, suggesting that one error was masking another, and resolving this should result in a clean system.

**Pre-caching Failure Details:** The current issue is that the system is unable to cache tiles during pre-caching, claiming that tiles do not exist at zoom level 19, despite suggesting that the best available zoom level is 18. This problem seems to be limited to the release environment, pointing toward a possible ProGuard issue, even though the application still functions.

**Timeboxing and Next Steps for the TIFF Issue:** Abel emphasized the need to time-box the issue to prevent it from becoming a "never ending thing". Zac is scheduled to meet with Josh to review the issue and potentially propose removing the pre-caching functionality entirely if a quick fix is not viable, though Josh wants to run the issue down to ensure the best possible data is provided.

**Issue of Pre-caching Functionality in Release:** Zac expressed concern that a broken feature (pre-caching) is communicating to users that it is working when it is not in the release APK. The system is not performing pre-caching in the build version after ProGuard processing, unlike in the development environment.

**Clarification of Gray Tiles Resolution:** Zac confirmed that the functionality for checking for the best tiles is working correctly, which allows the system to properly handle the handoff during caching when the process does not work. They confirmed the gray tiles building detection issue can be considered complete.

**ProgGuard as the Root Cause of TIFF Issue:** Zac explained that the ProGuard obfuscation was the root cause, and the TIFF problem was merely a symptom. ProGuard only runs when packaging the military (mill) build, which explains why the issue surfaced there.

**The Backup Image and Warning Popup Fix:** The original problem was that when TIFF conversion failed, the system generated a backup image with red error text and ran detection on it, leading to false results. Zac has since removed the backup image path and added logic for a user-facing popup warning that says "Tile capture failed" and that "Detections may not work properly".

**The ProGuard Issue is a Silent Failure:** The specific failure mode caused by ProGuard obfuscating classes in the mill build is a silent failure, visible only in the logs. This silent failure has the potential to affect features beyond the TIFF path, as the inability to retrieve high-quality NAI P plus imagery could result in feeding the detection model blurry or subpar map data.

**Need for Error Logs and Investigation Ownership:** Josh confirmed that the pre-caching timeouts are likely due to obfuscation involving a transient dependency and requested a full sTAKk trace in the release logs to identify any obfuscated method calls. Zac owns the initial investigation and will consult with Josh to rule out user error.

**Troubleshooting STAKk Traces and Logging:** Josh stated that deep understanding of issues requires full sTAKk traces and extra logging, specifically suggesting using a try-catch block around relevant calls to print output, even in a release version. They noted that variances could exist between the main Java Archive (JAR) used for compilation and the runtime environment being utilized, advising the team to run assembled production code with the extra logging to observe logcat errors and sTAKk traces.

**Resolution of ProGuard Issue and Discovery of Reflection:** Zac confirmed that the previous ProGuard issue was resolved by changing the search method rather than modifying ProGuard configurations, which led them into a new timeout issue. Josh realized that the team was unintentionally using reflection after Zac showed a code change in the factory class, which used a `class Java` approach to prevent ATAK from obfuscating it.

**Identifying and Correcting Reflection Use in Code:** After reviewing the code, Josh confirmed that reflection was being used on line 1882 with a `reflect` call. They instructed the team to remove the reflection, specifically the `class for name` call targeting `commi atTAKk map layer`, and instead use the actual qualified classes directly so that the code would be correctly obfuscated with ProGuard.

**Assignment for Code Correction and Further Review:** Josh assigned the task of addressing the reflection issue to "Claude," instructing them to use the actual qualified classes, not reflection, to allow for proper obfuscation with ProGuard. Zac was also asked to search for any other instances of reflection in the code to ensure all issues of that nature are resolved.

**Updates on Next Steps and Commitments:** Zac announced they had to conclude the meeting to attend a gym meeting to organize a back-to-school volunteer event in August. Josh committed to forking the TAK UI project, moving it to the rise 8 group, and starting work on the radial menu implementation.

---

## The TAK UI Recap - PM, end of day Monday april 27

### SUMMARY
GRG component scope finalized for plug-in implementation with radial menu update prioritized, amidst significant architectural risks from Jetpack Compose and ATAK constraints.

### GRG Scope Confined to Plug-in
The key technical decision was reached to keep the GRG component within the plug-in, specifically the grid expectation actual, rather than promoting it to a TAK UI core component. This was due to GRG's specialized, plug-in-specific nature and its absence in the TAK kernel. The decision means no TAK UI API is needed for this component, reducing dependency on core development bandwidth.

### Radial Menu and Platform Priorities
The radial menu was categorized as a TAK UI core item requiring updates to support nested hierarchical functionality across all platforms. Platform priority was explicitly guided as ATAK first and WinTAK second, noting that WinTAK's GRG implementation will require custom low-level primitives due to elevation requirements. The missing GRG specification document was identified as a gap that must be closed to unblock future collaboration.

### Architectural Risks Identified, internally
Significant long-term architectural risks were flagged due to TAK UI's lack of native Jetpack.Compose integration, which will prevent participation in Google's emerging App Functions/Gemini AI agent ecosystem. The sole member (or few members) of the TAK UI team and ProGuard obfuscation on the ATAK SDK were also cited as major sustainability risks. Abel reminded the team that the  current task is to assess and recommend, not to migrate.

### DETAILS

**TAK UI Recap: GRG Spike Investigation and Decisions:** The meeting started with a recap of the spike where Josh investigated TAK UI native rendering support for GRG (grid display). Josh confirmed that ATAK bindings exist in the GRG library, and they were able to prototype an ATAK implementation. However, WinTAK has no existing bindings, meaning any GRG implementation there would require custom work. 
> Abel's takes: I need to understand the WinTAK "callout", Start with defining "bindings", So It means that when Josh "creates" The Grid he will use ATAK, and since there are no "binding" that grid cant be re-used for WinTak? meaning they have to create it for WinTak too? 
Furthermore, TAK X GRG APIs only exist on the ATAK JVM side and are not present in the TAK kernel, which surprised Nathan. The key technical decision reached, as recommended by Nathan, was to keep the GRG component within the plug-in, specifically the grid expectation actual, rather than promoting it to a TAK UI core component. The reasoning for this decision is that GRG is a specialized, plug-in-specific capability, which is not considered general enough for TAK UI core, it is not currently in the TAK kernel, and it specifically requires the GRG builder plug-in to be installed. Josh agreed that this approach could work without requiring a TAK UI binding. Nathan committed to following up with Sean and Chris from their team to understand the historical context of why these APIs exist in core versus the TAK kernel, as this context may inform whether the component eventually moves to the TAK kernel.
> Abel's takes: There's lots going on here that I am not following, I realize there are terms I am also mixing up. Prioritize these terms and understanding how they relate.  [ATAK binding, GRG library, GRG APIs, TAKX, TAK Kernal, TAK UI core, ]

**GRG Component Platform Priority and WinTAK Implementation:** Nathan provided an analogy, comparing the GRG decision to the combat swim plug-in's PDF dive plan report, where ATAK and WinTAK implementations are kept within the plug-in and not pushed to core due to a lack of general applicability. Nick's guidance on platform priority was explicitly stated as "ATAK first, WinTAK second," because ATAK and WinTAK are the two fielded platforms that SOCOM pushes out, and WinTAK is considered low priority, so its implementation should not be allowed to slow down fielding. The plan is for TAK UI to eventually cover TAKX, but a measured approach should be taken. Regarding the WinTAK GRG implementation, Josh noted that WinTAK will likely require lower-level primitives beyond just polyline because GRG uses elevation to render lines correctly, and straight lines alone would not be accurate enough. Thomas, who previously worked on the WinTAK side, should be brought in for context on this. There is currently no specification document on Confluence regarding PDF for GRG.
> Abel's Takes: another term, primitives

**Radial Menu Conclusion and Follow-Up Actions:** Nathan and Josh concluded that the radial menu is a distinct use case from GRG, and it should be supported across all platforms. The radial menu was categorized as a TAK UI core item, not a plug-in specific one, requiring the TAK UI binding for the radial menu to be updated. Josh committed to submitting a Merge Request (MR) or draft for review by the end of day tomorrow for the ATAK GRG component. Nathan committed to reaching out to Chris and Sean to investigate the history of the GRG APIs in TAK core versus the TAK kernel. Thomas will be looped in regarding the WinTAK GRG implementation, as they own that context. Since no spec document exists for GRG, creating a simple document was considered for Nathan and Booze Allen's reference, as it is a gap worth closing that would unblock support. The radial menu remains an open TAK UI update item that needs to be tracked separately. The Product Manager (PM) considered the decision to keep the GRG component within the plug-in as good news, as it reduces dependency on Nathan's bandwidth and the TAK UI core timeline. The PM also affirmed that the missing GRG spec is a gap that must be closed. Thomas needs to be involved in the WinTAK conversations to prevent knowledge from being siloed. The radial menu was confirmed as a TAK UI core item and must be tracked as a separate contributor merge request effort.

**TAK UI and Jetpack Compose Relationship and Gemini Integration:** It was clarified that TAK UI does not use Jetpack Compose by default, though it is inspired by it. The design decision to minimize dependencies was intentional due to ATAK's conservative dependency management and version targeting constraints. Nathan's long-term vision is to move towards Jetpack Compose as the default, but this is not currently feasible. Josh flagged App Functions, Google's Compose annotation system for agent runtime, and Gemini integration, though Nathan was unfamiliar with these and flagged them as something to watch but not immediately actionable.
> Abel's Takes: this is more of an internal discussion point that we should consider adding to our assessment.

**Final Decisions and Task Confirmations:** The GRG component decision is to stay in the plug-in, meaning no TAK UI API is needed, and Josh is the owner, with no further spike effort required. The radial menu already exists in TAK UI but needs updating, and Josh will investigate this during the current week. The issue of GRG APIs not being in the TAK kernel is owned by Nathan, who will follow up with Chris and Sean for their context, but this is not a blocker. The `ActionBarView` item is assigned to Thomas to pick up once they are clear of their current work. The slider example was already sent by Nathan, and Rise 8 will reference it when they begin working on those stories. The team will continue working through remaining flow stories asynchronously via Mattermost. Primary remaining workflows include: placing a grid, finding and labeling buildings, and labeling and drawing sections. Abel will continue working through these stories and will loop Nathan in as necessary.
> Abel's Takes: I need to determine what framework, structure we should use to provide SOCOM the assessment report. Personally I think it should include a backlog, prioritized and also some sort of supporting doc, for each user story, Consider something similar to the Spreadsheet.

**Product Manager Top-of-Mind Items and Next Steps:** The Product Manager's key takeaways were that Josh's spike is complete, the GRG stays in the plug-in, and no further TAK UI API is needed, so the spike should be closed. The Radial menu is Josh's next item this week and needs to be tracked. Thomas has a clear next action, the action bar conversation, once they surface from their current work. The App Function/Gemini agent runtime topic is worth monitoring, as it could become irrelevant if AI capabilities expand on Android, but it is not actionable now. The meeting cadence (async via Mattermost) is working, and no process changes are needed. Formal next steps include: 
- (1) closing the spike, formally documenting the outcome (GRG stays in plug-in, no TAK UI API needed), and updating the story tracking system to ensure a clear record; 
- (2) Have Josh work on the Radial menu, confirming they will look into updating the assistant TAK UI radial menu this week, ensuring a clear deliverable is tracked; 
- (3) following up with Thomas to pick up the `ActionBarView` conversation once they are clear of current work; 
- (4) updating the native versus escape hatch breakdown table for the "place a grid" user story with the confirmed answers from Nathan; 
- (5) moving to the next user stories, specifically labeling sections and drawing sections, and walking through these asynchronously via Mattermost before the next sync with Nathan; 
- (6) creating a basic GRG spec document, even a lightweight one-pager, as Nathan requested it, and it will unblock future Booze Allen collaboration and serve as a reference for WinTAK implementation work with Thomas.

**Radial Menu Tracking and Deliverables:** The Radial menu needs to be tracked as an open spike. Josh's specific deliverable is to investigate the existing TAK UI radio menu abstraction, assess the necessary updates for nested hierarchical support, and produce a proposed API design draft to share with Nathan via Mattermost. Abel is assigned to check in with Josh on this progress before the next sync with Nathan.

**Topics for Follow-Up with Kevin/IPM:** The following items were identified for follow-up with Kevin (or for the IPM): 

* (1) **GRG Grid:** Confirming that GRG staying in the plug-in and requiring no TAK UI API changes the story estimates and approach. 
* (2) **WinTAK GRG Implementation:** Acknowledging the need for custom work and lower-level primitives, noting Thomas owns this, and asking about the effort and associated risk. 
* (3) **GRG Spec Document:** Determining if one should be created and who owns it. 
* (4) **Radio Menu:** Josh is investigating the existing TAK UI radio menu abstraction and nested hierarchical support; the key questions are the realistic timeline, the complexity of the implementation, and whether Nathan's bandwidth affects the review or merge timeline for this TAK UI contributor MR. 
* (5) **`ActionBarView`:** Thomas has this as the next item once they surface; the question is what Thomas is currently working on and when they will be available. It was noted that Thomas is working on their 'jam update' and will start working on the action bar tomorrow (00:08:44). 
* (6) **Bugs from the DT:** Several bugs across `5.4` and `5.6` were common via email from Josh and Cliff. Before the email arrives, the team needs Kevin's gut assessment on the residual markers bugs, given that he already identified the likely root cause as ATAK dropping messages. It was noted that 5.4 was never in the prototype scope, so the team needs guidance on how to handle those findings, specifically regarding the May 15 and follow-on extension month scope.

1. **Technical Risks and Team Assessment:** Josh explicitly warned that the TAK UI migration is not a simple swap and that introducing TAK UI components into the plug-in will have catastrophic effects. 

2. **Nathan's Capacity:** Nathan is the sole member of the TAK UI team, raising concerns about the sustainability of the partnership and whether they can support the project. 

3. **Jetpack Compose Gap:** The lack of movement toward Jetpack Compose presents a real, long-term risk, as TAK UI may become incompatible with the future direction of Android, Google, and Gemini agent capabilities. 

4. **ProGuard Obfuscation:** ProGuard obfuscation on the ATAK SDK is a significant point of developer friction, making it harder for plug-in developers and potentially rendering it incompatible with future AI agent integration. It was confirmed that the team explicitly told SOCOM and Nick that the task is to "review, assess, and recommend," not to "migrate,"setting the expectation that the deliverable is the findings of the pros and cons assessment, not a completed migration. Josh confirmed the radio menu should be fine and will investigate, likely requiring a V2 component with the old one deprecated, which was deemed the right thing to do.

**Product Manager Internal Gut Check and SOCOM Communication Strategy:** The PM's internal conversation (pre-IPM gut check) confirmed that the team's concerns are genuine and need to be surfaced diplomatically to Nik, framing them as findings, risks, and trade-offs identified during the assessment. The risk of Nathan being the sole member of the TAK UI team is worth raising directly with Nick, not as a complaint, but as a program risk that affects everyone's success. Josh's bottom line is that if Nick wants the work done properly, it requires more than a couple of developers on a bridge contract.

**App Functions, Jetpack Compose, and TAK UI Future Architecture:** Josh raised the topic of App Functions—Google's new Jetpack Compose-based annotation system that exposes app functionality to AI agents like Gemini on Android (currently rolling out to Samsung devices). This system will become the standard way Gemini and other agents interact with Android apps. The implied concern is that if TAK UI is not using Jetpack Compose, it will not be able to expose functions to AI agents in this manner. Nathan's response acknowledged that TAK UI is inspired by Jetpack Compose but not built on it, a design choice made intentionally due to ATAK dependency management constraints, and while they want to move there eventually, they cannot currently. Josh's internal assessment after the call was that the Jetpack Compose gap is debilitating for TAK UI's future, and Nathan and Booze Allen may not fully grasp how debilitating it is. Furthermore, ATAK's ProGuard obfuscation compounds this issue because AI agents cannot work with obfuscated methods. Josh's view is that when Gemini and agent runtimes mature, TAK UI will be unable to participate without a major rewrite. They believe the smarter move would be to migrate everything to Jetpack Compose or even Flutter now, rather than continuing to invest in TAK UI's current architecture. The summary of this risk is that Google is making Jetpack Compose the standard for exposing app functions to AI agents like Gemini, TAK UI's current architecture cannot participate, and ATAK's obfuscated SDK exacerbates the problem.
> Abel's Takes: These are internal risks we flagged that we must report on..

---

## TUESDAY IPM PLAN

TAK UI 

```
Task 2 — TAK UI Research and Migration
4.3.2 — Research and provide a cost and timeline estimate for rewriting the plug-in into the TAK UI framework. Goal is to establish TAK UI Bridge language cross-compatibility.

* TAK-UI feedback / plan
```

> JOHN, User Manual
- Clone the repo, needs HELP (access gateway)
- Can atleast make edits in a google sheet
- Will show Abel (me) content wise
- "expanded scope"

> ZACH
- TIFF issue, there are still reflections in the code, breaking pre-fetching titles, will work on that, correcting that. "BUG FIX"
- 

> THOMAS
- JAMF issues? cant access TAK Forge with Git, they had to add that domain to a list
- `MR` nathan shared with us, looked at our implementaiton of ActionBarView, it looks like it shoudl work. no full context how ours works.. compared, later pair up with Zach a bit.

> KEVAN
- Nik convo on Friday, sent it over to John to review
- General Format for GOTS Eval delieverables, Time with John and Abel.

* WE DONT DECIDE WE ADVISE, Let's be direct
* What the different WinTAK support


## 1. Wanted to take a moment to realign on what we are delivering for TAK UI by May 15.

* The deliverable for SOW 4.3.2 is `an assessment document — a research-based cost and timeline estimate for migrating the AI GRG plugin to the TAK UI framework.` That is what SOCOM has asked for and what we are building toward.

The spikes, workflow analysis, and BAH sessions we have been running are the research. They are what give the assessment its findings and make the estimate credible. That work is directly relevant and on track.

* What I owe yall is to finish the remaining user worflows, UI Framework Mapping..

* Go over them together and align on what the spike consist of, and bring your findings back to discss with BAH and ultimately add the into this document. 

* Let's get this done, with enough time before the 15th to allow Kevan to work through the cost and timeline section 

## Card 2: Proguard Obfuscation and Reflection Causing Silent Failures in .mil Builds

**What's broken / the opportunity:** 
- Reflection-based code breaks silently when Proguard renames classes during `.mil` packaging
- The plugin uses reflection to look up classes by name at runtime. 
- Proguard renames those classes in `.mil `builds, so the lookups fail without surfacing an error. This does not happen in dev or .civ builds.

**Source / How it surfaced:** 
- April 27 pairing session, Zach and Josh, during .mil APK testing.

**Why:** 
- The `.mil` build is the only one that ships to SOCOM operators
- Failures invisible in dev and `.civ` reach the field. 
- The pre-caching timeout is one confirmed symptom; other affected paths are not yet scoped.

**Blocker or Risk if not addressed:** 
> Scope of reflection use in the codebase is unconfirmed
> Josh identified `line 1882` as one instance. 
> Zach was asked to search for others. Until that search is complete, the full impact is unknown.

**What we're doing about it:** 
- Josh confirmed the fix; Zach owns implementation and codebase search
* Remove reflection at `line 1882`, use qualified class references directly. 
* Zach also searching for additional instances. 
> Coding fix ownership is not fully confirmed — notes attribute it to "Claude."

**What done looks like:** 
1. Pre-caching completes on `.mil` APK across repeated runs with no silent failures in logs
No timeout on 2nd and 3rd attempts. 
2. Zach and Josh confirm no remaining reflection in the codebase.
3. ensuring user feedback is CORRECT? --> Pop ups, 
- We did NOT RUN at all (local data), WE DID RUN, but 4 our ot are blank, 

**How to prompt the engineers / suggested next steps:** 

* Ask Zach: "Did the codebase search turn up any other instances of reflection beyond line 1882?"

* Ask Zach or Josh: "Who owns writing the fix — is that you, Zach, or was it handed to Claude Code?"

* Ask Josh: "Once reflection is removed, is there anything else needed before we can do a clean .mil validation run?"

---

## Triage and Drafting Session Summary — April 27-28

**What we started with:**
A single bug ticket — plugin running detection on a backup image when TIFF conversion failed, producing false building detections. Abel and Zach had been pairing on it, but Zach found new issues during testing that changed the picture.

**What triage revealed:**
Three potential issues. After working through each:

1. **TIFF / backup image bug** — Zach fixed this on a branch. Backup image path removed, warning popup added ("Tile Capture Failed, Detections may not work properly"). Fix is in code but not merged. Full .mil verification is blocked by Issue 2.

2. **ProGuard obfuscation / reflection** — Surfaced when Zach tested the .mil APK to verify his TIFF fix. Josh joined the pairing session and identified the root cause: the plugin was using reflection (looking up classes by name at runtime) which breaks silently when ProGuard renames classes in .mil builds. Fix confirmed: remove reflection at line 1882, use qualified class paths. Zach to search for other instances.

3. **Buffer space** — Dismissed. One-off, not reproducible.

**Artifacts drafted:**

- **Bug ticket** (Card 1): "Plugin runs detection on backup image when tile capture fails, producing false building detections" — full rewrite with updated acceptance criteria and ProGuard dependency noted.

- **Chore ticket** (Card 2): "Remove reflection and add accurate pre-caching state alerts to resolve ProGuard obfuscation in .mil builds" — covers the technical fix plus accurate operator messages for all three pre-caching states (no run, partial run with errors, full successful run). Time box requested by Kevan; duration not yet confirmed.



Kevan 1:1 — Talking Points

1. Pre-IPM format
I need more time with just you and Jonathan before the full team. The technical depth on pipelines, APK versions, and TAK UI abstractions moves too fast for me to track product decisions in real time. Can we add 30 mins before IPM for just us three?

2. TAK UI and BAH next steps
Josh has the grid display and radial menu spikes. Thomas has ActionBarView. I need your read on: are the time boxes confirmed, and are grid labels and slider API assigned? I want to make sure we have a clear package to bring Nathan before the next BAH sync.

3. Bug and feedback triage
DT bugs are in from Josh and Cliff. I need your help separating ATAK platform instability (not ours to own) from plugin issues we should fix before May 15. What is the filter you want to apply?

4. GOTS next steps
Before I schedule anything with Nik on the maneuver domain, I want your read: is a VSM for route planning worth pursuing internally first, or do we go straight to the follow-up session with Nik?



--

## Session Summary, Appril 24 

Started with triaging three pipeline issues stemming from the "Implement Parallel Matrix Pipeline" chore:

Parallel Matrix Pipeline -- Deprioritized April 21 by Kevan. Confirmed later in the session that the matrix build (5 ATAK versions per job) is already live in the pipeline. GitLab comment drafted to document the pause and Josh's pivot.

release_internal timeout -- Resolved April 22. Josh built pads-fast to replace the upstream publish service. All 5 ATAK versions now publish successfully. PM card saved to tak-daily-april_20-24.md at line 846.

assembleProduction slowness -- Open. Dependency check identified as a contributor by Josh. Chore drafted this session. Lower priority than TAK UI work per Kevan. PM card saved at line 888.

User manual: Zach rebased, pushed, and pipeline ran. MR was pending two approvals. Pipeline structure confirmed: 7 job types x 5 ATAK versions per run.

Josh sync (April 24): GRG grid display spike pivoted away from Polyline -- Josh is using the ATAK JAR directly, building a prototype. ATAK only; WinTAK documented as a gap; WebTAK separate. Kevan's call.

Radial menu spike: Handed off to Josh. Full spike artifact drafted and cross-referenced against source material. Time box still needs confirmation.

Chore drafted this session: Resolve assembleProduction Job Timeout Failures -- ready to post to GitLab.








//////////////////
Claude, 

As a Product Manager, I am attempting to provide my engineering team and product designer guidance/direction and some sort of way to structure the deliverables. SOCOM wants us to migrate the AI GRG plugin to the TAK UI framework. The initial approach the team was gonna take was to provide Nik and SOCOM an assessment based on user stories and workflows @TAKUI-escaphatch-strategy.md, and as we been working through @takui-migration-workflows.md , that has slowly "pivoted" or started to "drift" to suggestions or nudging the engineers to start implementing as much as they can.. the "unofficial" pattern or workflow is

1. Abel, Jonathan and Claude Code take the 8 to 10 user stories and run the @takui-migration-workflows.md, then bring in Engineers to discuss.
2. Research/Discovery spike on a component or UI/screen, etc based on an end to end user story workflow
3. Return with your findings, and recommendations
4. Determine what to bring up to Booz(BAH) and Nathan
5. Decide what to do next in terms of development towards migrating AI GRG to TAK UI

There appears to be a "break" or misalignment and ambiguity on what to do for steps 4 and 5. I will try to identify the current situation, what makes it complicated and challenging.

a) The bridge contract ends in 3 weeks, While we are expecting to be awarded the Large contract after May 15th, it's not clear what the gap will be between the end and the re-start, SOCOM was VERY specific on what they want from us by the 15th, "4.3.2 — Research and provide a cost and timeline estimate for rewriting the plug-in into the TAK UI framework. Goal is to establish TAK UI Bridge language cross-compatibility." and Jordan said "TAK-UI feedback / plan" So that means any sort of development or migraton effort is OFF THE TABLE and we must keep that in mind, but this is also causing confusion with the Engineers, since they have been also "sugged" or "nudged" to do development if Nathan.BAH OK our suggestions

b) Nik has all his eggs on the TAK UI basket, he sees it as the ideal state and has the TAK Offsite conference in August he wants to announced AI GRG as one of the first plugins along with xCheck that will be TAK Native in the short-term.. 

c) Josh and to a certain extent, Kevan have strong opinions on SOCOM and Nik's general TAK UI plan and strategy. Josh has flagged concerns with the framework and most recently his red flags about Jetpack Compose, Proguard and "agent runtime, etc" Kevan, with his GOTS evaluation and MOSA asssessments, Has already made progress with Nik and SOCOM describing a future where SOCOM is focus on the domains, missions for a more interoperable and connected ecosystems (libraries, components, etc) This does not really "fit" into the TAK UI future state.

d) As the PM I need to have clear outputs, deliverables outline and defined for the TAK UI expected task deliverables, and make sure this is clear to the engineers and we can provide the customer the assessment documentation and recommendations that would not just satisfy 4.3.2 for SOCOM but would give my engineering team a clear deliverable to focus on.

Correct 4.3.2 does not authorized development, however two factors have made us start "sliding" towards "some" development

- The confidence or assumption that we would get a 30 day extension post May 15th and "slide into" the 5 year long term contract
- We are gonna get the 5 year contract, eventually.. so why not just start some development while we can..
- Wanting to "show Nik" we are capable and sorta establishing or making "inroads" with SOCOM and Nik..


---

- Talk through the stories
- Defining the specific questions we are ASKING FROM THE DEVS and how to make sure that gets into the Asssessment.
-- t
* Time
* Risk


- Documented
- 


# IPM


UPDATE

- removed reflections
- ""working properly
- Shift from Dalogue Box to TOkens, (file cache)

THE BUG
- message to the user is improper
> the API is not well buiult, v2 rec.. so that can depricate the old versions, 
> effort shouldn't be super high, 
> Thomas, How much do we want to actually start contributing to TAK UI, we are getting mixed signals
> CONTRIBUTING VS ASSESMENT
addig code to TAK UI

Thomas, Kevan to agree


ActionBarView
- run test, make use of changes Nathan sent us
- See if it fits our needs, to know for use if is No Op or effort involved
- 


STORY 1: Place and Define Grid Parameters
**Updates**
- SPIKE: Investigate TAK UI Native Rendering Support for GRG Grid Display [COMPLETED]
    -> NEXT, Josh 


STORY X: adjust the setting of my GRG, 

STORY 2: Draw Sections Within the Grid
> S1: activate section drawing
> S2: Draw section
> Scenario 3: Configure section options 

Story 3: [ai]Detect and Label Buildings Within Grid Sections
> S1: Run AI building detection
> S2: Review and correct building labels

Story 4: Manually Label Buildings

ARE THESE PART OF AI GRG "specific" workflows?

STORY : Add non-building details on map(AOI)

STORY : Export GRG artifact for distribution

STORY : Review and Refine GRG with Team

STORY : Share GRG Files with mission execution team

CONFUSING
* TAK UI development,
* JAMF migration

THOMAS, LACKING
- a well define set of tickets
- FOR MY SIDE, Documentation piece, 
A recommendaiton or level of estimate
Each engineer
FInal decisioo

Thomas, When I try to understand
I am being a little too analytics, too
specific with the acceptance criteria
HERE IS WHAT WE ARE LOOKING FOR
is not THE STEPS
THE OUTCOME

---

# End of Day 4:35PM - Huddle

1. Pipeline issues (Thomas and Zach)
- different pipeline issues
- 

2. 5.6 Crashes when selecting Meters in GRG Export

- there is a spinner in the dropdown

# Stand up - Weds APRIL 29

1. App crashing Bug fix

MR gets approved and merges to master - needs two approvals, you said Zach's MR is pending review this morning

Pipeline triggers automatically - all 7 jobs run, you're looking for all green including assembleProduction

MR also needs to merge into the maintenance branch (maintenance-5.6) - this is what triggers the .post stage and release_internal

release_internal publishes to the Package Registry - this gives you the APK link

You download assembleProduction APK - not the Mil or Civ variants, specifically assembleProduction

Uninstall the existing plugin on your device first - then install the new APK

Run detection 3-5 consecutive times and confirm consistent results

- JONATHAN, Clone the .mil repo, needs help
* User Manual revisions, content - at least

[THOMAS]
- looking over Zach's MR, to merge it and test it and send it out
- End of day, he got TAK UI repo pulled out, to do testing, with the Test Project Josh set up (https://git.tak.gov/rise8/tak-ui/-/commit/0392xyz, verifcation around action bar menu-view, That Nathan has done to see if it fits our needs. Set up, will try to test it today.
- pairing around: TAK UI findings

///

# Weds, April 29th 1030am How do we want to set our selves up for success with this client
- what story do we want to tell
- what evidence
> How do we express that? what artifacts? "orienting scenario"?
> AI assisted tactical engagement
https://gitlab.gl.rise8.us/rise8-all/delivery/engagements/socom/tak/socom-tak-journey/-/blob/main/in-flight/orienting-scenario.md?ref_type=heads
 - future state journey

 Designing a journey for operators to plan and execute a mission, as opposed to "working on a plugin"
 - here is how the people, data and model, the plugin and cross-domain plugin fucntionality can work togehter..
 
 **They met yesterday, what would make sense for deliverables**
 Things to have, that woudl be good

 1. scenario doc, **future state journey map** [we-dont-have-a-current-state], future state journey map, (Orienting Scenario: AI-Assisted Tactical Engagement) the journey map is gonna CONVEY how the different domains are coming togehter. IDEALLY have some mockups that illustrate those key momments in the Journey. basically, how do routes come together , mockups to inspire
>THE GOAL is to try to get SOCOM "oriented" for how we want to execute this contract
-- Kevan GOTS and TAK UI, is where "it fits"
>> Kevan the assessment "you suck", here is the vision, the path forward (we did the MOSA evals, here is a cohesive vision of all the layer pieces in.. move off the current indepednet plugin and TAK UI, move away this weird "cyber approach", instead here is a coherent scenarios)
>> GOTS Eval is we review, here are the problems and propose 
>> TAK UI is related, we are gonna make some suggestions (based on what Jonathan said)
>> The Report that comes out of TAK UI migraiton, cost and timeline, to actually do the timeline. - We need to get very specific, include a report that "this will never be a compelte one" since we were told GRG should not be in TAK UI, so where is the actual boundary.. specially if it just provides core components (ToolBars) where is the engineering value if you are sitll doing majority of dev in native ATAK -- Reduce risks to mission and reduce risk to force.. it will resonate why we need good UX frameworks and then go into engineering time to deveolopm new capability.

///
**TAK UI Assessment Doc** 
- Abel, figure out general time, not cost.. let's do TIME and run through Cost later, WHAT WE NEED TO KNOW
1. total time
2. how to get AI GRG most integrated with TAK UI native component, for both ATAK and WinTAK, Here is the total time for getting our Plugin to TAK UI for WinTAK and ATAK functional parity for WinTAK.. Because they ahve said they dont wanna support everything.. call out what we have to duplicate across wintak and atak. for example GRG is one.. and call out this will have to be fully maintain and escape hatch.. and the level of importance and what the value is.. and we can show how much of our plugin functinality is gonna be cover by TAK UI, aside from basic compoene,ts like toolbars, wahts the value of that if our specifif cstuff is nto vovered and highlight the jetpack.compose, the stuff Josh called out.. value loss, highlight the value and show case that.. the last thing is.. How many different version of ATAK are we supporitng TAK UI.. liek Nathans Radial menu callout. THey do suppor vs not.. -
how many different varients of components are we suposed to support in TAK UI, capture the risk.
- we can still do that.. MR, MRs 
- MRs to TAK UI , the purpose
* contribute to it
* build evidence (that we are able to do x amount of contributuons to it in two weeks, we have first hand experience contributing to TAK Ui within our assessment as well, ATAK and WinTak parity, it be good to go through that and will help us evalate how it much it cost and effort
* KEVAN, let's do ONE THING on TAK UI and revist - Let's do ONE end to end TAK UI contribtuon, for a component, to ensure it does proper ATAK and WinTAK.. What is the testing methodology for TAK UI? if I make a chagne to TAK UI, wahat is the testing? in the CI/CD how we test that change makes a varient in WinTAK variaent and TAK UI -- Kevan testing.. in house.. Go deep on how we test this and validate this end to end.. and then we can do a single contribution and say "we did this as part of the assessment" -- Kevan to me.. Abel you can get some time with Josh, get support.. How do I communicate this, Give Josh a high level task and tell him to work with THomas or even Kevan, and ping Josh.. to have technical -- DOnt feel like I have to do all this on my own and manage everyone.. message Me (kevan and Josh, I am trying to workshop this.. and speak to how to do this.. - Kevan has been pushing THomas to be more proactive. and not just have everything written out to him.,  ))
///

3. **current state: of plugin-delivery** Kevan to Abel, Grab time with Rob

2. **Design System and Research Process**, SECOND THING he wants to delivery (human systems context), TAK UI framework, Revise language "here is what a design system provides, in terms of how to use and when to use UI, comm trust and confidnce, reduce risk and uncertainty for missions.. - design toward operator outcomes. show how TAK UI is different and doesn't do what TAK UI does?, not framed as a replacement, TAK UI is just a collection of code to use for consistancy.. that's fine but is not a Design System..
> Kevan - make it part of our final report, presentantion. start setting the scene, deliverables.. 

3. Model Improvements
- we can close building density,
- GOTS submission and TAK UI "report"

### MAY 7th/8th - SHOOT FOR HAVE ALL ARTIFACT CONTENT DONE

---
 ## Outomces in Prod and Hypothesis - Wednesday April 29

### Summary
Meeting discussions aligned project goals with standardized outcome frameworks and defined specific mission success metrics.

*Outcome Alignment Review*
Participants identified the need to refine overly broad project goals. They established a specific outcome focusing on operator efficiency in production environments.

*Standardized Outcome Framework*
The team adopted a standardized Figma template to formalize signals, baselines, and targets. They set a goal of 50 percent time reduction for labeling 200 buildings.

*Metric Definition Finalization*
Team members decided to utilize post-mission operator feedback to track the 50 percent time-saving metric. This approach prioritizes clear leadership visibility into project progress.

*Next steps*
[Abel Hernandez] Draft Hypothesis: Draft specific hypothesis linked to the accurate GRG outcome.
[Abel Hernandez] Update GitLab: Transfer finalized outcome definitions and metrics documentation to GitLab before the 3:30 PM call.

### Details

**Focus on Outcomes and Project Status:** Abel Hernandez noted they were playing catch-up with UI, pipelines, code, and merge requests, which kept them from focusing on outcomes. They requested the session to revisit Jonathan Van Dalen's findings from a previous user call and to establish realistic expectations for the bridge contract, potentially validating a hypothesis via an experiment within the remaining three weeks.

**Review of User Findings and Artifacts:** The participants planned to review Jonathan Van Dalen's findings from a user call held the previous Thursday. Jonathan Van Dalen directed Abel Hernandez to the relevant Figma/Fig Jam artifact containing notes, quotes, and "field signals" from the interview, which they noted had not yet been formally shared.

**Clarification of User Journey and Project Scope:** Abel Hernandez recalled notes stating the draft user journey was a reasonable skeleton, but that operators emphasized it as a "web not a process," with phases bleeding heavily. Jonathan Van Dalen clarified that they needed to define whether the discussion of hypotheses and outcomes focused on the goals for the current bridge contract or long-term work, with Abel Hernandez indicating a desire to cover both.

**Current Plugin Outcomes and Impact:** Jonathan Van Dalen confirmed that the core impact of the AI GRG plugin on operators has not meaningfully changed. Abel Hernandez expressed concern that the current outcomes were too broad, specifically citing the agreed-upon outcome: "operators produce accurate GRGs in less time and with less effort".

**Validating the Current Outcome:** The agreed-upon outcome focuses on the operator (person) creating a GRG (task) with reduced time and effort (change in behavior). Jonathan Van Dalen explained that while the time-saving was proven during the prototype phase, it has not yet been validated in a deployed mission scenario, which is necessary to call it a "prod outcome".

**Developing a Specific Hypothesis and Key Results**: Abel Hernandez recognized the need to draft a hypothesis for the current outcome and specify key results (metrics) to confirm the desired change in behavior. This led to a discussion about mission baselines, noting that mission planning can range from one month to an immediate 15-minute response time, which influences the specificity of the hypothesis and acceptance criteria.

**Utilizing the Standardized Workshop Artifact:** Jonathan Van Dalen presented a Rise 8 standardized Figma board template for formalizing outcomes, which covers outcomes from a user/mission perspective, plain English signals, measurable metrics, baselines, targets, deadlines, and result documentation. The participants agreed to use this framework, moving forward with the established outcome: "SOF team leaders produce accurate GRGs in less time and with less effort".

**Defining Signals and Scenarios:** The discussion moved to defining the signals, or plain English indicators, that show the outcome is happening. They determined that signals should be more specific than the outcome itself and either come from hard system data logging or operator reports during mission deployment. A key signal identified was that "high complexity building imagery is fully labeled in dramatically less time".

**Establishing Metrics, Baseline, and Target:** The primary metric selected was time, specifically "*time to achieve an accurately labeled GRG of 200 buildings". The established baseline, based on previous SOCOM validation, was approximately one hour per 100 buildings, which was adjusted to two hours for 200 buildings. They set the target for this task at one hour, representing a conservative 50% reduction in time.

**Discussion of Cognitive Load:** Abel Hernandez inquired about the definition of "significant cognitive load," which Jonathan Van Dalen described as the mental effort involved in sequencing, starting and stopping new series of labels, and making continuous corrections and edits. While acknowledging that cognitive load presents many opportunities for future outcomes, they agreed to focus primarily on the time metric for the current outcome.

**Identifying the Metric Source and Feedback Tools:** The participants determined that the primary source for the metric must be either a post-mission interview/diary study or system reporting. Since functionality for analytics tools to report time and corrections is not currently built into the plugin, they will rely on data reported by Special Operations Forces (SOF) operators after real mission use.

**Next Steps for Outcome Documentation:** The "Results" section of the template was identified as the place to log evidence and findings after measurement and interviews. Abel Hernandez committed to transferring the formalized outcome and metrics into GitLab before an upcoming 3:30 meeting with Jeff Wills to provide updates on outcome progress.

**Discussion of GitLab Workflow Improvements:** Abel Hernandez expressed hope for improvements in the GitLab workflow, specifically mentioning the ability to use Claude to write issues directly into the backlog, a feature they had observed at the Impact Lab Ship Summit. Jonathan Van Dalen acknowledged the rapid development in AI, mentioning the new Claude design functionality.

**Importance of Maintaining Focus on Outcomes:** Jonathan Van Dalen emphasized that correctly defining outcomes is crucial for leadership visibility and for having focused conversations with stakeholders, as it is easy for discussions to drift from the intended goals. They noted that outcomes often need to be brought up repeatedly to guide project direction.


----

# April 30, PM's Thursday Planning

1. TAK UI migration assessment - *top priority*
* Josh's contribution work:
* The new `research-workflow`

2. Stable 5.6 release to Prod

3. Remaining deliverables for May 15

4. Demo, May 6th - plan

5. Issue Triage

6. Outcomes in Prod


[ZACH]
> Bug (center point null)
> Crashing error
--> All bugs are completed
5.4 acceptance

[JONATHAN]
- User Manual , sent to me, feedback
> quick story: User Manual
- Jon cant get the repo clone 
- Session with Nik (explore future of SOCOM TAK)

[THOMAS]
- Thomas, changes for user manual (ticket in GitLab)
- Bugs come up - prioritize (follow rise8 practices)
> test 5.4
- resolve Jonathans repo cloning
- Wrap up testing ActionBarView

## Daily Stand Up, Thursday April 30

### SUMMARY
Meeting reviewed software development status and finalized tile caching communication strategies and bug management protocols.

**Caching Thresholds and Bugs**
Tile caching failure thresholds were established at 25 percent to inform user messaging. Resolved grid and crashing bugs indicate development completion for the current version.

**Development Practices and Documentation**
Team members committed to logging all changes and bugs in GitLab for proper prioritization. Future vision planning will address shared data and plugins.

**Strategy for Future Releases**
Decided that no further development proceeds without formal backlog stories. Planning is underway for version 5.6 testing and a pre-caching feature demonstration.

### DETAILS

**Discussion of Tile Caching Thresholds for User Messaging:** Zach explained that they created the tile caching thresholds to assist with user messaging, setting failure thresholds at anything over 25% of missing tiles. Their approach was to inform users that if only one or two tiles were missing, lower quality tiles might be used, and anything above 25% missing tiles indicates a failure. Zach is open to the team changing the thresholds if necessary.

**Update on Bug Fixes and Development Status:** Zach reported that a bug related to unlocking the grid and deleting it has been resolved by ensuring the grid always retains a center point. Additionally, the crashing error has been corrected, meaning all known bugs are completed and all development is finished. The team is waiting for acceptance of 5.4 to proceed.

**User Manual Content Revisions and Future Vision Exploration:** Jonathan shared that they reviewed the user manual content and provided suggested revisions to Abel, noting the challenge they face with cloning the repository which is required to assemble the PDF. Jonathan also has a session scheduled with Nick to explore the future vision for SOCOM TAC, focusing on shared data, plugins, and a more coherent user experience.

**Tracking and Process for Changes and Bugs:** Thomas emphasized the importance of tracking changes for the user manual in a ticket or in GitLab. They also stressed the need for writing up new bugs so they can be properly tracked and prioritized before immediate resolution, adhering to "rise practices". Thomas committed to testing 5.4 changes and resolving Jonathan's cloning issue today.

**Status of Version Testing and TAC UI Migration Planning:** Abel confirmed that testing for version 5.6 is complete and looks good, including the fixes for the crash and the grid issue. Abel confirmed that Thomas will handle testing 5.4, and mentioned an upcoming TAC UI migration call to review the spreadsheet, discuss remaining stories, and draft spikes. Abel is working on a new format for the spikes based on recent feedback to better address questions required for the migration assessment document.

**Demo Planning and TAC UI Contribution Strategy:** Abel is planning the demo for next Wednesday around the pre-caching feature to showcase the user messaging and how it relates to imagery quality and potential future inference improvements. Kevin requested that Josh attempt one end-to-end TAC UI contribution to provide a full assessment of Rise A's development experience with Nathan's life cycle. Abel confirmed this is a specific request for Josh and not a general team task.

**Issues with Bug Triage and Prioritization:** Abel acknowledged Thomas's point about prioritizing bugs, noting that they are currently receiving many bug reports via email that need to be fully triaged and reviewed before being added to the backlog. They mentioned that they need to review the user manual and create a story for it.

#### Post Stand-up discussion

**In-depth Discussion of Tile Caching Triggers and Messaging:** Jonathan expressed a need for a better understanding of what causes caching problems to advise on effective user messaging, especially regarding recovery steps. Zach clarified that caching issues do not occur if the high-quality map data is already locally shared or saved. Caching issues leading to partial failures (e.g., 25% or 50% loss) occur in mobile imagery mode when service is shoddy and times out, or when a Level 19 tile is unavailable in a specific map area.

**Next Steps for Caching Messaging and Process Adherence:** Jonathan proposed that messaging should accurately communicate that not all tiles were retrieved and the cause may be poor internet or unavailable tiles. Both speakers agreed not to perform any further development work without formally capturing it in the backlog as a story to adhere to effective practices for triage and prioritization. Jonathan commended Zach for thinking about surfacing system behavior to the user.

### Action Items from Stand-up

[Jonathan] Find Contact: Identify appropriate personnel to address the blocked repo cloning issue.
[The group] Track Manual Changes: Ensure revisions for the user manual content are tracked in GitLab ticket system.
[The group] Document Bugs: Write up and track all new incoming bugs immediately for proper prioritization.
[Thomas] Test 54 Build: Perform required testing on the 5.4 build version with recent fixes.
[Thomas] Resolve Cloning Issue: Fix the repository cloning problem encountered by Jonathan.
[Thomas] Write Up Testing: Complete action bar view menu testing and document the findings.
[Abel] Prepare Demo Script: Develop a pre-caching demonstration script for the next Wednesday demo.
[Josh] Select Contribution: Select a suitable candidate project for an end-to-end TAC UI contribution.
[Abel] Triage Bugs: Review and fully triage incoming bug reports before adding items to the backlog.
[Abel] Review User Manual: Examine the revised user manual content and create a related user story.
[Jonathan] Discuss Messaging: Bring caching messaging discussion and potential revisions to Abel for prioritization.


----

# TAK UI - Internal team review: 

### SUMMARY
Team reviewed section drawing tool scenarios and validated technical components while planning future assessment activities.

**Section Drawing Tool Review**
Validation of section drawing tool activation and persistence confirmed reuse of native components. Participants clarified the technical implementation via existing native libraries.

**Configuration and Component Confirmation**
Discussions confirmed availability of specific UI components for settings and buttons within the native repository. The team successfully resolved discrepancies regarding previous tool availability.

**Backlog and Future Planning**
Remaining assessment stories were prioritized for future documentation and spike creation. Team members agreed to focus on current assessments before initiating new development.

### DETAILS

**Review of Section Drawing Tool Scenarios:** Abel reviewed three scenarios related to the user story, "I need the option to draw sections within the grid," including activating the section drawing tool, drawing a section, and configuring section options. The discussion aimed to validate the components and patterns listed on the tracking sheet against the current workflow and the repository scan performed by Claude (00:01:29). Abel asked Thomas and Jonathan for direct feedback to avoid spending time on redundant questions, noting they were not deeply familiar with the code's components and patterns.

**Scenario 1: Activating the Section Drawing Tool:** The activation of the section drawing tool is achieved via the `ActionBarView`, utilizing the same exact component as other workflows, but with a different button click (00:02:54). Tapping the section button sends an `ATAK broadcast` message that triggers the `setToolbar` action to open the drawing tools. It was noted that drawing color and fill preferences are applied automatically in the background using an `ATAK native` class, and there is no `TAK UI` abstraction for this process today.

**Scenario 2: Drawing a Section and Persistence:** Drawing a section involves selecting a desired shape, which reuses `ATAK`'s existing shape drawing tool, and the toolbar is `ATAK native`. The persistence of the drawn polygon shape on the map is handled by the Drawing Tools API, which Thomas confirmed is accessible in `ATAK` and is the mechanism used to persist the shapes. It was also confirmed that `ATAK core` and `ATAK native` are the same thing, with `ATAK core` being the technical package.

**Scenario 3: Configuring Section Options via Settings Menu:** Configuring section options involves adjusting settings via the gear menu in the `ActionBarView`. The color picker uses `ATAK`'s color palette dialogue via a color button, which Thomas confirmed is available in the `TAK UI` repo as `color picker` buttons, contradicting the initial finding that there was "No Claude feedback on this one". The use of `Alert Dialogue` for the help icon modal was identified as an Android component, and while an `Alert Widget` exists in `TAK UI` to replace it, the current implementation is an escape hatch.

**Scenario 3: Icon Buttons and Image Buttons:** The icon buttons for label flow are Android image button elements, and Thomas confirmed that `TAK UI` does have an equivalent called `Image button`. The conversation covered the possibility of image buttons being on the roadmap, but the confirmation that `TAK UI` has a directly named `Image button` component led to the notes being updated.

**Remaining Stories and Backlog Triage:** After reviewing Story 2, the team identified that they only have three stories left to perform the assessment on: "Label buildings with grid section" (Story 3, the AI portion), "Manual label buildings with grid sections" (Story 4), and "Export GRG artifact for distribution" (Story 5). Thomas confirmed that adding non-building details to a map and reviewing/refining the GRG are not part of their plugin's workflow.

**Spike Template and Future Planning:** Abel plans to pair with Thomas soon to finalize the spike template for the assessment process to ensure the captured information is specific and correctly documented. The updated sheet and assessment findings will be used to create an agenda for Nathan on Monday to close the loop on `TAK UI` native components versus unconfirmed components and to generate spikes for migration contributions. Thomas offered to help bring Zach up to speed on the `TAK UI` assessment work once the spiking tickets are ready.

**Pre-caching Messages and Demo Planning:** Jonathan clarified the warning messages related to tile caching and discussed potential improvements, but it was agreed to focus on documentation and story creation before starting development. Abel planned a demo on Wednesday focusing on the user experience of tile caching and how the system surfaces failure insights to the user by showing the mobile view disconnected from service (00:50:59). Zach will begin looking into `TAK UI` and assist Jonathan with the repo if needed.

### NEXT STEP
[Abel] Create Agenda: Put migration assessment findings into the Monday agenda for Nathan.
[Abel] Prepare Spikes: Create spikes for assessment work using the finalized template.
[Abel] Run Assessment: Conduct assessment on remaining stories 3 and 4 (Label Buildings, Manual Label Buildings).
[Abel, Thomas] Review Template: Pair together to review and finalize the assessment spike template specifics.
[Jonathan] Create Caching Stories: Help Abel create documentation and stories for potential tile caching warning message improvements.
[Abel] Triage Backlog: Triage the mini backlog of outstanding issues sent by external stakeholders.
 Zach] Study TAK UI: Start researching TAK UI components and ongoing work.
[Thomas, Zach] Onboard Engineer: Thomas to bring Zach along today for TAC UI work onboarding.

### References

takui-story2
tak-daily-april_27-may1
takui-migration-workflows
takui-migration-assessment

----

# USER JOURNEY - April 30 - Nik and Jonatha
> Follow up

---

# DT's (Cliff, Chad and Josh) Bug Triage - Thursday 5pm

From Cliff

## Below are a few things that I have noticed using ATAK v5.6 running on a Samsung S23.

> ISSUE 1
- Load and start AI-GRG on ATAK v5.6 on Samsung S23
- Create GRG
- GRG is displayed on screen 
- Select Automated Labeling 
- Buildings labeled 

**Attempt to close GRG without saving GRG is removed, but building labels remain.**
> *My follow-up questions:
Hi Cliff and Chad, a few follow-up questions to ensure we are aligned on the expected behavior you are describing.. 

1. "Close GRG" toggles the grid on/off or quits/exits the AI GRG Plugin?
> Nick Responded: Close GRG should not exit the plugin. This is because we can manage multiple GRGs in the plugin. However, closing a GRG could/should remove the grid and labels from view. I don’t say delete because the GRG is not necessarily created yet.
2. What do you expect to happen to the labels, once the grid is removed?
> Nick Responded: That is a follow-on with MARSOC. Technically those COT markers could be leveraged for other things (fires, etc.)

--
> ISSUE 2
- Build GRG
- Create name sections
- Automated labeling
- Save GRG 
- Close GRG
**After saving, building numbers remain outside created areas.**
3. After you've run automated labeling and you have a drawn section, When you "Close the GRG", are you expecting to only see the labels inside the section and not the ones outside the label?
> Nick Responded: That is probably a follow-on with MARSOC.

**After closing the GRG, there should not be any labels on the map. All labels and building numbers are saved in the GRG gr8 file.** 


```
- I'm using Goggle hybrid map.  The MGRS is 41s QS 70788 13818 
Lat Long 
- Decimal degrees (DD): 32.6300° N, 65.8781° E
- Degrees, minutes, seconds (DMS): 32° 37' 47.93" N, 65° 52' 41.02" E

If you have steps or specific map data that you want us to test, please pass it.  If you have any questions, please reach out. 
```

Please let me know if that answers your question.  

--

> ISSUE 3, etc
AI GRG - Issues and Improvements
> Summary: Here are some notes on AI GRG for ATAK 5.4 . I used the Samsung S23, S20
and Note 8 for testing. I used the same imagery as Cliff did with 5.6,
GOOGLEHYBRID. There are a couple of things I had found that I wasn’t able to
recreate Ill list them first.

* https://docs.google.com/document/d/1LMbzaOyvHYQS-I4JFQX-nSCnDlVX_qt5/edit

android libraries all use Kotlin, coroutines under the hood
what TAKUI is creating is "substractions"
they have a separate component to bring in Jetpack.compose. in the future at some point, android is gonna depreicate VUE and move to compose
every example app, uses jetpack.compose now

they need to prepare for it

update that risk, tone it down

-

WHAT 

--

# QUESTIONS/PREP FOR BAH CALL on MAY 4

## Story 2: Draw Sections Within the Grid

**Opening frame**

> "We finished the internal review on Story 2 — Draw Sections Within the Grid. We walked three scenarios with the team. I want to share what we confirmed, flag the escape hatches, and get your input on a few components before we finalize."

---

**What we confirmed — no questions needed**

- `ActionBarView` entry points (Scenarios 1 and 3) — escape hatch, same pattern as Story 1, Thomas has the MR you shared
- `PolygonCreationTool` in Scenario 2 — TAK UI native, confirmed
- `ColorPickerButton` and `ImageButton` in Scenario 3 — TAK UI native, Thomas found both in the repo

---

**Question 1 — `AtakBroadcast / SET_TOOLBAR + UNSET_TOOLBAR`**

> "In Scenario 1, the section drawing tool activates and closes the ATAK drawing toolbar via `SET_TOOLBAR` and `UNSET_TOOLBAR` broadcasts through `AtakBroadcast`. There's no TAK UI abstraction for this today. Before we decide on a path — is there anything in TAK UI we should be looking at for this, or guidance on where to look? If nothing surfaces, we see two paths: stay on the escape hatch, or Rise8 contributes a native version. What would you recommend?"

---

**Question 2 — `DrawingPreferences(mapView)`**

> "When the section tool activates, drawing color and fill are applied automatically in the background via `DrawingPreferences` — fully ATAK native. Before we settle on escape hatch — is there a TAK UI path for managing drawing preferences we should know about, or guidance on where to look?"

---

**Question 3 — `ATAK DrawingTools API` (shape persistence)**

> "After the GRG Creator draws and closes a section, the shape persists via the ATAK `DrawingTools API`. No TAK UI abstraction today. Before we decide on a path — is there anything in TAK UI for shape persistence we should know about, or guidance on where to look? If nothing surfaces, we see two paths: stay on the escape hatch, or Rise8 contributes a native version. What would you recommend?"

---

**Question 4 — `android.app.AlertDialog` (help modal)**

> "The help icon in the settings pane opens a modal via `android.app.AlertDialog`. You have `AlertWidget` in TAK UI. Before we make a call — is `AlertWidget` the right replacement here, or is there guidance on the preferred approach?"

---

**Closing**

> "That covers Story 2. We have Stories 3 and 4 ready to walk through the same way when you have time."

---

claude, provide me a hand off session summary and prompt to continue doing this work, referencing context and details to create spikes for TAK UI from two Spikes that dont currently follow our new format, the spikes we will work on are:



* Where your Sec. 4 framing is stronger than what's in the document now:
> Yeah. basically here is where we will give them the scope summary assessment based on workflows and if they want the component breakdown for tha tworkflow, we have Section 3 to dig into

* Where it gets complicated — and you need to make a call:
> Well maybe, but we have a process. We research internally, We Spike, We close loops with Nathan/BAH so it's assumed that we have ran the gamit to make this "confirm" claim and if we didn't, we can call that out in the Unknowns/Gaps or whatever section we have..

* Where I'd push back on Sec. 3 moving after Risks:
> I agree, I dont want to put this evidence at the end. I dont think we need to fully decide where it goes, to at least improve/update restructure Section 4 and Section 3 as in what info goes there and how its presented..(push back)

* The mapping problem you'll hit:
> ActionBarView would be documented once in the "inventory" portion for Section 3 and once we get to the User Story/workflow Scope summary section 4, we woukd just make a reference, thats obvious and or implied not overly repeat it. we can make updtes once we have the content..

* What SOCOM actually needs from this section to approve a next contract:
> If you are refering to Sec 4, yes..100%

* My recommendation before drafting anything: Decide two things:
1. Workflow, 100% we dont need to overly emphasize the components here, we will work through it but lead with workflow and we need to determine if the workflows will be placed "under" or "inside" the Categories we have currently (ready to migrate, etc)
2. It's assumed that we have already discussed with Nathan and BAH and thats why that claim is made. Anything that we have not, we can call out explicity or add it in the unknow/need to validate

