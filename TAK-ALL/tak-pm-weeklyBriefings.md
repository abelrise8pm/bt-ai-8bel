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

# FORMAT, EMAILS AND PEOPLE

nizme.n.cuin.ctr@socom.mil, david.akers@sofwerx.org, gabrielle.robles@sofwerx.org

chad.j.raaymakers.civ@socom.mil, shane.d.toner.mil@socom.mil, nikolas.a.cline.ctr@socom.mil, jonathan.r.miller.civ@socom.mil,daniel.a.lynch.civ@socom.mil, robert.k.boone.ctr@socom.mil, james.vernon2.ctr@socom.mil

Sharon, Kevan

**What the customer liked**
Great discussion yesterday.  We really like the format you used for presenting progress with sections for planning, accomplishments, and issue resolution—please continue with that.

 To ensure we are all aligned, could you also add a summary for every issue discussed outlining your understanding of the agreed-upon resolution?  This will be a great way to catch any potential misunderstandings early.

**SUGGESTIONS FOR DOCUMENTING**
Thank you for documenting the discussion from earlier this week.

To centralize all project information for easy tracking, please consolidate the following artifacts into a single source document (Word or PowerPoint):

 The "Forecasted Sprint Schedule," accomplishments, and risk/mitigation plans from your 26 March PI Planning presentation.
The weekly drumbeat email that includes Nik’s feedback.
The email containing the notes from our recent meeting.
The email with the list of GOTS applications provided by Nik.
 
This document will serve as our living baseline.  Going forward, please add all future weekly drumbeats to this file, ensuring each entry is dated.  While you can continue to send weekly updates via email, the key requirement is that this single document is continuously maintained as the complete source of record for this two-month effort.

Finally, to ensure the right people are kept informed, please include the Program Office core team from the Kick-Off slides on all future communications for this effort.

Let me know if you'd like to connect on Teams to clarify anything.

--
Abel,
The documentation plan's layout is great.  In summary, moving forward, Rise8 will maintain two documents:

* Running Summary: A document for ongoing updates and key decisions on a weekly basis.
* Sprint Slide Deck: A presentation outlining the sprint schedule, accomplishments, and any identified risks with updates every two weeks.
 
I will ensure both files are kept up-to-date in our project folder, providing the team with a single source for the most current information.

Please also ensure to include **SOFWERX** Leads, `David Akers` and `Gabrielle Robles` on emails and meetings.  We had mentioned this to Sharon and Devon as well.

## MONDAY - MARCH 30 - Drumbeat Context for April 3
> After we wrapped up the call with Nik, Nizme requested I sent her an email with "the feedback we received.. what they provided to us as guidance"

**[Monday-March-30]**
1. Dual-Track Development
Nik agreed with Rise8's strategy to maintain the existing ATAK plugin as the current production baseline while TAK UI matures. Rise8 understands that the long-term intent is for all new plugins to be built in TAK UI. TAK UI is the ideal future state for new plugin development, including AI GRG, and we are actively developing a TAK UI version of the plugin in parallel. We will not add new features or functionality to the ATAK version going forward. 

2. GOTS Evaluation
Nik provided an initial plugin list via confluence link to Kevan and Sharon in a follow-up email. Abel and Kevan will review and intent to follow up with questions and next steps.

3. Plugin Release and Jira Visibility 
Nik clarified that when submitting a plugin release, teams are expected to follow the initial release process, which creates a Jira ticket with the PRR (Product Release Request). Without that Jira ticket, Nik does not have visibility into what the team is delivering. We will ensure all releases follow this process going forward."

**[Tuesday-March-31]**

**[Weds-April-01]**

**[Thurs-April-02]**








---
# Stakeholder Presentation "talking track"

Part 1: Intro
Morning, This past monday we had our kick-off and we agreed that our team would begin working on updating the plug in, TAK UI investigation, and start sprint planning, and today I want to share our forecasted sprint planning for the next 8 weeks, get your thoughts, feedback and also go over the work that team has been working on these past 3 days. Towards the end, we will have some questions and request

Part 2: Reference the Schedule and Milestones (Green table)
According to the Milestone's schedule, we are currently, here "PI" planning

Part 3: The PI planning "forecasted sprint schedule" - 
I'll go over the 4 sprints, Starting with what's currently in progress and planned leading up to April 8th demo..

OK, First up Sprint one, starting March 23rd to April 5th, the work streams we're anticipating are {a high-level concise blurb that clearly articulates the first 3 bullets without getting in the weeds of the details: - Plugin SDK Update to v5.6 and functional Regression testing TAK UI Research, Component Mapping and Migration prep, Developer Infrastructure and Plugin Housekeeping,} 
* A callout, switch in tone about 4th bullet in Sprint 1 "Sprint 2 Prep: GOTS and Model Improvement Scoping" {succicntly referencing that we need their support to help us scope and define this, and we can talk about it shortly after}

Next, For Sprint 2 from April 6th to April 19th, we are forecasting that we'd be wrapping up the testing on the update to 5.6, TAK UI migration should be underway, and depending on the remaining information, and scope alignment for MOdel Improvement and GOTS we think we should be in a good spot to start the initoal work on both of those.. 



# TAK Bridge contract iterations (sprint planning)

Give be a summary similar to Yi's slides

## Sprint 1 - March 23 to April 5th
* TAK Demo & PM Sync April 8th

**Our Plan**
> Our goal is to get started this sprint
- Review TAK UI and map all plug-in components to TAK UI.
- Create initial GOTS Baseline and prioritize list.
- Identify detection limitations and identify Model Improvement paths.

**What's in progress**
- update to v5.6 and testing on emulators and devices
- TAK UI framework initial research and assessment
- Plugin UI inventory & component mapping
- Start TAK UI migration "workflow/process block based"? (8 to 10 storieschores)
- TAK UI Migration iterative testing/validation
- Update Plugin Name to "AI GRG Builder" and Replace GR8 Icon
- Other chores related to "TAK Integration and compatability: The plug-in must work within the ATAK ecosystem, pass the keying process, stay compatible with SDK releases and integrate with TAK server(where needed). Related to SOW's #1 task "Update to v5.6)

**What got done**
- tbd
**Demo Plans**
- tbd

## Sprint 1 --> ! Risks, Assumptions & Asks (open questions)

### 1. `4.3.3` Related to Model Improvement 

### 2. `4.3.4` Related to GOTS Evaluation

///Sprint 1 END
---

## Sprint 2 - April 6 to April 19th
* TAK Demo & PM Sync April 22nd

**Our Plan**
- Review ATAK 5.6 plug-in feedback.
- Begin building TAK UI plug-in.
- GOTS Evaluation in progress
- Begin prioritized AI detection improvements.

**What's in progress**
- tbd
**What got done**
- tbd
**Demo Plans**
- tbd
--

## Sprint 3 - April 20 to May 3rd
* TAK Demo & PM Sync May 6th

**Our Plan**
- Set up some sort of pipeline (detection/inferance) - precession and recall
- Continue building TAK UI plug-in.
- GOTS Evaluation in progress
- Complete prioritized AI detection improvements.

**What's in progress**
- tbd

**What got done**
-tbd

**Demo Plans**
- tbd
--

## Sprint 4 - May 4th to May 17th
* TAK Demo & PM Sync May 20/21 TBD?

**Our Plan**
- Final TAK UI plugin development and report.
- GOTS Evaluation completion and report.
- AI detection improvement completions and report.

**What's in progress**

**What got done**

**Demo Plans**

They will give us more on GOTS

 
 Hi Nik,

 Yesterday during our call with SOCOM and SOFWERX we got some info from Jonathan Miller on a few topics that we want to get fully aligned with you on as te team is ramping up on work for the upcoming sprints. I want to schedule time with you to discuss the following:

 First, we want to confirm the two-track approach for the AI GRG plug-in. The ATAK version as our primary production focus, with a parrall TAK UI version for exploratory development and feedack (while we wait for TAK UI to be out of beta) 

 Second, We heard from you during kick-off and more from Jonathan Miller yesterday about the varios apps/plug-ins that could be up for evaluation and that you have specific ones you'd like for us to start out with. We'd like to get those discussions started so we can determine deliverasbles and expectations for this contracts timeline.

 And lastly, get your recommendations/suggestions on how to best collab with BAH, Perhaps a formal intro with Nathan Bidell (apologies if I got the name incorrect)

 Given our 8 week timeline, aligning on these two things witll allow us to plan our sprints with more confidnce. 

 # WEEKLY DRUMBEAT

[4.3.4] Align with Nik on GOTS evaluation scope and priorities. Get his plugin shortlist and confirm deliverable format and timeline expectations for this contract.

[4.3.2] Confirm dual-track approach with Nik. Align on maintaining the current ATAK plugin as primary prod focus while TAK UI exploratory development continues in parallel.

Dual-track development requires ongoing capacity management: Maintaining both ATAK and TAK UI plugin versions increases engineering effort while TAK UI production timeline remains undefined. COA: Team will actively manage workload to ensure primary ATAK plugin progress stays on track.

GOTS evaluation scope and priorities pending alignment with Nik: Evaluation cannot be scoped or started without a confirmed plugin priority list. COA: requested meeting with Nik to confirm priorities and define deliverables.

## Week's progress template: 

[SOW#] One-line headline of what was done or decided — result or expected benefit in plain language. (~24 words)

## Looking Ahead

[SOW#] Bold headline of what will be done. One sentence on the expected result or benefit, under ~24 words total.

## RISKS AND MITIGATIONS
[Risk title]
One sentence, what the risk is and why it matters — under 28 words total. COA: One sentence on what we are doing or asking for to resolve it.



"Operators should spend less time looking at their phones and tapping through screens, and more time focused on what matters operationally" — John M and Nik, March 26 sync
"Seeking a more general AI capability across TAK to make it more interactive and less dependent on users being heads down in their phones" — Nik, kickoff
The mission outcome they care about is not a better app. It is operators executing missions with a complete, accurate reference they can trust — made faster, with less cognitive burden, so attention stays on the mission instead of the screen.

--

Mission Outcome: SOF Operators increased their focus on the mission environment, as the frequency and manual effort required for configuring and correcting GRGs on the device screen is reduced.


The "So What" (Impact): By reducing the cognitive burden of navigating a complex UI, operators are able to maintain a more consistent focus on their surroundings, minimizing the distraction caused by the device during the planning and execution windows.