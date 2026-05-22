
# CARRY FORWARD FROM WEEK 3 — Friday April 10 EOD

## Plugin Release — Where Things Stand

**What got resolved:**
- Brandon (TPC) identified the cert issue root cause: `aigrg.metadata.json` in the TAK Plugin Master List was on the wrong schema version (v4/v2 mix instead of v3). This is what caused ATAK to reject the signed .mil APK with an untrusted cert.
- Thomas submitted MR !627 "fix: fit aigrg metadata to v3 template" — Jared Hepp (TPC) reviewed, added corrections, and merged it April 10. Pipeline passed.
- Brandon confirmed: "a protected master branch will produce a trusted APK as long as the metadata is formatted." Cert issue is closed.
- ProGuard root cause identified and fixed (April 14, Josh). Manually-set CI/CD variables (`takrepo.user` and `takrepo.password`) were overriding the auto-injected pipeline credentials, blocking the connection to `takrepo` where the ProGuard mapping file lives. Josh removed the manually-set variables, the pipeline connected to `takrepo`, and the mapping was successfully pulled: `milRelease => Copied proguard mapping mapping-5.6.0.17.txt`. A secondary config mistake (wrong repo declaration) was also caught and fixed by Josh in the same session. This was a Rise8-side issue, not TPC.

**Pending confirmation — April 14:**
- Josh's fixes are in. Next pipeline run expected to produce a clean `assembleProduction` pass and a signed `.mil APK`. No confirmed passing build yet as of end of day April 13.

**Device validation — CONFIRMED April 15:**
- Plugin `.mil` APK loads and runs on device. Process confirmed working. See installation steps below.
- Note: ATAK CIV + DoD plugin is NOT the same as ATAK-MIL. Confirmed this week.

**Repo access:**
- Nik and Chad still need to be added to the `aigrg` repo on TAK Forge. Thomas does not have owner/admin access. Needs to go to Jared Hepp (TPC) or Kevan.

**What's left before the build reaches SOCOM:**
1. Pipeline passes clean — signed .mil APK confirmed (expected April 15)
2. Device validation confirmed on ATAK 5.6.0.16
3. Kevan sends Chad Molyet the Artifactory link (Nik cc'd)

---

## FOCUS FOR THE WEEK 4.13 to 4.17

1. **Submit our first enabling outcome:** Get the signed, field-deployable build to Nik and Chad and make sure we are setup to ship on a repeatable cadence without heavy dependence on TPC.

2. **Our first meeting with BAH on TAK UI migration:** Finish remaining workflow stories and align on a collaboration cadence with Nathan and Kelly (BAH).

3. **GOTS evaluation kickoff:** Work with Kevan to start reviewing Trailblazer, Combat Swim, and SpotPlot and align with SOCOM on what the deliverable looks like and what done means before the evaluation goes any further.

4. **Quantify sliding window performance:** Get a side-by-side comparison of old vs. new detection performance so the improvements are baselined for future metrics and feedback from the field.



--

## GOTS (Plugin) MOSA Evaluation takeaways

### SUMMARY
Recap and discussion on the Modular Open Systems Approach for SOCOM plugins, with a focus on defining the 5-week plan and necessary scope protection.

**SOCOM Plugin Vision Proposed**
A long-term vision was proposed for a Modular Open Systems Approach foundation for all SOCOM TAK plugins, moving away from isolated tools to shared components. Support for the concept was expressed, but with caution regarding the potential for excessive scope creep.

**Immediate Interoperability Focus Defined**
The immediate focus is on a workshop to address inconsistent schemas and repeated functionality across plugins to improve modularity and interoperability. Nisme requested explicit documentation of risk concerns and discoveries to inform SOCOM of the necessary trade-offs and efforts.

**5-Week Plan and Scope Protection**
Clarification is needed regarding the concrete 5-week plan, the number of plugins to be evaluated, and the final deliverable type. The 5-week scope must be protected and bounded, positioning the Modular Open Systems Approach vision as strategic input rather than a short-term commitment.

### DETAILS

**Recap of Plugin Evaluation Vision:** Based on the recent demo, Kevin proposed a long-term vision for a modular, interoperable foundation for all SOCOM's TAK plugins, moving away from isolated, siloed tools toward shared schemas, core libraries, and connected workflows. This approach is based on the MOSA (Modular Open Systems Approach) framework and is described as a vision for the future, not a deliverable for the immediate contract. Nik and JB expressed support for the concept but advised caution regarding the scope to prevent taking on too much work.

**Near-Term Focus and Workshop Plan:** The immediate focus will be on starting the conversation about making the plugins more modular and interoperable, possibly through a workshop. This involves addressing inconsistent schemas across plugins, repeated shared functionality that could be moved to core libraries, and reducing manual steps (00:04:01). Nisme requested documentation of risk concerns and discoveries to help SOCOM understand the required effort and trade-offs.

**Uncertainties and Need for Kevan Check-in:** There are several uncertainties that need clarification, including Kevan's concrete "five-week plan (what remains of the briege contract), the exact number and depth of plugins to be evaluated, and the nature of the five-week deliverable (e.g., a report, proposal, or prototype) (00:04:01). Abel needs to check in with him to understand the actual work plan for the next two weeks and beyond, and what guidance is needed from the product manager, including how to organize the work and what they need to put into the backlog, There's likely some Pre-IPM work there..

**Upcoming Milestones and Parallel Work:** The team needs to determine what will be presented to Nik at the demo on April 22nd, and identify any potential blockers or dependencies. The MOSA vision work seems to be a parallel track to the ongoing AI GRG and TAK UI migration, so the distribution of work needs to be decided.

**Product Management and Scope Protection:** Abel needs to ensure Nizme and Nik are kept up to date through regular communication (drumbeats and decks), maintaining transparency to avoid surprises. It is important to document risks and concerns separately from the regular updates, as Nizme requested this documentation explicitly. The remaining five-week scope must be protected, as the MOSA vision is an ideal state that exceeds what can be delivered in the short term, and must be positioned as strategic input for SOCOM rather than a delivery commitment.

### NEXT STEPS
1. Define Scope: Check in with Kevan to define the full 5-week plan. Determine which plugins are being evaluated and to what depth the team is going.
2. Seek Guidance: Understand specific needs from Kevan beyond adding items to the backlog. Receive guidance from him on how he wants to organize the work.
3. Divide Workload: Determine how to divide the work for the parallel AI GRG and TAK UI migration tracks.
4. Prepare for demo: Determine the content to present to Nik by the April 22nd demo time. Identify potential blockers or dependencies that are ahead.
5. Update Stakeholders: Ensure Nizme and Nik are up to date on findings. Share updates via drum beats and decks to maintain visibility and prevent surprises.
6. Document Risks: Document risks and concerns as requested by Nisme. Prepare this documentation potentially separate from the drumbeat materials.

---

## ACTION ITEMS — WEEK 4

**[Enabling Outcome 1] Rise8 Ships on a Repeatable Cadence**
> Rise8 shipped the AI GRG plugin to the field on a repeatable cadence, controlling the full release path without requiring TPC or SOFMC to guide execution.

- [x] Josh resolves ProGuard — `assembleProduction` passes *(gate, Josh owns)*
- [ ] Rise8 devices updated to ATAK-MIL 5.6.0.16 — device validation run *(Abel)*
- [ ] Repo access confirmed for Nik and Chad — Kevan or Jared Hepp *(Abel nudges Kevan)*
- [ ] Artifactory link sent to Chad Molyet, Nik cc'd *(Abel or Kevan)*
- [ ] Confirm PRR status with Kevan — MR route may be sufficient, but Nik's Jira visibility is unconfirmed *(Abel)*

---

**[Enabling Outcome 2] Rise8 Shifts from TAK UI Consumer to Contributor**
> Rise8 team shifted from TAK UI consumer to key contributor, increasing native component prioritization for TAK UI v1.0 release.
> Target Mission Impact: SOCOM ceased rebuilding platform-specific plugin versions, deploying the AI GRG once across WinTAK, TAKX, WebTAK, and OASIS.

- [ ] Prep BAH call — agenda, framing, key questions ready *(Abel)*
- [ ] Run first session with Nathan and Kelly — intro, share Stories 1-4 findings, lead with questions not a presentation *(Abel)*
- [ ] Flag priority native candidates to Nathan during call: floating toolbar, grid engine, SwipeRelabelManager *(Abel)*
- [ ] Leave call with agreed collaboration cadence *(Abel — outcome of call)*

*Post-call / feeds Pre-IPM and IPM planning:*
- [ ] Complete workflow Stories 5-8 *(Abel + team)*

---

**[Enabling Outcome 3 — DRAFT/WIP] Rise8 Establishes SOCOM/SOFMC Plugin Architecture Standards**
> Target Enabling Outcome: Rise8 team established a documented MOSA assessment across SOCOM's TAK plugin portfolio, giving `SOFMC the evidence base to direct plugin development toward shared architecture standards` rather than isolated vendor roadmaps.
> Target Mission Impact: Operators experienced more consistent, lower-friction workflows across TAK plugins as duplicated functionality collapsed into shared foundations — reducing manual steps and cognitive load in the field.

- [ ] Sync with Kevan — define 5-week plan, which plugins to evaluate (Trailblazer, Combat Swim, SpotPlot), to what depth, and what the deliverable looks like *(Abel — gate, do this first)*
- [ ] Align on April 22nd demo content for the GOTS track — what does Rise8 show? *(Abel + Kevan)*
- [ ] Divide workload across AI GRG, TAK UI migration, and GOTS tracks *(Abel + Kevan)*
- [ ] Begin structured plugin review — compliance risks, SOCOM fit, MOSA architecture *(Kevan + team)*
- [ ] Document risks and discoveries separately from drumbeat — Nisme requested this explicitly *(Abel)*
- [ ] Scope protect: frame MOSA vision as strategic input to SOCOM, not a contract deliverable *(Abel)*

---

**[Pre-IPM / Sprint 3 Planning]**

- [ ] TAK UI workflow Stories 5-8 drafted and ready for review *(feeds from EO2 post-call, Abel + team)*
- [ ] Sliding window performance side-by-side comparison ready *(eng deliverable, baseline for field metrics)*
- [ ] GOTS evaluation stories scoped with Kevan and ready for backlog *(feeds from Kevan sync)*
> 
- [ ] Full backlog reviewed and prioritized for Sprint 3 *(Abel + Kevan)*

---
*KEVAN 1145 sync*

- build not working (async)
- don't be afraid to ask for more comms from the devs
- articulate what problem is: ATAK uses "ProGuard" (shrinks code) its a library that "shrinks code" depedendecy with pipeline when it tries to. build our plugin , 
- Deck AI summaries, awareness, ton of context, feel confident to be noisey, 
- Add screenshots of the component

===
1. documentation website (TAK UI) tak.gov there is an issue, expeired 
TPC working

KELLY

1. cadence, Nizme, and 3 months PIs
2. PI planning (decides 2 week sprints)
3. RIGHT NOW in, Sprint 4, Ends end of MAY
NEXT JUNE 1st, plan what their gonna focus in the next 3 months
2 week increements

IN THE MIDDLE of their sprint

BAH is our primary delovoper for the 20 plugins that they have


WHAT DO YOU WANT THE COLLAB PROCESS? Do you want just a MR?
Nathan, any gub fix, 
Bug Fixes, No APIs --> just push me a merge request
NEW API --> shoot me an email
CHANGE API -->shoot me an email

Kevan asked for --

API stability Guide
NATHAN SAID TO SEND HIM OUR DOCUMENTATION
ACCESS TO THE REPO (Nathan)

Radial Menu (they do have it and exampes)
in the TAK UI Hellow world

They do NOT support nested Radial ATM
We missed,, THey are using OLD ATAK API for the 
radial menus.. TAK kernal?

MOVE towards new APIs (under the hood imp)

Kevan: 5.4 is the oldest version, we got more modern APIs

Kevan: Send us the PI planning, Roadmap of TAK UI delivery, over the next couple months.. (we can wait for you or find a way to collab)

Kelly: those plans are in progress, Nik do they have acces s to teh 
NIK --> give us access to the SOCOM roadmpa
THe goal they have with TAK UI (August ofsite) #1 thing with TAK UI is getting xCheck full done in TAK UI.. 

10 devekioers / 20 plugins

BEST WAY FORWARD, 
Nathan emails about feature implementaiton
Nathan comms
Send Screenshots of our stuff

Slack Channel - Kelly
TPC mattermost --> Nathan can create a private channel

SEND KELLY OUR AVAIALBILITY 

NATHEN - quick technical questions
How are we deploying

embeeded an SDK library (depeedncy)
"under the hood" running in python? embedded in ?
ONNX run time

Future Goal
- stuff running on multple platforms
- how do we deploy it across?
- 
----

### KEVAN/Nik - GOTS way forward

lack of inter-opera-bility

INNITIAL THOUGHT: Overall "breakout structure", decompose into different layers, looking through.. ATAK components, android

As it evolves and grows
you
MAKING THE FUNCTIONALITY and CODIFY IT "what is the mission" and how do we plan that mission?
THEN core capabolities to do that
- libraries (func, ect)

NIK --> "think how to implement" tought things, we dont own the CORE of TAK, TPC does. we have influence.. 

* googleplay = SAME CORE ENGINER, what changes, when we lead a "flavor plugin" cryptographic signed "you are now NO LONGER .civ. you are the .mil version of ATAK" and that allows us to load Military plugins. 

Kev "core", SOCUM TAK CORE, not TPC/ATAK
What is SOCOM TAK CORE, (same as other mil, we just use .mil) cap[atabolity across]

Nik, it's a double edge sword, how do we OPEN plugins, "weather" example.. ,y plugin for UAS should work.. :i am already getting winds?"

So when CORE breaks or changes, we can react fact
AI GRG

"I dont control CORE" we have a depeency..

Kev - we advocate for YOU TO CONTROL, SOCOM Core
multiple plugins, general.. common data libaries and "math"
push it in a way.. keeping an openess of the ecocysmesm and more tools
keeping the LEAN

AI GRG example, our inferance model (run building and do the labeling algo rhthms published SDK)

out of the box more inter-opera-ble

NIK: "TAK CORE" (what you download from Google play) they all the same without anu plugins, How? would it be another plugin, how do I make a ATAK .mil SOF 
KEV: No way TAK CORE, SOCOM ATAK Variaent (NOT NOW)
KEV: "Tak Forge just kills", if you build something for everyonw.. is for anyone, every thing is so brittle..  How

Nik: TAK is amazzing but any PM with "money", can make it.. "THATHER SOF" is my customer.. 

KEV:
- we can build
-- core libraries
> the amount of manual sycns, re-sharing.. "is killing me"
-- write a plugin, a library that lets devices sycns (COTS messages, CORE ATAK). put in "these hooks" so plugin are more interopable.

Build out libraries (mortar trajectory) anyone who needs to pull it in.. trajectory/return of the responce.. 
Devices "smartly" sync and share data = another Library
I want to build a way for a team to build an entire "loadout"

`takSync`

I like the vision -Nik
> SPOT PLOT is our most sensative plug (LATER)
> the amount of pushback "big army", you cant do that, every once ina. while people try to come after it.. We are adding Russian and Chinese mortars.. he is SENSATIVEY TO THIS TOOL
. BUT HE LIKES IT>

ATAK Callsing,, Abel , and Jonathat
WHY DO I HAVE TO SELECT

"SOF Libraries" SOF CORE, Yes!
on future efforts when that happens

Nik, if we can start TYING THINGS UP TOGETHER
"who is where" = Combat Powers
when we resecued the F15 pilot

RMF compliance.. 

Nathan is a one man show (TAK UI)

WinTAK and WinTaK-x and WebTAK
across every single software we deliver

WinTAK spport life cycle
TAX-x has not met our baseline reqs


===


PM read: our code is ready. The pipeline environment TPC controls is missing something our build needs. It's their yard, their fix.

What's left before this chore closes:

1. TPC resolves the ProGuard mapping issue
or give us access to the iamges 
2. `assembleProduction` passes — signed `.mi`l APK produced
3. Rise8 validates the APK installs on ATAK-MIL `5.6.0.16`
4. Kevan sends Chad Molyet the Artifactory link


1. request an account
2. Mases might have a version

# PRE IPM - 4.13 3PM

### Summary
Workflow review and performance testing were prioritized alongside several technical issue resolutions regarding build blocking and tile loading.

**Review User Story Workflows:** The team must refine the 4 remaining end-to-end user story workflows before discussing prioritization with B&H stakeholders. The side-by-side comparison to quantify the sliding window approach performance will require building the older version from a previous commit.

**Technical Issues and Blocks:** The Prog Guard issue is blocking package obfuscation for the production build, and progress depends on TPC resolving the mapping or granting access. The investigation into the memory leak during building detection, which appears to be a temporary allocation, will now be picked up.

**Gray Tiles and SDK Version:** The gray tiles issue is mostly fixed, and a toast notification was implemented to prompt users to rerun the scan if tiles fail to load after 3 attempts. The team agreed to stay on SDK version 5.6 until the production-ready build is complete, consolidating redundant verification tickets.

### Next steps
- [Abel,Jonathan] Document Workflows: Collaborate on the remaining 4 end-to-end user story workflows; understand and document processes.
- [Abel] Create Plugin Ticket: Create a blanket ticket to track plugin evaluation efforts in the sprint.
- [The-group] **Schedule Plugin Sync:** Arrange a meeting to synchronize on details from Niks conversation about plugin evaluation.
- [Zach] Investigate Leak: Pick up the prioritized task investigating the memory leak during building detection process.
- [Abel,Jonathan] **Build Old Version:** Pair to check out a previous commit; build the old version of the app for side-by-side performance comparison.
- [Thomas] **Track ProGuard Issue:** Monitor the TPC ticket submitted regarding the ProGuard mapping configuration issue.
- [Abel] **Update Ticket Status:** Remove Josh as assignee from the SDK 5.6 upgrade ticket; move the ticket to prioritized status.
- [Abel-Johnathan-Thomas] **Review Gray Tiles UX**: Pair to run through the corrected gray tiles functionality; evaluate the new toast message UI and UX.
- [Thomas] Request Script Snippet: ConTAKt TPC/Brandon to request a screenshot or snippet of the ProGuard script dependency installation configuration.
- [Jonathan] Request TAKge Access: ConTAKt Jamie Keys regarding the US person form; fill out and submit the necessary documentation for TAKge access.
- [Kevan] Provide Device: Give Jonathan of the extra physical devices needed for testing.

### DETAIL

**Review of End-to-End User Story Workflows:** The team will review and refine the documented end-to-end user story workflows, which were initially developed by Abe, Thomas, and Claude. These four remaining workflows must be assessed and documented to ensure accuracy before discussing prioritization with B\&H stakeholders. Abe plans to work with Jonathan on understanding these workflows, particularly because Abe is still learning to use the plugin.

**Plugin Evaluation Strategy:** Kevan suggested creating a blanket 'evaluate plug-in' ticket to track the plugin evaluation effort. Following this, the team should schedule a follow-up meeting with John and Kevan to discuss the plan developed with Nik and determine how to track subsequent tasks, potentially using subtasks or sub-issues. The discussion about the plugin evaluation will be deferred so Jonathan is not immediately overwhelmed upon their return.

**Investigation of Memory Leak:** The ticket for investigating a memory leak during building detection, where a background process might not be closing correctly, is currently prioritized. Zach noted they have not yet looked into the issue, as it appears to be a temporary allocation of resources rather than an actual memory leak, and they focused on solving other problems. Zach committed to picking up the memory leak investigation now that they have reached a stopping point on other work.

**Side-by-Side Comparison for Sliding Window Approach:** The team plans to conduct a side-by-side comparison to quantify the performance of the sliding window approach versus the older version, addressing a question raised during a demo. Abel will collaborate with Jonathan on this task, which will involve building the older version from a previous commit, requiring a reinstallation of a-tech. This pairing will help Abe gain experience with the application and catch Jonathan up on the work.

**Status of Prog Guard Issue and Next Steps:** The issue with Prog Guard is causing a blocker, as the obfuscation of packages for the production build is not being correctly picked up in the config file. Thomas has submitted a ticket and is TAKged as the primary owner for tracking this issue, which currently blocks checking the mail. The team concluded that progress on this item is dependent on TPC resolving the Prog Guard mapping issue or granting access to the necessary images so the team can fix it themselves.

**SDK Version and Consolidation of Tickets:** The team agreed that they are currently on SDK version 5.6 and will wait to bump to 5.7 until the production-ready 5.6 build is sorted out. They also decided to consolidate multiple duplicate tickets related to verifying the 5.6 mail build. It was determined that a single checkbox on the `upgrade to 5.6` ticket is sufficient for tracking the required mail verification.

**Status of Gray Tiles Issue:** The issue with gray tiles not loading seems mostly fixed, though a few edge cases remain. Zach implemented a toast notification that informs the user if one or more tiles may not have loaded properly, suggesting they may want to rerun the scan, which occurs after the system attempts to fetch the tile three times. Abe and Jonathan will pair to review the user experience of the new toast notification system, as suggested by Thomas.

**Access to TAK Forge and US Person Form:** Jonathan needs access to TAK Forge, which may require filling out a US Person form that needs to be signed. It was noted that Jamie Keys, who works with Wayland, previously created a version of this form with the required header and signature. Kevan confirmed they have the necessary extra devices for Jonathan.

**TAK UI Repository Access:** Kevan asked Thomas R and Zach to confirm they have access to the TAK UI repository. While Thomas confirmed they are in the repo, Zach stated that they did not initially see the repository in the projects section but later gained access via a direct link. The team will begin to become TAK UI contributors, anticipating the necessity of working with the repository.


# BAH/TAK UI recap

### Summary
Workflow agreement established contribution process and weekly touchpoint via Mattermost for collaboration, with alignment on TAK UI native solutions.

Establish Workflow and Contribution: Participants agreed on a user story workflow and contribution process, allowing bug fixes via direct merge requests while requiring email for API changes and new feature requests. A closed Mattermost channel was established for asynchronous collaboration, with email designated for broader communications and announcements.

Align Strategy and Development: Mutual alignment was reached on Rise A being an active contributor to TAK UI, addressing the current strain on Nathan’s bandwidth. The teams agreed that while the 20/80 'escape hatch' situation is a current reality, the goal is to transition toward 100% TAK UI native solutions. The development of a native floating toolbar for the X check plugin is currently underway.

Address Risks and Gaps: Several risks were acknowledged, including the docs.TAKac.gov website being down due to an expired certificate, which prevents engineers from accessing vital documentation. Known gaps were noted, specifically the absence of a formal TAK UI roadmap and the lack of support for nested radio menus.

### Next steps
[Abel] Send Email: Draft and send recap email to NISME NMEUSCOM.
[Abe] Send Availability: Forward Abel and team availability details to Kelly.
[Kelly] Create Meeting: Schedule 30-minute weekly touch point meeting using shared availability.
[Abe] Share Documentation: Share documentation links with Nathan and Kelly.
[Abe] Share Workflow: Share user story workflow table details with Nathan and Kelly.
[Abe] Share Repo: Share Joshs discovery repo link with Nathan for workflow implementation review.
[Abe] Send Screenshots: Send floating toolbar screenshots to Nathan as reference for his current sprint implementation.
[Nathan] Create Channel: Create closed TAK UI dev channel on Mattermost.
[Abe] Send Invitees: Send Nathan a list of names to include in the Mattermost channel.
[Abe] Certificate Follow Up: Follow up on docs.TAK.gov expired certificate issue resolution.

### Details
Decisions Made Regarding Workflow and Contributions: Abe presented a proposed user story workflow-based approach that was well-received by Nathan and Kelly of BAH. They agreed on a contribution process where bug fixes can be submitted via a direct merge request, but any API changes or new feature requests require emailing Nathan first. They also established communication channels, planning to create a closed Mattermost channel for asynchronous collaboration and defaulting to email for broader communications, announcements, and requests (00:00:00).

Scheduled Weekly Touchpoint: Kelly and Abe agreed to establish a 30-minute weekly touch point to be used as needed. Abe committed to sending Kelly their availability and the team's availability so that they can schedule the meeting (00:00:00).

Alignment on Collaboration and Strategy: Mutual alignment was reached on four items, including the agreement that Rise A is a collaborator with TAKUI. Nik clarified that Rise A's role would be as active contributors to TAK UI, not just consumers, which addresses the fact that Nathan is currently operating as a "one-man show". There was mutual agreement that the current 20/80 "escape hatch" situation is a reality, but the goal is to transition toward 100% TAK UI native solutions over time (00:01:47).

Native Floating Toolbar Development: The conversation identified that the floating toolbar example is already being worked on by BAH to be TAK UI native. This development is part of their current sprint and will be utilized for the X check plugin, which was identified as an opportunity to derisk and improve the TAK UI approach versus relying on an escape hatch (00:01:47).

Acknowledged Risks and Documentation Issues: Several risks were called out, including the fact that the docs.TAKac.gov website is currently down due to an expired certificate, which is preventing engineers from accessing TAK UI documentation and API stability guides. Another key constraint noted is Nathan's bandwidth, as BAH currently has 10 developers spread across 20 plugins (00:03:15).

Gaps in Planning and Feature Support: Both Nik and Kelly acknowledged that the absence of a formal TAK UI roadmap makes proactively aligning priorities difficult. This highlights the importance of the newly established asynchronous communication channels, such as Mattermost and email. Additionally, nested radio menus are not currently supported in TAK UI and have been flagged as a known gap (00:03:15).
Open Questions on AI Model Deployment: There is an open question regarding cross-platform deployment for AI models as migration expands beyond tech. They are currently using Onyx runtime for this purpose (00:03:15).

Follow-up Tasks and Information Sharing: Abe has several follow-up tasks, including sending Kelly the team's availability for the 30-minute sync and sharing links to their documentation with Nathan and Kelly. Abe also committed to sharing the user story workflow table and Josh's discovery repo link with Nathan, who requested access to review how workflows are being implemented (00:04:52).
Coordination of Floating Toolbar Screenshots and Mattermost Channel: The team needs to send floating toolbar screenshots to Nathan to serve as a reference for the current sprint implementation, a task that JVD can assist with. Nathan is creating a closed TAK UI dev Mattermost channel, and Abe needs to send Nathan a list of whom to include in the channel and confirm the channel's creation. Abe also needs to follow up on the docs.TAK.gov certificate issue (00:04:52).

## April 14 - Tuesday Daily Standup and .mil install support

### Summary
Team members updated individual progress with branch cleanup and pipeline testing, clarifying roles for TAK UI collaboration with Nathan and resolving ATAK installation issues for acceptance testing.

**Collaborations and Standup Blockers**
A meeting recap was sent to SoftCom for the Booz Allen (BAH) collaboration, and a 30-minute meeting is scheduled to determine focus areas. Assistance was needed for building and acceptance testing due to an ATAK version issue, blocking story reviews.

**TAK UI Contribution Strategy**
Nik did not explicitly state the team were TAK UI contributors, but the expectation is for them to begin contributing to establish precedence and practice. The team will establish criteria for current stories before approaching Nathan to discuss moving forward with native TAK UI tasks.

**Technical Debugging and ATAK Setup**
Debugging of the ProGuard issue involves running builds from Josh's pipeline to check logcat and pulling changes to test for inadvertent resolution of coroutines issues. The correct mill setup for ATAK was confirmed after fully uninstalling, downloading the correct civil core and military flavor plugins, and installing the DoD flavor plugin for mill certification.

### ACTIONS
- [Zach] Update Coroutines: Clean up current branch; push changes for Coroutines. Pull Joshs changes into branch; check if ProGuard issue resolves.
- [Thomas] Test Pipeline Builds: Test builds from Joshs pipeline; debug breaking issues found during testing. Ensure maintenance pipelines run correctly.
- [Thomas,Abel] Resolve ATAK Version: Thomas will assist Abel troubleshooting ATAK versioning issues after standup.
- [Jonathan,Kevan] Status Meeting: Meet to get a download of current work status.
[Abel,Jonathan] Plan Stories: Review stories; identify research spikes needed before consulting Nathan.

### DETAILS

**Upcoming Collaboration and Standup Plans:** Abel mentioned sending out a meeting recap to SOFMC for a collaboration with Booz Allen, confirming an upcoming 30-minute meeting is on the calendar, with the goal of determining their focus for that meeting before the end of the current week. Abel also noted needing assistance after the standup because they were blocked on building and performing acceptance testing due to a potential issue with their ATAK version, which was preventing them from pairing with Jonathan to review stories.

**Individual Task Updates and Branch Cleanup:** Zach stated they would clean up their branch, push changes for the coroutines, and investigate 11 related issues, hoping some were resolved by a fix Josh implemented concerning ProGuard and coroutines. Thomas committed to testing builds from Josh's pipeline to identify working and breaking components, with a focus on debugging and eventually ensuring the other maintenance pipelines are working correctly.

**Offer of Technical Assistance for Versioning:** Thomas offered to stay on after the standup to help Abel with ATAK versioning and related issues.

**Clarification of TAK UI Contributor Role:** Abel sought clarification on whether Nik explicitly designated their team as TAK UI contributors during a previous call. Both Zach and Thomas agreed that Nik did not state this explicitly; Zach thought it was implied that they could assist with native functionality if needed for their primary work on GRG, while Thomas recalled Nathan saying they were open to the idea.

**Strategy for TAK UI Collaboration and Story Assessment:** Abel explained the need to establish criteria for their current stories, which currently resemble spikes, before approaching Nathan. The strategy is to ask Nathan about moving forward with native TAK UI tasks like the floating toolbar button and grid placement, acknowledging that some features (like the floating toolbar) might already be in Nathan's sprint.

**Clarification on Bridge Contract Development Scope:** A discussion ensued regarding the extent of TAK UI development expected during the current bridge contract. Kevan clarified their understanding that Nik wants them to begin contributing to TAK UI, not necessarily to complete all stories but to "start knocking some of these out" to establish precedence and practice, including working through a style guide and collaborating with Nathan on new functionality updates.

**Identifying and Debugging the ProGuard Issue:** Kevan inquired about the plan for identifying the ProGuard issue. Thomas confirmed they would run builds from Josh's pipeline and check logcat, and later in the day they planned to focus on testing the build. Zach noted they would pull Josh's changes into their branch to see if the coroutines and ProGuard issues were inadvertently resolved, following a suggestion from Claude to let ProGuard know to keep the Kotlin co-routine class.
> Abel's takes: This is related to testing our .mil plugin and apparently a blocker that I need to understand better and get timelines and determine potential escalation. This is blocking us from being in prod!

**Installation and Testing Setup for ATAK — CONFIRMED WORKING April 15:**

Abel confirmed the `.mil` plugin loads and runs on device. The working install sequence is:

**Step 1 — Get ATAK-MIL APKs from tak.gov**
Go to https://tak.gov/products/atak-mil and download both:
- CORE: `ATAK-5.7.03-ACCFF30D2-CIV-RELEASE.APK` (351 MB)
- MIL flavor plugin: `ATAK-SYSTEMPLUGIN-FLAVORPLUGIN-5.7.03-ACCF30D2-5.7.0-MIL-RELEASE.APK` (14.5 MB)

**Step 2 — Install ATAK-MIL on device via Android Studio**
Drag and drop both APKs into Android Studio. Follow prompts and accept settings. CORE first, then MIL flavor plugin. This gives you a `.mil`-certified ATAK environment.

**Step 3 — Get the plugin APK from the pipeline**
Go to the successful `assembleProduction` pipeline run on TAK Forge. Download the `artifacts.zip`. Unzip it. Inside the `app` folder is the plugin APK: `Rise8-ATAK-GRG-Plugin-1.0-40c6868-5.6.0-mil-debug.apk`.

**Step 4 — Install the plugin**
Drag and drop the plugin APK into Android Studio. ATAK loads it and the plugin is usable.

> Abel's takes: This is related to a couple of pressing issues — one is establishing our TAK Dev process and all related steps. It's also the steps to have the ATAK ecosystem working for any TAK plugin. These exact steps need to be written up as acceptance criteria and a chore so the whole team has a repeatable setup process documented.

**Testing Scope and Methodology Clarification:** Thomas advised Abel that for their purposes, they should focus on testing the `.mil`  build from their master branch, while developers test locally, then the civil `(.civ)` build from their branch, and finally the `.mil`  build once merged. This clarification helped Abel understand that focusing on the `.mil`  version for acceptance testing was the appropriate mental model moving forward.
> Abel's takes, also part of our TAK dev process, testing phase! These steps need to be broken down into accepTAKe criteria for all relevant user stories and chores.

**Next Steps and Team Focus:** Abel planned to review stories with Jonathan and conduct further research before approaching Nathan regarding available features versus planned work. Thomas and Zach confirmed they would work separately on similar items, with Thomas focusing on testing the remaining tickets to close them out.


# Weds, April 15 - Dailt Stand Up + One Month Extentions

### SUMMARY
Contract bridge extension negotiations progressed with finalized justification language, while the team addressed Progard and memory leak issues with focused debugging strategies.

**Contract Extension Justification Finalized**
The contract extension negotiation progressed with an agreement to simplify line items and focus the TAKUI contributions on creating a prioritized roadmap for AI GRG plugin requirements. The team finalized the extension email language, including model improvements, SDK development from 5.6 to 5.7, and GOTS evaluations.

**Progard and Memory Leak Strategy**
A strategy was set to address concurrent Progard and memory leak issues, with one team member focusing on the Progard bug that breaks the local development environment. The team decided to create a general Progard bug ticket with individual sub-tasks for better data capture and exploratory work.

**Granular User Workflow Documentation**
A new, more granular version of user workflows was developed to incorporate specific UI components and screenshots, which will function as a consolidated decision tracker. This new document will likely replace the existing inventory sheet and the user workflow Google document to streamline information.

### NEXT STEP
[Kevan] Review Proposal: Provide feedback on the shared draft contract extension document.
[Abel, Jonathan] Finalize User Stories: Collaborate with Jonathan to finish remaining TAK UI user stories.
[Kevan] Send Draft Email: Send the draft extension email to Abel and Jonathan for review before official submission. Commit to being more communicative in the group chat channels.
[Thomas] Resolve ProGuard Issue: Continue investigating the ProGuard issue for local and production builds. Attempt to set up Joshs self-signed APK environment for faster debugging. Move the ProGuard chore item to In Progress.
[Thomas] Post Status Update: Post an end-of-day status summary so Josh knows where to pick up work.
[Zach] Address Memory Leak: Rebase local changes onto the new main branch. Push changes related to the memory leak fix through the protected branch pipeline. Verify the fix and create a merge request.
[Abel] Send Proposal: Finalize the contract extension proposal document details. Send the completed proposal out within 15 minutes.

### DETAILS

**Introduction and Personal Updates:** Abel noted they were seeking a tax extension, which was facilitated with information provided by Claude. Zach mentioned their taxes were easy this year due to military W2s but anticipate complications next year with a new job and starting a business, which includes a planned Kickstarter for pre-orders.

**Contract Bridge Extension and User Stories:** Abel reported on a call with NISME at SOCOM regarding an extension for the bridge contract, noting that materials needed to be sent to them that morning after receiving feedback from Kevan. Abel and Jonathan met to review user stories to prepare them for team discussion.

**Progard Issue and Debugging:** Abel initiated a thread with Josh and the team to address Progard issues, relaying Josh’s suggestion to use a self-signed APK for easier debugging. Abel also reported running into a bug, noting that the detection being off seems consistent with issues Zach and others have been calling out.

**User Workflow Documentation and Decision Tracking:** Jonathan detailed their work on a more granular version of user workflows, which incorporates specific UI components and screenshots and will function as a decision tracker. This new document will likely replace the inventory sheet and the user workflow Google document to avoid confusing the team, integrating workflows, UI decisions, and links to development stories.

**Confirming Direction with Nik:** Kevan planned to send a draft email to Nik, which Kevan will share with Abel and Jonathan for review, to provide more concrete details and confirm the desired direction for the contract. Kevan suggested simplifying line items for the contract extension, such as "do more GOTS" or "57," and providing detailed justification only if requested.

**Communication and Status Updates:** Kevan requested that the team increase communication in the chat to provide tighter awareness of ongoing activities, especially for team members like Josh, who may pick up work later in the day. Thomas committed to posting a status update at the end of the day to ensure Josh knows where to pick up work.

**Addressing Progard Issues and Memory Leaks:** Thomas is focusing on the Progard issue, including attempting to set up Josh's self-signed environment for easier debugging. Zach plans to return to the memory leak issue, pushing changes to a protected branch, and submitting a merge request to verify the changes. Both Thomas and Zach agreed to TAKkle their respective issues concurrently, as the memory leak is likely related to the overall Progard issues.

**Clarifying Progard and Memory Leak Tracks:** Zach clarified that there are two separate issues: Thomas is handling the Progard issue breaking the local development environment, while Zach is working on the memory leak to improve the actual final product. Thomas confirmed that they are working to make the build load properly and detect buildings, while Zach is focusing on improvements beyond that, such as fixing memory leaks that would occur even if the build was working.

**Prioritized Development Tasks:** Abel assigned Thomas to address the Progard bug and to time-box the effort of setting up Josh's self-signed APK version 5.5 for debugging. Zach is continuing work on the memory leak task.

**New Bug Report on Deletion Text:** Abel reported a new bug where, after running a detection and deleting a section, the text says "remove untitled item" instead of "remove section A," which consistently occurred after running a detection. Both Thomas and Kevan expressed doubt that this specific issue is Progard-related, but the bug remains in the backlog for future investigation.

**Team Norms and Communication:** Abel noted the lack of established team norms and suggested discussing communication improvements during the upcoming retro, expressing a preference against implementing mandatory stand-downs. Kevan suggested creating a general Progard bug ticket with individual sub-tasks for focused exploratory work, which was accepted as a good idea for better data capture and communication.

### SIDEBAR ISSUE
**Reviewing Contract Extension Justifications (TAK UI):** Abel and Kevan reviewed the contract extension language, agreeing to keep the theme aligned with the original task of "research and software development". For the TAKUI contributions, the goal is to focus research with the TAKUI maintainer team to create a prioritized roadmap for capability development to meet AI GRG plugin requirements.

**Reviewing Contract Extension Justifications (SDK and Plugin Evaluation):** They modified the SDK update to include "continue development from 5.6 to 5.7" to show the planned progression. For the plugin evaluation, they agreed to rephrase it as continuing evaluation beyond the initial assessment, including modularity, scalability, and interoperability, to identify gaps and patterns across the ecosystem.

**Finalizing Extension Email:** Abel committed to cleaning up the bullets, aligning them with the contract sections, and having Claude draft the final email within 15 minutes. Kevan indicated that the final justifications were acceptable, including the inclusion of model improvements and GOTS evaluations.

## One Month Extension - Roadmap Pre-draft APRIL 14
### we try to stay in line with the themes of the task (bullets) research and software development, research framing, not changing what was in the original SOW, sub-bullets that can include active development by us)

1. Maintain Active Compatibility Support for ATAK Versions 5.4 and 5.6
- Continue development against version 5.7
- Monitor upcoming ATAK releases and prepare for upgrade, testing, and delivery
- Incorporate field operator feedback into plugin improvements

2. TAK UI Contributions and Migration
- Collaborate with the TAK UI maintainer team to develop a prioritized roadmap for TAK UI capabilities required by the AI GRG plugin
- Provide greater granularity on cost and timeline estimates based on actual development effort
- Conduct research on TAK UI development

3. Model and Plugin Improvements Based on Operator Feedback
- Iterate on model and plugin improvements based on operator feedback, and assess capacity for new feature requests and refinements
- Assess the scope and effort required to codify a repeatable model training pipeline

4. Plugin (GOTS) Evaluation
- Continue evaluating the broader plugin portfolio beyond the initial assessment — including modularity, scalability, and interoperability — identifying gaps and patterns across SOFMC/SOCOM
- Workshop the MOSA baseline with Nik, moving from observations to actionable recommendations documented as agreed-upon baseline findings
- Synthesize findings from the portfolio evaluation and MOSA workshops into an initial working draft of what a shared core library and schema standard could look like for the plugin ecosystem



---

### Path to Prod "The problem & next steps" - April 15, Weds

**BROKEN**
"Our .mil release build is either crashing or building detection is not working. 
**WHY**
We believe it's a ProGuard issue — ProGuard is a tool that automatically shrinks and protects our code when we build for release, and it's shrinking code it shouldn't be touching. 
**BLOCKED**
Until this is resolved, field deployment is blocked and Kevan cannot send Chad Molyet the Artifactory link. 
**WHAT WE ARE DOING**
Josh packaged a local debug environment for Zach and Thomas 
— SDK, signing certs, and a setup script 
— and they are working through it this morning using an iterative build and fix process. Josh is available this afternoon as backup.

### Path to Prod "The problem & Next Steps - April 16, Thurs

**What's broken**
The signed `.mil` release build loads on device but building detection is severely degraded — detecting 2 buildings where we expect 22-24. The plugin appears to work but is not operationally useful.
**Why**
ProGuard is over-aggressively obfuscating the ONNX runtime libraries that power the detection model. Josh flagged this risk last night ("reflection for prefs is surely failing") but didn't catch the detection failure because his run-through wasn't a full detection test against a known image.
**Blocker**
We cannot send Chad Molyet the Artifactory link until detection works correctly. Sending a broken build to the field is worse than not sending anything.
**What we're doing**
Going back to Josh with a concrete number: 2 detections vs 22-24 expected on a known image. He needs to add ProGuard "keep" rules for the ONNX runtime classes so they survive the release build. This is a targeted, known fix — not a mystery.
**What done looks like**
Install `assembleProduction` from a fresh pipeline run, run detection against the same image, confirm 22+ buildings detected. Then Kevan sends the Artifactory link to Chad.

# Thursday April 16 - Abel and JVD Demo Prep and Planning

Summary
Meeting focused on aligning demo strategy for Wednesday and refining the process for TAK UI contributions.

Wednesday demo strategy finalized
Participants agreed to demonstrate building detection improvements using a side-by-side comparison. This strategy frames the model improvement hypothesis around reduced operator labeling time.

TAK UI integration roadmap
The team established a plan to recommend valuable components for the TAK UI framework. They will prioritize engineering validation for these contributions.

### Next steps
- [Jonathan] Draft Model Outcome: Develop a starting statement defining the model improvement outcome.
- [Abel Hernandez] Request Plugin Version: Request developers deliver a version showing detection differences by Monday. This is necessary for demo preparation.
- [Abel Hernandez] Schedule Dual Setup: Grab time with Zach to set up dual plugin versions for side-by-side comparison capability. Invite Jonathan to this session.

- [Abel Hernandez] Schedule TAK UI Triage: Schedule pre-IPM sessions with engineers to triage user stories and discuss TAK UI components. Ensure Kevin is involved in contribution talks.

Details
Demo Strategy for Wednesday: Abel Hernandez and Jonathan agreed that the Wednesday demo should focus on presenting a comparison between building detections before and after implementing caching tiles and the sliding window approach. They acknowledged that tying the metric updates to a specific outcome related to model improvement would be more impactful for the audience. The comparison is intended to provide a quantifiable reference for the operators regarding the improvements in the production version of the application (00:01:10).

**Model Improvement Outcome Hypothesis:** The discussion addressed the need for a hypothesis regarding the model improvement outcome, which Abel Hernandez had not yet developed because of uncertainty regarding the post-mission feedback loop (00:02:19). Jonathan suggested a starting point for a model improvement outcome that could be formed based on the prototype experience, arguing that improved models should reduce the time and energy operators spend fixing labels during missions, directly impacting the AI workflow's value (00:03:25). They agreed to frame the demo around this hypothesis since current testing involves short feedback loops, making a hypothesis appropriate (00:04:32).

**Definition of Demo Readiness:** Abel Hernandez requires a working version of the application that shows the improved building detection for the side-by-side comparison by Monday to prepare adequately for the Wednesday demo. Jonathan advised making this requirement a clear request to the development team, noting that waiting past Monday would make preparation difficult (00:07:35). The challenge is securing an application version (specifically the "civ version" that avoids the code shrinking process) where building detection is functional, as the current signed APK ("mil version") has poor detection (00:06:40).

**Next Demo Segment:** User Stories and TAK UI Development: The second part of the demo for Wednesday will involve presenting the completed user stories and determining which two to four stories will proceed to TAK UI development or "escape hatches" (00:08:33). Jonathan's understanding, supported by a conversation with Kevin, is that an "escape hatch" means leaving the existing implementation as it is, without implementing TAK UI. The most critical element is identifying where TAK UI implementation must begin (00:09:55).

**Strategy for TAK UI Contribution:** Abel Hernandez and Jonathan discussed the strategy for contributing to the TAK UI framework, which is owned by BAH, the contractor (00:15:09). They determined that they should start by making recommendations for components that could be valuable to other plugins and that BAH is not imminently planning to implement (00:12:30). The process involves getting conceptual agreement from BAH first, then planning the contribution with Nisme and the team within the established guidelines (00:15:09).

**Source of TAK UI Component Information:** Jonathan asked how to determine what components are currently available in TAK UI to aid in the decision-making process (00:18:20). Abel Hernandez indicated that the source of information for TAK UI components is likely the TAK UI repository or documentation, which is accessible via TAK Forge (00:19:37). Jonathan noted that they need access to TAK Forge and had messaged Jamie about access (00:20:24).

**Setting Up the Side-by-Side Comparison:** Abel Hernandez identified the need for an engineer, specifically Zach, to assist in setting up a system to load and unload different versions of the plug-in to facilitate the side-by-side performance comparison. Abel Hernandez aims to learn how to toggle between the current improved version and the older prototype version, which Jonathan confirmed they possess, without relying on the development team (00:21:34). This setup is crucial for establishing benchmarks and planning the model improvement hypothesis for the demo (00:22:44).

**Defining the Role of the User Story Spreadsheet:** Abel Hernandez clarified that the user story spreadsheet is intended to drive discussions and serve as a reference point for aligning on plans, rather than being the primary development working document (00:22:44). Jonathan agreed, suggesting the sheet should also be used to track decisions, such as confirming which stories will proceed with TAK UI implementation (00:24:16).

**Integrating Engineering Input on TAK UI Decisions:** Abel Hernandez expressed anxiety about closing the loop on UI/UX decisions without involving engineers, as the data analysis performed by the Claude agent requires engineering confirmation (00:25:39). The planned approach is to meet engineers halfway with evidence from the repository and the user value stream map, allowing them to validate the information and guide decisions (00:28:12). Jonathan proposed the next step is to align with the engineers on the strategy, which involves determining if they will start TAK UI development on components deemed possible and researching any unknowns (00:29:16) (00:31:51).

**Collaboration Strategy with Engineers:** Abel Hernandez, Jonathan, and the engineering team will hold pre-IPM-style sessions to triage user stories and clarify the next steps (00:33:49) (00:36:16). The specific questions for the development team are: whether they are comfortable implementing the possible TAK UI pieces and if any components or patterns from the stories should be proposed for contribution to BAH's TAK UI framework. Abel Hernandez committed to involving Kevin in the TAK UI contribution discussions because of their strong opinions about TAK UI and the broader vision for the OTAA contract (00:34:51) (00:37:18).


Go to the Rise8 intance

- https://git.tak.gov/rise8/rise8-atak-grg-plugin.git = TAK FORGE

- git@git.gl.rise8.us:rise8-all/delivery/engagements/socom/grg-plugin/rise8-atak-grg-plugin.git = Rise8 Install

script atak deploy = 

./scripts/deploy_atak.sh = get ATAK in emualtor
./gradlew :app:installCivDebug  = installs our plug in (civ debug) 

[4.14_THURSDAY]

- KEVAN: repo that's sstarting to do 'context mapping' of SOCOM , used for GOTS evaluation to show how plugins are related
- ALL HANDS ON DECK for testing? 
- Kevan walk through what he built with John, 
- He made some agents that represent Nizme, Chad, etc.. SKILLS.md
-  Kevan has some agents SKILL.md 
> **GO BACK** is this repo? project?  (a beta version) "collecting plugin ecosystem across the board"

>- JONATHAN , UI inventory and workflows, DEMO prep, what story are we telling

>-ZACH: memory leak issues fixed, he is gonna verify it also works with proguard, if it breaks, is a ncessary loss to get something out // proguard has a problem with coupernites, 
>-THOMAS: Test Johs's build, He will look into the building detectoon issues, 
- 



## JOSH MEETING - APRIL 15 1715

- it's not the mapping it self, whatever we are not finding is prob a condition of something we did wrong..
- Thomas did way too much.. misunderstood the problem..
- without their mapping on Proguard NOTHING will work
- where are we? the .civ release is running? locally, Thomas.. YES
- Josh proguard-gradle.txt, serviceControl kept failing
- Thomas out package and the ATAK map package (Thomas assumed were important)
= Josh we have to supress the "mprnings?",
- josh adding "keep class" to proguard-gradle

RELEASE and NOT have func breaks, and keep an eye on our patterns, to know we need to update Proguard rules, when we add additional stuff, otherwise is gonna keep breaking

ONNX run time before. he added X, were only detecting 3 or 4 building..the only diff btween the debug and the release is proguard, theres prob classes in there that are causing the issue, ONNX runtime is using x libraries.. -- 

- ATAK map, they dont have zoom level 19 times..
- NAIP USGS NIP+ map

if the KMZ detection is working as we are expecting, we are in a solid place (as far as concern proguard)

local civ release first.. 
then build it for the ,mil 
proguard is what we have to solve, not the map caching

--
# Abel and Zach .mil detection debugging and other image tile loading issues

Summary
Initial plugin installation and detection testing uncovered critical issues with incorrect APK usage, leading to low-fidelity imagery and detection failures.

Plugin Installation and Errors
Initial plugin installation confirmed visibility of the floating menu, but detection tests resulted in a big red blob error, which was not the expected issue. A lack of a countdown was explained as normal behavior when the device is offline and using only local files.

APK and Offline Connectivity Issues
It was confirmed that the wrong APK was being used, causing the plugin to use a white canvas backup image and leading to incorrect detections of 2 buildings. The application's inability to run effectively on local files due to zooming to level 19 with low-resolution tiles was identified as the main issue.

Low Fidelity Impacts Detection
Detection tests using local files confirmed that lower-fidelity imagery directly impacts detection accuracy, finding only 43 buildings instead of the expected 86 in low-fidelity areas. The model requires a hardcoded zoom level of 19 to have good data, which is often unavailable when offline.


Next steps
[Zachary Greenlief] Fix Plugin: Fix the previously added code change. Ensure successful functionality related to offline behavior.
[Zachary Greenlief] Query Claude: Ask Claude why the ATAK application is not connecting to the server. Investigate the network connectivity issue.
[Zachary Greenlief] ConTAKt Tom: Reach out to Tom regarding the ongoing mill side issue. Dig into the technical problem together.
[Abel Hernandez] Finish Testing: Complete the end to end application testing.


Details
Initial Plugin Installation and Verification: Abel Hernandez worked on installing a new plugin and addressing a bug, noting the need to clear content, maps, and images via the plugin menu. They verified the plugin loaded successfully and were preparing to test it, noting that they were already screen recording for documentation purposes. The floating menu of the plugin was visible, but Abel Hernandez was unsure how to clear a persistent grid that contained numbers.
Initial Detection Testing and Review of Errors: Abel Hernandez dropped a grid in an area with buildings to run detection and observed a "big red blob," suggesting an issue not related to a previous error. Zachary Greenlief noted they had an idea about the problem. Abel Hernandez asked why they were not seeing a countdown, and Zachary Greenlief explained that a countdown does not occur when the device is offline because it only uses local files and does not need to cache them.
Validating New APK and Previous Issues: Abel Hernandez confirmed that they had been using the wrong APK, an older version that utilized "reflectionbased code," which they and Zachary Greenlief discussed, though the term's meaning was unclear to them. The wrong APK was causing the plugin to use a white canvas backup image when the TIFF file conversion failed, leading to incorrect detections of two buildings.
Discussion on APK Source and Tunnel Vision: Abel Hernandez asked why the APK they retrieved from the pipeline builds was the wrong one, expressing confusion about their process. Zachary Greenlief suggested that focusing too narrowly on a specific problem (tunnel vision), such as the imaging issue, can obscure the root cause. Zachary Greenlief noted that the application was set to use local files instead of online resources, which was the actual imaging issue.
Connecting to Server and Offline Status: Zachary Greenlief indicated that the current actual issue is that the application will not run effectively on local files because it zooms in to level 19, which only provides low-resolution, high-altitude imagery. They agreed that they need to communicate with Jonathan to change the current message from a toast notification to an actual warning, such as a popup, to inform the user that they are offline and tiles are not being grabbed (00:06:55).
Acknowledging Development Ecosystem Challenges: Abel Hernandez and Zachary Greenlief acknowledged that the issues are complex, stemming from an ecosystem of interrelated problems, rather than a single person's fault. Abel Hernandez shared that they are battling to learn not only the application and the plugin development process but also the entire ecosystem and domain (00:00:06).
Scenario: Offline Operation and Zoom Levels: Zachary Greenlief outlined a user scenario where an operator is offline but has local files, explaining that when the application tries to zoom to the required level 19 (approximately 500 ft above ground), it might only have a lower-fidelity tile available (e.g., 3,000 ft). This causes the application to zoom into the low-fidelity tile, leading to reduced image quality and detection failures (00:01:58) (00:04:10).
Recreating the Offline Toast Message Bug: Zachary Greenlief demonstrated that when they placed the grid down on the map, a toast popped up immediately saying "imagery cached and ready," which is incorrect because the error is that the device is not online and cannot fetch tiles (00:10:34). Abel Hernandez realized that while their phone was connected to Wi-Fi, the application itself was not connected to a server, confirming Zachary Greenlief's earlier point (00:11:43).
Implications of Operator Assumptions and Connectivity: Zachary Greenlief stated that the operator assumes they are connected to the TAKtical server, but they are not (00:13:56). This led to a discussion about whether the team needs to implement a warning for offline status or if they should adopt a quick fix by restricting plugin use when offline (00:13:03).
Local File Detections and Fidelity Issues: Zachary Greenlief ran a detection test on a map using local files and found 86 buildings, which was correct, but noted that the detection would break if the imagery was fuzzy (00:16:08). When testing on an area with lower fidelity, the detection found only 43 buildings, demonstrating that the images were not of a high enough fidelity for accurate detection, despite the map source being local (00:26:17).
Map Source, Caching, and Hardcoded Zoom Level: The base map image used was the ATAK image, and if using a KMZ file, it would run and find a similar number of buildings due to being an already cached image (00:28:54). Zachary Greenlief reiterated that when the map source is local, it only has the tiles cached before the user went offline, and the required zoom level for the model to have good data is hardcoded to level 19 (00:31:39).
Local Device Testing and Caching Behavior: Zachary Greenlief initiated a demonstration on a local build to show the experience when a user is offline, starting with an established KMZ file to confirm expected behavior. During this process, they observed that an image that was initially clear started showing signs of caching, which complicated the attempt to replicate an issue related to being offline (00:37:05). The initial confusion arose because a feature that was expected to be local seemed to be caching, making it unclear whether the original issue was due to being offline (00:38:25).
Prioritizing Application End-to-End Verification: Abel Hernandez stated that while the current issue is important, their priority is to verify the application end-to-end. They committed to letting Zachary Greenlief continue working on the current technical issue while they focused on end-to-end testing. Abel Hernandez acknowledged that both participants are figuring out real-time issues and suggested that reviewing documentation on how bugs are written would be helpful for articulating findings (00:39:48).
Providing a Bug Reporting Template and Next Steps: Abel Hernandez provided Zachary Greenlief with a bug template structure to help articulate findings, whether they indicate a bug, an edge case, or a need for improved user communication. The discussion centered on whether the application's behavior when local versus online is a bug or if the communication to the user about their ability to recover and troubleshoot needs improvement (00:41:20) (00:43:44). Zachary Greenlief agreed with the assessment and planned to take a lunch break to reset, and then reach out to Tom to collaboratively investigate the issue, especially since it impacts the mill side (00:42:44).
Confirming the Mill Release Status and UX Iteration: Abel Hernandez confirmed that the mill release AP is ready to go, and the current work involves iterating on user experience and bugs (00:42:44). The provided template is intended to assist Zachary Greenlief in articulating findings as either a bug or a user experience suggestion, which helps Abel Hernandez communicate findings to the wider team. Both speakers expressed appreciation for each other's patience, and the meeting concluded with Abel Hernandez moving on to finish end-to-end testing (00:43:44).

## SLACK HUDDLE 6pm Josh and Zach
Zach first assumed the issue was from being online vs offline
but the TIFF issue...
TIFF 
on or off line
if the tiff fails, 
because we are off line
or if there's an other issue that could be fixed in the TIFF
Zach for whatever reason when using the mil, we FAIL to gen the TIFF
so, when it fails, he wants to now  why it fails, thought it was functioning..  offline because there is no access to tiles
.civ release offline works proper
ERROR during capture "buffer isn't large enough"

Kevan, did we introduce this bug?
Zach: he is not sure.. whats happening.. its just me(abel) and zach devices

---

# Initial TAK Brainstorm, Abel was abscent from this call Friday, April 17

**Summary**
Meeting discussions aligned on transitioning toward domain-based project ownership and integrating cohesive system architectures for future tasks.

Domain Ownership and Structure
Proposed a shift from individual plugin management to domain-based ownership. This model categorizes operations into mission and Command and Control domains to ensure streamlined functionality.

Current System Architecture Analysis
Analysis of existing repositories identified significant inconsistencies in plugin implementations and data handling. This review serves as a foundation for unifying disparate system components and workflows.

Strategy and Future Vision
Decided to develop a compelling mission narrative supported by user interface mockups. This vision will guide initial task orders and mitigate risks associated with the current fragmented system.

**Next steps**
[Kevan] ConTAKt Mike: See if Shaunas friend Mike can join a discussion regarding the ATAK pitch.
[Kevan] Push Project: Push the current context workspace to a repository. Send the repository link to Jonathan.
> Abel's Take: Make sure you also get this link


**DETAILS**
**Project Context and Contract Overview:** Kevan provided context for the project, noting that the current OTA (Other Transaction Agreement) is intentionally vague because specific task orders will be awarded under it, positioning it as an IDIQ (Indefinite Delivery, Indefinite Quantity) contract where they are the sole awardee. They have begun capturing information on key personnel, including the program manager, Chad M, and have recorded initial notes and interactions. Kevan is working to build up project context for reference (00:01:11).
> Abel's takes: So this "project context" is different than the actual model dream state, this is more internal to rise8 getting customer insights and improving our positionin?

**Domain Ownership Proposal for Mission Applications:** Kevan proposed a "dream state" model where ownership is assigned by domain instead of by individual plugin to manage mission applications. These mission apps are described as plugins that operators use in the field, such as AIGRG. The goal is for a single team to manage all mission applications within their assigned domain, determining what should be a plugin, or what should be on mobile versus desktop.
> Abel's takes: 

**Classification of Domains:** Kevan outlined the proposed domains, which are based on a list received from Nik, but with some modifications. They removed a "miscellaneous" category, merging much of its content into "core," and separated "C2" (Command and Control) from "mission" due to the volume of content in both. C2 focuses on TAKtical-level observability, team status synchronization, and message issuing, while mission focuses on planning and setting up for mission execution.
> Abel's takes: So currently we have designated w mission domains? that all plugins should fall under; Core, C2(command and control), need to confir if there are 2 main/top categories

**Differentiation Between C2 and Mission Domains:** The mission domain is defined as encompassing all activities related to building a mission package, including planning tasks like GRG construction and route planning. C2 is primarily concerned with actual TAKtical command and control, focusing on real-time decision-making and communication during a mission. Kevan acknowledged that this categorization is a "first hack" and will require a workshop for refinement.
> Abel's takes: Ok, just answer my question.

**Plugin and Library Distinction:** Kevan established a distinction between plugins, which provide actual user functionality and interaction, and libraries, which are core functionalities supporting the plugins. For example, AI GRG is a plugin, while the AI SDK (Software Development Kit) model is considered a library, to help structure the analysis against MOSA (Modular Open Systems Approach) requirements.
> Abel's takes: Important for me to know the differnece between just a library, that can be used across plugins, vs an actual plugin.. As he said an an example is the AI SKD, that's the library the AI GRG uses. 

**Analysis of Current State Repositories:** Kevan is using Claude to analyze the `Combat Swim` and `Trailblazer` repositories provided, generating overviews that include supported user workflows, current architecture, communication patterns, dependencies, and a MOSA assessment. Claude is also extracting all data entities used by the plugins, such as `combat swim leg route`, to understand their schemas. The tool also extracts COT (Cursor on Target) messages, which are the actual messages plugins send throughout the ATAK ecosystem for map rendering.
> Abel's takes: Confirm with Kevan is "COT" is the same as when I heard comments that "they are trying to get rid of COTS"

**Inconsistencies in Current Plugin Implementations:** The current state analysis revealed that different plugins, such as `Combat Swim` and `Trailblazer`, are defining similar concepts, like routes and waypoints, in their own custom, bespoke ways without interoperability. This isolation extends to the plugin workflows and dependencies, highlighting a lack of connection between the components. Kevan emphasized that the analysis also pulls out all external dependencies, like data sources and services, required by the plugins.
> Abel's takes: Basically a DDD, Event Storm with Claude. Great work. This should inform the picture.

**Tool Use and Strategy for Domain Ownership:** Jonathan expressed that the analysis is a valuable alternative to extensive discovery research and workshopping. Kevan intends for the analysis to function as a "giant context work pad" for the team, primarily focused on shaping the OTAA and subsequent task orders. The initial pitch is to move towards domain ownership rather than plugin-by-plugin ownership, a concept Jonathan aligns with due to the current mess of disparate plugins (00:12:42).
> Abel's takes: This is VERY important and relates to what Jonathan and I spoke about, that we must ensure Kevan continiues to involve design and product into the "dream state", "big picture" strategy for this domain(s).. Kevan did acknowledge that this initial discovery mostly driven by him and Claude (single player mode) is more of "giant context work pad", to be leverate by the balanced team

**Vision for a Coherent System (The "Dream"):** Kevan outlined a vision for an integrated system where team information and equipment loadout sync automatically across devices. This system would allow one person to plan a mission and create GRGs (Graphic Reference Guides), which would then automatically sync to all team members, along with necessary data sources like map images. This integrated approach would allow for dynamic mission changes, such as adjusting routes based on hostile COT messages, and ensure consistency across functionalities like "no-go zones".
> Abel's takes: As a PM this sound interesting and I need to keep an eye on this. Obviously there's lots of assumptions, unknowns baked in..

**Strategy for Navigating Political Risks and Task Orders:** Kevan believes there is internal support for moving away from the existing TPC (TAK Product Center) structure among their immediate stakeholders, but acknowledges broader political risk between TPC and TAK funding. The strategy is to achieve alignment on the desired end state with SOCOM (Special Operations Command) and work with them to navigate political risks. Kevan aims to discuss this vision with Nik next week to influence the drafting of initial task orders, which are needed soon, as Nik is the primary person for all TAK-related plugins.
> Abel's takes: I need to keep this in mind for this upcoming weeks, Post April 20. ensure product is present. check in with Kevan.

**Initial Scoping and Long-Term Architecture Needs:** Kevan identified three areas for initial exploratory scoping: Operational Enclave Management, and a Tiered Digital Architecture for Common Services. The `Operational Enclave Management (OEM)` involves managing updates and maintaining awareness for hundreds of TAK server instances across various environments. The `long-term architecture for common services (CO-ARCH)` aims to replace isolated capabilities, like custom servers for route planning, with `a common API layer (CO-API)` that provides tiered service access to all domain teams.
> So, OEM and CO-ARCH and CO-API, my acronyms by the way.. This is starting to get into enabling outcome terroritory, and that narrative and picture need to be painted. More ideally, the current state.. VSM?

**Need for a Compelling Narrative and UI Mockups:** Jonathan emphasized the need to frame the vision by clearly articulating the risk of continuing with the current fragmented system, which includes UX risk, situational awareness risk, and ultimately, mission risk. Kevan agreed that a dream end state needs to be developed with full UI mockups and a compelling workflow narrative that demonstrates a holistic mission planning and execution process. They aim to have this vision ready during the bridge contract to support the initial task orders (00:33:46).
> Abel's takes: What is the actual date for this? When they want to have this ready. I think here is a great opportunity for us to "plant the seeds" for a current state definition, via VSM and then also VSM the ideal/dream state.. There is lots of mission outcome opportunities here.

**Sharing Project Data and Future Work:** Kevan confirmed they will push the current project context and analysis to a repository and share it with Jonathan so they can begin workshopping the concepts. This initial work on underlying connections, models, and integration paths can start now, even while remaining compliant with TPC. 
> Abel's takes: I need access to this, and we should set up that 30 mins recurring TAK Product Strategy/Vision sync between Kevan, Jonathan (JVD) and me.


---

## PM STATUS — APRIL 16 MORNING

**What's broken**
The signed `.mil` release build loads on device but building detection is severely degraded — detecting 2 buildings where we expect 22-24. The plugin appears to work but is not operationally useful.

**Why**
ProGuard is over-aggressively obfuscating the ONNX runtime libraries that power the detection model. Josh flagged this risk last night ("reflection for prefs is surely failing") but didn't catch the detection failure because his run-through wasn't a full detection test against a known image.

**Blocker**
We cannot send Chad Molyet the Artifactory link until detection works correctly. Sending a broken build to the field is worse than not sending anything.

**What we're doing**
Going back to Josh with a concrete number: 2 detections vs 22-24 expected on a known image. He needs to add ProGuard "keep" rules for the ONNX runtime classes so they survive the release build. This is a targeted, known fix — not a mystery.

**What done looks like**
Install `assembleProduction` from a fresh pipeline run, run detection against the same image, confirm 22+ buildings detected. Then Kevan sends the Artifactory link to Chad.

## PM STATUS — Friday, APRIL 17th MORNING

**What's broken / What's the current issue**
Abel's device was detecting only 2 buildings vs the expected 22-24. Thomas and Zach confirmed detection works correctly on their devices.

**Why**
Abel had the wrong APK installed — an older version still using reflection-based code that Josh had already replaced. When TIFF conversion failed on that build, the plugin sent a backup image (white canvas with red text) to the ONNX model, which detected the letter shapes as buildings.

**Blocker**
No systemic blocker. The build on main is working. Abel needs to install the correct APK: `Rise8-ATAK-GRG-Plugin-1.0-fc1f248-5.6.0-mil-release.apk` and clear all content/maps first.

**What we're doing**
- Abel installing the correct APK and validating detection on device
- Zach adding a toast notification for offline/no TAK network users, then submitting MR
- Josh and Kevan opened a side conversation on plugin versioning strategy (currently stuck at 1.0 with no semantic versioning)
- Open question to Josh: can the TIFF conversion failure happen to operators in the field, or was it isolated to the wrong APK?

**What done looks like**
Abel confirms 22+ buildings detected on the correct build. Zach's MR merges. Kevan sends the Artifactory link to Chad Molyet with Nik cc'd.

[4.17_APRIL]

> "Before we send Chad the Artifactory link — what does done look like and who owns each piece? I want to make sure we're all testing the same thing.

* **_YESTERDAY_**

* **_TODAY_**
- Install the correct APK Josh gave you
- Validate detection on device
- Draft the drumbeat
- Set up side-by-side comparison for demo prep

(((`BLOCKERS_HELPS`]]]
* a

>>GO BACKS & TEAM ISSUES
- Confirm the team knows we're unblocked on the signed .mil APK
- `IMPORTANT`: who is testing what and what does "done" look like before this goes to Chad? WE NEED an itemized list out of this conversation, not assumptions
- Float the idea of a formal release checklist — that's worth a chore ticket via /tak-issuedrafting

END TO END PROCESS
- master
- maintenance 5.4 and 5.6
> we have 3 separate pipelines

PAIRING WITH ZACH 11am - April 17..

User is out in the field NO INTERNET, but has their file local
- Zoom level 19 (is in there by default)
- 19 is significant is because is the level we use
- given the closes til

the image we have locally is at "Zoom 19" = 500 feet
if those tiles arent local, and the next local tile is 3000 feet , we are just zooming into that 3000 foot tile to a 500 foot zoom rate

pre-caching wasnt breaking. 
The root cause

local files are clean

> file is local, fuzzy

imagery cached and ready 

- 43 buildings labeled, there is atleast more
"based tak image"

`FIRST` BECAUSE when you are map source is LOCAL it only has the tiles that are cached BEFORE you went offline, 
you dont have the right ZOOM LEVEL (19 hardcoded) to grab those tiles.

* normally we pre-cache

`SECOND` Cache Image



`THIRD` TIFF Fails, doesnt tell you


### team updates
[eng]
- KEV: "Dream Sheets" 
- THOMAS: Release OUT, APK, full run through, latest build, try to get that release through, send tha tover to chat and nik..
- ZACH: changes in, MR and will look on what's next
- 
[Design]
- JON: x

---

# DEMO PREP - 

1. Outcomes framing for the SOW tasks workstream

2. DEMO Improvements/Optimizations -->  `Latest MONDAY EVENING`
- experiment (hypothesis) during GRG creation, reL model improvements
- experiment (hypothesis) post mission, ref model improvements

3. TAK UI effort `RISK: waiting for THEIR PI Planning? `
> Communicste to BAH first
- prioritized stories, 
- Next steps
-- What Nathan said
-- Escape Hatch
-- TAK UI Development

> Who owns TAK UI migration, front-

"start developing on TAK UI on all the "Yeses"

SPECIFIC ASK, - are we starting TAK UI native dev?
ANOTHER ASK to Collab, "are we instested in contributing elements"
poll the tea, elements, worth contributing.. discussion.











---///daily stand up, start///
## DAILY STAND-UP: 4.13 to 4.17

[4.15_APRIL]

* **_YESTERDAY_**

* **_TODAY_**

(((`BLOCKERS_HELPS`]]]
* a
* b
* c

>>Go Backs
- a
- b
- c

### team updates
[eng]
- KEVAN: close the loop with Nik, convo with Monday, more concrete details. 
draft email for me and John to review, (GOTS Eval)
- SIMPLE ONES up-front, we can provide more details
"line items" if they need more justication, we can provide more.. IF WE DROP MORE, Own up to.. more communicative in chat. Tigher comms
- THOMAS: Continue looking at the proguard issue, gonna try to get Josh's self sign, get that working..  Should have posted a status. (own up to it)
- ZACH, Go back the memory leak --> proguard related?
- Thomas
- We think they are, Proguard depencies as are being phiscated.. , code routines

TWO ISSUES

- azach thogh he brke it in civ, broke our local env. this is sepaare
- not working 
THomas is doing the dev size
- zach i doing is the memory leak
- thomas is doing the proguard, but it extends beyond local, its in local and prod builds.. SHORT answer, YES it makes sense to work them separate. what Thomas is doong is getting the build, it works.loads into ATAK
ZACH works on IMPROVING beyond that.

[design]
- 
- e
- f

[others]
- g
- h
- i



---///daily stand up, end///

[4.14_TUESDAY]

## Plugin Release Pipeline — What It Took

**The Build Ran But ATAK Rejected It**
The build ran and produced a signed APK, but ATAK rejected it on device. The cert was untrusted — meaning the app saw it as unauthorized and refused to load it.

**Fix: Metadata Schema Mismatch in the TAK Plugin Master List**
Brandon at TPC traced it to a formatting error in our plugin's registration file (`aigrg.metadata.json`). The file was on the wrong schema version (v4/v2 mix instead of v3). Thomas submitted MR !627 to fix it, Jared Hepp (TPC) merged it. Cert issue closed.

**The Build Still Failed — ProGuard Couldn't Find Its Mapping File**
A tool called ProGuard — which shrinks and protects the code before shipping — couldn't find a required file (`atak.proguard.mapping`) from TPC's build system (`takrepo`). The pipeline couldn't connect to retrieve it.

**Fix: Manually-Set CI/CD Variables Were Blocking the Connection**
Josh found that someone had previously set login credentials manually in the pipeline config (`takrepo.user` and `takrepo.password`). Those manual entries were overriding the automatic credentials the pipeline templates inject by default, blocking the connection to `takrepo`. Josh removed them. The pipeline connected, pulled `atak.proguard.mapping`, and all 7 build jobs passed — including `assembleProduction`.

# Daily Stand Up + Plugin Install Support April 14th 1015am

### SUMMARY
Team members updated individual progress with branch cleanup and pipeline testing, clarifying roles for TAK UI collaboration with Nathan and resolving ATAK installation issues for acceptance testing.

Collaborations and Standup Blockers
A meeting recap was sent to SoftCom for the Booz Allen collaboration, and a 30-minute meeting is scheduled to determine focus areas. Assistance was needed for building and acceptance testing due to an ATAK version issue, blocking story reviews.

TAK UI Contribution Strategy
Nik did not explicitly state the team were TAK UI contributors, but the expectation is for them to begin contributing to establish precedence and practice. The team will establish criteria for current stories before approaching Nathan to discuss moving forward with native TAK UI tasks.

Technical Debugging and ATAK Setup
Debugging of the ProGuard issue involves running builds from Josh's pipeline to check logcat and pulling changes to test for inadvertent resolution of coroutines issues. The correct mill setup for ATAK was confirmed after fully uninstalling, downloading the correct civil core and military flavor plugins, and installing the DoD flavor plugin for mill certification.


Next steps
[Zach] Update coroutines: Clean up current branch; push changes for coroutines. Pull Joshs changes into branch; check if ProGuard issue resolves.
[Thomas] Test Pipeline Builds: Test builds from Joshs pipeline; debug breaking issues found during testing. Ensure maintenance pipelines run correctly.
[Thomas, Abe] Resolve ATAK Version: Thomas will assist Abe troubleshooting ATAK versioning issues after standup.
[Jonathan, Kevan] Status Meeting: Meet to get a download of current work status.
[Abe, Jonathan] Plan Stories: Review stories; identify research spikes needed before consulting Nathan.


Details
Meeting Start and Schedule Alignment: The meeting began with general greetings and a brief discussion on personal schedules, including Zach mentioning family issues related to a child's cold and a mix-up regarding a doctor's appointment date. The conversation also touched upon the difficulty of distinguishing between days, likely due to a recent conference, where they were "all off by day".
Upcoming Collaboration and Standup Plans: Abe mentioned sending out a meeting recap to SoftCom for a collaboration with Booz Allen, confirming an upcoming 30-minute meeting is on the calendar, with the goal of determining their focus for that meeting before the end of the current week. Abe also noted needing assistance after the standup because they were blocked on building and performing acceptance testing due to a potential issue with their ATAK version, which was preventing them from pairing with Jonathan to review stories.
Individual Task Updates and Branch Cleanup: Zach stated they would clean up their branch, push changes for the coroutines, and investigate 11 related issues, hoping some were resolved by a fix Josh implemented concerning ProGuard and coroutines. Thomas committed to testing builds from Josh's pipeline to identify working and breaking components, with a focus on debugging and eventually ensuring the other maintenance pipelines are working correctly.
Offer of Technical Assistance for Versioning: Thomas offered to stay on after the standup to help Abe with ATAK versioning and related issues. Abe expressed appreciation for this offer of assistance.
Clarification of TAK UI Contributor Role: Abe sought clarification on whether Nik explicitly designated their team as TAK UI contributors during a previous call. Both Zach and Thomas agreed that Nik did not state this explicitly; Zach thought it was implied that they could assist with native functionality if needed for their primary work on GRG, while Thomas recalled Nathan saying they were open to the idea.
Strategy for TAK UI Collaboration and Story Assessment: Abe explained the need to establish criteria for their current stories, which currently resemble spikes, before approaching Nathan (Nik's name was used in error). The strategy is to ask Nathan about moving forward with native TAK UI tasks like the floating toolbar button and grid placement, acknowledging that some features (like the floating toolbar) might already be in Nathan's sprint.
Clarification on Bridge Contract Development Scope: A discussion ensued regarding the extent of TAK UI development expected during the current bridge contract. Kevan clarified their understanding that Nik wants them to begin contributing to TAK UI, not necessarily to complete all stories but to "start knocking some of these out" to establish precedence and practice, including working through a style guide and collaborating with Nathan on new functionality updates.
Identifying and Debugging the ProGuard Issue: Kevan inquired about the plan for identifying the ProGuard issue. Thomas confirmed they would run builds from Josh's pipeline and check logcat, and later in the day they planned to focus on testing the build. Zach noted they would pull Josh's changes into their branch to see if the coroutines and ProGuard issues were inadvertently resolved, following a suggestion from Claude to let ProGuard know to keep the Kotlin co-routine class.
Installation and Testing Setup for ATAK: Abe worked with Thomas to resolve issues loading the mill plugin, which involved fully uninstalling ATAK, downloading the correct civil core and military (mill) flavor plugins, and going through all necessary permissions. The team confirmed the mill setup was working after the DoD flavor plugin was installed, which enables ATAK to be mill certified.
Testing Scope and Methodology Clarification: Thomas advised Abe that for their purposes, they should focus on testing the mill build from their master branch, while developers test locally, then the civil (civ) build from their branch, and finally the mill build once merged. This clarification helped Abe understand that focusing on the mill version for acceptance testing was the appropriate mental model moving forward.

Next Steps and Team Focus: Abe planned to review stories with Jonathan and conduct further research before approaching Nathan regarding available features versus planned work. Thomas and Zach confirmed they would work separately on similar items, with Thomas focusing on testing the remaining tickets to close them out.

## NIZME 2pm Progress Sync


---
* **_YESTERDAY_**

* **_TODAY_**

1. `Get the build validated and send artiofactory link to Chad/Nik`
Build passed overnight — all 7 jobs green including assembleProduction. 
Blocked on device validation. 
Need help uninstalling and reinstalling ATAK-MIL correctly on device. 
Once validated, Kevan or Abel sends Artifactory link to Chad and Nik.

2. `IPM Prep — TAK UI Stories 5-8`
Engineers review remaining workflow stories ahead of Monday. 
Flag escape hatches vs native candidates so Nathan (BAH) can weigh in async on Mattermost before IPM.

**Where We Are Now**
Build is passing. Josh flagged there may be minor instability during testing — a known side effect of ProGuard. He says it is covered. Device validation on ATAK-MIL 5.6.0.16 is the next step.

(((`BLOCKERS_HELPS`]]]
* "I'm trying to `validate the build on device` but the plugin shows as `incompatible`. 
I `attempted to update ATAK-MIL` but I'm not confident the update actually took 
— `still showing 5.6.0.15. Can someone walk me through the correct way to update ATAK on the device`, and confirm what version the build was compiled against?"
* b
* c

>>Go Backs
- a
- b
- c

### team updates
[eng]
- framework and approach (GOTS eval)
- Zack will clean up his branch, 11 issues (weird bugs, ProGuard +) and PUSH
- Thomas testing builds that came out of Josh's pipeline, debug whatever is breaking still
- Other Maintenance pipelines.. test 

**PROGUARD PLAN OF ATTAKK**
- check log cat
- claude compera the packages?
- we have two packages one with Proguard one with out, Thomas might try that
- 
- 


- dod flavor plugin we loaded that in = `ATAK-SystemPlugin-FlavorPlugin-5.6.0.17-0133b620-5.6.0-mil-release.apk` enables ATAK to be .mil "signed" cert
- this our MIL PLUGIN APK: `Rise8-ATAK-GRG-Plugin-1.0-40c6868-5.6.0-mil-release.apk`
[design]
-  ABEL DONT CARE ABOUT `.civ` abel checks master build
- Devs will test locally.. 

> 

- e
- f

[others]
- g
- h
- i


# TAK UI with JVD

1. Some escape hatches aleady "exist" while others might be unknown
2. Document your findings as you work through the stories
- Spike: What is the criteria
3. What are the actual dev
- TAK UI has native thse things.. Nathan confirms TAK UO
- TAK UI does NOT have native.. Nathan confirms
- Do you want to add this to your backlong OR do you want Rise8 to "knock it out"
"the third option, poptential we look for things in TAK UI that can do something similar but change the user experience" 

# TAK UI User Stories -  Spikes & Criteria

**Summary**
Workflow stories demand alignment on criteria and developer expectations for TTAKag UI components, requiring partner collaboration and an assessment of internal development capacity.

Align Workflow Story Criteria: The team must align on acceptance criteria for current stories, which are structured as technical spikes due to documentation and review requirements. Expectations regarding developer use of TAK UI native components, confirmed by Nathan, must be established before proceeding.

Define TAK UI Component Requirements
Partner collaboration is necessary to identify non-native TAK UI components and define requirements for user stories, ensuring agreed-upon escape hatches for missing features like the floating toolbar. This approach is expected to reduce the complexity ratio of the story implementation.

Assess Internal TAK UI Development
A discussion is required to determine whether to ask Nathan to prioritize non-native TAK UI features or explore contributing to development via Nik Softmc, clarifying boundary lines of the bridge contract. Simple bug fixes can be submitted directly via merge requests, but new APIs require prior discussion with Nathan.

### DETAILS

**Workflow and Story Criteria Alignment:** The current stories are structured similarly to technical spikes due to the expected documentation and review process, making alignment on criteria and validation steps necessary [i]. The existing criteria, currently a table, is acceptable, but the team needs to determine expectations from developers, particularly concerning TAK UI native components [i]. For TAK UI native support, Nathan must be informed and confirm the status to ensure everyone is operating with the most current information, especially given potential outdated documentation [i].

**Collaborative Partnering on TAK UI Components:** The team must collaborate with their partners to define requirements for user stories; for instance, identifying components that are not TAK UI native, such as "workflow process and components," so that an escape hatch can be agreed upon [ii]. If a component like the "floating toolbar" is not TAK UI native, they will confirm if it is in development, and if so, they may proceed with a temporary escape hatch implementation if the effort is minimal [ii]. This approach is expected to shift the implementation complexity ratio of the story, making it less dependent on the escape hatch [ii].

**Exploring Options for TAK UI Development Contribution:** A discussion is needed regarding whether to ask Nathan to add non-native TAK UI features, such as the "grid placement render," to the backlog for prioritization, or whether to approach Nik SOFMC about the possibility of team contribution [iii]. The discussion hinges on SOFMC's interest in having the team contribute to creating the actual TAK UI component, rather than waiting for their PI planning cycles [iii]. The scope of any potential TAK UI development under the current bridge contract is uncertain, necessitating clarification on boundary lines [iii].

**Guidelines for Submitting Merge Requests and New APIs:** Feedback from Nathan confirmed that for simple bug fixes, developers can submit a merge request directly for review and likely approval [iv]. However, for new APIs, changes, or if the team is completely rethinking how something works, they must start a discussion with Nathan first [iv, iv]. The team received an update from NISME indicating that Ray will submit merge requests for bug fixes that do not change any APIs, and will email Nathan before any changes are made for new or changed APIs [iv].

**Assessment of Risk and Scope for Internal TAK UI Development:** While Nathan seems open to discussion regarding proposed changes, the team needs to assess how much TAK UI development they want to take on within the current contract's scope and timeframe, particularly given past issues with external repositories [v, vi]. The five-week contract window raises questions about the practical amount of TAK UI development the team should commit to [vi]. A full assessment of the TAK UI repository's stability is required before committing to development [v].

**Consideration of Alternative TAK UI Implementations:** An alternative approach to implementing features that lack a TAK UI native component involves seeking similar functionality within TAK UI, even if it requires a change to the user experience [vi]. This approach, such as achieving the desired functionality without a floating toolbar, would integrate more into TAK UI, but could require significant effort and resources [vi]. The current consensus is that creating an escape hatch may be easier than entirely rethinking the user experience, making the latter a potentially risky move [vi].


audio high jack  - testing?

FEASIBILY - 


---

we dont have the mapping from the ATAK build
when we go to build our stuff we get the mappgin

3 template
placeholders
its been set from the ATAK.JAR, the JAR is trying to set it..

ATAK GRADLE TAK JAR = "applied mapping and path to the mappgin"
it looks and it thinks is already here.


TAI UI Dev

[4.13_MONDAY]

* **_YESTERDAY_**

* **_TODAY_**

(((`BLOCKERS_HELPS`]]]
* a
* b
* c

>>Go Backs
- a
- b
- c

### team updates
[eng]
- framework and approach (GOTS eval)
- b
- c

[design]
- 
- e
- f

[others]
- g
- h
- i