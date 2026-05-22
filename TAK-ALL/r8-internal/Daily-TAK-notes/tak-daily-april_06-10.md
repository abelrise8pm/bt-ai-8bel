# Monday, April 6th 700am - Slack Developer Discussions

Josh: Please review and merge "feat: use sliding window to infer over a large image" (TAK Forge GitLab), This is the first step to resolving "[BUG]Reduced building detection when zoomed out" (Rise8 GitLab), It will publish the SDK with v1.0.2., This is the fix in the plugin, which won't actually build until the SDK is published. fix: resolve issue with tile caching and building filtering (TAK Forge GitLab)

Josh: You'll see in this video that i'm using the KMZ image and zooming out all the way then switching to an online map. Then I run the detections. You'll see that we are downloading tiles to the caches.

This only happens the first time. We are doing it at zoom level 19. I tried at 18 and fewer detections resulted because they weren't high enough fidelity. Then I tried at zoom level 20 and the same number of buildings were detected as with 19. So zoom level 19 seems to be the sweet spot.

We can talk about prefetching on GRG creation. That could make it feel a lot faster but I felt like that was out of scope. Anyways, run great, works great. Everyone should be happy.

Kevan: We probably want to change our android namespace in the longrun: us.rise8.atak.grg.plugin , 
Kevan: merged; "AI GRG initial release", MR to add plugin to master release list. We should be able to release internally after this is merged and send the apk to Nik directly, or submit a Jira ticket to publish to tak.gov registry when done

## CURRENT GITLAB PROJECT AND REPOS

### TAK FORGE aka git.tak.gov/rise8
There are 4 projects, this is USSOCOM/SOFMC's GitLab repo (the customers)

1. grg-tak-platform-sdk (shows activity 12 hours ago)
2. rise8-atal-grg-plugin (shows activity 1 hour ago)
3. rise8-wintak-grg-plugin (shows activity 4 months ago)
4. takui-grg-plugin-discovery (shows activity 4 days ago)
> Abel's Observations: I am assuming that Josh fixed the bug in "rise8-atak-grg-plugin" because I see a commit "test: resolve mock issue" and then in the "grg-tak-platform-sdk", he also has a commit after, Merge branch 'rise8/rise8-atak-grg-plugin#40' into 'main'..  I guess the gap I have is for me as a PM. they requested to merge the latest changes to a different project in TAK Forge < devsecops/TAK Plugin Master List / Merge request? how?

#### git.tak.gov/devsecops
1. Android Builder Image
2. Artifactory Token Service
3. Docmentation Tool
4. GitLab CI Common
5. TAK Plugin Master List (this where Kevan submitted "AI GRG initial release: Initial addition of ATAK plugin AI GRG to TAK Plugin Master List for releases.
" and it shows as "marge request", Josh approved and someone J Hepp added 2 commit "aigrg: Fix referenced MFR name in metadata" and then 40 mins ago, "aigrg: Content file update", it says "Marge request pipeline #000xxx passed" )
6. TAK Windows Builder Images
7. Trivy Report Templates
8. Watchtower CI

### Rise8 self-hosted aka gitlab.gl.rise8.us/groups/rise8-all/../tak
There is a lot in here and this is ours, Rise8's self-hosted repo. Doesnt' appear we are NOT doing any development here.. but I do keep my stories here. 
GRG Plugin
1. atak-cv-model-server
2. rise8-atak-grg-plugin
> I believe here is where I have my epics, and issues board: `https://gitlab.gl.rise8.us/groups/rise8-all/delivery/engagements/socom/tak/grg-plugin/-/boards/`
3. rise8-atak-grg-plugin-security-policy
4. rise8-grg-ai-model
5. rise8-grg-ai-model-security-policy
6. rise8-grg-ai-sdk
7. rise8-grg-ai-sdk-security-policy
8. rise8-tak-cicd
9. rise8-wintak-grg-plugin (not priority)
10. rise8-wintak-grg-plugin-security-policy (not priority)

---

# Moday, April 6 - TAK Bridge Daily Stand-up

The new sprint kickoff involved environment setup and detection issues, with plans for the upcoming demo and repository standardization.

Sprint kickoff and logistics
The current sprint began on April 6th and runs through the 19th, with Abel Hernandez preparing the demo presentation and reviewing the backlog for the pre-IPM meeting. Team members confirmed upcoming travel and appointments impacting availability this week.

Environment setup and integration
Zachary Greenlief is troubleshooting unsuccessful higher-level detection attempts and plans to adjust detection thresholds and tiling with assistance from Josh. The team must address a documentation discrepancy in the plugin Merge Request and finalize production readiness for Nick to distribute the plugin.

Repository standardization and demo
The team agreed to standardize repository usage by working within the internal GitLab and potentially setting up mirror repositories to sync code to TAC Forge. Kevan Mordan strongly recommended pre-recording the upcoming demo, utilizing Android Studio's device mirroring feature to showcase bug fixes and high-altitude detection.

### DETAILS
Team Member Availability and Logistics: Zachary Greenlief will be occupied with an appointment tomorrow for approximately two hours mid-day and will be traveling, yet still working, on Thursday and Friday. Kevan Mordan is currently camping in Southern Utah but will be traveling to San Jose for a conference from Wednesday afternoon through Friday.

Upcoming Sprint and Planning: The current period marks the beginning of a new sprint, running from April 6th to the 19th, according to the established schedule. Abel Hernandez plans to prepare for the demo on Wednesday, which includes creating a presentation deck, and will spend time reviewing the backlog and preparing for the pre-IPM meeting scheduled for later in the day. They also plan to look through the plugin list that Nick provided.

Progress on Environment Setup and Detections: Zachary Greenlief collaborated with Josh last week to properly set up their development environment. They have been attempting to implement higher-level detections, though their initial attempts have not been successful, and they plan to try different approaches this morning. Zachary Greenlief noted they have multiple strategies remaining, such as adjusting the detection threshold or improving tiling, and that Josh has agreed to assist them later in the day.

Device Setup and Internal Tools Integration: Thomas Reynolds needs to obtain the passcode for the new phone and laptop to complete the Android device setup and also plans to configure some of the tools learned at ShipSummit, like Claude, for their repository to enhance productivity. Abel Hernandez also plans to set up their Android phone and device and will reach out for assistance if they encounter issues.

Plugin Integration and Release Readiness: Kevan Mordan has submitted the initial Merge Request (MR) to integrate the team's plugin into the master list but noted a documentation discrepancy between the repository's README and the Confluence article that needs to be addressed. They emphasized the need for close communication regarding the official release schedule and when the team is production-ready for Nick to distribute the plugin.

GitLab Repository Usage and Standardization: Abel Hernandez raised a concern about the development process, noting that stories are housed in the Rise 8 internal GitLab, while code is being pushed to the TAC Forge side, and asked for suggestions on how to standardize the use of the repositories. Kevan Mordan suggested using the internal GitLab for development to gain more metrics and visibility, potentially by setting up mirror repositories to sync the code to the TAC Forge GitLab, and agreed to use both until a permanent solution is found.

Strategy for the Upcoming Demo: The team discussed the upcoming demo scheduled for Wednesday and the best approach for showcasing the working plugins, with the intention being to display the work completed and the upcoming sprint plan. Kevan Mordan strongly recommended pre-recording the demo, especially to showcase bug fixes and the high-altitude detection feature, as this has been effective in the past.

Demo Recording Technique: When pre-recording the demo, the team typically uses the physical device and utilizes the device mirroring feature in Android Studio for screen recording. This method is preferred over an overhead camera setup, which can be cumbersome and lead to a dizzying view for longer recordings.


Device Passcode Confirmation: Kevan Mordan confirmed that the phone passcode is known, but the laptop's passcode is still uncertain. Abel Hernandez suggested trying "3140" for the laptop.

Post-ShipSummit Integration and Future Planning: Abel Hernandez plans to implement some of the techniques discussed at ShipSummit, such as setting up scales for drumbeat updates, which they noted as a time-intensive process. They encouraged all invited members to attend the pre-IPM meeting to ensure everyone is aligned on the sprint objectives.

---

## PRE-IPM Prep, Monday 1130 AM April 6

Feature-Epics

- FEATURE-TAK-Bridge-0001: TAK UI Framework migration & research: How users interact with the plug-in inside ATAK. what they see, how they submit images, how resuls are displayed and how they correct outputs.
- FEATURE-TAK-Bridge-0002:The CV Model : YOLO, YOLT. The accuracy, performance, and ability to identify and outline buildings correctly. Both algorithm and model's capabilities.
- FEATURE-TAK-Bridge-0003:Model Training Pipeline : the infrastructure that maes the model improve over time. Involves, Data collection, labeling, training, evaluation, and the feedback loop back from the field.
- FEATURE-TAK-Bridge-0004:TAK Integration and Compatability : The plug-in must work within the ATAK ecosystem, pass the keying process, stay compatible with SDK releases and integrate with TAK server(where needed). Related to SOW's #1 task "Update to v5.6
- FEATURE-TAK-Bridge-0005:Deployment and Release Infrastructure : The delivery mechanism for the plug-in.. the GitLab ci pipeline, Fortify scanning, Artifactory, Hand-off to TAK Forge, ATO compliance. All the work related from getting the plug-in code from source, dev to users in prod
- FEATURE-TAK-Bridge-0006: GOTS Evaluations : Evaluate existing SOFMC/SOCOM plugins for AI improvement opportunities. Identify where cognitive burden can be reduced across prioritized plugins and deliver findings and recommendations to the PMO.

## PRE-IPM Top Priorities

## 0. Working in 5.7
- Bump SDK to v5.7
> kevan we are in the mobile game.. we need some sort of methodology 
for testing and validating.. 
> we need a process, 
> TAK UI, make sure it make sense for TAK UO

## 1. Bug Fixes and Demo Readiness

* 🪲[BUG]Reduced building detection when zoomed out: Model performance seems to degrade when the operator is zoomed out. Detection improves when zoomed in over the same area.
> Detection accuracy dropped when operators zoomed out `because the model processed images at whatever zoom level was on screen`, reducing fidelity. Josh fixed it with a 
-- > `sliding window approach that always runs inference at zoom level 19, regardless of view.` 
--> Tiles are cached after the first run. SDK v1.0.2 published.
* **Sliding window approach**
Instead of processing whatever the screen shows,`the model breaks the full area into fixed-size overlapping chunks ("windows")` and runs detection on each one at a set zoom level (19). It slides across the image systematically, so no section gets missed and fidelity stays consistent regardless of where the operator is zoomed.
* **Tile caching**
Maps load as small square image segments called tiles. Without caching, the app re-downloads those tiles every time you run detection, which is slow and network-dependent. `With caching, tiles download once and are saved locally`. Every subsequent detection run pulls from the local cache instead of the network.

* 🪲[BUG]Intermittent building detection failure on repeated runs

> Intermittent detection bug — likely fixed as a side effect. Josh's filtering fix corrected how the plugin tracks building markers. 
- `The suspected cause: when operators deleted markers, the plugin was not clearing them from its internal list. On the next detection run,` newly found buildings were being flagged as duplicates of those ghost markers and filtered out — making it look like detection failed. The filtering fix likely cleared that behavior.

> Why they are related: Both fixes touch how the plugin handles and tracks detected buildings between runs. The filtering fix that resolved duplicate detection is the same logic that may have been causing buildings to disappear on repeated runs.

## 2. Production Readiness and Release

- `Docs fix` first, 
- `THEN` PRR form,  (Jira Project)
- `THEN` wait on TPC (TAK Product Center)
- `SEND` Nik the APK directly while that is all in motion.

1. Fix the docs discrepancy (Kevan owns)
The README and Confluence are out of sync. This should be clean before anything official goes out.

2. Submit the Plugin Initial Release `PRR form`(Kevan submits, at Nik's request)
This is the web form on TAK Forge. Submitting it auto-creates the Jira ticket. That ticket is how Nik tracks the release. This cannot be skipped.

3. TAK Product Center `processes the PRR`
Once the ticket exists, a rotating TPC engineer picks it up and adds the plugin to the production CI/CD pipeline. Rise8 waits here.

4. Plugin is `live in the registry and distributed per the MFR`
The MFR (government-signed doc) defines who gets it and how. J Hepp's commit suggests one already exists from the competition — but Kevan needs to confirm it covers this release.
> Memorandum for Release: a government-signed doc that defines the distribution guidance for the plugin — who gets it, how it gets distributed, and under what conditions. Nik's side signs it, not Rise8.

5. `Sending APK directly to Nik` sits outside this sequence. It is an informal shortcut — Kevan emails Nik a link to the APK sitting in Artifactory. No PRR needed. Nik gets it faster but it is not an official release. This can happen in parallel or before steps 2-4.

- Release, TAK Plugin MASTER LIST, We did an MR, we are there, repo setup

## 3. TAK UI Migration, Workflow by Workflow
---
# TAK 🌉 Pre-IPM, Monday April 6 2026

## SUMMARY
Version 5.6 testing remains necessary for backwards compatibility, with a focus on resolving the .mil tag signature blocker for the officially signed APK and aligning on a version bumping strategy for plugin development.

**Version 5.6 Testing Status**
Testing for version 5.6 remains necessary despite current development on 5.7 to ensure backwards compatibility and maintain organizational clarity for releases. The major blocker for the full release testing is waiting for the officially signed APK to test the signed .MIL tag built in Tag Forge.

**Version Bumping Strategy Agreed**
The team agreed that 1 engineer should handle bumping the codebase to the latest SDK version, confirming this standard dependency management. The initial release metadata for the plugin was successfully merged into the ATAK plugin master list via a merge request, bypassing the Jira ticketing system.

**Initial TUI Migration Strategy**
7 new stories related to end-to-end workflows were introduced to facilitate the gradual migration to Tag UI. The team needs to collaboratively determine which parts of these workflows are ATAC-related development versus components that can be migrated to TUI.

### DETAILS

**Review of 5.6 Testing Status:** The team discussed the incomplete testing of version 5.6 due to initial issues with the military (MIL) tag loading on an emulator for Thomas Reynolds (00:00:00). They clarified that while development is occurring in 5.7, testing for 5.6 remains necessary to ensure backwards compatibility and releases for the latest versions (00:01:10). Kevan Mordan suggested simplifying the process by focusing on 5.7 since only 5.6 and 5.4 builds will be produced, but Abel Hernandez emphasized the need to test 5.6 for organizational clarity (00:02:17).

**Clarification on .MIL Tag Testing:** The team reviewed the status of the .MIL tag signature required for testing the full release, confirming that testing with the development (DEV) build has already been completed and validated by Thomas. The signed .MIL tag, which is built in Tag Forge, cannot be tested until the officially released and signed APK is available (00:04:36) (00:07:07). The current blocker is waiting for the signed APK after the required sign-off (00:07:07).

**Updates on Plugin Documentation and Findings:** Abel noted that the story "Publish GRG plug-in SDK to GitLab registry" is completed, and the initial investigation is done, resulting in a findings markdown file that will serve as documentation for the gradual migration (00:08:12). Kevan Mordan suggested that these initial findings should be included in their sprint demo (00:09:38).

**Discussion on Bug Fixes and Image Detection:** The team reviewed a bug fix video, which addressed an issue where detected buildings remained cached, causing problems, and discussed the fix involving setting a specific zoom level for processing image tiles (00:09:38). The recommendation is to use zoom level 19 as a "sweet spot" for running all tiles of an entire image (00:10:41). Kevan Mordan proposed side-barring the details of image detection due to time constraints (00:11:46).

**Alignment on Version Bumping Strategy:** The team agreed that only one engineer should handle the responsibility of bumping the codebase to the latest SDK version, and other developers can then pull those changes (00:11:46). Kevan Mordan confirmed this is standard dependency management, but stressed the need to establish a comprehensive strategy for testing and validating multiple versions of the plugin, given the mobile nature of the application (00:12:54).

**Plan for Developing a Version Management Strategy:** Abel volunteered to research how the ATAC team handles version management in their documentation, as well as general industry practices, to establish a baseline for their own methodology (00:13:55). This information will be reviewed internally before presenting any proposals to SOCOM, with a follow-up discussion scheduled for the following day (00:14:47).

**Confirmation of ATAC Plugin Master List Status:** Kevan informed the team that the merge request (MR) to add the plugin's initial release metadata to the ATAK plugin master list has been successfully merged (00:18:41). They used an MR (merge request) instead of the Jira ticketing system (PRR form) due to an apparent workaround for merge request issues (00:20:52). However, the exact process for releasing the signed plugin to production remains unclear, which will require further investigation in the relevant matter channel (00:25:11).

**Target for Production Release and Sprint Demo:** The primary objective is to finalize the release pipeline setup and ensure the bug fixes are complete and validated, providing a clear line in the sand for when to tell Nick to distribute the production plugin (00:27:09). For the sprint demo, the team plans to showcase the release pipeline setup and provisioning of the plugin information in the master list, as well as the completion and validation of the bug fixes (00:28:06).

**Strategy for TAK UI Migration Workflow Stories:** Abel introduced seven new stories related to end-to-end workflows from the value stream process blocks, intending to use them for the gradual migration to Tag UI (TUI). The team needs to collaboratively determine which parts of these workflows are ATAC-related development work versus components that can be migrated to TUI, using end-to-end testing of full workflows as the metric for success (00:29:51).

---
# Josh, Zach 5pm April 6 Huddle

### SUMMARY
Reduced building detection when zoomed out was fixed via tile caching, confirming intermittent bug resolution but raising new prefetching concerns.

Detection Bug Fixes Confirmed
The intermittent bug of repeated building detection was fixed by implementing a "sliding window" approach and tile caching for high-fidelity images. This tile caching ensures the model always uses the clearest possible image, solving performance degradation when zoomed out.

Prefetching Proposed and Blocked
The team proposed "pre-fetching" map tiles upon Geographical Reference Grid area definition to speed up detection by performing heavy downloading in the background. This feature is not production-ready because the plug-in cannot guarantee all tiles finish downloading before detection runs, which could worsen the operator experience.

New Reliability Block Identified
A critical new issue was identified where detection can start before all map tiles finish loading, resulting in the model analyzing incomplete imagery. Zach will investigate a programmatic check to confirm all map tiles are fully downloaded and cached before detection is initiated.

### DETAILS
Bug Fix: Reduced Building Detection When Zoomed Out: The team addressed a bug where model performance degraded when the operator was zoomed out, which Jonathan Miller observed during early prototype testing. Josh implemented a "sliding window" approach, where the model now analyzes large images by sliding across them in overlapping sections instead of analyzing one large image all at once. This overlap is intentional and helps catch buildings that sit on the edges of sections that might otherwise be missed (00:03:18).
Tile Caching Implementation: As part of the fix for the detection bug, the plug-in now pre-downloads and caches the highest fidelity map tiles available for the selected area before running detection. This "tile caching" ensures the model always works with the clearest possible image, regardless of network conditions during detection. The caching involves storing copies of data in temporary storage to serve future requests faster (00:01:29) (00:04:49).
Fix for Intermittent Bug Root Cause: Josh identified and fixed an intermittent bug where the building detection array was not clearing properly between runs, leading to the model finding the same buildings already in memory and appearing to fail (00:04:49). This issue was identified as a data management bug, not a model failure, and Josh believes it is now fixed (00:06:29). Abel noted that the fix involves running more inference passes per detection, which could increase latency as areas get larger (00:08:01).
Product Manager Takeaways and Assignments Related to Debugging: A key product manager takeaway is that the debug snapshots being taken during detection need to be removed or hidden behind a debug flag before production. Abel needs to create a ticket for this issue, which Josh himself flagged (00:08:01). Josh's confidence in the fixes is high, as they ran the model four or five times over a large area and got consistent results (00:09:21).
Concept of Prefetching for Improved Experience: Josh proposed "pre-fetching," where the plug-in starts downloading and caching map tiles as soon as the Geographical Reference Grid (GRG) area is defined, instead of waiting for the operator to hit "detect buildings" (00:09:21). The goal is for detection to feel faster because the heavy lifting of downloading map tiles happens in the background (00:10:55).
Framing Prefetching for the Customer: The team proposes framing the prefetching idea to the customer as an opportunity to significantly improve the detection experience by preparing imagery in the background as soon as an area of interest is defined. This is expected to reduce perceived waiting time and improve reliability in areas with limited connectivity (00:10:55).
Gotchas and Risks Associated with Prefetching: Several issues were identified regarding prefetching, including the rapid scaling of tile volume at higher zoom levels, potentially draining battery, consuming storage, and slowing the device. A critical concern is that the plug-in cannot currently guarantee all tiles will finish downloading before detection runs, which is an open engineering problem (00:12:17). Furthermore, the prefetching assumption may not match the unknown operator workflow in the field, necessitating workflow validation with the customer (00:13:33).
Prefetching as a Promising but Not Production-Ready Feature: Prefetching is considered a promising idea but is not ready to be sold as a feature due to the tile guarantee problem, which is still a blocker. Abel concluded that if tiles are not finished loading before detection runs, the operator experience could worsen (00:13:33). Abel needs to follow up with Josh on what is required to guarantee tiles are fully downloaded before detection runs (00:14:43).
Confirmation of Intermittent Detection Failure Fix: The intermittent detection failure bug (repeated runs bug) is likely fixed based on the earlier implementation of the sliding window approach and tile caching. Josh believes the root cause was the building detections array not clearing between runs, and they could not reproduce the issue anymore (00:14:43). Although Abel thinks the issue is resolved, they need to perform a clean test patch before officially closing the ticket (00:16:05).
New Issue: Tile Loading Not Guaranteed Before Detection: A new potential bug was identified and agreed upon as the most important thing to address: the plug-in starts detection before all map tiles finish downloading. This results in missing or blurry tiles, meaning the model is analyzing an incomplete image (00:16:05). Zach will investigate a programmatic check to confirm all tiles are fully downloaded and cached before the bitmap is created and sent for inference (00:17:14).
Strategy for Customer Pitch on Reliability Issue: Abel plans to pitch the tile loading reliability issue to the customer by stating that they identified a reliability issue where building detection could run before all map imagery finishes loading, leading to incomplete results (00:17:14). The proposed fix would ensure the model always works with a complete, fully loaded image before detection begins, improving metrics consistency and accuracy (00:18:37).

Product Manager Takeaways and Action Items: Josh noted that the Tactical Assault Kit (TAK) pipelines are the most challenging and flaky they have encountered, which is a systematic risk to viability and feasibility (00:18:37). Abel needs to follow up with Kevin to sort out the development merge workflow and commit to creating a ticket for Zach covering grid capture, tile loading, and memory leak investigation. The target for getting a packaged build ready is Wednesday, requiring packaging by Tuesday (00:20:03).

New Workflow for Getting Latest Code Changes: Abel learned a new workflow for obtaining the latest code changes without manually downloading and installing the APK, which involves syncing the project via Android Studio while connected to the VPN (appgate?) and the correct GitLab repository. 
"if you have android studio and the plugin project open, just sync the gradle project... go to "sync gradle project" or run /refresh dependencies. As long as your are on the VPN (appgate) connected to GitLab, it will automaically pull the latest code and the SDK down for you, no manual APK download need"

This new process increases Abel's independence in validating fixes before they are packaged (00:21:08).

### raw-notes

```
JOSH - Huddle
Zoom level
Zoom level 19 - 221 *sweet spot*
Zoom level 20 - 800
640x640 SDK limit, need them to be scare
- tile image func, looks for the cache tiles, 
- i am gonna download em and cache em for you.. 
- the inference
- the debug, snapshop, we are gonna have to get rid of it, causes extra processing
- Deleted markers, lasso tool, when you re doing this, deleting it, building detection array
and it wasnt getting empty.. 
- pre-fetching titles..  
> The most important piece: when he ran the detection, those tiles blurb appeared
- /refresh
-/sdp
-/graddle
- #39, intermitten, the bug is squashed
- memory leaks
- zach did you see any memory leaks? wghen ever we run our detections it never closed?
- "that thread interrupted" look into
///
- guarantee the download of the tiles happen and guartened that, after we dowmload., we create the bitmap, gurantee all the tiles are getting loaded into the bitmap, THE BUG?
--> we should be able to know how much of the tile we download, we should have all the info..
--> we should, we know we download it successfully.. 
* Zach touch base, grid capture, check for memory leaks, 
```
///
---
# ** DEMO PREP - 4.6 to 4.8 **

### - Nik's OUTSTANDING REQUEST
**1. PRR Process — follow it for every release, keep him updated**
Nik requires all plugin releases — initial and every future update (v1.2, v2.0, etc.) — to go through the PRR form on TAK Forge, which auto-creates a Jira ticket. Without that ticket, he has no visibility. His message today explicitly asks to be kept updated on PRR status. This is not a one-time ask — it is the standing release norm going forward.
> 
**2. SDK Version Strategy — develop on latest, release on even numbers**
Always develop on the latest SDK (currently 5.7). Release and support only even-numbered versions in the field — currently 5.6 and 5.4. When 5.8 releases, the targets become 5.4, 5.6, and 5.8. This is an ongoing mobile version management commitment, not specific to this contract.
**3. Dual-Track / Tech Debt — no new ATAK features, position for TAK UI**
No new features or functionality on the ATAK plugin. TAK UI is the long-term destination. Nik's warning: don't accumulate tech debt by over-investing in ATAK at the expense of TAK UI readiness. The August 17-21 TAK Offsite is the de facto milestone — he intends to brief on TAK UI production-ready plugins there.
**4. GOTS Evaluation — priority shortlist received, evaluation needs to begin**
Nik provided a priority shortlist of three plugins for AI improvement evaluation: Trailblazer, Combat Swim, and SpotPlot. He also shared the full SOFMC plugin list broken down by function (Command and Control, Maneuver, Intel, Fires, Misc). Per the Week 2 drumbeat, the shortlist is received and under review — but the evaluation has not formally started. Deliverable format and timeline expectations for this contract have not been confirmed with Nik.
> Gap: Deliverable format and what "done" looks like for GOTS evaluation is still undefined. Confirm with Kevan if there is any new guidance from Nik before or at standup today.
----

### Item 1: Bug Fixes and Demo Readiness
* What you know:
- Zoom bug: confirmed fixed and merged by Josh, SDK v1.0.2 published
- Intermittent detection bug: Josh believes it may have been resolved as a side effect of the filtering fix but has not confirmed it
- Zach is still troubleshooting higher-level detections and his attempts are not working yet
- Kevan strongly recommended pre-recording the demo using Android Studio device mirroring

**Key questions for engineers:**
- Josh, can you confirm the intermittent detection bug status today?
- Are we confident enough in both fixes to demo Wednesday, even if pre-recorded?
- Zach, does your detection issue affect the demo or is it a separate track?

### Item 2: Production Readiness and Release
* What you know:
- Kevan submitted the MR to the TAK Plugin Master List and it passed
- There is a documentation discrepancy between the repo README and Confluence that needs to be resolved before the release is clean
- Kevan flagged that tight comms are needed when the team is actually production-ready for Nik to distribute
- The Jira PRR ticket has not yet been formally submitted to publish to the TAK registry

**Key questions for engineers:**
- Kevan, what exactly needs to happen between now and a clean production release? Is it just the docs discrepancy?
Once docs are resolved, does the PRR Jira ticket go in immediately or is there another step?

- Are we ready to send the APK directly to Nik this week as an interim step?

### Item 3: TAK UI Migration, Workflow by Workflow

* What you know from Josh's initial-findings.md:

- TAK UI handles roughly 20% of the plugin natively: UI components, navigation, dialogs, map tools, tool composition
80% still requires ATAK-native code: floating toolbar, radial menus, grid placement and updates, drawing tools, CoT persistence, detection via ONNX

- The `GridTransformer` alone is 500+ lines using direct memory access and reflection — not a simple port
- Current state: core workflows are functional in the TAK UI prototype but detection is not wired, export is not done, save/load is partially implemented

**Key questions for engineers:**
- Josh, given what is in `initial-findings.md`, what is the logical first workflow to migrate? Grid creation? Section drawing?
- Are the existing TAK UI migration stories in the backlog scoped at the right level or do they need to be broken down further?
- What is the biggest unknown heading into migration work that could block progress in this sprint?

**My overall Pre-IPM flag:**
* The demo on Wednesday is the highest urgency item this week. Everything else can flex. If the intermittent bug is not confirmed resolved by today, that needs to be your first question in the room.
---
# TAK pre-Demo check-in , April 7 2026

**SUMMARY**
Model improvement with tile pre-caching was implemented and documented, followed by a major decision on plugin compatibility with TAK UI, and a discussion regarding the `.mil` tag signing blocker.

Model Improvement and Pre-caching: A holistic solution implemented pre-caching of all tiles at the optimum elevation when placing the GRG, which significantly improved performance and addressed potential cache misses. This optimization was agreed to be documented as a summary blurb in the development Slack channel.

TAK UI Compatibility Decision: The team decided to punt the critical decision regarding full TAK UI compatibility versus preserving existing plugin functionality back to SOCOM, as full integration requires completely reworking the entire plugin UX. Findings need to be summarized in a slide deck to illustrate trade-offs and effort, emphasizing that the current plugin cannot exist with TAK UI without significant UX changes.

`.mil` Tag Signing Blocker: Work on SDK `5.6` and `5.7` remains blocked because the "`.mil`tag" has not been signed off, preventing the release generation process. A pull request was created as a forcing function to try and move the signing process forward.

### DETAILS
**Model Improvement and Pre-caching Solution:** Kevan summarized a holistic solution implemented to address multiple, potentially unidentified, issues, including cache misses and memory issues, by pre-caching all tiles at the optimum elevation when placing the GRG. This optimization improved performance due to the up-front pre-caching. Zach agreed to document this as a summary blurb in the development Slack channel instead of a formal Word document (00:00:00).

**TAK UI Research Findings and Next Steps:** Abel asked for suggestions on how to demo or present the TAK UI research document. Kevan suggested preparing a high-level slide that includes a snapshot and summary of the full report to discuss with Nik, as there is a potential conflict regarding expectations of TAK UI compatibility. The team needs to be clear that the current plugin cannot exist in its current state with TAK UI without significant UX changes.

**Decision Point on TAK UI Compatibility**: The team discussed the critical decision of whether to preserve the existing plugin's functionality or attempt to go "full TAK UI," which would require significant UX changes and rediscovery of how to implement the features, Kevan noted that this is a decision point to potentially put back on SOCOM, given the team's preference for maintaining the existing plugin and its feature set. Abel emphasized the need to summarize findings into a slide deck to illustrate the trade-offs, risks, and effort involved, especially noting that being fully TAK UI native would require completely reworking the entire UX of the plugin.

**`.mil` Tag Signing and Release Generation Issue:** The discussion shifted to the SDK `5.7` stability verification, noting that the "`.mil` tag" is still not signed off, preventing work on both `5.6` and `5.7`. Kevan created a pull request as a forcing function to try and move the process forward, suggesting Nik might be able to apply pressure on the issue. Thomas expressed concern that no other repos or projects seem to be using that specific release part of the job or pipeline, Abel suggesting we might be the "guinea pigs".

**Current Sprint Work Stream Definition:** Abel outlined the work streams for the current sprint, including finishing the update to SDK `5.7`, performing regression acceptance testing on `5.6` and `5.7` (once the `.mil` tag is signed), and starting "peacemeal" TAK UI development. Kevan clarified that the SDK update is largely complete; the focus should be on verifying the `5.4 `and `5.6` mil plugins built off their pipeline and wrapping up the model improvements related to pre-caching. They confirmed that developer infrastructure and plugin housekeeping tasks are complete and should be included in the sprint report.

**Tiles Building Detection Blockage:** Zach reported being blocked on the tiles building detection work because they were having difficulty loading the necessary branch onto their system. The specific branch, referenced by Josh, was not found locally or remotely, and master was not pushing the expected changes. Zach is waiting for a response from Josh to resolve the issue.

**Resolving Application Loading Issue:** Abel sought assistance with getting the application to show up in Android studio for loading the plugin. Thomas identified that they needed to rerun the install scripts, specifically the command `./gradlew installCivDebug`. The command failed, and Zach noted this was a known issue with Gradle, which they had encountered when trying different versions (00:19:25).

**Java SDK and Demo Recording Plans:** Thomas suggested that the Gradle issue might be related to using the wrong Java SDK version, as terminals sometimes default back to an incorrect version. Zach confirmed they were on Java `17.0.0`. The team aligned on recording a demo, which is expected by the stakeholders, possibly showing bug fixes and successful building detection after repeated runs. Thomas agreed to act as a backup to set up the app on `5.6` and screen record the demo if needed.

**Mases Krikorian's Access Status:** Mases confirmed that their TAK account was approved, meaning they can start doing real work, though they still need to get accounting set up and acquire a charge code. Mases needs to be added as a developer to the code repositories on TAK Forge, which only Kevan Mordan currently has the access to do.

# TAK Demo Prep 1530-1700 April 7th

### Summary
Technical discussions focused on KMZ and mobile map caching, addressing inference fixes via sliding window, and determining a strategic shift for plugin development.

**KMZ and Caching Clarification**: Clarification was provided regarding KMZ files, which do not require tile caching because they are preloaded map overlays. The solution for poor inference results was implemented using a sliding window to capture max resolution at zoom level 19 or 20.

**Memory Profiling and Plugin Strategy:** The team decided to conduct memory profiling using a Java memory profiler, with Thomas Reynolds assisting, to investigate a potential memory leak. Kevan Mordan proposed a strategic shift to group the 23 disconnected plugins by domain and refactor their core functionalities into reusable libraries.

**AIGRG and Pipeline Issues**: The corrected bug in the AIGRG plugin, which involved caching tiles at a specific elevation, was successfully demonstrated detecting 44 buildings while zoomed out. Joshua Miller committed to investigating the unstable pipeline and release issues, which are preventing the internal build job from completing.

**KMZ vs. Mobile Map Caching:** The difference between using a KMZ file and a standard map for caching was clarified (00:00:00). KMZ files are already loaded and do not require tile caching because they are map overlays that already exist in storage. If a user switches to a map, they must cache the tiles (00:01:11) (00:06:18).

### DETAILS
**Resolution and Inference Fixes:** The team discussed the fix for poor inference results, which previously stemmed from condensing the image to 640x640. The solution implemented was using a sliding window to capture the max resolution at zoom level 19 (or 20) (00:01:11).

**Forcing Tile Caching:** The current solution for map usage involves forcing tile caching "under the hood" for mobile maps, which is better than forcing the camera to zoom to load the entire GRG. Although the process might seem slow, it ensures consistent detections when using map overlays, though sometimes the bitmap capture can occur before all tiles are fully cached, leading to blurry or discolored tiles (00:01:56).

**Sliding Window Implementation:** Kevan Mordan confirmed that the sliding window functionality, which was previously attempted without success, is now implemented (00:02:53). Joshua Miller confirmed the sliding window shifts partially to capture elements (like buildings) that might lie on the edge of tiles (00:03:41).

**Memory Leak Status and Profiling:** Joshua Miller reported that although the system is working great, they are unsure about the memory leak and suggested conducting memory profiling. The issue related to story 39, which concerned duplicate detection markers being added, is now resolved (00:04:27) (00:08:55). Thomas Reynolds was asked to assist with memory profiling using a Java memory profiler, which could involve running it in the app and having Claude analyze the resulting fire map to indicate any leaks (00:08:00).

**KMZ and Caching Dialogue Clarification:** Abel Hernandez confirmed their misunderstanding that KMZ files should show the caching process (00:05:18). Joshua Miller confirmed that KMZ files do not show the caching process because the image is already stored as a map overlay (00:06:18). This explained why Zachary Greenlief was not seeing the tile loading dialogue when using a KMZ (00:07:10).

**Device Memory Baseline:** The team discussed the memory specifications of the target devices, noting that the Galaxy S20 series features a minimum of eight gigs of RAM. Joshua Miller concluded that developing with six to eight gigs should be acceptable, as the previous development environment might have been too low (around two gigs), causing issues when loading models (00:11:20).

**Strategic Approach to Plugin Development:** Kevan Mordan proposed a strategic shift from individually enhancing 23 disconnected plugins to grouping them by domain (e.g., mission planning, fires) and refactoring their core functionalities into reusable libraries (00:15:25). They noted that the current plugins, such as Combat Swim and Combat Spot, lack coherence and require manual steps for data loading and setup (00:14:05) (00:20:35).

**Plugin Library vs. Standalone Plugin:** Kevan Mordan and Joshua Miller agreed that functionalities not requiring distinct, isolated user experience evolution should be implemented as libraries, rather than standalone plugins (00:21:33). They discussed creating high-level plugins (like a Mission Planner) that manage domain objects and relationships, which then call upon these underlying libraries (e.g., a swim planning algorithm) (00:20:35).

**GRG Plugin Feature Scope and TAK UI Transition:** Abel Hernandez confirmed that the immediate priority for the GRG plugin is bug fixing, not additional features. The next focus is incorporating as much native TAK UI as possible to rework non-TAK UI elements and create easier-to-test end-to-end workflows (00:23:25). Kevan Mordan expressed concern that the expected "full TAK UI" vision for the plugin might require a complete change to the plugin interface, suggesting the team needs clarification from Nick on whether they prefer preserving the current functionality or changing the plugin entirely for TAK UI compliance (00:25:03).

**Pipeline and Release Issues:** The team discussed ongoing issues with the pipelines, which are currently unstable and not building (00:26:03). Thomas Reynolds noted that the internal release job is failing due to issues like the Kubernetes cluster, preventing the build artifact from being copied to the package registry (00:26:45). Joshua Miller committed to investigating the pipeline issues, drawing from their recent experience with the third-party pipeline (00:27:48).
Plugin Loading Troubleshooting: Abel Hernandez encountered issues loading the plugin on their device (00:27:48). The problem was traced back to a Gradle issue and an incorrect SDK setting, which Zachary Greenlief and Thomas Reynolds helped resolve using SDK man (00:28:58). A subsequent failure was due to the device having the wrong ATAC version (5602) (00:30:48).

**Demo Recording Plan:** The team decided to use Google Meet or QuickTime for screen recording the demo. Abel Hernandez planned to voice over while Zachary Greenlief performed the demonstration and decided to proceed with the dry run immediately, postponing further device troubleshooting (00:31:44) (00:34:05).
AIGRG Plugin Demo of Bug Correction: Zachary Greenlief demonstrated the corrected bug related to elevation and building detection. The fix involves caching tiles at a specific elevation to ensure consistent imagery is provided to the model, resolving previous issues where zoomed-out images were too blurry. The demo successfully detected 44 buildings while zoomed out.

---
## TAK Release Glossary

**TAK Forge** — Government-hosted GitLab (`git.tak.gov`)
The government-hosted GitLab instance owned by USSOCOM/SOFMC. This is where the official CI/CD pipeline runs, where the signing service lives, and where builds get published. Rise8 pushes code here but does not control the infrastructure.

**Merge Request (MR)**
A formal request to merge code or metadata changes into a shared repository. Rise8 submits MRs in two contexts: (1) within our plugin and SDK repos when code is ready, and (2) to the TAK Plugin Master List repo when a release is ready for TPC to pick up. TPC engineers like Jared Hepp review and merge the Master List MR, which triggers the official build and signing pipeline.

**Pipeline Config**
The instructions that tell the automated build system what to do — which variants to build, where to send the output, and how to sign it. A misconfigured pipeline can produce the wrong variant or skip signing entirely. Rise8 owns this config on our side; TPC owns theirs.

**Keystore**
A secure file that holds the private keys used to sign a build. Think of it as the master key that the signing service uses to stamp the cert onto the APK. If the keystore path is wrong or the file is missing, the pipeline cannot sign the build at all. This was the original blocker earlier in the sprint — the keystore path was misconfigured on Rise8's side.

**Signing Service**
TPC's automated system that stamps a build with a certificate to prove it is legitimate and safe to install. ATAK checks this stamp before allowing a plugin to load. If the wrong cert is used, ATAK rejects the plugin entirely. Rise8 does not have access to this service — Brandon LaPorte at TPC owns it.

**Certificate (Cert)**
The digital stamp applied by the signing service. There are two kinds: a trusted production cert (what operators need) and an untrusted cert (used for testing or development). If a build comes back signed with the untrusted cert — as ours did this week — ATAK will display an error and refuse to load it. Rise8 does not own or control the certs; TPC does.

**Protected Branch**
A specific branch in the repo (e.g. `maintenance-5.6`) that is locked down and triggers the trusted signing cert when the pipeline runs from it. Running a pipeline from `master` produces an untrusted cert. TPC's signing service only issues the trusted cert when the build originates from a protected branch.

**Debug Build vs. Release Build**
A debug build is an unsigned development version used for internal testing — it loads on a device but is not distributable. A release build is signed and intended for official distribution. ATAK will flag a plugin as incompatible if a debug build is installed where a release build is expected.

**Build Variants (CIV and MIL)**
Every plugin build comes in two flavors: `.civ` for civilian use and `.mil` for military field deployment. Same code, different signing. Only the `.mil` variant can be distributed to SOCOM operators. The pipeline config controls which variants get produced.

**`.mil` APK** — Military-tagged Android Package Kit
The military-distribution version of the installable plugin file. Same code as `.civ`, different signing. Required for field deployment to operators downrange.

**Artifactory** — Build artifact storage
TAK Forge's storage system where built APKs live after the pipeline runs. Engineers and Abel pull builds from here for testing. Once a good signed .mil build is confirmed, Kevan sends Chad Molyet a direct link from here.

**PRR** — Plugin Release Request
Official web form on TAK Forge that initiates a plugin release. Submitting it auto-creates a Jira ticket. Required for every initial release and every update release. Without the ticket, Nik has no visibility into what is being delivered.

**TAKJenkins** — TAK automated build user
GitLab service account that must be added as a Reporter on Rise8's plugin repo before TPC's pipeline can access and build it. Prerequisite for PRR processing.

**MFR** — Memorandum for Release
Government-signed document defining distribution guidance for the plugin — who gets it (MIL/CIV/GOV) and under what conditions. Submitted alongside the PRR. Nik's side signs it, not Rise8.

**MOA / MOU** — Memorandum of Agreement / Memorandum of Understanding
Government-to-government document submitted by the Program Office to TAK Forge to authorize `.mil` APK pipeline configuration. Rise8 does not submit or control this.
---

## MY DAILY STAND UP + notes
[TUES-04_07_26]

- Thomas: what are his priorities
- KEVAN: 
* look at our sprint plan
* Cover, 
* Thomas run down this release
* release internal..
* figure out what is missing and what is failing?
* if we dont go where to go from here, the next one will be..
--> reach out to Mattermost, to the TAK UI people
-- Hey we are trying to migrate. help us.. 
--> they have to get the MFR singed
--> they dont know why the realease is failing
--> Thomas, focus on that.. 
--> Kevan will look at the plugins, how we want to evaluate those

SIDEBAR PATH TO PROD:
- message nate?

**Yesterday**
- pre-ipm kinda
- started reviewing backlog
- sync wth Josh and Zach
- created 3 issues

**Today**
- sync with Nizme, on format for drumbeat
- looked into the MFR/PRR .mil
- Is the tile loading fix (Zach's investigation) resolved or still open going into the demo?
- Are the two bug fixes (zoom and intermittent detection) confirmed stable, or still being validated?

> **QUESTIONS**
"Is the MFR the only document we need to submit with the PRR to unlock .mil builds — or is there a separate MOA or MOU required on top of that?"

"Who owns submitting the PRR — is that Kevan, or does one of the engineers handle it?"

"Before you head out Wednesday afternoon, Kevan — what do you need from me so the PRR doesn't stall while you're traveling?"

"Is there anything blocking the demo that I need to know about right now?"

**HELPS**
1. Ask Josh or Zach: "Can someone help me do a Gradle sync in Android Studio before the demo so I can mirror the device? Or can we pre-record the detection run today?"

2. Ask whoever recorded last time: "Who set up the screen recording for the April 8 demo — can we do the same?"

---
## Tuesday Afternoon — 1pm to 4pm
**Backlog, GOTS, and demo dry run**

**Abel owns**
- Review the GOTS shortlist (Trailblazer, Combat Swim, SpotPlot) — what does "evaluate" actually mean for each? Write down your questions before you talk to anyone
- Do a dry run of the demo deck out loud — you will find the gaps

**Abel delegates**
- Ask Zach: "Does your higher-level detection issue affect Wednesday's demo, or is that a separate track?"
- Ask whoever is recording: confirm the recording is done or scheduled

**Abel needs to know**
- Kevan's answer on MFR question (should be back by now)
- Zach's tile loading guarantee status — is it fixed, still open, or deprioritized for the demo?
---
## Kevan and Abel Huddle 1830

Our plug in cannot exit with TAK UI as it is today
1. do we go in on TAK UI? and scrap or plgu in?
2. or do we have a conversaiton with Nik, say.. Here is where we are at
set the ATAK functionaly, better user experience, we wil have this
and you need TAK UI support US.. as TAK UI gets better and suppoers our compoents

Assume NIK thinks is more mature.. 
our app is so incompatible.. we are gonna have to change a tonf of our
app, -- 
DEFAULT, Rebuilt our APP, 1 for 1 in TAK UI, and present Nik with this info.
Do you want us to stay this course and potentially interating on it in the same code base.. 
OR you want us to go all in and do new design
We give him that baseline..  there will be significant changes , all in on TAK UI.. 

What is our baseline? stripping every layer of 
FIRST STEP, get a single repo that is TAK UI compliant
SECOND Full TAK UI native
THIRD, get a "vector check" with Nik.. could start the collab with TAK UI folks
work.. with the TAK UI team feeding htem our 
TAK UI complianct
TAK UI native (work with TAK UI team)

TAK UI Compliant = our plug in is full compliant with TAK UI "where we can"
it looks like a TAK UI plug- in.. "scape patch" - "tak ui compliant" 
PATH to get from TAK UI Compliant = scrap it and make it TAK UI compliant, or 
TAK UI Native = 100% 

This sprint, "TAK UI "compliant" and work iwth BAH and Nate to plan the feature plath, how ot get to full TAK UI native..  -set follow up Nik

the other way,, SCRAP our Grid UX, that not idea.. more work.. THERE IS. GAP
we can change our stuff OR they can support it!

For this sprint, engage with the team! BAH, when will it be supported what does a multi plugin look like.. "

# POST DEMO: Release Status and Blockers

**Top Priority**
Plugin merged to master list. PRR open. Release pipeline failing on TAK Forge infrastructure. Not a Rise8 issue.
---
**Sequence**

1. **Jared Hepp (TPC):** Kubernetes cluster resource failure blocking the internal release job. Ticket open, actively being investigated. Rise8 is waiting.
2. **Kevan:** Once pipeline resolves, add Chad Molyet (SOCOM DT lead) to repo permissions so he can pull the build from Artifactory.
3. **Nik's side (Program Office):** MFR must be signed and submitted alongside the PRR before production distribution. Rise8 does not own, draft, or control this.
   - Who on Nik's side owns the MFR? Who drafts it, routes it for signature, and submits it?
   > 
   - Does J Hepp's existing MFR from the competition cover this release, or does a new one need to be signed?
   > thats not correct..
   > Memo for Record, signifies we are able to release the plug in and needs to be submited to the TAK Plugin Master Least
   - Does the MFR get attached to the PRR form at submission or sent separately?
   > we dont think so.. Kevan already had. 
   - Assumption to validate: MOA/MOU and MFR are two separate documents with separate owners and separate purposes.
4. **Chad Molyet (SOCOM DT):** Once build is accessible and MFR is in place, Chad handles the government-side process before operators receive the plugin.
   - What is "some paperwork" on Chad's side exactly, and is there a timeline?

**Assumptions to validate with Kevan or Nik**
- MOA/MOU and MFR are two separate documents with separate owners and separate purposes
- J Hepp's MFR commit may mean one already exists but is not confirmed to cover this release

## Enable .mil build variant in pipeline to unblock field deployment
> The plugin has two versions of every build: .civ for civilian use and .mil for military field deployment. Right now the pipeline only produces the .civ version by default. Operators in the field need the .mil version. This chore is about updating the pipeline config so it produces both, which is the prerequisite to getting a signed, field-ready build into the hands of SOCOM operators.

**Open questions before this can be closed:**
1. Once the config change is merged, does the pipeline automatically produce a signed .mil APK or does TPC need to do something on their end first?
   *We need to know if this is fully in our hands or if we are still waiting on someone else.*
   Assumed: Likely still requires TPC or Program Office action. Signing requires a certificate or key Rise8 probably does not own.

2. How do we verify the .mil build is actually signed correctly?
   *How do we confirm the output is actually field-ready before we hand it off.*
   Assumed: Install the .mil APK on a physical device and confirm it loads without a signing error. ATAK will reject unsigned or incorrectly signed plugins.

3. Who validates the output, Rise8 or TPC?
   *Who is responsible for saying "this is good to ship."*
   Assumed: Rise8 validates it installs and runs. TPC or Program Office validates the signing certificate is correct for distribution.

4. Brandon (TPC): Is there anything on TPC's side needed to enable .mil signing once our pipeline produces the build?
   *We want to make sure we are not blocked again the moment our fix is in.*
   Assumed: Almost certainly yes. .mil signing typically requires a government-managed certificate. TPC likely needs to configure that on their end.

---

# APRIL 8 SESSION RECAP

## What We Did This Session

**Demo Script (tak-demos.md)**
Built a full 6-part presentation script for the April 8 SOCOM demo. Natural, conversational, not word-for-word. Covers intro and agenda, schedule reference, Sprint 1 accomplishments, TAK UI discovery slide, demo intro and post-video recap, Sprint 2 WIP across 4 workstreams, GOTS hand-off to Kevan, PI planning forecast Sprints 2 through 4, and risks and mitigations.

**Customer Update Copy**
Drafted all four Sprint 1 accomplishment paragraphs and all four Sprint 2 WIP paragraphs. Stakeholder-facing, no jargon, no em dashes, 24-36 words each.

**Sprint Forecasts**
- Sprint 2: April 6 to April 19
- Sprint 3: April 20 to May 3, model improvements in prod, collecting operator feedback
- Sprint 4: May 4 to May 17, final deliverables, findings reports, contract closeout

**Cheat Sheets Built**
- GridTransformer: 500+ line class, direct memory access, must be ported exactly or grid breaks
- Tile Caching: pre-downloads and stores imagery locally, removes network dependency
- Sliding Window: breaks AOI into overlapping sections, runs detection at zoom level 19, no section missed

---

### TAK UI Strategy (Kevan and Abel Huddle, April 7)

**Step 1: TAK UI Compliant (this sprint)**
Single repo. Every plugin component is either direct TAK UI or a documented ATAK escape hatch. 80% will be escape hatches.

**Step 2: TAK UI Native (future)**
Full native requires complete UX rework. Decision for Nik and SOCOM. Rise8 presenting trade-offs at April 22 demo.

Nik introduced Rise8 to Kelly and Nathan at BAH (TAK UI team) post-demo. Abel sent intro email. Calendar invite pending to align on migration approach.

---

### Path to Production: Current Status (Post-Demo)

**Top Priority**
Plugin merged to master list. PRR open. Release pipeline failing on TAK Forge infrastructure. Not a Rise8 issue.

**Active Sequence**

1. **Jared Hepp (TPC):** Kubernetes cluster failure blocking internal release job. Ticket open, being investigated.
2. **Thomas Reynolds (Rise8):** Needs to implement one-line pipeline config change to add `variants: "civ mil"` to `assembleProduction` job. Josh identified the fix. Kevan asked Thomas to implement. Thomas not yet responded.
3. **Kevan:** Add Chad Molyet (SOCOM DT lead) to repo permissions once pipeline resolves.
4. **Nik's side (Program Office):** MFR must be signed and submitted alongside PRR before production distribution. Rise8 does not own this.
5. **Chad Molyet (SOCOM DT):** Receives build via Artifactory link, handles government-side process before operators receive the plugin.

Key clarification from Kevan: Goal is signed .mil builds for 5.4 and 5.6 only. Debug builds already exist. .civ artifact on master branch does not suffice.

Chore created: Enable .mil build variant in pipeline to unblock field deployment. Tracked in backlog. Open questions around TPC signing authority and validation still pending Brandon's response.

---

### Key People
- **Nik:** SOCOM lead, owns PRR visibility, SDK strategy, TAK UI direction, August offsite milestone
- **Chad Molyet:** SOCOM DT lead, receives signed build from Rise8 via Artifactory link
- **Jared Hepp (TPC):** Actively investigating pipeline failure
- **Brandon LaPorte (TPC):** Support engineer, looped in by Nik, actively engaged on .mil signing question
- **Nathan Bedell and Kelly (BAH):** TAK UI team, newly introduced by Nik post-demo
- **Josh:** Identified pipeline config fix for .mil variant
- **Thomas:** Assigned to implement the config fix, not yet confirmed
- **Kevan:** Tech lead, traveling Thursday and Friday, aware of all tracks

whats the plan..
MR josh
TAK master list
pipeline failuers
waitin on 
Josh will try to get ahead of it
The prechase is a MR (kevan asked if we finished)
us.rise8.atak.aigrg.plugin to us.rise8.atak.aigrg.plugin

---

Anthropic not releaing their mythose

key store file

[THURS-04_09_26]

**Yesterday**

**Today**

> **Blockers/Helps**


[MONDAY-04_06_26]
**Yesterday**
**Today**
* Pre-IPM --> Who needs to be there this time
    - Backlog Grooming
    - Outcomes in GitLab

* Start Prepping the Deck for Wednesday Demo & Sprint Planning (April 6 to 19th)
* GOTS Eval, start reviewing

--MAYBE--
* _update TAK Development process map_
* _organize bookmarks for TAK_
* _Setup THIS project directory and file structure_
* _Create SKILLS.md s_
* _connect MCPs_
> **Blockers/Helps**
* Norming on GitLab projects and repos
    - `git.tak.gov/rise8` vs `gitlab.gl.rise8.us/.../tak`
* Set up Android devices
* Still need to learn how to use the plug-in/app, Help me test it

ZACH
- set up env., higer level detections working. not working. trying somethin else today

KEVAN
- Camping, St. George 
- MRL added to the masterlist
-- Diff in docs, Confluence vs README in the repo
- Go over GOTS
- Kevan OUT, Weds afternoon thry Friday
- Comms, release.. and what people to use. 
- WIP, we need tight COMMS when we are actually productions ready

THOMAS
- Android device "up"
- PL "passcode" needs it
- Make use of ShipSummit, config for our repo

PRR --> 
MFR

[THURS-04_09_26]

**Yesterday**

**Today**
What happened overnight:
Josh fixed the Rise8-side config issues and the pipeline ran. Brandon (TPC) confirmed a signed .mil APK for 5.6 was produced. Abel validated on device — ATAK rejected it. Not officially signed. The cert is untrusted because the build did not run from a protected branch.

**What this means for you as PM:**
Still blocked, but the path is clear. 
One more step on the Rise8 side before this goes to Chad.

**What is left before operators have it:**
- Zach's plugin MR and the Master List MR get merged 
— Kevan owns the Master List merge
- Pipeline runs from a protected maintenance-X.Y branch — triggers the trusted cert
If cert is still wrong after that — Brandon investigates
- Once cert is confirmed good, Kevan sends Chad Molyet the Artifactory link
- Chad handles the government-side process before operators receive it
> **Blockers/Helps**
**RETRO**
runners are slow
they took forever to run
confused, frustrated
they time out after an hour
we have to deal with that.. 

Thomas check in GitLab, submitted PRR
Register our own Runners

[FRIDAY-04_10_26]

**Yesterday**

#### Plugin Release and .mil Signing
- Plugin merged to TAK Plugin Master List
- Pipeline ran and produced a signed .mil APK for 5.6
**Today**

> **Blockers/Helps**
#### Plugin Release and .mil Signing
* TPC's signing service used the wrong cert — Brandon is investigating, no ETA
* Rise8 pipeline config still producing CIV variants when it should not be — Thomas owns the fix

* Brandon to resolve the cert issue on TPC's end
* Thomas to clean up the CIV/MIL pipeline config

* [waiting] Kevan sending Chad Molyet the Artifactory link — can't happen until cert is confirmed good

STAND UP

Zach: he put in the MR, with all the changes..  pushed from his local to GIT, we should have everything, he has..

Thomas: Look into pipeline issues. we got everything figured out with what Josh posted today.

Thomas and Kevan.. inference running.. when it got t the end... tooltip.. one command shift, GRG.. AI

there is 1 GR8 left..

Sendover to Chad M..

Sendover to Chad M..

### DRUMBEAT
GOTS EVAL, Plan for Next Week
with Nik
Nizme questions
other user 
complance, risks and measures
path forward More SOCOM tailoeered effort
Plugin MOSA architecurre wirth Nik, charter our plant
for interoperability with SOCOM
ONLY TAK UI to BAH

### QUANTIFY
Abel, quantify the detection performance
slide window
QUANTIFY the DETECTION performance the Slide Window
performance boost
- how can I start?
> We have the old version vs the new app
Kevin.. "on device" not sync, 
Scrub them.. there is potential, 
collecting this data we gonna get secret real quick
1. device, sync to a server, how we get access and class levels.. 
- feedback loops on training the model, if we start getting info on core inferance
- user manual interactons
- THINK ABOUT IT

2. 

---

5.6 exactly? ATAK 5.6 did you run it..


--- 
TEMPLATE

[DAY-0x_xx_26]

**Yesterday**

**Today**

> **Blockers/Helps**
