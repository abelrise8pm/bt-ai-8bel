# Monday Prep - 3.23

### SUMMARY
Weekly focus themes established four priorities: post-kickoff follow-up, validation of challenges, outcome conversation initiation, and GitLab backlog completion.

**Weekly Focus Themes Defined**
Four weekly themes were defined: post-kickoff follow-up planning, validating assumptions, starting the outcomes conversation, and finishing the GitLab backlog. Team norming and internal process map development were also noted as themes, with norming delayed until April 6th.

**Validate Assumed Challenges**
Validation efforts will focus on 3 core challenges: the manual bottleneck, the knowledge gap, and the critical issue of silent failure due to a lack of structured feedback or telemetry. The existence of a second, less understood value stream for post-mission debriefing also requires understanding.

**Process Maps and Pipeline Codification**
Internal process maps need development for the TAK delivery process and the 7-stage Computer Vision Life Cycle. Within the Computer Vision Life Cycle, a model training pipeline must be codified to automate the repeatable process of taking imagery and training the model.

**Weekly Focus Themes:** Abel outlined four primary themes for the week of March 23rd through March 27th, which include post-kickoff follow-up planning, validating assumptions, starting the outcomes conversation, and finishing the GitLab backlog. Two additional themes were noted: team norming, which is delayed until the week of April 6th due to the offsite ship summit in Utah, and developing internal process maps for the team. The internal process maps include the TAK delivery process and the Computer Vision Life Cycle.

**Post-Kickoff Follow-up Planning:** The initial theme focuses on closing the loop regarding stakeholder mapping and the organization chart, with further activities planned based on kickoff learnings. Specific action items include confirming key roles like Robert B and Dan L, addressing assumptions about JB and Nizme, and understanding the scope of the Special Operation Forces Mission Command (SOFMC) versus US Special Operations Command (SOCOM). Access to TAK Forge (GitLab) and government-furnished equipment (GFE) are necessary, as is submitting a Memorandum of Agreement (MOA) or Memorandum of Understanding (MOU) to obtain the Mil APK label.

**Validating Assumed Challenges and Findings:** The second theme is dedicated to validating assumed challenges and current condition findings by getting feedback from customers and subject matter experts (SMEs). Abel identified three core challenges: the manual bottleneck (speed vs. tactical risk), the knowledge gap (building for the wrong mission window), and the most critical challenge, silent failure (lack of telemetry or a structured feedback loop on how GRGs perform during live missions). This validation process is related to questions about organizational metrics and prototype performance assessments, items in the kick-off Deck.

**Understanding the Value Stream and Debrief Process:** A significant assumption being made is the existence of two distinct "end users/customers" of the value streams: one for the personnel executing the mission with the GRG, and a second, less understood end-user/customer for post-mission debriefing. The team needs to understand the part of the value stream involving "mission debrief people" who report which GRGs worked or were inadequate, which is crucial for improving the model and establishing a new baseline.

**Starting the Outcomes Conversation:** Theme three emphasizes initiating the discussion about target conditions and ideal states to align on enabling mission outcomes for the next eight weeks and beyond, especially concerning the four contract tasks. The four tasks are updating the plug-in version SDK to 5.6, TAK UI migration and research, model improvements, and Government Off-The-Shelf (GOTS) evaluation. Abel needs to prepare an impact mapping narrative, working backward from these deliverables to define outcomes (measurable changes of behavior) and identify the beneficiary actors.

**Finishing the GitLab Backlog:** The final theme focuses on completing the GitLab backlog structure, where features, impact, and outcome epics have already been added using new templates. The current backlog includes issues and features related to the TAK UI, and Abel needs to ensure that mission outcomes are fully defined.

**Developing Internal Process Maps:** A fifth (5th) and key internal theme involves developing process maps, including the TAK delivery process (kickoff, source, build, test, release, deploy) and the broader Computer Vision Life Cycle. The Computer Vision Life Cycle is mapped across seven stages: Problem Framing and Planning, Data Collection and Preparation, Model Selection and Development, Model Training and Fine-Tuning, Evaluation and Validation, Deployment, and Monitoring and Iteration.

**Codifying the Model Training Pipeline:** Within the Computer Vision Life Cycle, a model training pipeline needs to be codified and documented to automate the repeatable process of taking imagery and training the model. The pipeline stages include Data Collection, Labeling and Annotation, Training, Evaluation, and Packaging and Deployment, which relate to stages within the larger Computer Vision Life Cycle. Codifying this pipeline is necessary for supporting the retraining cycle.

### Suggest Next Steps:

1. Abel will figure out the relationship between SOFTMC and SOCOM regarding the organization chart.
2. Abel will align with the internal team, including Sharon and Kevan, to understand the "comfort level" and customer readiness for discussing mission impact and outcomes beyond the eight-week bridge contract, and start preparing the narrative by mapping the relevant enabling outcomes, mission-outcomes and mission impact of the four contract tasks.
3. Abel will close the loop on stakeholder mapping and the organization chart with the customer.

---

1. What is the current state, challenge (pain-points) related to "cognetive overload"

---

## EPICS/FEATURES

#### 0001: TAK UI Framework migration & research
> How users interact with the plug-in inside ATAK. what they see, how they submit images, how resuls are displayed and how they correct outputs.
* TASK 2 - migrate to TAK UI + research

#### 0002: The CV Model
> The computer vison model's ability to accurately identify and outline buildings in satellite and aeriel imagery, covering both the algorithm and its performance in the field.
* TASK 3 - Ai/ML model improvements

#### 0003: Model Training Pipeline
> The infrastructure and porcess that makes the m odel improve over time, data collection, labeling, training, evaluation and the feedback loop from the field back to restraining.
* TASK 3 - (partially) Ai/ML model improvements

#### 0004: TAK Integration and Compatibility
> Ensuring the plug-in works within the ATAK ecosystem, compatatible with SDK releases, passing the keying process and integrationg with TAK server where needed. 
* TASK 1 - upgraded to 5.6

#### 0005: Deployment and Release Infrastructure
> The CI (continious iteration) and to a certain extent the "CD" continious delivery pipeline. (ci/cd). Fortify scanning, Artifactory, GitLab hand-off to SOFMC/SOCOM and ATO compliance. Everything requird to reliably deliver the plug-in from our product/dev team to operators on the field in prod. 
    - Fortify Scanning: automated security analysis tool, scans code for vulnerabilitiues. Once plug-in's APK Is built, and handed to TAK Forge, they scan it.
    - Artifactory: Storage and version management in TAK Forge's pipeline. After APK passes fortify scans, gets keyed and signed it gets stored into Artifactory. Specified version is downloaded then installed on devices or emulator. 
* TASK 4 - GOTS eval

#### 0006: GOTS Evals?
---

# March 23, Monday - TAK Kick-off PM recap

### SUMMARY
GRG plugin deployment prioritized for immediate AI-assisted labeling capability, with TAK UI migration established as the foundational work across various environments and contract alignment required for current SDK usage.

**GRG Plugin Immediate Deployment:** Immediate priority focuses on deploying the current GRG plugin version to provide AI-assisted labeling capability quickly. Performance evaluation for the plugin is deferred to the government team, specifically Shane and Chad, to identify proper reporting channels.

**TAK UI Foundation Critical:** Migrating the GRG plugin into the TAK UI framework is critical for expanding deployment capability across desktop and cloud environments, including ATAK WinTAK and WebTAK. The government owns all plugins, and this foundational step must precede any further backlog development.

**Contract Alignment and Work Start:** The SOW section `4.3.1` requires the team to build plugins with the latest SDK version, signing backwards to ensure compatibility with older versions like 5.4 and 5.6. Development work starts immediately on 5.6 compatibility and TAK UI exploration, prior to the March 24 PI planning meeting.

### DETAILS

**Initial Feedback and Priority for GRG Plugin:** The immediate priority is to get the current version of the GRG plugin, which users have tested, deployed as quickly as possible. Nik suggested focusing on delivering the capability for AI-assisted labeling rather than prioritizing plugin improvements, with plans to iterate on versions `1.1` or `2.0` later. Performance feedback for the plugin is deferred to the government team, specifically Shane and Chad, prompting an inquiry into the proper channels for obtaining this evaluation.
> Abel's takes: Right, So here is one ask from me, I need to make sure that when Nik said that performance feedback should come from the Government folks, was he referring to Chad and Maj. Toner or who should be our contact to obtain this feedback..

**Blockers and Establishing TAK UI as a Foundation**: Nik that there should be no immediate blockers or barriers to proceeding, reminding the team that the government owns all plugins. The main focus remains on migrating the GRG plugin into the TAK UI framework, which is crucial for enabling deployment across desktop and cloud environments like ATAK Win, TAK-X, and WebTAK, thereby expanding deployment capability beyond Android devices. This foundation must be established before pushing further backlog ideas, supporting a flat capability build across the enterprise first.
> Abek's takes: A very clear priority and even further solidiying an enabling Outcome, from Nik, Getting the GRG plut-in migrated over to TAK UI creates a stable "foundation" and also ensures cross-platform compatability and deployments. Gots to make sure we track this. Second part for me is to try to coordinate with Kevan and the engineers, what exactly does migration to TAK UI entail, look like (while still getting access to the docs via TAK.gov)

**Coordination and Future Plugin Evaluation Direction:** Chad will serve as the primary point of contact for coordination, with Nik acting as the day-to-day point of contact for the delivery team. The government has many plugins for the team to assess, and they will share what they have so the team can suggest areas for the best improvements, recognizing that the team knows their own capabilities best.

**Contract Versioning and Alignment with TPC Releases (SOW Section 4.3.1):** The requirement in SOW section 4.3.1 dictates that the team must work on the most current SDK version, as TAK releases every 120 days, and plugins must be compatible with every version. Nik clarified that the process involves building with the latest SDK (e.g., 5.7 or 5.8 when available) and then signing backwards to support older versions like 5.4 and 5.6, ensuring the team does not anchor themselves to an older SDK version.
> Abek's takes: For me, as the PM I need to align with the engineers and then with Nik and SOFMC about a couple of things, First - the 120- day releases, So that means we can't go to prod any date, it has to be every 120 days? Second, Managing the various SDK versions, I need to make sure I undertand and the engineers too.. It appears that we are always developing on the latest version, but we need the ability to "sign backwards" to support legacy and older version? How exactly is all that determine and organized? 

**Success Metrics and Implementation Plan Expectations:** Performance will be measured through PI planning demos, and the program managers, Shane and Chad, expressed interest in receiving assessments as part of section 4.3.4. They seek a recommendation and implementation plan, ideally a 30, 60, or 90-day roadmap outlining critical factors or long lead time items, or advice on how to fix identified issues. Nik reiterated that they would like to begin discussing 4.3.4 once the team has a sense of the level of effort required for the TAK UI migration, ensuring a clear path forward (00:11:06).
> Abel's Takes: So the first obvious thing for me, I should confirm with Shane ane Chad how they would like to see those "recommendation and implementation plan" I can make a roadmap, a type of PRD doc. Simple. Prefer format.. that's what I need to confirm. Second is Nik, again once we have estimates and some sort of TAK UI migration/implementation timelines, then he wants to know about it so we can have our plan set for how and when.. 

**Alignment on Work Start and Sprint Cadence:** The discussion around the phase one milestones, including PI planning, addressed starting development work immediately, even before the PI planning meeting scheduled for March 24 (00:13:12). The team agreed that work could commence right away by securing access to TAK Forge, beginning 5.6 compatibility work, updating the plugin, and initiating TAK UI exploration (00:14:38). **Initial Work Proposal and TAK UI Ownership:** Nik suggested that initial sprint work should focus on TAK UI, which is considered one of the biggest current efforts due to the flexibility it provides. Nik confirmed "they own" TAK UI, and the person who built it is on their team, providing direct access to resources. Kevin and Abel were tasked with creating a backlog that includes updating and testing the plugin and developing a TAK UI research and implementation plan.
> Abel's Takes: The biggest issue for me now is getting access to TAK Forge, So I can start reviewing those TAK UI documents. I need to also figure out, what backlog are we using? It's unclear if we are using just TAK Forge, workingo out of there, working out of our GitLab instance or if we are going back to SaaS GitLab? That's one,  Second is basically.. start putting together a backlog based on upgrading to 5.6 and then the TAK UI discovery/research and migration. that I dont know much about. 
> Abel's Takes: It be good to also get the name of this person, who built TAK UI. What kind of support can they offer us? Once again, another reminder for me to get on this with Kevan ASAP. backlog where will it live and also get TAK UI and 5.6 stories in there

**Future AI Capabilities and Plugin Expansion:** Nik expressed interest in collaborating to identify where AI can add value across various plugins, seeking a more general AI capability across TAK to make it more interactive and less dependent on users being "heads down in their phones". However, the number one priority remains successfully migrating the GRG plugin into TAK UI to establish that foundational work (00:18:07).
> Abek's takes: So this is a very interestng take from Nik, that we should discuss and clarify with Sharon and Kevan..  What exactly does he mean by "eeking a more general AI capability across TAK to make it more interactive and less dependent on users being "heads down in their phones"." --> is this post Bridge Contract? We have some mission impact here? another different app or tool?

**Definition of Initial Sprints and Next Steps:** The work beyond the initial sprints, focusing on changes to other plugins, is acknowledged as less clearly defined or "nebulous" compared to the straightforward work of updating to 5.6 and learning the TAC UI framework (00:19:05). The team can commit to the next two to four weeks of sprints centered on updating the plugin and migrating to TAK UI, while the assessment of other plugins will require hands-on experience and collaboration to define work items (00:20:22). The immediate tasks for March 24 and 25 include bringing the plugin up to 5.6 compatibility, focusing only on bugs and regressions since no new features are being added, and starting work on TAC UI. A follow-up meeting is scheduled for Thursday or Friday morning for the team to present a high-level sprint plan outlining the approach for the next few weeks.
> Abek's takes: So, this is it. This encapsulates most of the takes above. Right? Basically, get a backlog going by Thursday, March 26th at the latest.. version 5.6 testing, assessment, make sure is stable, then TAK UI reasearch/disco activities and migration efforts. Go! 

### SUGESTED NEXT STEPS

1. Abel will try to understand how the team keeps track of the latest SDK version, where to get the lead on the correct version, and where to get the latest build information from the repo.
2. The group will focus on the work needed to bring the plugin back up to 5.6 and start on TAC UI over the next couple of days (March 24 and March 25).
3. The group will meet with Nick on Thursday or Friday morning to regroup, review the high-level sprint plan for the next few weeks, and do a deeper dive into plugins.

---

# Wednesday March 25th 2026 - Daily Stand Up & Sprint Planning

Migration and scheduling updates were provided, focusing on testing documentation review and device access logistics for the Mil-Variant ATAC Installation.

Migration and Scheduling Updates
Updates covered starting UI framework mapping and coordinating sprint plans for migration, with 5.6 testing ticket tests confirmed as passed. UI framework mapping is nearly complete via an Excel sheet, pending technical support response for account access.

ATAK Installation and Logistics
The team determined the Mil-Variant of ATAK needs installation on virtual devices this week, with a mill-tagged APK artifact available on Tac Forge. Devices are being managed, and a request was made for account setup to gain project access for all members.

Plugin Naming and Migration Strategy
The plugin name must be updated to AI GRG builder or AIGRG plugin, requiring contact with Matt O'Donnell for the source Figma icon file. The team decided that the migration strategy should focus on actual user workflows for end-to-end testing rather than a component checklist.

Updates on Migration and Scheduling: Abel Hernandez provided an update on the previous day's work, which included starting on UI framing framework mapping and creating stories and chores in GitLab for migration. They also mentioned coordinating a sprint plan with Kevan Mordan. Abel Hernandez has a dentist appointment at 2 p.m. and is preparing slides for a progress update scheduled for the following day with "softm folks" and NISME.

Testing and Documentation Review: Thomas Reynolds reported passing all tests for the 5.6 testing ticket and left a comment regarding the successful tests. They spent half a day reading documentation on TACI and plans to continue looking through documentation and start testing TAUI locally. Zachary Greenlief reported that they have nearly completed filling out the Excel sheet for UI framework mapping and is waiting for technical support response regarding account access.

Access and Device Logistics: Kevan Mordan confirmed that Thomas Reynolds should have access to Tac Forge. Devices are being managed by Whan, who received them the previous day, and Kevan Mordan is considering having Abel Hernandez's mailed out, which could arrive by Friday. Kevan Mordan requested that Zachary Greenlief set up their account access for tech.gov to receive access to projects.

Mil-Variant ATAC Installation: The team determined that the mill variant of ATAC needs to be installed on virtual devices this week, noting that the mill variant is a plugin rather than a separate application. Kevan Mordan displayed the pipeline on Tac Forge, noting a mill-tagged APK artifact is available to download, which is the first mill-tagged version of their plugin. The team plans to experiment with both the debug and release mill APKs.

Plugin Naming and Icon Updates: Kevan Mordan noted the need to update the plugin name to "AI GRG builder" or "AIGRG plugin," as requested by Nick. They also mentioned needing to find the correct icon, which may require contacting Matt O'Donnell to find the source Figma file, as the current icon might still display "GR8". Abel Hernandez confirmed they do not have the source Figma file for the icon.

Upcoming Progress Update and Sprint Planning: The team has a progress update scheduled for the following day at 12 Mountain, potentially including Nick, Jonathan, Shane, and/or Chad, and N. Abel Hernandez offered to prepare slides using the existing format to present the sprint plans, which will be based on the setup in GitLab. The goal is to obtain more information, such as other plugins for the guts evaluation, from Nick during this meeting.

Migration Strategy Discussion: Abel Hernandez suggested basing the migration work on actual user workflows from the value stream (e.g., "prepare the imagery," "define the grid on the map") rather than a component checklist to allow for end-to-end testing and acceptance testing. Kevan Mordan agreed that an end-to-end workflow covering everything is an acceptable approach. Zachary Greenlief is currently completing the UI framework mapping using a component-based approach and plans to test the 5.6 repo once they gain Tac Forge access.

Tracking Josh's Work and Communication: Abel Hernandez expressed concern about a "blind spot" regarding Josh's exploratory work on the TAUI plugin, which includes administrative tasks like proper release packages. They proposed communicating with Josh to get a recap via Slack or a quick standown, and then creating tickets to track their deliverables. Kevan Mordan created a new internal "dev channel" to facilitate communication.

New Ticket Creation and Migration Scope: Two new tickets will be created: one for SDK registry and another for TAUI plug-in investigation. Thomas Reynolds asked if the expectation is a full migration to TAUI or only an investigation. Kevan Mordan suggested that since TAUI is significantly different, a separate repository might be required instead of a sub-tree.

Mobile vs. Web Plugin Variant Discussion: Kevan Mordan advocated for having separate, targeted mobile and web variants of the plugin, arguing that a laptop screen and a phone screen require different user experiences and functionality. They plan to discuss this with Nick, emphasizing that key features like the radial menu do not translate well to a website interface. Thomas Reynolds supported this, noting that Tech UI is currently only mature for ATAC deployments.

TAC Gov Account Activation and Next Steps: Abel Hernandez received an email regarding their TAC gov account activation, which will allow them to submit the US person form. Kevan Mordan and Abel Hernandez agreed on creating tickets to change the plugin name and test the plugin on the physical device. Kevan Mordan, who has two devices, will ensure the test is completed on an emulated device as well.

Planning Follow-up Meeting: Abel Hernandez will work on the slides for the following day's presentation and will try to meet with Kevan Mordan before 2:00 p.m. Eastern, as Kevan Mordan will be unavailable from 3:00 p.m. to 5:00 p.m. Eastern . Abel Hernandez will set up their TAC gov account and update the stories in GitLab.

**Additional context from Slack**
Josh: I think we can actually set up our sdk to publish to the gitlab registry and we can start using maven properly with it. I know for the challenge we just threw everything into the plugin repo.

Josh: I'm going to continue seeing if I can nudge the TAK-UI migration to not be absolute crap
Josh: Looks like the 5.6.0.15 supported plugin can be released
Josh: TAK-UI plugin template is out of date with TAK-UI deps. Turns out you need to be using the latest beta to get dependency resolution working properly. They don't have support for the ActionToolBar. 
Josh: But not big deal. Most of the code is copy/paste from the GR8 plugin repo. The good news is we were already using kotlin and kotlin flow so everything is pretty straight forward.Anyways, today I'll focus on getting the SDK releasing proper packages to the registry.

# Weds March 24 12pm Sprint Planning Review with Kevan

### SUMARY
Sprint planning reviewed the 4-sprint roadmap with defined work streams and scheduled dates, focusing on model performance and GOTS evaluation scoping.

**Sprint 1 Work Streams Defined**
Sprint 1 confirmed major work streams including SDK 5.6. update, TAK UI research, and developer infrastructure chores, utilizing the RDA/SOWs for summarized iteration dates. The approach is to define major work themes first, followed by smaller components like chores, spikes, stories, and bugs.

**Sprint 2 Blockers and Focus**
Sprint 2 will focus on task 1 validation (updating to v5.6), task 2 migration (TAK UI), and starting tasks 3 (model improvement) and 4 (GOTS evaluation). The GOTS evaluation is blocked by the lack of an in-scope capabilities list, which requires immediate scoping and definition of the evaluation framework.

**Model Improvement and Final Deliverables**
Model improvement work is separated into two epics: the model and the model training pipeline, focusing on inference performance and a good precision-recall score across the Ground Reference Grid. The final technical Sprint 4 includes completing all major migrations and evaluations, performing the Fortify scan, and executing the final software delivery package.

### DETAILS

**Sprint 1 Planning and Backlog Review:** Abel reviewed the proposed items for Sprint 1, which runs from March 23rd to April 5th, including updating the SDK to version 5.6, TAK UI research investigation, and developer infrastructure chores. They confirmed that the current proposal focuses on "big streams of work" or themes, which will encompass smaller chores, spikes, stories, and bugs. The plan is to align on the major work streams and then determine the smaller components that make up those streams.

**Replacing the Sprint Planning Slide and Iteration Summaries:** Abel plans to replace the current slide showing the work plan with a green table template that Sharon previously used, which Kevan agrees should be included. They will use the iteration dates provided by Kevan to create a generalized summary of the work expected for each two-week period, noting that as the project progresses, detailed stories will not be fully fleshed out immediately.

**Sprint 2 Planning and Key Work Streams:** Sprint 2 is tentatively scheduled from April 6th to the 19th, and the primary focus will be on continuing task 1 validation (plug-in sdk on v5.6) and beginning task 2 migration (TAK UI framework), along with kicking off tasks 3 (model improvement) and taks 4 (GOT evaluation). Work streams include closing out the plugin update with testing and ensuring compliance, and beginning the TAK UI migration, which Kevan noted will likely start in the current sprint (March 26,27), though the dates represent high-level targets.

**Sprint 2 Blockers and Scoping Activities:** A blocker for the GOTS evaluation kickoff (Stream C) is the lack of an in-scope capabilities list, which Abel intends to discuss tomorrow with Nik, in addition to defining the evaluation framework. Model improvement scoping (Stream D) is currently undefined, requiring confirmation from SOCOM/SOFMC on what they want to improve—model architecture, training data, or inference. Kevan suggested the government users, possibly Marine users, are the users Nik referenced when discussing feedback on the model 
Action item is to include those questions to Nizme or Nik, to get the feedback from from the Marine users.

**Sprint 3 Outlook and Model Improvement Workstreams:** Sprint 3 activities are projected to include the continuation of TAK UI migration, GOTS evaluation in progress, and model improvements underway. Abel separated the model improvement work into two potential work streams: the model itself and the model training pipeline, which they are treating as two distinct epics due to the connected nature of the work streams.

**Defining Model Performance and Training Pipeline:** Kevan emphasized that they are focused on "detection performance" or "inference performance" rather than the model itself, striving for a good precision-recall score for the overall Ground Reference Grid (GRG). They noted that better performance across the entire GRG can be achieved through methods like pre-processing without changing the model itself. Kevan confirmed that model training may not be necessary, and they did not receive any pushback on this approach during the kickoff.

**Sprint 4 and Final Deliverables:** Sprint 4 is the final technical sprint and includes completing the TAK UI migration with final findings documented, completing the GOTS evaluation, wrapping up the A/IML model improvements, and performing the final software delivery, including the Fortify scan and the release package. The team is required to deliver a cost and time-line assessment, which for the eight-week period will reflect the time and cost already spent . Program management close-out activities include the final sprint demo and presentation of performance metrics.

**Sprint Scheduling and Date Clarification:** Kevan explained that the discrepancy between the sprint end date (May 17th) and the contract closing date (May 15th) is due to GitLab's strict, two-week iteration scheduling, which includes weekends and cannot be manually adjusted to end on the contract date (00:16:04). Abel will proceed with the accepted format for slides and will use an AI assistant to create concise blurbs for the presentation (00:18:04).

**Kevan Mordan's Focus and Involvement:** Kevan stated that they will be moving toward a more hands-off approach concerning the plugin work to focus their personal time and effort on the GOTS evaluation and planning. They expressed willingness to provide context and inputs regarding the model improvement's long-term production and deployment aspects but will be less involved in the specific changes needed for the current iteration.

**TAK Forge Access and Current Detection Flow:** Abel confirmed he is waiting to get access to TAK Forge. The current detection flow does not use the previously discussed segmentation masks or guided diffusion, and the pipeline that was shown would need to be rebuilt and likely hosted internally, as Kevan Mordan noted that Tag Forge does not support triggering things from that pipeline, and also reference Sprint 3 slides for the latest pipeline.

--

### The Recap from Slack, March 25, 4PM

[1-2] **Escape Hatches + Declarative Syntax**
TAK UI provides pre-built UI components with shorthand code — not a full replacement of how the plugin is built. When TAK UI lacks a component, developers can fall back to native Kotlin. No hard blockers found. Next step: Josh confirms escape hatches are a valid long-term answer.

[3] **Time-Boxed Investigation**
Josh is actively investigating TAK UI feasibility but the work isn't tracked. Spike ticket created and time-boxed to Sprint 1 (April 5).
> Next step: Josh delivers a short findings summary answering key migration readiness questions before Sprint 2 stories begin.
>> RESOLVED by Josh
* `1.10.0.102-beta` = current/latest version of TAK UI
* I think since I updated to the correct dependency and started using the right modules, the only things has been `ActionToolBar`. However, I know that the `radial-menu` will likely not be 1:1.
* Yup, absolutely. Already have it. Not a blocker at all.
* Pretty high given I have the foundational stuff pretty much done. The migration stories might just be validating features are complete in the migrations.
* Yeah, I'll be able to tell you tomorrow morning but almost assuredly by end of day tomorrow.

[4] **Proprietary + Minimal Docs Risk**
TAK UI is proprietary with minimal documentation and in beta — Rise8 can't fix bugs themselves and trial-and-error slows velocity. Primary mitigation is Nik's confirmed direct access to the TAK UI team at TPC. 
> Next step: verify that access is active before the team goes deep.

[5] **Falls Short + Breaking Changes**
TAK UI doesn't yet have equivalents for all plugin components, and as a beta framework its API is still actively changing — what works today may break after the next release. Long-term payoff is still worth pursuing. 
> Next step: raise directly with Nik tomorrow — does SOFMC know TAK UI is in beta, and does TPC have a stable release timeline?

----

# Mases - google doc: AI Questions & Decisions

### QUESTIONS

1. Where will the new AI model training pipeline reside?
a). For the competition, we had to use our own AWS instance because the AWS GovCloud did not support GPU VPCs

2. It was mentioned that the AI did not perform well on certain AOIs / imagery / zoom levels / etc. Will this imagery be provided to us? What classification level are they?

### DATA COLLECTION

1. Training user interface: provide an easy-to-use user interface for the operator to add annotations to the training data.

2. Continuous Annotation: a method to collect and offload all the labels created by the user, modified by the user, and incorrect labels that were deleted. Based on the operating environment, this data might be classified.
a). Collect the imagery
b). Collect the labels created by the AI model
c). Collect the modifications done by the User
d). Ask the user to rate the accuracy of the changes they made

3. Model Rating: Ask the user to rate the model performance every time the model performs auto labeling.
a). Accuracy of the building detections
b). Accuracy of the labels and the ordering of the labels.
- Possibly a 1-5 star?

---

## MARCH 26, Thursday 1015 Daily Stand Up

### SUMMARY
Summary
Access and credential issues were prevalent with continued work on the PI planning roadmap for the customer call and discussion regarding TAK UI maturity concerns.

Access and Credential Problems
Access and credential issues were reported by multiple members, with some receiving an X506 credential error when attempting to log into TAC. The team considered using Rise 8 emails for access due to ongoing CAC and credential problems.

Customer Call Preparation
A presentation deck was prepared for the customer call today, outlining the PI planning roadmap for the coming weeks. The team is coordinating sprint task assignments before most members are unavailable next week.

TAC UI Maturity Concerns
Difficulties and concerns were expressed regarding TAC UI’s current maturity and stability for a production-ready plugin. The team decided to highlight these concerns about long-term stability and production readiness during the customer call to gather necessary context.

### DETAILS
Access and Credential Issues: Zachary Greenlief reported regression on their access, having lost access to a system they had access to last week and receiving an X506 credential error when trying to log into TAC. Abel Hernandez also checked their access but still found their contract request marked as pending. Zachary Greenlief and Abel Hernandez both discussed the possibility of obtaining access through their Rise 8 emails due to the current CAC and credential problems.

Roadmap and Sprint Planning Updates: Abel Hernandez submitted their contract request and worked on the presentation deck for the customer call today, which will cover the PI planning roadmap for the coming weeks. They posted the deck to the channel for feedback, and their plan for the day includes finalizing the deck, adding open questions, and continuing to update the internal GitLab system by linking children and parents to the correct epics and outcomes. Given that most of the team will be gone next week, Abel Hernandez is trying to determine who will work on which sprint tasks.

Technical Tasks and Priorities: Thomas Reynolds was distracted by Tech UI work yesterday but plans to switch priorities today to install the Mill SDK and Mill version ATAC, then test the military-tagged APK on the emulator. Kevan Mordan plans to get the latest ATAC on a phone for testing to identify issues that need fixing.

**Concerns Regarding TAC UI Maturity:** Kevan Mordan discussed with Josh the difficulties concerning TAK UI and the team's posture to be cautious about committing fully to TAK UI  for a production-ready plugin due to its current state of maturity. Abel Hernandez noted that Nick has expressed eagerness for TAK UI  due to its cross-platform compatibility, though Kevan Mordan and Abel Hernandez expressed concern about TAK UI's stability and production readiness. Kevan Mordan suggested highlighting these concerns about long-term stability and production readiness during the customer call today.

**Need for Customer Feedback and Context:** Abel Hernandez noted that raising issues about  TAK UI with the customer allows the team to gather context for making direct recommendations later, and Kevan Mordan confirmed that this assessment is part of the overall evaluation. Kevan Mordan suggested informing the customer that the team is concerned but will continue investigating TAK UI to validate initial concerns. Kevan Mordan also raised usability concerns about platform differences, noting that mobile phone use cases (thumbs, drag and drop) differ significantly from a mouse and keyboard on a larger screen.

**Review of Customer Slides and Access Status:** Abel Hernandez asked Kevan Mordan to review the slides for the customer meeting to confirm what makes sense and whether the forecasted work should be more conservative given the team's limited access and next week's availability. Kevan Mordan stated that Abel Hernandez's access should be resolved today. Kevan Mordan also confirmed that Zachary Greenlief's access issues are unusual and may be related to their out processing, but Zachary Greenlief intends to put in extra time on the project if they gain TAC Forge access via their Rise 8 email.

Device Planning for Offsite: Kevan Mordan confirmed that devices are being shipped to the resort for the offsite meeting, including two phones saved for Josh and Abel Hernandez because Zachary Greenlief will not be attending. The devices available include laptops for running Webtac (one Dell and two Lenovos) and additional phones. Thomas Reynolds and Abel Hernandez both agreed to take a laptop.

**Follow-up on Evaluation Scope and Feedback:** Abel Hernandez plans to finalize the slides, incorporating open questions and potential risks related to  TAK UI. They noted that the scope for the evaluation, including the specific applications, is still missing, and that Nick is expected to bring more information today. Abel Hernandez will also bring up model improvement questions, hosting the pipeline, and seeking feedback from the likely Marine users who participated in the competition.

**Coordination of Customer Meeting and Internal Retrospective:** Kevan Mordan was interrupted by a scheduling conflict for the customer sync. Zachary Greenlief confirmed that the retrospective is an internal meeting, which they plan to attend, and Kevan Mordan encouraged Zachary Greenlief to attend all public-facing activities for exposure. Kevan Mordan asked Zachary Greenlief to send a quick summary of their access issues via Slack.

### SUGGESTED NEXT STEPS

- Kevan Mordan will try to coordinate a solution today for Zachary Greenlief's TAC access issues and attempt to get authorization to Attack Forge through Zachary Greenlief's Rise 8 email.
- Thomas Reynolds will switch priorities today to get the Mill SDK and Mill version ATAC, and test the mil tagged APK on the emulator at least.
- Kevan Mordan will attempt to get the latest ATAC on a phone today and test it out to identify any issues to fix.
- Zachary Greenlief will send Kevan Mordan a quick summary in Slack about his TAC access issues.
- Abel Hernandez will finish up the slides by adding open questions and potential risks regarding TAK UI, the scope for the GOT evaluation, model improvements, hosting the pipeline, and feedback from Marine users.
Kevan Mordan will review Abel Hernandez's slides and provide feedback.

---

#### 1130 3.26 prep
**What Nik/SOFMC Assumes About TAK UI**
- TAK UI is the #1 priority — it unlocks cross-platform deployment across ATAK, WinTAK, and WebTAK
- No immediate blockers — the government owns TAK UI, and the person who built it is on their team
- Direct access to the TAK UI team at TPC is available and confirmed
- The expectation is that migration is straightforward enough to begin this sprint

**CV MODEL TOPICS**
**1. Detection Accuracy and Performance Baselines**
Precision-recall, section vs. full AOI accuracy, label correction rate, and terrain/imagery degradation — what we've measured, where the model falls short, and what "better" needs to mean.

**2. Real-World Feedback and Training Data**
No production data exists, no field feedback loop, Marine user access unconfirmed, AOI imagery not yet provided — we are improving a model without knowing how it actually performs in the field.

**3. Data Collection and Continuous Improvement Pipeline**
Continuous annotation, user corrections as training signal, model rating per inference run — the mechanisms needed to make improvement repeatable and evidence-based over time.

**4. Infrastructure and Deployment Constraints**
On-device DDIL requirement, ONNX export format, wiped training infrastructure, pipeline hosting location undefined — the hard constraints that shape what improvement is even possible.

## TEAM RETRO - Thursday March 26 1600

### SUMMARY
Communication channels were established with Mattermost, with plans for clarifying AI evaluation objectives, and addressing the TAC Forge signing pipeline.

**Establish Mattermost support channels** Logging into Mattermost chat was recommended to facilitate requesting support from Nick and other team members regarding various stages of TAC Forge and related issues. The team was advised to establish these communication channels and reach out for assistance when facing difficulties.

**Clarify AI evaluation objectives** The need to understand the AI evaluation objectives concerning God's GS was identified as this area is currently vague. A commitment was made to talk to Nick about evaluation, model improvements, and the model training pipeline infrastructure to determine Nick's priorities.

**Address TAC Forge signing** The necessity of discussing the TAC Forge pipeline with Nick upon their return was raised. This discussion must focus on how to get the 'mil tagged APK' signed.

### DETAILS

1. **Establishing Communication Channels and Seeking Support:** Abel recommended logging into Mattermost chat to facilitate requesting support from Nick and others regarding various stages of TAC Forge and other matters. The team was advised to establish these communication channels and reach out for assistance when facing difficulties.

2. **Clarifying AI Evaluation Objectives and Priorities:** Abel identified the need to understand the "AI evaluation" objectives concerning God's GS, noting that this area is vague. They committed to talking to Nick about evaluation, model improvements, and the model training pipeline infrastructure to determine Nick's priorities and then establish a team approach. Abel also committed to providing the team with more direction and priority on their work by the following day.

3. **Addressing the TAC Forge Signing Pipeline:** Thoma raised the need to discuss the TAC Forge pipeline with Nick upon their return, specifically how to get the "mil tagged APK" signed. Abel agreed that this topic needs to be addressed .

---
## MY SUMMARY -- from (U) Synch / Status - 1400 March 26, Thursday

### PART 2 — TAK UI maturity, dual-track approach, and platform focus 
> TAK UI is beta, unstable, and Booz Allen owned. The team will maintain the current ATAK plugin while developing TAK UI in parallel. Mobile ATAK is the confirmed focus. WebTAK and TAKX are deprioritized for now.

#### Decisions made:
- Two-baseline approach confirmed — maintain current ATAK plugin while developing TAK UI in parallel.
- Mobile ATAK is the primary focus. WebTAK and TAKX are deprioritized for now.
- GRG outputs will populate to web and laptop platforms even if not fully optimized there.

#### New information:
- TAK UI is a Booz Allen effort, not TPC. Nate Biddell is the primary point of contact.
- TAK UI 1.0 timeline is currently being defined in conversations between Nik and Booz this week.
- TAK UI beta status means API could change between releases — documentation is still limited.

#### Risks and dependencies:
1. Maintaining two baselines adds ongoing engineering overhead with no defined end date.
2. No "graduation" criteria defined — unclear what triggers cutting over from ATAK plugin to TAK UI.
* Known Risk: No stable TAK UI version to build against. Risk of building on a moving target.

#### Open questions:
- When does TAK UI reach a stable 1.0? What does stability actually mean in practice?
- What is the formal process for flagging TAK UI issues back to Booz-Allen-Hamiltn (BAH) through Nathan Biddell?
- What does "functioning similarly or better" mean as a cutover threshold?

#### Action items:
1. Document and confirm the two-baseline decision back to SOFMC/SOCOM in writing.
2. Connect with Nathan Biddell as primary TAK UI point of contact.
3. Get Nik's input on TAK UI 1.0 timeline after his conversation with BAH.
4. Start and maintain a WebTAK and TAKX backlog even though deprioritized now.

### PART 3 — Model improvement expectations and current performance issues 
> Priority is improving the existing model, not replacing it. Key issues are intermittent detection failures and zoom level sensitivity. Jonathan Miller (John M) wants better consistency, accuracy, and speed — not perfection. A bug may be causing the intermittent failures, not the model itself.

#### Decisions made:
- Priority is improving the existing model, not replacing it. A model swap is acceptable only if it is low effort and achieves the same outcome.

#### New information:
- There is an intermittent detection failure — same area, same zones, no buildings detected on first run but buildings appear on second or third run. Likely a bug, not a model accuracy issue.
- Zoom level affects model performance. Lower image fidelity at higher zoom levels reduces detection quality.
- Johm M's definition of "improvement" is practical — better consistency, better accuracy, faster performance. Not perfection.

#### Risks and dependencies:
1. The intermittent detection failure could be a bug in the plugin, not the model. If treated as a model improvement it will never get fixed.
2. "Improvement" is subjective and not yet tied to measurable criteria. Without defined acceptance metrics, done will be hard to prove.
3. Zoom level dependency suggests the model may be sensitive to image resolution — a data quality and training data diversity concern.

#### Open questions:
- Is the intermittent detection failure a plugin bug or a model issue? These require completely different fixes.
- What is the acceptable detection rate — if there are 10 buildings, is 8 good enough or do we need 9 or 10?
- What is the baseline today — how consistently does the model detect buildings across different environments?

#### Action items:
1. Isolate and reproduce the intermittent detection failure before classifying it as a model or bug issue.
2. Document zoom level sensitivity as a known constraint and flag it as a training data diversity issue.
3. Define measurable acceptance criteria for model improvement with John M and Nik: precision, recall, consistency threshold.

#### PART 4 — Expanding AI Opportunities Across Existing Plug-ins (GOTS Evaluation) 
> GOTS evaluation covers 20+ BAH owned plugins. The mission outcome is reducing operator cognitive burden, not adding AI for its own sake. This is effectively a second discovery track running in parallel — scope, timeline, and deliverable format need to be clarified with SOCOM.SOFMC urgently.

#### Decisions made:
- GOTS evaluation scope is broader than originally understood — 20 to 21 plugins, not just the GRG plugin.
- The evaluation lens is AI opportunity identification — where can cognitive burden be reduced across existing plugins.
- User feedback will come from John M and Nik for now, with Marine users from the competition as secondary sources if available.

#### New information:
- BAH owns most or all of the 20+ plugins. Access requests need to go through them.
- Some plugin codebases may be private repos — access is not confirmed and needs to be verified.
- Nik likely has 1 or 2 priority plugins to start with — general evaluation of all 20+ is the broader direction.
- The AI opportunity framing is consistent with GRG — repetitive tasks, computer vision, labeling automation, reducing setup steps.
- *John M and Nik have articulated a clear mission outcome: operators should spend less time looking at their phones and tapping through screens, and more time focused on what matters operationally. Cognitive burden reduction is the mission-outcome, but I still need to answer the "So What = Mission Impact*
- Real-time candid feedback from fielded units will come once the plugin is deployed to interested units.

#### Risks and dependencies:
Access to 20+ plugin codebases is not confirmed. Booz Allen is the gatekeeper and a hard dependency before evaluation can begin.

1. No structured feedback mechanism exists yet for capturing operational user input at scale.
2. Tunnel vision risk: approaching all 20+ plugins through an "add AI" lens without a structured prioritization framework will produce low value recommendations. A rubric or 2x2 is needed before any evaluation begins.
3. Scope could expand significantly if they want to evaluate many of the 20 plugins without prioritization from Nik first.
4. The GOTS evaluation for 20+ plugins is effectively a second discovery and scoping track running in parallel to active development. Two parallel tracks in a 10 week contract is a real capacity and focus risk.
5. Marine user availability is uncertain — deployments and schedules may prevent direct feedback access.

#### Open questions:
- Is the GOTS evaluation a deliverable within this 10 week contract or is it scoping work that feeds into the next contract?
- Which 1 or 2 plugins does Nik want to prioritize first?
- What does the evaluation deliverable look like — a report, a briefing, a prioritized recommendation list?
- What is the timeline expectation for evaluating 20+ plugins within a 8 week contract?
- How do we formally request access to BAH owned plugin repos?

#### Action items:
1. Confirm with Nik which plugins to prioritize for the initial evaluation.
2. Request access to plugin repos through BAH — identify the right point of contact.
3. Build a prioritization rubric or 2x2 before starting any plugin evaluation. Criteria grounded in operator pain points and use cases, not technical AI feasibility alone.
4. Frame all evaluation recommendations around the cognitive burden reduction outcome — every suggestion should answer "how does this help the operator focus on the mission instead of the screen?"
5. Establish a structured feedback channel with John M and Nik for user input.
6. Clarify evaluation deliverable format and whether it belongs in this contract or the next one.

#### PART 5 — Versioning Strategy and Release Process Alignment 
> Develop on SDK 5.6, cut backwards to the currently fielded SDK 5.4. This is standard KMER release practice for all future SDKs. Booz Allen owns the release process and is the recommended guide — contact already established via Mattermost.

#### Decisions made:
- The team will develop on SDK 5.6 and cut backwards to SDK 5.4 — both versions must be supported.
- BAH is the recommended point of contact for production release process guidance, not TPC.
- Backward version signing happens through the TAK Forge release pipeline — there is a step to specify the target version.

#### New information:
- SDK 5.4 is the currently fielded version that can be pushed to devices today. SDK 5.6 is the target development version.
- The standard release process is always develop on the latest SDK and cut backwards to whatever is currently fielded. This applies to future SDK versions (5.7, 5.8, 5.9) as well — not just this contract.
- BAH cuts builds daily or weekly for SOFMC/SOCOM. They are the most familiar and available team for release process guidance.
- A Mattermost channel with Booz Allen already exists — communication path is established.

#### Risks and dependencies:
1. Supporting two SDK versions (5.4 and 5.6) simultaneously adds build and testing overhead. Both versions need to be maintained, tested, and released.
2. If the backward signing step in TAK Forge is not well understood by your team, it could become a release bottleneck.
3. Dependency on Booz Allen for release process guidance — if they are unavailable or slow to respond, it could delay your first production release.

#### Open questions:
- Is the backward signing process in TAK Forge documented anywhere our team can reference independently?
- Are there any known compatibility issues between the current plugin codebase and SDK 5.4 that need to be addressed before cutting back?
- What is the expected cadence for cutting releases — is there a schedule aligned to SOCOM's fielding timeline?

#### Action items:
1. Confirm the backward signing step in TAK Forge with Booz Allen and document it for your team.
2. Set up a working session with BAH to walk through the production release process.
3. Ensure the build pipeline supports generating both SDK 5.4 and 5.6 artifacts from the same codebase.
4. Add dual SDK support (5.4 and 5.6) as a known constraint in your release planning.
---
### Notes from (U) Synch / Status - 1400 March 26, Thursday

#### JOHN FEEDBACK ON MMODEL IMPROVEMENT, Right now
- when we run the model on "areas" it doesnt detect buildigs
- how do we get that one more building
- Greater efficiency
- Differnet Model? MAYBE
**KEVAN** can you go deeper in the zooming in and out?
- JOHN: if you are WAY ZOOMED OUT, its not gonna detect as well, We would set up section, Area of INterest, Label, Run it and it would say NO BUILDING detectede.

#### GOTS EVAL
- 20, 21 Plug-ins they fiend and sustain
- nik has a list
- what are areas we can implement AI
- or capabilities
- Less cognetive burnder, so the user is staring at is phone less, focus more on important than the screen 
> KEVAN: Do we have access to those plug-ins?
Modularity and scalability
Jonathan - TAK UI, its beta NATHEN  BAH, not TPC, 
NO TIMELINE FOR v1.0
--
#### portability
> KEVAN: fair for us to maintain the current ATAK plug in?
Fully PIVOT to TAK. UI issues.. "stab ility"
2 prong approach
BUT dive TAK UI
hesistant to sign off on a FULL PROD PLUG IN
>jonathan agree, but maintain two baselines
Once it hits 1.0

> Q. WebTAK? - A lot of people, Make WebTAK look like ATAK
TAK UI for mobile vs Web, let's stick with Mobile for now
GRG files can sstill be populated
if we need to add stuff for future, for WebTAK we will address

TAK Forge Pipeline, there is a point in thet pipeline, to sign it backwards
Kevan, cutting prod releases
go through VAH folks or TPC?

---

#### MARCH 27 - Friday 1015 - Daily Stand Up

**GO BACKS & BLOCKERS**


- signed .mil APK --> blocker
- **"DUAL TRACK Strategy"**, confirm and relate back to SOCOM dev in `.5.6`, cut back to `5.4 ` to release
- GRG plug-in TAK UI version is in `5.5` ? 
- Reach out to Nik (GOTS eval) new workstream & also to get in contaact with Nathan B, BAH
- Documenting Josh's TAK UI discovery/baselines



#### MARCH 26 - Thursday, Daily Stand up [abel's notes]

Thomas:
.mil SDK, test that on emulator

KEV
- latest ATK .mil on phone
- Josh chatting, TAK UI difficulties
- NOT anti-TAK UI, cautious, We dont feel comfortable commmitting
 as much testing as possible
 - see where TAK UI goes..

 ZACH fraework mapping
 - login to TAK, cant log x506 credential error
 - asked Kevan, to get auth through his Ris8 email

 TAK UI 
Angles
1- usabiity (cost vs benefit), A true ATAK native vs Web plugin
cover that and the differences between phone vs web
on wintak wehave a persistant nav bar, more info
re-suability

2- TAK UI prod readiness

--

### MARCH 25 - Daily Stand Up

YESTERDAY
* UI Framework Mapping
* Created Stories/chores for TAK UI migration
* Sprint Plan

TODAY
* DENTIST 2pm
* Testing v5.6 (emulator)
* Create chores/bugs
* Prepare for the Progress Update (same slide deck?)

BLOCKERS
- TAK Forge access: US person form, Suppor Ticket submitted

Finish UI Framework Maping
Got into TAK UI
Josh is setting that up?
5.6 everything works, left comment

- Wayland Devices shipping

GO BACK

- TAK UI Migration
- get .mil installed , install CIV ad install the .mil plug-in
-  Go to Pipeline --> JOsh Miller commmit, mil SDK [browse], APK, .mil, 
- check our manifest file 0 rgraddle, turn debug off
- AI GRG update the name and the Icon

SPRINT PLANS ready for Thursday
Get stuff from Nik

Josh is exploring
GRG plugs

A convo witj Nik - for peer usability, Mobile varient
and Web varient
TAK UI is not mature for anything outside 
ATAK runs on andorid
WebTAK runs on laptop
there are different usability concerns, curated for
mobile vs desktop
Start PUSHING BACK "reasons why we should"
mattermost

#### MARCH 24 - DAILY STAND-UP

* Abel, access to TAK Forge
> my request to TAK forge (PO)
* Backlog?
> 
* Create 5.6? 
* Josh miller upgraded to 5.6
- more stability investigation
- MFR signed
Josh is former Rise8 (OG), He is at Kohls
WebTAK proposal, he has experience
Primary plug-in dev
1099

#### BACKLOG PREP
1. Complete TAK UI framework mapping artifact (Zach in progress)
2. Confirm JDK 17 installed on all dev machines (DONE)
3. Confirm Kotlin vs Java split in codebase (YES, but read below)

3. Mases pointed out java files that are core SKD related to  AI/ML detection logic - does **NOT** block TAK UI migration
> Most of the plugin is already in Kotlin. The remaining Java files are in the core SDK — inference, labeling, metrics, and processing — all AI/ML detection logic. They are not blocking the TAK UI migration and will work fine on 5.6. Do we convert them to Kotlin now while we're in the codebase, or leave them as-is for now?

4. Dual-signing setup — High priority per the migration table
* Plugin must be signed by Rise8 first, then by TPC before it can deploy
* Without this, the migrated plugin cannot reach real users
Plugin must be signed by Rise8 first, then by TPC before it can deploy
Without this, the migrated plugin cannot reach real users
    1. Rise8 signs it — with our own developer certificate, confirming we built it
    2. TPC signs it — via TAK Forge, confirming it's approved for the TAK ecosystem

5. ProGuard configuration — required for production signing, known failure point
* Shrinks and scrambles code to protect it; specific TPC rules required for production builds.
* Misconfiguration is a known build failure point during the signing pipeline

### 6. Dropdown receivers refactor — side panel UI migration to Flutter/Kotlin fragments
* Side panel menus and tool interactions rewritten as responsive Kotlin/Flutter fragments
* This is where most of the GRG plugin's user-facing controls live


### 7. Map components refactor — overlays and map interactions
* Visual elements rendered on the map — overlays, icons, detection results
* Direct migration of how the plugin displays GRG grids, sections, and building labels
> Flutter is Google's framework for building UI that runs across multiple platforms from one codebase.

--

## Slack huddle with Josh M 1717 March 26 

Android SDK package, 
- updated to the rise8 plugin 
- convertion to TAK UI woudl be nice

RADIAL MENU WORKING WITH TAK UI
- we are good
- styling
- Big questions, UI, radial menu and action tool bar
- Radial Menu IS COVER for TAK UI
- He is gonna, take what he has, clearn it up
- push it as a baseline, 
- Some of the foundatinal stuff is there but not complete
- CHANGE SIZE - The Center, Grid gets defined, 
BASELINE, we can get there with TAK UI, APK 5.5.0

TAK UI, declerative, they dont want us to do certain things.
action tool bar (singleton)
It took up that space (tool bar)
THE CIRCLE + 

WinTak work, SDK java component, standard output
load it up, Jav arunner, jave process and talking to it standard
i/o - 
WebTAK, better than winTAK

He things we should get the Original one in Prod, 

WHAT HE IS WORKING ON
- discovery, how tak UI works.. 
- we have some foundational stuff
JOSH ADVISE --> Sit downm put TAK on it and start using it
you need to understand how it works
and how people use it. `jmiller@rise8.us`

Lattice OS -Anduril (their version of ATAK)
xrai

SDK "not signed" like prod, signed with differen tproperties
tntnt gets signed, the .mil flavor stuff, is the regular SDK

atak.apk , , mil.flavor 15.6mb, but 384 , we always ATAK APK
what we care is build.gradded. CREATE CIV and MIL, Civ is baseline
mil signed, prod signed then it can work on 

WEEKLY PM MEETNG

- Nizme is new
- Tempplates and formats
- THE WAY WE DID IT LAST TIME

Thomas has access to the TAK UI documentation, what are some specific 
---
# LARGE SCALE

Set-up ITERATIONS


Gameplan together
Flexible

SPRINT 1
- update plug-in v5.6
- TAK UI Migration
* 
SPRINT 2
SPRINT 3

Saga = 1 tier higher and an epic (odyssy)

Kevan EPICS

- SOW #s + "SOW Delivery Expectations" = a checklist

Kevan, GOTS eval
* mission areas we can lean in
* other GOTS eval for, P2P (TAK Forge)

KEVAN MAYB FOCUS ON THE WORK

- Abel, do whatever you want for GOTS Eval 

Kevan we need a new plug-in icon

FLUSH OUT MORE TAK UI

RIGHT NOW our GitLab, CANT
- LFS 
- Registry
--

Get time with Thomas and Zach

---

Nik C
Nizme --> John Miller

We need to start working righ tnow
Nizme's expectations "we are fully working right now"

Max: The GOV is paying us for FT work today, We need to demonstrate
If they schedule a PI planning, we need to be there

NIC is our main POC, what needs to get done (i focus on this)
Sharon and Shannon = NIZME/JOHN 