## Week of April 20-24 — Weekly Focus

1. **Get SOCOM's first feedback on the 5.6 release from Chad and Nik** that the build passes field review. That confirmation is what lets us submit our first Enabling Outcome.

2. **April 22 demo: move toward our first Mission Outcome hypothesis.** The before/after detection comparison gives us real data to start building the case that SOF Operators are spending less time correcting GRGs and more time focused on the mission environment.

3. **Advance the TAK UI migration conversation with BAH.** The first technical review with Nathan helps us determine where to prioritize TAK UI development and refine our path toward the Enabling Outcome of shifting Rise8 from TAK UI consumer to contributor.

4. **Ensure Sprint 3 prioritizes defects and UX improvements that affect operator trust in the field.** Groom the backlog around the bugs and UX gaps we discovered this sprint: silent failures and misleading status messages that could negatively impact operators in the field.

5. **Iterate on our definition of done for the TAK development end-to-end release and testing process.** Update the path-to-prod map and formalize acceptance criteria.

---

# PM Issue Cards, APRIL 20

## Pipeline Architecture: Moving from Manual Branch Maintenance to an Automated Multi-Version Build System
> Related Chore: Implement Parallel Matrix Pipeline to Replace Manual Multi-Branch Maintenance
**WHATS BROKEN / OPPORTUNITY:** *The current three-branch model requires a manual sync step before each release`*
The team maintains three separate branches (`master`, `maintenance-5.4`, `maintenance-5.6`) that do not stay in sync automatically. Before each release, an engineer must manually update the maintenance branches against master. This sprint, that step also revealed the 
`5.4` branch was not pointed at `v5.4` when originally created. Josh and Kevan agreed on a replacement approach: a parallel matrix pipeline that builds all supported ATAK versions (`5.4, 5.5, 5.6, 5.7`) by swapping variables, with no separate branches to maintain.

> **SOURCE:** Slack thread, Kevan + Thomas + Josh, April 18

**WHY:** *A manual sync step in the release process has already produced a version targeting error*
The 5.4 branch was not on v5.4 when first created. Thomas caught and corrected it this sprint. As releases increase in frequency, a repeated manual step with no automated check is a repeatable source of error that may not be caught before a build reaches Chad and Nik.

**BLOCKER or RISK if not addressed:** *Thomas, and other devs remains the single manual dependency before every release*
Each release requires our devs to manually sync the maintenance branches. If that step is missed or done incorrectly, a build could target the wrong ATAK version. The error would only surface after handoff.

**WHAT WE DOING ABOUT IT:** *Josh implements a parallel matrix pipeline; team agrees to CI on every commit, CD on significant feature releases*
Josh owns the implementation. Kevan and Josh explicitly agreed on the release cadence: automated builds and tests run on every commit across all ATAK versions, but release artifacts are produced only on significant feature releases. No formal ticket has been created yet.

**WHAT DONE LOOKS LIKE:** *One pipeline run confirms builds across all ATAK versions; no manual branch sync required before a release*
Thomas is no longer a required step before each release. A pipeline run shows pass/fail across all supported ATAK versions. You can confirm build status in one place before anything goes to Chad and Nik.

**PROMPTS FOR DEVS / SUGGESTED next steps:**
1. Ask Kevan: "Is Josh picking this up as a formal ticket in Sprint 3, or is it scheduled for a later sprint?"

2. Ask Kevan: "When you said CD on significant feature releases, were you talking about AI GRG plugin releases, ATAK platform version updates, or both?"

3. Ask Kevan: "What does 'significant feature release' mean in concrete terms so we have a shared definition before this goes into the pipeline?"

---

# My weekend prep for Monday, April 20

1. REVIEW KEV's "Initial TAK Brainstorm"
- Reference @tak-daily-april_13-17.md , lines x thru x

2. Prepare the side by side demo
3. Update the Demo Slide Deck
4. Pre-IPM Prep
* Implement Parallel Matrix Pipeline to Replace Manual Multi-Branch Maintenance
* Zach's bugs

[MONDAY] April 20 - Daily Stand up

Topics/Issues

0. Monitor emails and comms for Chad and Nik feedback on th 5.6 apk
> We are downloaded, installed, loaded, and running. 
- First question:  Is there a way to access the user manual from the software or ATAK?  I did find the manual on Git (17 Apr 2026), but can't seem to find a way to open it on the device in the usual ways.


1. Review the TAK UI user stories as a team, prep for TAK UI working session
* What is the goal of the TAK UI working sesison?
> Document every escape hatch and unknown by component, with the user workflow as context.
> Get a decision on each one — BAH owns it, Rise8 contributes it, or stay escape hatch.
> After: Write development stories. Ownership and scope are resolved.

2. Begin prepping for Wendesday demo and update
* side by side comparison
* Update the google slides
* dry run

3. Pre-IPM
* Josh: **Pipeline Architecture:** Moving from Manual Branch Maintenance to an Automated Multi-Version Build System
* Zach: Plugin reliability and operator UX improvements:
    - resolving detection failures under specific conditions, 
    - correcting misleading status messages, 
    - verifying that background processes close correctly after detection runs.
* TAK UI "compliance"
* Setup testing?

`JONATHAN` - SOCOM, 
--> improvements for the plugin, achanography?

Go back

`KEVAN` 
- user manual, TAK Forget pipeline builds that PDF,in the repo there is one..  seems chadfound that.. maybe there is a way it get bundle? not sure.. we need too look into if it gets bundle with the plugin.. review the PDF, 
- interesting tension.. Nik combo.. 5.6 get it otu the door AND then focus on TAK UI, rather than more ATAK plugin development.. 
- suggestions around clean up, and usability improvements, communicate that to nik..
- work on the framework, long-term evaluation, start with Bridge
- we are going through June 15th

`ZACH`
-  prgoress, READ BUFFER (expands) will ask Josh more about it.
- Sync with Josh
> 11:30 gone, be bac 4:30pm

`VSM` - nuance, so many VSMs to TAKkle, there are risks.. REQUIREMENTS SOURCING (10 mins..)

--

RADIAL MENU component

Right now, working agreements
- review TAK UI contribution guideline (is in ther docs)
- have some sort draft, API stuff
- Top TAK UI contributions, PR, n

get their current sprint 

export it as an excel file

anything not requiring an API change, GREEN LIGHT
forming opinions on TAK UI

# Monday, April 20 - Daily Stand up + BAH User Story Mapping

**Summary**
Administrative updates with technical development discussion covered plugin strategy for contract growth and user interface contribution guidelines.

**Plugin Strategy for Growth**
A strategy for SOCOM, TAK, and plugins was outlined, focusing on future contract growth, emphasizing the need to provide sufficient government explanation of plugin use. User experience risks in the current plugin were identified, suggesting iconography and flow improvements are needed as part of a larger growth plan.

**Technical Reliability and VSM**
Technical progress included an update on a read buffer issue, with plans to meet with Josh to investigate why it causes a problem in 1 instance but not another. The team decided to explore framing a Value Stream Map for the requirement sourcing process where the determination on making a new plugin is made.

**Tag UI Contribution Strategy**
The team reviewed Tag UI user stories to determine whether to build features natively or rely on 'escape hatches,' deciding that contributions should be made unless components are too niche. Challenges with the radial menu implementation were highlighted, necessitating a proper API and coordin

### Next steps
[Jonathan] Find Admin: Locate the government account admin name in the Slack history. Use this name to complete the Tag Forge contract submission.
[Josh] Review Pipeline: Review the ticket created for the automated pipeline matrix.
[The group] Review User Manual: Review the PDF user manual generated by the TAKge pipeline. Check if the PDF is bundled with the plugin build.
[Zach] Sync with Josh: Ask Josh to meet later today to run through and resolve the read buffer issue.
[Abel] Draft VSM: Create a first draft of a Value Stream Map focusing on requirement sourcing. Determine if this framing makes sense for deeper exploration.
[Abel] Export Spreadsheet: Export the TAK UI story review spreadsheet as an Excel file to send to B&H.
[Abel] Scrub Data: Remove all mentions and references to Claude findings from the spreadsheet.

### Details
**Administrative and Scheduling Updates:** Zach noted they have two remaining VA appointments, with one being an hour and a half away later in the day, necessitating them to be out most of the afternoon and returning around 4:30 PM. The second appointment is remote. Kevan shared they are recovering from an illness and plans to work a partial schedule. Kevan confirmed they should be able to attend the 1:00 PM Eastern sync with Nathan.

**Resolving Tag Forge Access for Jonathan:** Jonathan initially reported difficulty finding where to upload the "US person sign form" for account setup, having skipped it during the initial flow. Abel and Kevan guided them to the 'Request Contract' section, where the 'Choose file' option was located at the bottom of the page. Jonathan later confirmed that they submitted the required contract details and received emails granting them access to relevant user groups.

**Upcoming Agenda and Preparation for Demos:** Abel outlined the immediate agenda, which includes reviewing the ATAK manual access request from Chad and reviewing the tag UI user stories. Preparation for Wednesday’s demo is underway, including working on slides and setting up a side-by-side comparison with Sharon and Kevan. Upcoming tasks for development include a ticket for the pipeline, reliability, operator user experience (UX) improvements, resolving detection failures, and correcting misleading status messages.

**Broader Strategy and Contract Growth:** Jonathan indicated they plan to collaborate with Kevan on the "big picture" vision for SOCOM, TAK, and plugins, focusing on supporting growth for the future contract. They also emphasized the need to provide the government with a sufficient explanation of how to use the plugin to prevent confusion. Jonathan also pointed out user experience risks within the current plugin, suggesting that improvements to iconography and flow might need to be prioritized in a larger growth plan, pending access to end users for feedback.

**Status of the User Manual and Nick's Priority for Tag UI:** Kevan suggested that the TAKge pipeline builds a user manual PDF, which Chad's recent email seemed to confirm them looking for. Kevan recommended reviewing the manual PDF to understand its contents and mentioned an anticipated tension between current development and future work, noting that Nick seems to prefer focusing most time on TAKui development after the current milestone. Kevan also plans to continue working on the framework for the longer-term evaluation scheduled during the current bridge contract extension, which runs through June 15th.

**Addressing Technical Development and Reliability Issues:** Zach provided an update on technical progress, noting an issue with the read buffer that expands, and plans to meet with Josh later to investigate why it causes a problem in one instance but not another. Abel mentioned Josh's query about setting up integration testing, noting this is a potential area for the team to investigate. Kevan and Abel also discussed the possibility of conducting technical spikes, especially for items where the other team confirms they have no immediate plans.

**Exploring Value Stream Mapping (VSM) for Interoperability:** Abel initiated a discussion about performing a current state Value Stream Map (VSM) on the interoperability issues the team is facing. Kevan expressed concern about the time commitment and the team’s current expertise to shepherd such a complex conversation, suggesting there are multiple potential VSMs, such as the path to production via TAK Forge or how they identify functionality for a new plugin. Abel agreed to explore framing a VSM for the requirement sourcing, which is where the determination on making a new plugin is made, to see if it is a sensible direction to pursue.

### TAK UI Collab Review

**Reviewing Tag UI User Stories and Collaboration Strategy:** The team reviewed the detailed spreadsheet of Tag UI user stories in preparation for the meeting with P\&H. Jonathan summarized the spreadsheet columns, which included task descriptions, component details, belief on current Tag UI support, and discussion points from Claude. The B\&H discussion points are prompts generated by Claude to guide conversations about feature roadmaps and whether Rise should contribute native Tag UI components or proceed with the 'escape hatch' method.

**Determining Contributions to Tag UI vs. Escape Hatches:** The discussion centered on whether to build features natively into Tag UI and contribute them or rely on 'escape hatches' (non-compliant methods). Kevan argued for establishing reasons why the team would **not** contribute directly to Tag UI, such as high cost or the need for extensive API discussions. Jonathan suggested a valid reason to not contribute might be if the component is too niche for their specific use case, though nested radial menus are likely broadly applicable and should be contributed if not on the roadmap.

**Challenges with Radial Menu Implementation:** The radial menu was highlighted as a specific challenge, as their current needs are not met by the existing, outdated version of the radial menu supported by ATAK. Kevan noted that a proper API would be needed for their nested radials if they were to contribute, and there is a risk of breaking existing functionality in Tag UI unless they coordinate to confirm no backwards compatibility issues exist. The plan is to use the meeting to seek feedback from the other team on these issues, including whether they are developing similar features or if a custom solution would cause breakage.

**Structure of the Meeting with BAH and Contribution Guidelines:** The team decided the meeting with BAH should be structured to achieve working agreements and solicit feedback on the Tag UI user stories. Kevan suggested preparing a proposal based on the Tag UI contribution guidelines, which Nathan requires before API collaboration. Abel was advised to export the spreadsheet as an Excel file and to scrub any mention of Claude before sending it to the other team. The team confirmed that the contribution guidelines were not readily accessible and were previously located in documentation that required running a local Python doc server.

# BAH call guide

**Purpose:** Get a decision on every escape hatch and unknown — BAH owns it, Rise8 contributes it, or stay escape hatch. Leave with ownership and scope resolved so development stories can be written.

**References:**
- TAK UI user stories spreadsheet (Excel, Claude mentions scrubbed)
- TAK UI contribution guidelines (Nathan requires a proposal before API collaboration)
- `TAK-ALL/takui-migration-workflows.md` — spike artifacts for Stories 1-4
---

## Call Structure

`The goal today is` 
1. kick-off the conversatoon that could lead to a decision on every escape hatch and unknown. 

2. We leave with one of three decisions per component: 
-   BAH owns it and it is on your roadmap, 
-   Rise8 contributes a native version, 
-   or we stay escape hatch. 

> Once we have those decisions, we can write technical spikes for reasearch or actual development stories ."

### COLUMN WALK THROUGH
- User Story / Scenario — the workflow context. Keeps every component anchored to what the GRG Creator is actually trying to do.
- Task — the specific action the user takes. One row per interaction.
- Components / Patterns — the actual class or component handling that task in the current plugin.
- TAK UI Native? — our preliminary call on whether TAK UI can cover it today.
- Escape Hatch? — where we are currently using ATAK-native APIs outside TAK UI.
- Notes / Story Assessment — flags, risks, and patterns that repeat across stories.
- BAH Discussion Points — the questions we need your input on. This is what we are here to work through.

### PROMPTS FOR NATHAN

- "Is this component on your current sprint or near-term roadmap?"
- "If it is not on your roadmap, is this something Rise8 should contribute, or do we proceed with the escape hatch?"
- "Anything we should know before we proceed with this one?"
- On radial menu specifically: "We need nested radials. If we build and contribute it, what is the coordination process to avoid breaking existing functionality?"
- On anything flagged Unknown: "We could not make a confident call here. What can you tell us?"

old XML API<  5.1+, hiearchchal radium menus
Josh which is the custom radial menu that we render?

### 1. Working Agreements (open here)
- Align on the contribution framework before touching any individual component
- Anything not requiring an API change: GREEN LIGHT — Rise8 can proceed
- Anything requiring API change or new TAK UI component: needs Nathan's input before Rise8 commits
- Kevan's framing: come in with reasons NOT to contribute — high cost, API complexity, or too niche for broad use

### 2. Walk the Spreadsheet
- Walk row by row through the escape hatches and unknowns
- For each: confirm BAH's current status (on sprint? roadmap? no plans?)
- Decision options for each component:
  - **BAH owns it** — it is on their roadmap; Rise8 waits
  - **Rise8 contributes it** — not on BAH's roadmap; Rise8 builds and submits a native TAK UI component
  - **Stay escape hatch** — contribution is not viable (cost, API scope, niche use case); proceed with ATAK native

### 3. Nathan Decision Points (per component)

For each escape hatch or unknown, get answers to:
1. Any feedback or insights before we proceed?
2. Is this on your sprint? If yes, when?
3. If not on your roadmap — should Rise8 contribute a native version, or do we proceed with escape hatch?

**Components to flag by name:**
- `ActionBarView` — floating toolbar entry point, appears across multiple stories
- `MapMenuWidget` / nested radial menu — outdated in current ATAK; needs proper API if Rise8 contributes; risk of breaking existing functionality without coordination
- `GridLinesMapComponent` / `CustomGrid` — live map grid placement
- `GridABC123LabelManager` — grid labels and legend rendered as ATAK Marker objects
- `DrawingPreferences` / `AtakBroadcast` — drawing tool activation and color/fill
- `ColorPalette` (via `ColorButton`) — section color picker
- `DropDownReceiver` — settings pane

### 4. Radial Menu — Handle Separately
- Current ATAK radial is outdated; does not meet Rise8's nested radial needs
- If Rise8 contributes: proper API required, backwards compatibility risk
- Key questions for Nathan:
  - Are you developing a nested radial or updated radial API?
  - If Rise8 builds it — what is the coordination process to avoid breaking existing functionality?

---

--

# Monday 1PM BAH (Nathan) Working Group

User Story 1: As a GRG Creator, I want to place a grid and start defining its parameters, so that the GRG that gets created is within specified bounds.

**SCENARIO 1: Scenario 1: Place grid**
3. Tap Toggle Grid Icon	Floating toolbar button (ActionBarView)	VIEW	
- No TAK UI abstraction. 
- Nathan mentioned floating toolbar is on Sprint 3 
- Confirm timeline "send to Nathan"? he believes he has a different kind?
(iToolBar extension) 
- `ActionBarView` good candidate for us to implement.

4. Grid is displayed	"Grid placement / render
`CustomGrid + GridLinesMapComponent`
- No explicitly listed as ATAK native required	
- no binding to this ATAK core API, we could reproduce the functionality, exisitng TAK UI APIS, Polyline.. (specifcy where to draw the line) docs is under `mapComponents`, or `maps`. (Dedicate more time..) 
- render options for Polyline, Given if that can't be done, opportunity for Rise8 to add functinality to get the same visuals 
* **RISK:** potentially recreating the GRG API. - high complexity. / Not having a "binding" means they dont have an API yet, we would have to use the under line ATAK core APIs, BAH does not have a wrapper. 
- Investigate on our side, Rise8
- Given we want TAK UI binding, draw everything manually using polylines, the other if is an API in TAK kernel, we could draft an abstraction..underline TAK kernal APIs) 

5. Grid labels displayed; "Text w/background displayed on map
`GridABC123LabelManager` using ATAK `Marker + MapGroup`, Notes: Code confirmed: labels rendered as ATAK `Marker` objects, imports `com.atakmap.android.maps.Marker` and `MapGroup` — fully ATAK native, not decoupled
- Grid Labels and Legend, Rise8 to explore `renderToMap` API in TAK UI Hello World to validate adding hide icon and label text parameters to support grid axis labels and legend display.

**Scenario 2:  Define grid parameters**
> Update grid parameters via settings (gear wheel)
13. "sliders Android `SeekBar` (tab_grid.xml)", Button, `IntEntry`, `DoubleEntry` `SeekBar` used in current layout — no TAK UI Slider equivalent confirmed. Validate with engineers
- Nathan: Sliders were just added, there are examples in the hellow world repo, might be sitting in an MR. No examples yet, Nathan will let us know in the mattermost chat to show us the slider example changes.. will provide us a link to the MR, to the API
- Slider/`seekBar`: Monitor MatterMost for Ntahtn's MR link for the recently added slider API and validate it againt Rise8's `Seekbar` implementation.

> Update grid parameters via RADIAL buttons
- Validate existing TAK UI radial abstraction coverage for Rise8's use cases, investigate nested radial menu functinality, and produce a proposed API design draft to share with Nathan via MatterMost

https://
https://tak-ui.docs.tak.gov/tak-ui-docs/

---
## Kevan one on one - 

MAYBE WE SHOULD, 
He dont rmemember
Look through Confluence docs
Ask them if they know how to bundle it. .
user manual in confluence
it's all 
Ask Chad, what are the ways he expect to see it in the app
there no easy to find documentation

Prob better to use Jo

## Sharon DEMO Prep Part 1 & 2

Do one over the other.. Quick.. and more detail on the new one..
DO ONE OVER THE OTHER
Leave room for nik

Do not do a side by side demo, it will complicate things and people would have problems focusing on one over the other.
Instead run the demo one version at a time..

### Start with the emulator 5.5 - 

1. introduce the results of x number of runs
- how many buildings it detected
- how long did it take on avg.
- highlight an "interesting finding", if something came up.
2. establish/confirm/present the setup, before executing a run
- the AOI (image)
- Similar Grid Spacing to fit the AOI - 60m
- Set Maps to same “zoomed out level” (234m)
- Run Detection from Tool bar (Detect All)
- Present detection results
> call out the "height"
> call out difference in detection #s results

### Followed by the AI GRG 5.6 (sliding window and Tile Caching?)
1. introduce the results of x number of runs
- how many buildings it detected
- how long did it take on avg.
- highlight an "interesting finding", if something came up.
2. 2. establish/confirm/present the setup, before executing a run
- the AOI (image)
- Similar Grid Spacing to fit the AOI - 60m
- Set Maps to same “zoomed out level” (234m)
- Run Detection from Tool bar (Detect All)
- Present detection results
> call out the "height"
> call out difference in detection #s results

---
- Showcase, worse case,
- Flexibility to do more.. section by sectiion base.. 
- Group buildings within Sectioon
- worse case vs Best/ideal case.. 


---

Source File, to update the PDF

old XML API<  5.1+, hiearchchal radium menus
Josh which is the custom radial menu that we render?

the setion one.. when you click on a section "super deep, like 3 levels"
we dont know how we go about doing that in TAK UI

Nathan, if you dont have a idea..he can take a look
They have their DSL? you add buttons, need a new varient 
similar XMLs than what we have at the root lelevel
Nathan can give us a sketch of what the API can look like
and we can finish the implementation.
We dont ahve a ton of hours.. to work these functonalityes
they ahve to finish..

===


# TUESDAY MORNING PLANNING

1. **How do I send Nik 5.4 APK?**
> 5.4 APK link sent to Nik
> ~~*RISK/PENDING*~~ **RESOLVED April 22** — `release_internal` Timeout: Manual Intervention Required to Publish Builds to the Package Registry
The regular process is: code merges, pipeline runs automatically, release_internal publishes the build to the Package Registry, you send Nik the link. No manual steps.

**What Kevan did instead:** the `release_internal` job kept timing out, so he logged into TAK Forge and *manually triggered that job himself to force the build to publish.* It worked, but it required Kevan to intervene directly. If Kevan had not done that, there would be no link to send Nik today.

**How it was resolved:** Josh built `pads-fast` (`git.tak.gov/rise8/pads-fast`) — a drop-in replacement for the TAK Forge PADS sidecar that fixes the two root causes of the timeout (unnecessary APK re-compression and a single-worker bottleneck). All other PADS behavior — signing validation, registry push, auth — is preserved. Pipeline updated April 22. Manual intervention no longer required.

2. **Backlog Stories**
- Manual inside the plugin
- TAK UI User Story
    
    - `Grid Render and Placement`	Spike	Two competing implementation paths, high complexity, blocks story work — research before build

    - `Grid Labels and Legend`	Spike	API validation question with a go/no-go deliverable

    - `Slider API validation`	Spike	Outcome is a finding — does Nathan's slider API cover SeekBar or not?

    - `Nested Radial Menu`	Spike	Research + API design proposal before any contribution begins

    - `Chad's manual request` Story

3. **Demo & Presentation Dry Run**

4. Josh Slack topics
* Sometimes the `assembleProduction` job is taking longer than an hour. So it fails. I'll need to extend that a little. The 60m default for gitlab just doesn't cut it.
* We gotta get these `assembleProduction` jobs to run faster. I'm going to analyze some of it and see where we can get some savings. The dependency check is so slow. It's stupidly slow.

5. **Mattermost: Follow up with Nathan**
- ActionBarView is on BAH Sprint 3 — confirm the timeline and whether his version aligns with our use case (iToolBar extension vs. ActionBarView).

# Pre-stand Up Pre issues/topics


ZACH - Blocker, 1 final appointment at 11am, virtual
- Met with Josh, TIFF issues
- 1 proguard
- 2 additional "buffer space"
> works on civ, doesn't work on mil
-- 

JON - 
- AM getting Claude Repo updated, updated for SOCOM usage
- 

KEVAN
- behind on demo prep
- GMI? not planned
- demo prep
- container setup and running
- CONTAINER (1 password, podman)
- KEVAN, go through our notes, Post-Morem Retro
- Follow up call with Nik


GO BACK: 
- container setup, need time = he added different pillars.. project context.. 
- SAGE (stephen) 
- follo

48 sec = 148
48 sec = 148
48 sec = 148
50 sec = 148
50 sec = 148
"imagery cached and ready" = pre caching, GRID puts down start caching in the background

-- 
Remove "imagery cached and ready" when viewing kmz file or a file that is not from the map
detection no longer relies on the "view"

--

## KEVAN IPM Example

**SDK API -- TAK UI**
- here is a a TAK UI Menu components
- here are the params, compile it into an ATAK Radial or whatever Radial menu
example: `const grgRadialMenu = new TAKUIMenu(options);`
options
- `[{icon: icon.svg, tooltipHelperText: "Help Me", nestedMenu: [...]}]`
How we would CALL the TAK UI menu object.. to compile into this radial menu
- call out the different items, 
- Another example that we have is "the center dislay" where it shows you the grid being 10x8 or whatever else.. we have to support it

# Tuesday, April 21 dry-run DEMO, prep

Summary
Sprint 2 accomplishments and TAK UI progress were reviewed, with demo strategy refined for accurate capability comparison and shared plug-in vision established.

Sprint 2 Review and TAK
Sprint 2 successfully delivered the first end-to-end process for the Technical Assistance Center and published the first mill sign AIRG plug-in. Working norms and priorities were established for the TAK UI migration efforts, and 2 model fixes ensured consistent detection results regardless of zoom level.

Plug-in Vision and Demo Refinement
A review of the SOCOM plug-in portfolio led to a shared vision for a connected plug-in ecosystem emphasizing shared components, which Nick supported. The comparison demo strategy was refined by excluding the time element to avoid inaccurate comparisons between emulator and physical device performance.

Sprint 3 Progress and Planning
The 5.6 build was released for SOCOM acceptance review, and the team is working to automate the release pipeline to validate every version in a single run. Initial findings for the GO evaluation were shared, with Nick confirming the maneuver as the starting domain for the shared library model.


Next steps
[Abel, Jonathan] Record Demo: Record the demonstration video working with Jonathan; Share the recorded video out before end of day.
[Abel, Jonathan] Workshop Workflow: Workshop the plugin workflow specifics with Jonathan; Get comfortable with the new concept for the dry run.
[Kevan] Update GOS Notes: Tweak notes regarding GO evaluation and discussion with Nick; Talk to Abel about the finalized changes.
[Abel] Refine Script: Tighten the presentation script focusing on breaks and cadence.
[Abel] Detail Demo Links: Be intentional about calling out which specific sprint work directly contributes to the demo video content.
[Kevan] Schedule Dry Run: Schedule a final practice run-through of the presentation for the end of the day.
[Sharon Hamilton, Kevan] Discuss Travel Funding: Bring up travel funding with leadership; Determine if they will pay to send Abel to PI planning.


### Details
**Initial Setup and Planning:** Abel shared that they do not yet have the final recording of the demo but plan to share notes from Figma and FigJam regarding the sequence that them and Jonathan covered. Sharon Hamilton reminded Abel to start the recording of the current meeting (00:01:06).

**Sprint 2 Accomplishments and Milestones:** The second sprint demo occurred on April 22nd, and a milestone schedule was reviewed. Sprint 2 successfully achieved the first end-to-end delivery process for the Technical Assistance Center (TAK) (00:01:06). The first mill sign AIRG plug-in was published, and the review is in progress on the government side (00:02:11).

**TAK UI Progress and Model Improvements:** The team held their first meeting with Nathan and B\&H, establishing working norms and prioritizing TAK UI migration efforts. On the model improvement side, two fixes were implemented, ensuring detection runs consistently regardless of zoom level, and repeated runs produce the same accurate detection results (00:02:11).

**Plug-in Evaluation and Shared Vision:** A review of the SOCOM plug-in portfolio was initiated, and early findings were presented to Nick. This discussion led to a shared vision for a more connected plug-in ecosystem, emphasizing shared components rather than isolated tools, which Nick supported (00:02:11).

**Demo Preparation and Comparison Strategy:** The plan for the demo involves running the legacy emulator (version 5.5) and introducing results from multiple detection runs to show buildings detected and average time taken (00:03:28). The team plans to establish an Area of Interest (AOI), set up a grid, and then run detection on the grid using both the 5.5 version and the 5.6 version with the sliding window (00:04:36).

**Demo Refinements and Time Element Exclusion:** Abel noted inconsistencies in building detection results from repeated runs and suggested performing more runs to establish a consistent baseline (00:04:36). Jonathan advised removing the time element from the comparison demo, arguing that running on an emulator versus a physical device prevents an accurate "apples to apples" comparison for time. Sharon Hamilton agreed, preferring to focus on the difference in detection results (00:05:41).

**Showcasing Secondary User Workflow:** Kevan recommended highlighting that the model improvement resolves a limitation that previously hindered a secondary user workflow. The updated capability allows users the flexibility to run all building detections first and then draw sections around groups of buildings, or go section by section (00:06:47). Jonathan summarized this improvement as allowing flexibility in the workflow without sacrificing accuracy (00:10:00).
Sprint 3 Work in Progress (April 20 - May 4): The 5.6 build has been released and is undergoing acceptance review by SOCOM, while 5.5.4 was simultaneously sent for compatibility testing. The next development baseline will be 5.7 after 5.6 confirmation. Efforts are underway to automate the release pipeline to validate every version in a single run, reducing reliance on manual steps and preventing errors like targeting the wrong branch version (00:10:57).

T**AC UI and Model/Plug-in Improvement Updates:** The team wrapped up their first working session with B\&H, determining the scope and prioritizing the initial user stories. They are drafting an API design for a core plug-in component to share with Nathan for feedback. Additionally, the team is working on resolving reliability and UX issues, such as detection failures, inaccurate status messages, and ensuring clean process closure after each run (00:12:09).

**GO Evaluation and Future Planning:** Initial findings for the GO evaluation were shared with Nick, who confirmed the maneuver as the starting domain for the shared library model (00:12:09). The team is currently working on the practical design of this model (00:13:14). For the remainder of the PI planning, Sprint 4 anticipates reaching final compliance agreements for TAK UI, finalizing full recommendations for the GO evaluation, and closing out model improvements based on operator feedback (00:14:09).

**Review Feedback on Presentation and Cadence**: Sharon Hamilton suggested removing superfluous hash marks and leaving slides blank if needed (00:14:09). Sharon Hamilton praised Abel's speaking cadence but recommended practicing the talk track to sound more comfortable. Sharon Hamilton also clarified that the partner organization's name is Booz Allen Hamilton, or "Booz," not "B\&H" (00:15:14).

**Presentation Flow and Agenda Adjustment:** Sharon Hamilton suggested adjusting the agenda to present the demo in the middle, between the slide updates and the sprint/PI planning, to improve flow. Abel noted they were using a script and would tighten up the breaks (00:15:57).

**Discussion on Release Pipeline Visibility:** Abel asked Kevan if the ongoing work on the release pipeline should be mentioned to the customer (00:16:56). Kevan affirmed it is worth mentioning but stressed that this work should not delay the 5.4 release, adding that a full pipeline is less valuable if the team only conducts a few releases (00:17:57).

**PI Planning Communication and Contract Status:** Abel asked Sharon Hamilton about addressing the planning for June 15th. Sharon Hamilton advised speaking as if the work will continue, as that is the plan, but not filling out the slide completely (00:19:49). Sharon Hamilton suggested that Abel should mention sending the proposal back to the customer, as this could prompt them to provide an update on the contract extension status (00:20:49).

**Demo Video Consistency and Thoroughness:** Kevan inquired about the specific new work from Sprint 2 that would be included in the demo video, given that some fixes were already demonstrated. Kevan emphasized the need for the demo to be explicit that the video is a response to customer requests for a more thorough, side-by-side comparison of capabilities, possi

**Logistics and Key Stakeholder Importance:** The PI planning is scheduled for the first week of June at Fort Bragg. Kevan noted that Nick, located at Fort Bragg, is the critical decision-maker for TAK mission capability for operators, and they should prioritize travel and time with them (00:24:54).

# Tuesday, April 21 TAK Sync

### Summary
Building detection consistency improved with pre-caching feature and clarified demo strategy.

Building Detection Improved Accuracy
Testing on version 5.6 showed a 124% improvement in building detection accuracy over repeated runs. The system consistently detected 66 buildings within a specified zoom range on version 5.5.

Pre-caching Implementation Details
The system now implements image pre-caching, immediately caching all images within a GRG in the background upon placement to ensure imagery is ready for detection. Pre-caching visibility is limited to the mobile map view and is not needed when using cached KMZ files.

Demo Focus and Strategy
The team confirmed that the primary demo goal is to show building detection no longer relies on viewport zoom level. The planned narrative will emphasize the tiling solution for consistent scanning and the outcome of reduced mission risk.

### Details
**Improved Building Detection Consistency:** Abel reported successful testing demonstrating increased consistency and accuracy in repeated runs, which was a previous concern. Five emulator runs on version 5.5 within a zoom range of 291 m to 360 m consistently detected 66 buildings. A run on version 5.6 across 291 m to 351 m showed a 124% improvement in building detection accuracy (00:00:00).

**Image Pre-caching Feature:** Zach explained the implementation of pre-caching, where the system starts caching all images within a GRG in the background as soon as the GRG is placed (00:01:06). This ensures that when the "detect buildings" button is activated, the necessary imagery is already available for immediate processing. If the detection button is pressed before caching is complete, the system will show the progress of remaining tiles (00:02:07).

**Lasso Tool Functionality for Deletion:** The team confirmed that an issue with the lasso tool in the old version, which caused the system to retain detection data even after markers were manipulated or deleted, has been addressed. Jonathan clarified that the old version held onto detection data (00:02:07). Zach believed that Josh had fixed this issue in the new version (00:03:08).

**Pre-caching Visibility in Different Contexts:** The team discussed when the pre-caching user interface is visible to users, noting that it will not display when working with KMZ files because the imagery is already cached and ready to use (00:03:08) (00:06:01). The caching display is only visible when working directly from the mobile map view, which requires the system to create imagery tile by tile (00:03:08) (00:05:02). Jonathan clarified that the demonstration of detection capability at different zoom levels is still valid using a KMZ file (00:06:01).

**Demo Focus and Narrative Strategy:** Jonathan established that the primary goal of the demo is to show that building detection no longer relies on the viewport zoom level (00:08:14). They outlined a narrative approach to emphasize the improved detection accuracy in the new version (e.g., 160 buildings vs. 66 in the old version) using imported imagery like a KMZ file (00:09:00). The planned narrative will detail the previous problem, the solution (tiling approach for consistent scanning), the video evidence of the metric change, and the resulting outcome of reduced mission risk for operators (00:13:37).

## TAK IPM (Sprint Planning) April 21st Tuesday

**Summary**
Acceptance issues, pipeline configuration, and a memory leak fix were reviewed before prioritizing the TAK UI development strategy and user manual embedding.

**Acceptance and Blocked Merge Issues**
The team reviewed a confirmation dialogue bug displaying "undefined" during a bug delete process. A merge request was blocked because the source branch was 4 commits behind the target, requiring a rebase.

**Memory Leak Fix Validated**
Investigation into a memory leak was finished, and the fix, which involved correcting co-routines and adding threads for caching, was merged into the master branch. The pipeline configuration story for producing a sill was also completed with successful builds.

**TAK UI Strategy and Priorities**
The team decided to proceed with developing the action bar view and sending the API proposal via Mattermost. Embedding the user manual and documentation into the app was designated as the number 1 priority.

### Next steps
[Josh] Rebase Merge: Rebase merge request blocked because source branch is 4 commits behind target branch.
[Zach] Verify Memory Fix: Verify memory leak fix merge request, including specific commits, is incorporated into demo builds 5.4 and 5.6.
[Zach] Fix Detection Bug: Update code version to 5.7; verify and fix the bug preventing building detection from running before map initialization; time box this effort for 24 hours.
[Thomas] Confirm WinTAK Component: Confirm the equivalent component for the `ActionBarView` development exists in WinTAK.
[Jonathan] Draft Comms Language: Help Abel formulate big picture language regarding plugin outcome and impact for Com Tech messaging.
[Abel] Define Radial Schema: Define schema parameters (SDK API) for the nested radial menu component in TAK UI; review the defined schema with Thomas.
[Josh] Investigate Polyline API: Investigate TAK UI polyline API abstraction over ATAK kernel API for supporting custom grids and grid lines map content.
[Zach] Embed User Manual: Investigate mechanism for embedding user manual/documentation into the app; determine if a pipeline adjustment or code side changes are required.
[Zach] Find Strategy: Locate quick temporary solution for release strategy. Communicate official process if Claude knows required steps.
[Abel] Assign Story: Sign prepared story with screenshots to Zach.

### DETAILS
**Discussion on Team Status and Attendance:** The meeting commenced with Abel noting that Thomas was absent and questioning if Josh had previously joined these meetings. Zach confirmed that Josh typically joins at the end of the day when they are ready to work, asking for their focus.

**Review of Acceptance Issues and Blocked Merge Request:** The participants reviewed a bug regarding a confirmation dialogue displaying "undefined" per section during a bug delete process. They noted a merge request from Joshua that was blocked because the source branch was four commits behind the target branch, requiring a rebase. Abel committed to leaving a message for Joshua regarding the blocked request.

**Status of Pipeline Configuration and Memory Leak Investigation:** The story for configuring the pipeline to produce a sill was reported as complete, with both associated builds being successful. The investigation into a memory leak during build detection was finished, and Thomas had merged it, meaning the fix was part of the master branch.

**Validation of Memory Leak Fix Implementation:** Zach clarified that the memory issue was not a continuous leak but a failure to close co-routines during build detection, which would temporarily consume memory before snapping back. The solution included correcting co-routines, adding additional threads for caching, and setting up pre-caching. The participants agreed that Zach would verify if the commits related to this merge request were included in the demo build currently being used.

**Issues with Parallel Matrix Pipeline Implementation:** The team discussed the implementation of a parallel matrix pipeline, which was intended to replace manual multibranch maintenance. This implementation had faced issues, including the "`assembleProduction` job" failing due to exceeding the 60-minute default timeout for GitLab. Abel planned to leave a comment for Josh, asking if this issue was part of the current su-task or a separate job.

**Addressing the Detection Running Before Map Bug:** Zach identified a bug where detection runs before the map, similar to an idea previously discussed. They noted that their current branch was behind master, which had caused merge conflicts, requiring them to restart their work on a new branch updated to master version 5.7. They anticipate the fix will be relatively easy once the version control issues are resolved.
**Time-Boxing and Strategy for Fixing the Detection Bug:** Zach committed to updating their version to 5.7, verifying the bug's persistence, and then attempting a fix. They time-boxed this effort for another 24 hours, after which they will decide whether to add more time or discuss the priority of the bug with Josh. They also noted that this work is intertwined with another issue regarding a backup image being used when TIFF conversion fails.

**Confirmation and Discussion of the 5.7 Version Update:** Zach confirmed that when they pulled all the latest changes, the system indicated incompatibility with version 5.6 and required version 5.7. They assumed Joshua implemented this bump to version 5.7.

**`ActionBarView` as a Contribution Candidate:** Abel relayed information from Nathan that the `ActionBarView` might be an "`IToolbar` extension" and a candidate for contribution. Kevan confirmed that the `ActionBarView` is a separate development task that the team is undertaking. The team decided to proceed directly with developing the `ActionBarView` and sending the API proposal via Mattermost.

**Strategic Approach to TAK UI Development:** The team discussed the broader strategy for TAK UI development, acknowledging Nick's vision to reduce engineering costs via a framework, despite differing opinions on the ideal long-term approach. Kevan stressed the need to build rapport and evidence of contribution before pushing for changes to the project's direction. The initial next step is to get Thomas, the team's de facto WINT expert, to confirm what the WINTAK`ActionBarView` should be.

**Radial Menu Abstraction and API Proposal:** The team discussed validating the TAK UI Radial abstraction and drafting a nested Radial API proposal, which stemmed from the same user story as the `ActionBarView`. Kevan suggested using this as an opportunity to propose platform-specific menu components—for example, a radial menu on a TAK device and a sidebar menu on WINTAK. Jonathan agreed that diverging from consistency is appropriate when it benefits a specific channel or device.

**Clarification of Radial Menu API Definition:** Abel sought clarification on the API development, to which Kevan explained they were defining the SDK API, which functions as an interface with the TAK UI SDK, specifying the parameters needed for the menu object to compile successfully. The API is essentially defining the schema or shape of the object that represents a menu in TAK UI. Abel confirmed they would prepare the story details, including the parameters and components that need to be supported, for the engineers, Kevan provided example code for Abel and shared some scenarios of how this work would get done by the engineers.

**SDK API -- TAK UI**
- here is a a TAK UI Menu components
- here are the params, compile it into an ATAK Radial or whatever Radial menu
example: `const grgRadialMenu = new TAKUIMenu(options);`
options
- `[{icon: icon.svg, tooltipHelperText: "Help Me", nestedMenu: [...]}]`
How we would CALL the TAK UI menu object.. to compile into this radial menu
- call out the different items, 
- Another example that we have is "the center dislay" where it shows you the grid being 10x8 or whatever else.. we have to support it

**Review of Other Icebox Items:** The team briefly reviewed other items from the icebox, including validating Nathan's new slider API, which Kevan confirmed they sent in Mattermost. They also noted the need to validate the "`RenderToMap`" API for grid labels and legend display in the TAK UI hello world app repository. They decided to assign the investigation of the TAK UI polyline API for custom grid and grid lines to Josh due to its high complexity and exploratory nature.

**Priority of Embedding the User Manual:** The team discussed the urgent need to look into embedding the user manual and documentation into the app, which Kevan stressed should be the number one priority. Zach committed to investigating if this requires a pipeline adjustment or code changes and confirmed they would look into how other plugins, such as "drifters," register documentation within the specific tool preferences section.

**Immediate Task Resolution for Deployment:** The participants agreed to prioritize the fastest and easiest immediate solution to prevent any delay in the deployment. Zach will attempt to find a quick solution, and if an official method is known by Claude, that method will be communicated.

**Next Steps for the Strategy and Story Prep:** The immediate goal is to finalize the deployment. Abel is currently prepping the story, which involves adding screenshots, and will assign it to Zach.

**Follow-up on Iteration and Feedback:** The team acknowledged that Jonathan had previously expressed some opinions on the current state of the item, feeling it was missing something. Zach will pause other work to focus immediately on this new assignment.

---

- Zach PDF update, Merge Request
- Kevan, CLOSE THE LOOP on 
> Training Manua, close the loop
> Schedule follow up, MODEL CONCEPT MOSA

FEEDBACK 
unlocking a secondary workflow
get feedback from the users
none of the user had this implemented when they were supporting us
follow up

---

## Wednesday, April 22nd Daily Stand UP

### SUMMARY
Internet connectivity issues impacted demo participation, with discussion focused on PDF viewer fixes and documentation requirements for the plugin release.

**Connectivity Issues and PDF Fix**
Ongoing internet connectivity issues prevented participation in the demo. The PDF viewer now appears in the correct location, but the background must be changed to improve readability before the merge request submission.

**Demo Readiness and Training Manual**
Demo preparation is satisfactory, making a dry run unnecessary but available if needed. The training manual ticket must be closed and documentation incorporated into the plugin, as this could block the release.

**Plugin Handover and Performance**
It was decided to ask for an anticipated timeline for plugin handover to operators to prepare for feedback. Discussion points will include the reported 124% improvement in detections, focusing on the user impact and unlocked secondary workflows.


### NEXT STEPS
[Zach] Resolve Ticket: Close the loop on the training manual ticket regarding trading documents. Ensure this task is completed to unblock the current release.
[Zach] Update Viewer: Change the PDF viewer background color to increase contrast. Push the changes and create the merge request once internet access is restored.
[Kevan] Schedule Followup: Schedule the follow-up meeting with Nick for Friday concerning the MOSA model concept. Send meeting invites to necessary attendees.
[Abel] Query Timeline: Ask about the anticipated timeline for handing the plugin over to operators during the demo. Seek feedback on the 124% detection improvement and user workflow changes.

### DETAILS
**Internet Connectivity Issues and Demo Participation:** Zach is experiencing shoddy internet service due to a tree falling on a line, which is currently being fixed, with expectations for stability around 11:30. Due to these connectivity problems, Zach does not expect to be able to attend the demo.

**PDF Viewer and Merge Request:** Zach confirmed that the PDF viewer is now appearing in the correct location on the branch but noted that the current background color makes the content very difficult to read. They plan to change the background to a contrasting color and will submit the merge request as soon as their internet connection is restored.

**Demo Preparation and Dry Run:** Abel spent time on pre-IPM, IPM, and a lot of demo prep, including recording a video. Abel feels comfortable with their preparation and may not need another dry run with the team, but offered to do one if necessary.

**Closing the Training Manual Ticket:** Kevan brought up the need to close the loop on Zach's ticket regarding the training manual/documentation being incorporated into the plugin. This documentation needs to be added as it might be blocking the release if Chad requires it.

**Scheduling a Follow-up on the MOSA Model Concept:** Kevan intends to schedule a follow-up with Nick regarding the MOSA model concept they discussed. Nick is expected to send an invite for a Friday meeting, after which Kevan will send invitations to other relevant people.

**Inquiry on Plugin Handover Timeline:** Abel suggested asking for an anticipated timeline for when the plugin could be handed over to operators, focusing on when they could be ready for feedback. Abel confirmed they would add this item to their discussion points, framing it not as pushy but as a way to prepare for potential feedback.

**Discussing Plugin Performance and User Impact:** Abel wants to include the reported 124% improvement in detections as part of the ask, but they need to understand what this means for the users. Kevan suggested framing this by explaining that the plugin unlocks a secondary workflow and asking for user feedback to ensure the changes resonate well.

---

## Wednesday, April 22 — Demo Feedback and Bug Report

### What We Learned

**AI GRG well received by former operators**
- Kevan's post got a strong response from the community

**Bugs reported across 5.4 and 5.6**
- Building detection missed in dense areas (Afghanistan and Shalimar examples cited)
- Larger buildings getting double-labeled
- Parking lots occasionally getting labeled
- After closing a GRG, some buildings left over that were not removed/erased
- 5.4: disappearing toolbar
- 5.4: grid issues — gets bigger? (Abel to confirm)
- Note: 5.4 was never part of the prototype, so these issues are expected

**Inbound from DTs**
- Josh and Cliff emailed test steps and screenshots to reproduce each bug, along with version info and device info
- Sample imagery incoming from Google Hybrid and others

### Next Steps

`Zach` — User manual ready

`Abel` — Start adding tickets to backlog; refine them when DT emails arrive; post-mortem today (leaning toward pushing to Friday or Monday to protect heads-down time on user manual testing and bug triage)

`Jonathan` — Schedule usability testing/feedback session with Josh and Cliff; add Abel to the invite; determine who else should attend

`Kevan` — Train the model with new imagery from DTs to improve detection in densely populated areas they called out?

`All` — Replicate the bugs; Abel to determine what is realistic for May 15 vs what goes to extension or beyond

### Kevan's Response on Bugs and Deployment

> "Couple updates — they are not going to hold up deployment based on these, and the majority are caused by ATAK itself being inconsistent. We might have to be better about handling this inconsistent behavior, but it's good to record these issues as instability and extra engineering time needed to address problems with ATAK. This is evidence to continue distancing from TPC."
**What this means:** 
- Deployment is not blocked. 
- The bug pattern is largely attributable to ATAK platform inconsistency, not the plugin. 
- Recording these is valuable for the contract narrative 
- more support for the TAK UI migration direction and the case against continued TPC dependence.
---

# TAK UI - Abels Recap, Thurs April 23

### SUMMARY
TAK UI grid display and custom grid components discussion highlighted no direct API binding, requiring manual Polyline implementation or kernel API abstraction, with Action Bar View timeline clarification needed.

**TAK UI Grid Display**
The TAK UI effort encountered a challenge with grid display and custom components due to the lack of direct binding to the A TAK core API. This necessitates either reproducing existing functionality using TAK UI APIs like Polyline or drafting an abstraction over A TAK kernel APIs.

**Grid Implementation Risks**
A high-complexity risk involves potentially recreating the GRG API if an A TAK core API binding is absent. Investigation into the Polyline API versus a custom grid component is underway, but documentation for 'polyline' remains undiscovered.

**Action Bar View Status**
Clarification is needed on whether the Action bar view exists in Win TAK and if it differs from the I toolbar extension for grid placement. This spike may become a contribution candidate depending on confirmation of its existence and the definition of a build API.


### NEXT STEPS
[Abel] Validate Radio API: Validate TAK UI radio abstraction spike. Draft a nested radio API proposal.
[Thomas] Action Bar API: Follow up with Nathan regarding timeline and use case alignment. Confirm Action Bar View existence in Win Tag, define the proposed API requirements. Send proposed API to Nathan via Mattermost, then submit the pull request.
[Abel] Follow Up: Follow up with Thomas regarding his Action Bar View spike progress.


### DETAILS

**TAK UI Effort:** Grid Display and Custom Grid Components: The discussion began with the TAK UI effort, specifically focusing on displaying the grid and the tasks related to grid placement and rendering a custom grid and grid lines map component. This is related to the user story where a GRG creator defines parameters to ensure the GRG is created within specific bounds. A major challenge is that no direct binding to the A TAK core API exists for their grid, which necessitates either reproducing existing functionality using TAK UI APIs like `Polyline` or drafting an abstraction over underlying A TAK kernel APIs (00:00:00) (00:05:15).

**Risks and Paths for Grid Implementation:** A high-complexity risk was identified concerning potentially recreating the GRG API if they lack a binding to the A TAK core API. Two main implementation paths were named: using the TAK UI `Polyline` API to draw everything manually, or creating an abstraction over the A TAK kernel's API. The investigation into this spike, titled "TAK UI polyline API versus custom grid and grid lines component," is owned by Risa (00:01:35) (00:06:32).

**Investigating Polyline Documentation:** Despite the suggestion that the `Polyline` documentation might be under map components or maps, a search for "polyline" in the documentation was unsuccessful. The team needs to further investigate documentation under map components (00:03:09).

**Action Bar View Timeline and Use Case Alignment:** This spike, assigned to Thomas, relates to the same user story of placing a grid. Nathan suggested their Sprint 3 work might involve an "I toolbar extension" rather than the "Action bar view" they were hoping for (00:05:15).

**Action Bar View Clarification and Next Steps:** If it is confirmed that the `ActionBarView` is different from the I toolbar extension, it may become a contribution candidate for Risa. Thomas is tasked with following up with Nathan via Mattermost to confirm if the `Actionbarview` exists in Win TAK, which will then require them to define what "build API" means, propose an API, and submit a pull request (00:06:32).

**Future Spike Investigation:** A third spike, "validate TAK UI radio abstraction and draft nested radio API proposal," was mentioned but deferred for Abel to return to later. The next action items involve following up with Thomas regarding the Action Bar View spike and clarifying the action item for Josh's spike concerning the TAK UI polyline API versus custom grid and grid lines map component (00:06:32).


## Abel, Thursday Planning - 23rd

0. Abel OUT 1430

0. Do we have everyone available for a Post-Mortem?

1. User Manual in 5.6 and 5.4, can we get it to Chad?

2. How do I check both apk versions? suggestions? (5.4 and 5.6)

3. User Inteviews [JVD]
- Goals
- Other

4. Developer Sprint 3 work tracks
  
  * **TAK UI Research and Development:**
  
  * **5.6 and 5.4 "Bugs" & Feedback:**

JAMF Migration

> KEVAN: conversation, lean on why they like it more.. inform a DELTA for the whole conversation.. Nik is gonna send an invite for tomorrow, MANUEVER DOMAINS, How do they do Route Planning, for Nik combo tomorrow
> Josh's pipeline not as important
> TAK UI is priority
--> long term josh' plan..
--> next week amount of releases not worth it "full commercial kitcen"
--> if we do two more releases next two week, ROI?
Do we use it to show more releases for the bugs
Its a resoruce not as importnat, if we had the full contract, we want to do this. RIGHT NOW is not..
use it to catalogue, inform how we do it later
- focus on: TAK UI and Bugs
- Timebox it.

up until 915am
Lunch NOON
after 4pm

ASK a very specific question -- 

save the ATAK dod plugin
ATAK 5.4
FLAVOR 5.4

# Product / UX Strategy for SOCOM Journey Expansion

"dreams"

- Kevan's repo
- Delivery/Engagement/SOCOM/TAK/SOCOM TAK Journey/Repository
-- STAK, SOCOM
- TAK ecosystem that we own, distant from the TPC TAK

1. Delivery teams around the DOMAINS
* C2
* 
* fires
* Manueavers
* `SOCOM CORE` (shared foundation) - SPRING

the idea that there be a rise8 delivery team for reach

FIVE PILLARS

5. NIX


JON - "TAK Journey Dreams - Expanded Design Revision"
- avoid TAK UI pitfalls
- need consistant...
- Design Dreams

"6" Human Operator Systems

reflect the outcomes and impacts
to REFLECT THE OUTCOMES

Operating model -- embedded design lead

Kevan, opportunity to scale into this
opportunity c2 team working on CORE 
when it gets big enough it can be come its own team
based on scaling smarter and expanding timelines

How might we scale this?
Part as a Core Team? Split it off when it gets to a mature level
whast the amount of people to support this

--

building blocks to a design system

--

- Merge Request is in `Fix/user manual` , needs to rebase (josh pushed stuff)
- Tags Thomas, 
- after merges, approves, merges with MAIN becomes new MASTER
-  
we can point to that..
- 

1. form a basic opinion about it and bounce that of Nik
RISK: Josh and Cliff think this is a risk, to leave the labels on?

---

# PM Card — Release Pipeline Reliability: Publishing Resolved, Building Stage Approach Pending

---

**What's broken / the opportunity:** *The release pipeline has two stages with different states of resolution*
The pipeline that gets builds to Chad and Nik has two distinct stages: Building (code compiled into APK files for each ATAK version) and Publishing (finished APKs pushed to the Package Registry to generate a download link). The Publishing stage had a reliability failure that is now resolved. The Building stage has a known manual dependency that was identified, a solution was started, and that work is currently paused.

**Source / How it surfaced:** April 18-22, Slack and IPM. Josh and Kevan.

**Why:** *Both stages must work without manual intervention for the team to release reliably*
A failure or manual dependency in either stage sits between the team and getting a confirmed build to the field. The Publishing failure was requiring Kevan to intervene by hand before any build link could be sent. The Building stage has required a manual sync step before each release that has already produced one version targeting error this contract.

**Blocker or Risk if not addressed:** *The Building stage manual dependency is the remaining exposure*
Publishing is resolved with no current risk. The Building stage three-branch model still requires a manual sync step before each release. That step has no automated check. An error may not surface until after a build reaches the field.

**What we're doing about it:** *Publishing fixed; Building approach paused by team decision*
Publishing: Josh built `pads-fast` as a replacement for the upstream publish service, which was timing out before it could complete. Deployed April 22. No further action needed.

Building: The parallel matrix pipeline chore, which would have replaced the manual three-branch model, was paused April 21 at Kevan's recommendation given uncertainty on release cadence for the remainder of the contract. Josh had started the work before the pause. An open question on how much of that work was incorporated is documented in the GitLab chore.

**What done looks like:** *Publishing is confirmed done; Building criteria not yet defined*
Publishing: `release_internal` completes in under 4 minutes. All 5 ATAK versions publish per pipeline run. Confirmed April 22.

Building: Not yet defined. The team has not agreed on conditions for resuming or formally closing the matrix pipeline chore.

**How to prompt the engineers / suggested next steps:**
1. Ask Josh: "Is there anything remaining on `pads-fast` or `release_internal`, or is that fully wrapped on your end?"
2. Ask Kevan: "Under what conditions would we revisit the parallel matrix pipeline chore? Is there a release volume or cadence that would make it worth picking back up before the contract closes?"

--USER MANUAL

same version build, mil tag
zach vs thomas different
zach whipe his phone

THOMAS
- has not tested user manual branch
- has only tested `master`
- ActionBarView

---

# PM Card — `assembleProduction` Job Slowness: Build Stage Job Exceeds Time Limit and Fails Intermittently

---

**What's broken / the opportunity:** *The only job that produces a field-deployable APK sometimes runs too long and fails*
`assembleProduction` is the Building stage job that produces the final signed APK for field handoff. Josh flagged that it sometimes exceeds the 60-minute GitLab time limit and fails before completing. He identified the dependency check step as a specific contributor. When this job fails, no release-ready build is produced from that pipeline run.

**Source / How it surfaced:** April 21-22, Josh Slack messages. No prior ticket existed.

**Why:** *Every handoff to Chad and Nik depends on this job completing successfully*
If the job fails intermittently, the team has no reliable signal for when a release-ready build will be available without manually re-running the pipeline.

**Blocker or Risk if not addressed:** *Intermittent failures add an unplanned manual step to the release process*
A failed job on a release pipeline run requires the team to re-run the pipeline and wait again. How often this has affected past releases is not confirmed in the available context.

**What we're doing about it:** *Josh flagged the issue and stated intent to investigate; no formal ticket or confirmed assignment*
Josh noted two potential responses: extending the job time limit as a near-term measure, and optimizing the job to run faster as a longer-term fix. Neither has been confirmed as complete. On April 24, the TAK UI spike for GRG grid display was proposed to Josh as the higher priority over this work. Josh's response is pending.

**What done looks like:** *`assembleProduction` completes within the time limit on every pipeline run without manual re-runs*
A release-ready APK is produced consistently each time the pipeline runs. No manual intervention needed to recover from a timeout.

**How to prompt the engineers / suggested next steps:**
1. Ask Josh: "On the `assembleProduction` slowness, did you extend the time limit as a short-term fix, or is that still pending?"
2. Ask Kevan: "How often has `assembleProduction` actually failed and required a re-run? I want to understand the frequency before we decide whether to prioritize it over other Sprint 3 work."

1. Let's not call it "field review" it's "DT" (Development Testing) has been initiated.

2. sending 5.4 is part of #1 5.4 and 5.6 are a "package deal" that needs to be provided to SOCOM to conduct their DT, they are not separate accomplishments

3. yes, this is more about quantifying repeated runs and buulding detection accuracy by 124%

4. Yes, Call out that we have alignment and priority on what we are focus for TAK UI, 
As a GRG Creator, I want to place a grid and start defining its parameters, so that the GRG that gets created is within specified bounds.

Scenario 1: Place grid
Scenario 2:  Define grid parameters
Scenario 1: Adjust AI GRG settings
And also started on a the second user story: As a GRG Creator, I need the option to draw sections within the grid, 
So that I can organize the buildings' markers.

5. GOTS Eval feels accuate

6. I think that can be "bundled into" : 3. yes, this is more about quantifying repeated runs and buulding detection accuracy by 124%



--

# NIK MEETING, with Kevan, Friday April 24

TAK a Libraries (Plug in as a Service)

TRAILBLAZER-plugin.md
- server (depricated)
- comm patters, how its built

TOP DOWN ARCH PLUGIN DEV FOR TAK
B*star search alog
APIs
Libraries

service of the plugin "smaller"
purely UI

ATAK dependencies: java, server, rastra? (trailblaer-plugin.md)

Understanding the "entire echo system"
BEFORE he goes any further.. Nik in your ideal world, plugin as a service.. 
to get to a Core, SOCOM TAK.. fits operator neds and built it lean.. no duplicate 

### Nik responds
** Nik--> "you nailed it"
* we tried it, "how do you do routing?" Routing library, so that userexperience Given you upen ATAK without plugins you can still plan a route.
* ATAK has that capability, but how do we maintain that "Core" experience, BUT if we have a plugin,, we add "features"
* Given I have no plugin to plan a route, I got a start point and couple mid points and end point.. (in between) air, sea, land cross-domaion. "do i touch any poins in between"
* I load TrailBlazer, ATAK Core recognize i have vector or OSS data.. I can do turn by turn road navigation. 
- it does the planning for me, "snap it to the road"
- then I go back to the same CORE experience, go this directon and end up here
* "TrailBlazeer off road", terrain slopes, tree spacing (vegetation) I prob wont it a vehicle, or do I have to cover a point in beween?

**The Swim (sea)** changes things, but youare still going places..
air drop is similar, If you are in the air "tehre is not tree at 5000 feet" but wind gust, if you looking to jump. thrust... in the AIR "jump master" We look at where do I want to.. put in variables, wind, altitude, speed, that accounts "math" the mass, the canopy characteriscts, to land at this point, you have to start at this pint

The sea marinetime the same aspect, 20 feet at the surfaces, the tides, boats, dock area, looking at the tides, the water might move at one speed outside and inside the channel.. "compressing the space" doing physics..If i know the variables, the tides and surgace winds are doing, we can estrapolate how that water is moving (kinda like if it was the wind foe the air) determine where I need to start swimming.. "here" you planning your route backwards because you have so many external factors.. its how we plan it now.. the current would do this, I want to land here.. where do I need to start the swiming process from? -- 

Kev: trailblaser has avoidance, Swim doesnt
if you ahve core structures "SOCOM TAK" makes it easier to scale across
an avoidance area.. example.. if we have that logic once.
Kev: right now every single plugin is figureing it out on its own.. the more we unify the "core logic" it reduces engineering cost having to figure it out from scratch. avoidance area example.. 

Nik: we went easy on the ground, its either a geofence (TAK understans that) sty out of this shape, or select a COT marker and stay away certain feet from this radius, "this is shape" stay out of it, 

- SOCOM confluence, he has a huge section on routing

Nik Shares screen, he has a whole section on routing, 
- Core Data : (not loading), 
- Navigation Modality Specific
- TAK Routing Community 
- Docs

Kev: Difference in data for gorund and swim
every plugin needs data, they ahve differnt way of impport?
data requirements.. (functionality can just REQUEST the data source) as opposed having operators manually upload/import or sync data across..  Kev wants to know Niks impression, long term, but near term, have one person within a team import data, via TAK service, to start and overtime, we can get better.. collab, get all data together.. field level, aggregate all data.. diff ways to do this, Pesonally it kills us to see so many manual , focs on misison and execution.. 
- subscribe to data feeds

The TLDR tool, automated route planning, it has to have something to calculate against, on TrailBlazer the TLDR took takes, elevation, open street maps vector data and it creates a model. to run, We run the algo CCM data (cross country), ArcGIS.. a 3d model of the world.. I think using the TLDR tool as an example.. we have "a thing" the creates a model of .. "whatever", Before a unit deploys. I am going here..  How do we create the models.. to run the algorithm... against.. 

Nik, shres confluence `Core Data` 
- Man Made Objects
- Water Ways
- Vertical Obstructions

FUTURE DATA
- Soil Type
- Vegetation

Elevation, vs Wind Speed

Navigation Modality Specific Data
ON ROAD | OFF ROAD | MARITIME | AVIATION
-OpenStreetMap | Corss Country Mobility CCM | etc | tc

A company called dito ir ditto? sync subscribe
dito peer? 

Nik, yo have to make plugins to make TAK 'do things'
we are gonna integrate a GPT plugin, "agentic ai"
basically the plugin would, You can put. your "load out"
example, I have an M4, shotgun, anti-tank,
Kevan is carrying stuff, Abel too
Have the plugin tag the call sign, with that equipment
so we can start having that load out avaialble
with ouer things.

Manifest plugin (DECO?)
If we can start using the plug-on
vehicle break.
based on my missoon requirements..
It can iedntify those people for me
Charlie 3 1, 3-7
SpotPlot, this person has the mortar.. 
a library or the plugin what is that exactly call? how do I intro that..
the easiest way is to do a Plugin.. it becomes part of the core func
and then add it to eh core.. 
the TPC is a lot smaller.. 

How do we tag call signs of poeple.. 

Kev: GPT plugin, setting up the schemas

TAKGPT , is it GOTS?
Kevan can offer a GOTS alt

Multimodel GPT plugin.. integrate with plugins it self
'create me a GRG at this location'

--

contracting.. 
only talk about TAK UI, AI GRG
do we want to.. say OK, we are gonna suffer together
while we wait on these people "to do the contract"

the things we are trying to do, we need you ON PRODUCTION
GOTS eval be a "catch all?"

Nik.. I want you to write code.. not to assessment
Nik, I can't give you access to Jira, share confluence,
we need you ion Prod, get a SCOCOM email and CAC, 

--

NIK, talks about planning, epics.. 

--

Sharing huis "requirement"
- agentic ai

His EPIC

`SOF end-users` want to `leverage AI/ML including Intel`
to assist `in mission and route planning`, both deliberate and hasty, 
to assist `in risk reduction`. 
Integration with TAK would 
- save manpower, 
- provide enhanced situational awareness, 
- force protection, 
- and improve decision making for Agile Combat Employment applications in support of Special Operations

SOCOM uses initiartives

SpotPlot, 
ability 

For
	
SOCOM Operators


who
	
utilize TAK


the
	
TAKtical Assistant


is an
	
AI companion for TAK


that
	
monitors COT for relevant information to compresses Observe Orient Decide of OODA loop giving SOF Operators the time and space needed to Act


unlike
	
the current way of having to constantly monitor the map for info


our solution
	
reduces cognitive load and shortens the OODA loop. Which allows Operators to make more informed decisions faster about relevant "things" (enemy, terrain, information, etc.)
 

 Shring JIRA

 Initiatives - EPICS - Featuers

NIck: He agrees with everything, BUT how do we put it into execution?
Nizme's lane, he wants to say.. "generic"  in the sense of "delivery TAK capabilities" is not specific, 

Kev: OTA is very specific.. ?

TAK UI - initiatives, yes they are named after plugins..
SpotPlot v3.0
nested issues in the Epic
AGILE SAFE, is a RISK
until we found a better way

TAK offsite, 17 to 21 August, - Nik's recommendation is to make a hotel reservation
who needs to go
BAH team, Kelly is going.. 
Nik is gonna have Nathan there
Contracting was a pain
the easiest, was to hold squat
I voiced my strong opinions

--

run the build no successful
TAK UI needed to run?
TAK UI testing

--

PR for the grid if we feel like we are ready
Record our contributions
Document the shit they are doing and the goodness we are doiing

Are we gonna delivery TAK UI components?
Yes we would want to make contributions here
Make PRs and showcase the progress we didd


no bindings
skeleton components
implement me "daddy"

if he does the prototy
bare mini
draft MR
contact them
- people are weird
- hit me with everything you got..