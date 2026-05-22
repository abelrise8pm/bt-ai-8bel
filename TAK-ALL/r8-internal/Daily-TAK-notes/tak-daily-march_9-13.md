# March 9th - TAK project pairing (Kick-off and GitLab)

### SUMMARY
The team established a client kickoff agenda with icebreaker considerations, reviewed key stakeholder profiles, and outlined execution-focused contract goals.

**Kickoff and Stakeholder Review**
The team decided to include a brief recap of the TAC mission in the kickoff while considering an icebreaker for a more casual atmosphere. Stakeholders Jordan Boring (Acquisition Program Manager) and Jonathan Miller (Technical PC) were profiled, with Miller confirmed as the authority for technical decisions.

**Workshop and Documentation Approach**
A stakeholder mapping workshop was proposed for the kickoff to define core collaborators, likely including Jordan Boring and Jonathan Miller. Communication expectations were confirmed, including two-week Agile sprints and the continued use of TAC Forge for the software delivery pipeline.

**Contract Goals and Execution Focus**
The current 8-week contract is execution-focused, with 4 specific goals including SDK compatibility and estimating a rewrite cost, differing from general mission impact goals. The team must clarify the vague goals of improving the detection model and defining the scope for the government software evaluation.

### DETAILS

**Review of TAC Outcomes and Impact:** The discussion started with a review of TAC's overall mission, outcome, and impact, which speakers agreed the clients should already be aware of due to prior sprint demos. It was decided that a very brief recap to ensure nothing has changed is appropriate for the kickoff, but they should not spend much time on it since the core mission is unlikely to change. The speakers suggested using a short statement to confirm they remember the mission and then move on (00:00:00).

**Kickoff Agenda and Icebreaker Consideration:** The speakers discussed the agenda for the client kickoff, noting the previous challenge atmosphere was formal and business-like, lacking time for casual activities (00:01:22). Jonathan Van Dalen suggested considering an icebreaker or more casual starting point to better understand the people they will be working with, given they do not know the clients well (00:02:23).

**Key Stakeholder Profile: Jordan Boring:** The speakers documented their current knowledge of Jordan Boring, identifying them as the Acquisition Program Manager overseeing the program's interest, dependencies, and managing blockers for TAC (00:02:23) (00:04:26). She was described as friendly, with positive communication regarding the previous award, and was noted for her focus on user work and context (00:03:33). Jonathan Van Dalen stated their sentiment toward the team is good, and they are a civilian (00:04:26).

**Secondary Stakeholder:** Britney Busher: Britney Busher was identified as a potential stakeholder, possibly managing TAC at a higher level. Jonathan Van Dalen expressed doubt that she would be a core collaborator, and stated they have no history of communication with them. Her name was sourced from the draft Statement of Work (SOW) (00:05:27).

**Key Stakeholder Profile:** Jonathan Miller: Jonathan Miller was identified as the technical authority (Technical PC) at TAC, responsible for making technical decisions and accepting technical work. The team will consult him regarding the target SDK version, UI framework interests, modularity, scalability, and the assessment of government applications. Although he was involved in the previous 8-week challenge, he was not highly vocal, and the team does not know much about him (00:06:29).

**Stakeholder Mapping Workshop:** The discussion transitioned to a proposed workshop item for the kickoff, which involves creating a stakeholder map to define levels of engagement (Core Collaborator, Involved, Informed). The intent of this exercise is to clarify who the team will collaborate with daily or weekly, with Jonathan Miller and Jordan Boring assumed to be close to the core (00:08:47). The speakers acknowledged that new players may be introduced and that this stakeholder exercise could be the first real agenda item for the workshop (00:09:57).

**Organizational Structure Visualization:** Abel Hernandez emphasized the value of creating a visualization, such as an org chart, for the different entities under SOCOM (00:10:53). Jonathan Van Dalen suggested creating an org chart structure, potentially involving entities like SOCOM, Softworks, and the TAC Product Center (TPC), either by workshopping it live with the client or by piecing it together beforehand and reviewing it (00:11:45) (00:13:48). The proposed draft agenda items include a brief reminder of TAC impact, stakeholder mapping, and then org structure definition (00:14:51) (00:16:40).

**Communication and Documentation Approach:** The team reviewed communication and documentation expectations, confirming meetings will be held over MS Teams with two-week Agile sprints, weekly status meetings, and demos after every sprint (00:18:11). A key communication question is whether the client is open to using a Teams channel for informal collaboration, as the previous method was email (00:20:30). Abel Hernandez confirmed that the two-week sprints and weekly status meetings are expected (00:19:12).

**Story and Delivery Tracking Tooling:** The speakers discussed story and delivery tracking, noting that Kevin and Thomas have already established a Rise 8 internal GitLab repository (00:21:26). The team's assumption is that GitLab can serve as a performance management system, covering planning and reporting, and that the government will accept GitLab exports and artifacts as compliant submissions (00:23:19). The possibility of the government requiring a Jira-based format or a specific submission portal needs to be confirmed at kickoff (00:24:28).

**Reporting and Artifact Compliance:** The team reviewed expectations for reporting artifacts, including the final report/briefing, which should be maintained as a living document updated continuously to avoid a last-minute scramble (00:25:41). Jonathan Van Dalen confirmed the need to discuss the format for documents such as the software evaluation and estimates (00:26:37). The use of TAC Forge for the software delivery pipeline, as was done for the prototype, will continue to be the mechanism for getting the working APK out, while Rise 8 GitLab will handle story tracking and evidence export (00:28:53).

**Bridge Contract Goals and Delivery Focus:** Jonathan Van Dalen articulated that the current 8-week contract is execution-focused, primarily requiring deliverables rather than problem-solution thinking or mission impact, which is a key difference from Rise 8's general culture (00:32:34). They noted that this 8-week effort is not expected to significantly advance user outcomes or mission impact, but rather to enable the software to function and be deployed by making it up to date (00:33:59). The conversation needs to be managed internally to ensure Rise 8 understands this is an execution contract and that these are enabling goals (00:32:34) (00:42:30).

**Defining Specific Engagement Goals:** Four specific engagement goals for the contract were reviewed: updating the SDK compatibility, estimating time/ cost for a rewrite in the new TAC UI framework, improving the detection model, and evaluating existing government software for modularity and scalability. For the SDK compatibility, the specific target version needs to be clarified, likely by asking Jonathan Miller (00:36:04) (00:39:55).

**Clarifying Model Improvement and Scope of Evaluation:** The goal to "improve the detection model" is vague because there is no defined metric or standard for improvement, requiring the team to define an experiment and a testable metric (00:37:59). The evaluation of existing government software for modularity and scalability also requires definition of scope, specifically which software and what information the client is seeking, as the current request is broadly stated (00:39:55). Jonathan Van Dalen expressed a belief that the client is likely viewing these four goals as a checklist to be completed during the contract rather than expecting prioritization (00:43:51).

**Prioritizing Unknowns for Internal Sync:** Abel Hernandez planned to curate a list of urgent assumptions and unknowns, especially regarding the broad goals, for an upcoming 30-minute sync with Kevin. The prioritization will focus on documentation and specific delivery goals, with a goal of making progress on the artifacts before the client kickoff (00:48:24) (00:50:58). Key priorities include clarifying the modularity and scalability evaluation scope and defining the technical target SDK version (00:49:39).

**Key Dates and Milestones:** Jonathan Van Dalen emphasized the need to use the kickoff to capture accurate key dates and milestones, as the dates in the SOW are incorrect. Specific dates to confirm include PI planning status, code baseline expectation, and the management status report and final demo dates 

---

# March 9th - TAK Bridge contract pre-kickoff assumptions

### SUMMARY
Contract scope and deliverables were clarified with a production-focus confirmation, with a major decision to prioritize the TAK 5.6 upgrade.

**Contract Scope and Focus**
The 8-week contract objective focuses on ensuring the team's TAK plugin is compatible with TAC UI components on TAK 5.6. The team confirmed the contract is largely execution-focused, treating the 4 delivery goals as a checklist rather than a prioritization tied to mission impact.

**Deliverable Tasks and Outcomes**
The team was advised to use the 4 delivery tasks/goals as a baseline while attempting to clarify their exact meaning or how to support them during the project. It was determined that the primary goal is getting the product into production for real-world use and measuring the enabling outcome of production readiness.
> Abel's takes: The "4 delivery task or goals" is the unofficial way to refer to upgrading the plug-in to v5.6, "research/estimate" that it's compatible with the TAK UI, Improve the detecton model, evaluate existing gov software for modularity and scalability(moderniation). A potential risk I need to adress is that these 4 things are vauguely and loosly defined. Action item! align on what are the customers expectation and what constitutes done for us.</>

**Long-Term Project Success**
The team was requested to focus beyond the 5.6 upgrade to codify a model training pipeline for the follow-on OT contract. The team must obtain TAK Forge access to acquire TAK 5.6 to start the necessary plugin upgrade work immediately.
> Abel's takes: So another very important aspect of this project. I need to confirm and understand. Kevan seem to want us to "go above" just following the requirements checklist. It appears that an objective/goal for him is for us to also "codify a model training pipeline" as this could help us be successful once the contract expands. Questions for me are many. We will touch on this more, but for example, 
* what does that effort involve in terms of hours and people
* how do we "manage" it as in, do we treat it as a spike, do we just do the work, does the customer know about it? Are we beeing stealthy about it or do we make it part of the roadmap. 
* Abel, make an OORM
</>

### DETAILS

**Scope of GOTS Software Evaluation and Requirements:** The initial assumption was that Kevan could help define the scope of the government off-the-shelf (GOTS) software evaluation, specifically which applications are in scope and what is meant by modularity and scalability. Kevan stated that they do not have anything defined and that this is a "really weird contract overall" with uncertain expectations, potentially looking toward a longer-term OT contract (00:03:37). The only confident objective for the eight-week contract is to ensure the team's TAK plugin is compatible with TAK UI components on TAK 5.6 (00:05:01).
> Abel's takes: Ok, So here we are starting to raise some risky assumptions. It's acknowledge that the contract is "weird", while we do have some strict and expected deliverables (ensure the team's TAK plugin is compatible with TAK UI components on TAK 5.6) which is two of the four. We should get on the same page about the modernization part (software evaluation, modularity and scalabilit). Kevan acknowledge nothing is defined. So, when is the best time to get this defined? Ideally before March 18th, kick off. And I need to understand more around "potentially looking toward a longer-term OT contract " It was brought up a few times by Kevan how it would benefit us in the long term, for us to think beyond 8 weeks. I need to undersand this more.
</>

**Contract Focus and Deliverables:** The team assumed the bridge contract is execution-focused, treating the four delivery goals (SDK modernization(UI KIT), rewrite estimates, AI/ML model improvements, GOTS evaluation) as a checklist rather than a prioritization exercise tied to mission impact. Kevan confirmed this focus is largely correct, noting that the goal to get the plugin onto TAK 5.6 is aligned with a production focus, which aligns with RO's existing approach (00:06:04). They believe the request for research is likely "legal ease" to justify using the contract vehicle, suggesting the actual expectation is to perform the work.
> Abel's takes: It's further assumed that the four "requirements" and our the "four goals" are loosely around 4 categories, and they are often swaped and interchangably referenced. I need to put forward clear titles and descriptions and ensure the customer, and our team 100% undersatnd them. Two other key concepts to get out of this. #1 We must get 5.6 to prod! That is an outocome, and we also don't have the user data to make improvements on the model if we are not in prod, So that is our biggest enabling outcome. Get to prod with 5.6 and get actual user data. the #2 part of this is that we are assuming the way the customer is referencing "reasearch" is more about the contract language and our "busienss norms" they want us to do the work. So, how do I sort that out?</>


**Clarification on Real Outcomes and Deliverable Tasks:** There was discussion regarding whether the listed four delivery tasks are the definitive objectives or if the team should try to draw out the real outcomes. Kevan suggested using the four tasks as a baseline while attempting to clarify their exact meaning or how to support them during the new phase. Nik reportedly wants to get the product out in the field as soon as it is on 5.6, meaning outcomes in production, although quantifying exact user metrics might be challenging.
> Abel's takes: I need to reference the SOW (and any other gov language) so that I can define what we call thee "four" task/requirements/goals that keep being brought up. Yes, once the product is out in the field, we have a shot at outcomes. I need to get ahead of that and seems I need to work closely with Nik is like a PM for TCP and or TAK, on the customer side..</>


**Measuring Outcomes and Production Readiness:** The team discussed the scope of work and whether they would be able to measure outcomes like time saved by the end of the eight weeks (00:10:55). Kevan clarified that the product being ready for production is an enabling outcome, and they hope to claim the user outcome (e.g., creating an accurate GRG in less time) once it hits 5.6, making this a goal (00:09:54). They reiterated that the government wants them to *do* the work to get the app in the field for real-world use, viewing the contract's "research" language as a mechanism for faster movement.
> Abel's takes: So, very important. circleing back on a few points (assumptions) that were made earlier such as that the "research" mentioned in the SOW/constract is not necesserarily advocating to conduct a comprehensive "research" phase and only provide some document. Research is always continious and part of the work effort to get this plug-in to v5.6 (enabling outcome) and then getting it in the hands of users, so we can get at a real user outcome. for example; creating an accurate GRG in less time. So we have a clear Enabling outcome, Not only getting 5.6 into prod, there will be effort ince TAK Forge and TAK Product Center are involved and we have dependencies. (I think is worth calling out that I need to push for mapping the Path to Prod VSM)</>


**AI/ML Detection Model Improvements:** The team sought clarification on what "improving the AI/ML detection model" means, specifically which metric or criteria would signal improvement (00:14:09). Kevan indicated that the team should expect to receive more information on specific areas the government wants to improve, noting that some improvements might relate to inference strategies (like section-based inference) rather than only model training (00:15:02). Kevan prioritized the 5.6 upgrade over model improvements, suggesting the latter might be a secondary focus, potentially leading to research on improvement strategies depending on required areas.
> Abel's takes: Great call out, this is also a big focus for me as PM. I should expect and request this "more information on specific areas the government wants to improve, noting that some improvements might relate to inference strategies (like section-based inference) rather than only model training" I agree, 5.6 is our biggest priority and it would also help me know and understand the various "categories" or "criteria" where they want the model to be improved and define how we would measure that according to best practices</>


**Impact of SAFE/PI Planning on Delivery Cadence:** The team inquired whether SOCOM's SAFE/Program Increments (PI) planning would impose hard constraints on the team's two-week sprint cadence or delivery window. Kevan stated that they will likely conduct touchpoints with the government for sprint planning and completion, which involves presenting the plan and summarizing completed work (00:18:18). These touchpoints are largely a "checking the boxes" activity and should not impact overall delivery, serving more as a contractual requirement rather than a limitation (00:19:24).
> Abel's takes: Fair, as a Product Manager I need to have those comms and the relevant content ready, in a format that gives the customer the insights they need to be informed and make decisions
</>

**Artifact Delivery Systems:** The team asked if the government would accept GitLab exports instead of Jira-based artifacts for compliant artifact submissions. Kevan confirmed that the government does not care about the system, as they use GitLab internally on TAK Forge, and the mention of Jira was likely boiler plate contract language (00:20:25). The team's established GitLab repository is deemed the correct system for planning and tracking, though DefenseWERX (DWX) (who is funding the contract) might require a specific submission for payment, possibly involving administrative double entry (00:21:21).
> Abel's takes: GitLab is a go, and abel would just be aware of the gov wnats another format
</>

**Projected Key Delivery Dates:** The team sought confirmation on key delivery dates, which the integrated master schedule relies upon. Kevan noted that the dates are incorrect from the Statement of Objectives (SOO) because the start date is changing, and they expect the deliverables to be the same but shifted to align with the new start date (00:22:29). The contract is unlikely to kick off on the 11th and might not start until March 16th or 18th, as funds are in a holding pattern (00:23:27).
> Abel's takes: That has been confirmed, that the contract will kick off on Wednesday March 18th. I also need to confirm with Sharon or Kevan if we are expecting an updted SOO (Statement Of Objectives) from the gov customer that's more specific then the SOW.. Is this where we get more clarity on some of our questions/assumptions
</>

**Stakeholder Mapping and Communication Styles:** The team aimed to be briefed on the communication styles, priorities, and decision-making patterns of confirmed core collaborators: Jordan Boring (Acquisitions Program Manager) and Jonathan Miller (Technical Point of Contact). The stakeholder mapping identified Nikolas (Nik) Klein as another key contact whom the team expects to interact with frequently, noting that Jordan Boring is expected to go on maternity leave in May or June (00:27:00). The role of Britney Busher, whose name appeared in the SO draft, needs to be confirmed, as she may be a DefenseWERX (DWX) liaison or at a higher program office level than Jordan (00:28:10).
> Abel's Takes: Nothing here aside from, make sure Jonathan updates the stakeholder map and org chart
</>

**Kickoff Stakeholder Expectations:** Kevan confirmed they are known by the stakeholders and that the team needs to confirm who the government will send to the kickoff stakeholder mapping exercise. Due to the contract's small size (one and a half full-time employees for eight weeks), Kevan suggested they will have a small kickoff to gauge the situation, as having too many team members present without expectation might be shocking (00:30:12). The full intent is to involve everyone, but the team will proceed cautiously until they receive the final Statement of Work (SOW) (00:31:29).
> Abel's Takes: So, for me I need to clarify, who are the Risers (my colleagues) that should be "customer facing", for example, as we wait to get the final SOW or SOO... Who is ok to show up so that the customer doesn't get "shocked". I am also assuming those who dont come, will still be involved, just not directly.
</>

**Focusing on Long-Term Success (OT Contract):** Kevan expressed a need for help transitioning the current effort to ensure success in the follow-on OT contract (00:32:28). They advocated for focusing beyond the 5.6 upgrade to codify a model training pipeline, obtain information on problem areas from Nik and John, and address longer-term issues like inference detection and usability concerns with TAK UI components (00:33:29). Kevan wants the team to avoid "tunnel vision" on just 5.6 and instead focus on setting up the project for long-term success with the OT contract (00:34:30).
> Abel's Takes: This is in my top 3 of issues to watch, plan and execute. As a Product Manager, I need to set the vision, impact and the north start beyond just getting the plugin version to 5.6, that' just the first few weeks. I need to fefined some goals around feasibility and viability/desirability themes
* to codify a model training pipeline
* obtain information on problem areas (pain-points)
* address longer-term issues like inference detection
* usability concerns with TAK UI components
Get on this!
</>

**Access to TAK Forge:** The team needs TAK Forge access to acquire TAK 5.6, which they do not currently have. Kevan requested that Thomas Reynolds and Zach Greenlief check if they have TAK Forge access (the government's GitLab and CI/CD) to look at the 5.6 framework and start upgrading the plugin to use 5.6 dependencies and TAK UI (00:39:44). TAK UI components are designed to allow the plugin to be written once and ported to TAK and TAK-X (Linux-based), which is expected to be the future replacement for WinTAK (00:40:51).
> Abel's Takes: So as a PM I need to do the follwing
* Check in with Thomas, has he and Zach gotten TAK Forge acesss
* Ask and get help on how do I get access?
* There are also other on going access and onboarding request: (Kevan request that Thomas can you start onboarding everyone else with ATAK as well? Help people find the repos, clone, and build to Android Stuidio?)
* For everybody for onboarding, make sure you're setup with 1password! It makes using our new internal GitLab instance much easier.
* Additionally highly recommend installing 1password CLI so you can automatically pull all those secrets and keys from your terminals
* We won't have access to TAK-UI docs/repo until we get forge access again. Everything is locked behind appgate.
* additional context from Slack on getting on-boarded to ATAK

*Onboarding Process and Development Setup*

* Kevan is requesting @Thomas to help onboard team members to *ATAK* (Android Tactical Assault Kit), which is a specialized military/tactical mapping and communication platform used by special operations forces [1]. Based on the project context, Rise8 has developed an AI/ML plugin for ATAK that automatically detects and labels buildings on map imagery to create tactical reference graphics (GRGs) for mission planning.
> Thomas Step 1 for everybody for onboarding, make sure you're setup with 1password! It makes using our new internal GitLab instance much easier. See our IT documentation if you haven't set it up already. I also recommend downloading the app for easy password/secret/key/etc. access

*Key Technical Processes:*

*Repository Access and Cloning*: Thomas needs to guide team members through finding the correct code repositories (repos) and using Git to clone them locally. From the surrounding context, Jonathan mentions having Android Studio set up but pointing to an "old repo" [2], indicating version control challenges common in active development.

*Android Studio Setup*: Android Studio is Google's integrated development environment (IDE) for Android app development. The team needs to configure it to build the ATAK plugin, which requires connecting it to the proper source code repositories and ensuring all dependencies are properly configured.

*Build Process*: "Building to Android Studio" refers to compiling the source code into a runnable Android application or plugin. This involves setting up the development environment, resolving dependencies, and ensuring the code can be compiled and tested locally.

The subsequent messages show Thomas is working on getting ATAK running in a simulator environment [3], which is essential for testing without physical devices. The team appears to be transitioning from prototype to broader team development, requiring systematic onboarding to ensure everyone can contribute to the ATAK plugin development effectively.

**Update from Thomas on-boarding onto ATAK and setting up**
Thomas: We won't have access to TAK-UI docs/repo until we get forge access again. Everything is locked behind appgate.
</>

# March 12 - TAK Alignment before Kick-off

### SUMMARY

TAK project review involved clarifying vague AI/ML improvements and GOTS evaluation criteria for the 4 SOCOM tasks via a proposed HCI workshop and a focus on defining northstar principles.

**Clarifying AI/ML and COTS**
The team needs clarification on vague AI/ML model improvements and COTS evaluation specifics before the March 18 kickoff, as currently there is no strong data or feedback. The team is expected to define the COTS evaluation criteria themselves by leaning on existing Modular Open Systems Approach concepts from previous work materials.

**Long-Term System Codification**
The 8-week bridge contract requires concurrent work on short-term tasks and long-term system architecture, such as defining a Version 1 of a repeatable COTS evaluation process. A major constraint is the feasibility of running an AI training pipeline inside the government-controlled TAC ecosystem, necessitating architectural recommendations.

**Aligning Design and Principles**
Integrating design and product management within the engineer-centric TAC ecosystem is a concern, leading to a proposed Human-Centered Interaction workshop to define guiding principles. The primary focus for the 8 weeks must be defining success criteria and high-level outcomes, rather than becoming obsessed with detailed user stories.

### DETAILS

**Clarification Needed on AI/ML Model Improvements and GOTS Software Evaluation for TAK Project:** The TAC project involves four tasks from SOCOM, but clarification is needed on three vague areas before the March 18 kickoff, specifically concerning AI/ML model improvements and GOTS (Government Off-the-Shelf) software evaluation. Conceptually, the idea of model improvement is clear, but the specifics of *what* is being improved are ambiguous, necessitating a discussion with the customer. Kevin suggested, and Abel agreed, that one way to gain insight is to walk everyone through how the plug-in works and use the subsequent feedback to understand the issues. The customer mentioned AI model performance, but it is currently unknown if the problem truly resides within the model or if it involves retraining with new data or changing the user interface (UI). This ambiguity is understandable since the initial work occurred during a competition, meaning the team likely lacked full access to users or detailed feedback, resulting in a current lack of strong data, evidence, or baselines. Kevin confirmed that the team received almost no feedback, despite being ranked number one among all performers for meeting the requirements during the competition; they only received confirmation of meeting requirements, but no deeper performance insights.
> Abel's takes: So action items from this is for Kevan to "walk everyone through how the plug-in works and use the subsequent feedback to understand the issues." To get everyone familiar, but also to help us start understanding potential area of improvement. Something we were asked to do that we still need to define is "model improvement" at this poing we don't know what kind of improvements are needed so is important to get feedback from the customer, where did the plug-in fail? We need to understand understand if the improvements are more about the model's architecture (how it was built) or it's training data (the sources it learned from)

</>
**Expectations for Government Off-the-Shelf (GOTS) Evaluation:** Abel Hernandez initially assumed the GOTS evaluation might involve guidelines on modularity or scalability, but Kevin disagreed. Kevin noted that the current major acquisition focus is on the Modular Open Systems Approach (MOSA), a mandatory US Department of Defense strategy for designing defense systems. MOSA utilizes modular design, standardized interfaces, and open standards to ensure systems are interoperable, easier to upgrade, and more cost-effective, allowing for rapid component addition, removal, and replacement. Kevin is leaning heavily on MOSA concepts utilized in previous materials, suggesting that the team is expected to define the evaluation criteria themselves. Kevin recommended that Abel look into the MOSA concepts used by the team and review the sprint demo slides and decks, which explain how the plug-in aligns with MOSA and other priorities, to reinforce development decisions.
> Abel's takes: Imporatnt action items for me. Look into MOSA, understand it and ensure that's how we are building and reference the old materials from Demos.
**Task for Abel Hernandez**: Review the sprint demo slide deck, located in the demos or deliverables folder in the drive, as it details the team's alignment with MOSA in their development work (00:04:26).
</>

**Long-Term Thinking and Codifying the Model Training Pipeline:** Kevin emphasized the need to avoid "tunnel vision" during the eight-week bridge contract by not solely focusing on the four immediate tasks, but also considering the long term, specifically by referencing the codification of the model training pipeline. Abel Hernandez, from a Product Manager perspective, sought clarification on how this ambiguous long-term goal relates to the four short-term tasks: is it integrated into the work, or is it a separate work track. **Kevin clarified that the work involves two concurrent tracks:** the theory and the actual eight-week implementation and delivery. For example, a simple short-term fix, such as retraining the model with more data, can be done quickly and shipped (00:06:10). However, Kevin expects the team to simultaneously begin architecting the system and the repeatable processes behind the work. For instance, during the GOTS evaluation, the team should not just determine if something works or not, but also produce a Version 1 of a repeatable evaluation process.
> Abel's takes: **Task for Abel**: Attempt to understand Kevin's meaning regarding the necessity of producing a Version 1 of a repeatable evaluation process, rather than simply stating if GOTS works or not. Kevin acknowledged that clarity will increase as Abel becomes more familiar with the environment (00:07:20). - A few things that "pop" for me here is that as a PM, there's
a) the "codification" of the model training pipeline, basically having a repeatable, documented and automated way to teach AI what a building looks like, staritn from getting the images, labeling them, training hte model,testng how well it learned and deploying it." I need to be more in the know and support it. I need to lean on Kevan to be involved and understand. 
b) Request a training run (What are we training on, where do the images come from, how do we know a label is correct and who decides what counts as a building, how do we know the model is good enoug to ship? what's the pass fail criteria?) 
</> 

**AI Training Pipeline and TAK Ecosystem Limitations:** The team needs to decide if building an AI training pipeline, as mentioned in the sprint demos, is a goal to pursue. A critical question raised by Kevin is whether an AI training pipeline can even run inside TAK Forge (00:07:20). Abel  needs to clarify this with Kevin, as the assumption is likely 'no,' given that the TAK ecosystem is government-controlled and differs from environments where commercial software training pipelines typically operate. This might necessitate recommending a different architecture for how the AI training pipeline should function within the specific constraints of the TAK ecosystem.
> Abel's takes: So a thing I need to ask Kevan and we need to clarify is "how do we find this out" and depending on the answer whether this training pipeline doesn't run inside TAK Forge, then are we putting time and effort into "recommending a different architecture" or ? **Task for Abel Hernandez**: Figure out the feasibility and architectural recommendations for the AI training pipeline within the TAK ecosystem. Kevin's suggestion for the eight weeks is to run a quick training cycle and ship results while simultaneously beginning to outline the longer-term system. Abel needs to ensure tracking of both short-term deliverables and long-term system definition. Abel's analogy, which resonated with Kevin, described the current effort as simultaneously cooking food and organizing the @ for efficiency, scalability, and documenting recipes (00:08:40). Kevin extended the analogy, stating that they are cooking in a home kitchen but planning to move to a commercial kitchen soon, requiring some immediate shortcuts while simultaneously designing the required long-term commercial kitchen<> 

**Integration of Product Management and Design in the TAK Ecosystem:** Abel expressed concern about integrating designers and product managers into the TAK ecosystem (TAK Forge, TAK Product Center, etc.), which feels very engineer-centric. The concern is based on previous experiences in Palantir Foundry and another TAK project, where engineers might move fast and implement solutions, potentially leaving Product and Design out of the loop, resulting in reactive reworking and realignment. Abel stressed that their goal is not to slow engineers down or require approvals, but to ensure close collaboration (00:10:15). Abel acknowledged their previous mistake of treating the platform as solely the engineers' domain and accepting outputs without sufficient collaboration. Kevin agreed that these concerns are fundamentally correct, especially regarding design, and acknowledged that the constraints imposed by the TAK ecosystem and TAK UI component restrictions naturally create contentiousness. Kevin wants the team to define the right interaction points and agree on a unified approach to design (00:11:44).
> Abel's takes: Already spoke with Jon about this and he is gonna facilate it.
<> 
**Proposed Human-Centered Interaction (HCI) Workshop for Team Alignment:** Kevin suggested, and Abel had already discussed with Jon and Coby, leading an exercise focused on Human-Centered Interaction (HCI) and its seven principles. HCI, which is a research field at the intersection of systems engineering, computer science, and psychology, has approximately seven widely recognized fundamental principles (00:11:44). The critical goal is to explicitly define how these principles apply to ATAC (Android Tactical Assault Kit). A particularly important principle for the team is **consistency**, as the product being built is a plug-in that must adhere to the look, feel, standard flows, and user expectations of every other ATAK plug-in. While improvements are possible, the team cannot deviate from standard ATAC elements, especially given the constrained environments where ATAC is used. 
> Abel's takes:**Task for Abel, Jon, and Coby**: The HCI workshop must integrate the principle that the ATAC plug-in cannot deviate from standard ATAC flows and user expectations, considering that the applications are used in constrained environments (00:13:09).<> 

**Defining Guiding Principles and Northstar for Design and Engineering:** From a product perspective, the result (the plug-in running in TAC) needs a defined set of guiding principles or a "northstar" to guide design and engineering decisions. If everyone understands these guiding principles, the team can work flexibly without unnecessary contention.
> Abel's takes: **Task for Abel Hernandez, Jon, and Coby**: Include the objective in the workshop that defining shared guiding principles allows the team to work flexibly without unnecessary contention. This flexibility means that designs can evolve during engineering, and vice-versa, as long as the decisions follow the northstar principles (00:14:23).<>

**Focusing on Outcomes and Success Criteria Over Detailed User Stories:** Given the eight-week effort within the ATAK environment, Kevin noted that user stories can be complex, and obsessing over making them "right" is not the most crucial priority; the outcome is what matters (00:14:23). Stories should function as representations of desired outcomes that the team works toward solving in outcome-oriented ways. Detailed user stories are typically useful for decomposing large bodies of work over long periods and maintaining predictability. However, since this is an eight-week window starting with almost no feedback, and a large amount of feedback is expected on Day 1, detailed, eight-week stories would quickly become incorrect, creating unnecessary churn.
> Abel's takes: **Task for Abel Hernandez**: The product manager must focus on defining the success criteria for the eight weeks and the high-level outcomes that need to be achieved. If outcomes are clearly defined, the underlying work can remain flexible and dynamic based on learning (00:15:41). Kevin gave an example where spending hours writing detailed stories based on TAK UI patterns could be wasted effort if a deeper architectural limitation is discovered. Given the current high number of unknowns, planning too deeply at the story level early on would make the stories brittle (00:16:51).

**Recommended Planning Approach for the Eight-Week Period:** Kevin recommended that Abel start by defining the "north star" for success, then break that down into high-level outcomes. An example of an outcome is specifying targets for model improvements or identifying areas of the system for evaluation. Initially, each outcome can be a high-level one-liner, refined and decomposed as the team learns more. The team may eventually create stories, or they might maintain high-level epics and create dynamic subtasks as work emerges. The process will be inherently messy and chaotic, blending technical spikes, development, integration, testing, and deployment, sometimes within a single cycle. Kevin anticipates that once the system stabilizes, the approach will evolve, but chaos should be expected during this eight-week period. Abel Hernandez agreed with the suggestions and the approach of establishing norms via the seven fundamental principles of HCI (00:18:04).
> Abel's takes: yes, so what I have already started to do is convert the 4 tasks into outcomes and working on that, this is my priority for the nest two days</>

**Revisiting the Importance of Success Criteria and North star:** Abel reinforced that Kevin's point about not becoming obsessed with written stories—which can create a false sense of control—was appreciated; instead, the focus should be on success criteria and the north star to ensure high-level outcomes align with daily/weekly work. 
> Abel's takes:
**Task for Abel Hernandez**: Define the success criteria and northstar. If stories emerge, they should flow from this definition, ensuring a clear link between the work and the outcome, which requires close collaboration with the engineers. The Statement of Objectives (SOO) document and its four tasks essentially serve as the team's requirements (00:19:13).
: 1.  AI/ML enabled GRG ATAK plug-in update to the latest version 5.6 and compatibility with SOCOM releases.

2.  AI/ML enabled GRG ATAC plug-in TAK UI migration research timeline, estimates of cost, and effort.

3.  COTS (Government Off-the-Shelf) modularity and scalability evaluations research, deliverable, and requirements. Questions for SOCOM include: Do they have format or specifications for content delivery? Does moving the plug-in to TAC UI meet the research requirements, or is a further customized report needed? The approach will be to begin migrating the TAC UI, and any incomplete work will be extrapolated to a closeout cost analysis report\~=CITATION:15=\~.

4.  Model improvements/Feedback as far as performance evaluation\~=CITATION:16=\~.
Action Plan for Requirements Assessment: 

**Task for Abel**: Read through the four tasks with the team and collaboratively ask: "How are we going to be successful here?" for each requirement. The realization that there are many unknowns is acceptable (00:22:42). The team must feel uncomfortable until they can confidently define success for each task. For tasks where the team feels confident, they can begin decomposition by asking what specific work will meet the success criteria. For this eight-week window, the core goal is understanding what success looks like. Abel Hernandez can start this process immediately, accepting that the initial answers may be "I don't know yet," as this ambiguity is fine. Kevin noted that the first week will likely involve "growing pains," but work should accelerate by week two or three. The team must establish a framework to operate without contention, ensuring everyone understands the decision space they can operate in without unnecessary involvement of others. If the customer's expectations for a requirement cannot be answered, the team should not proceed with decomposition. 
**Task for Abel**: Review the sprint demo slides from the previous engagement for useful context and concepts (00:23:53).
</>

**Suggested next steps**

- Abel will review the sprint demo slide deck to understand how the plug-in aligns with MOSA and other priorities.
- Abel will clarify whether the AI training pipeline could run inside TAK Forge.
- Abel will define success criteria for the eight weeks and the high-level outcomes needed, focusing on understanding what Kevin means by producing a version one of a repeatable evaluation process when evaluating GOTS.
- Abel will read through the four tasks from the SO document with the group and ask how success will be achieved for each requirement.

---

# TAK - pre-kick off Strategy discussion and alignment

### SUMMARY 
Initial strategy discussion focused on prioritizing plugin migration to version 5.6 for deployment and resolving multiple ambiguities in the Statement of Work regarding TAC UI and GOTS requirements.

**Plugin Migration and TAC UI**
The 8-week period focuses on migrating the existing plugin to ATAC version 5.6 and researching the move to TAC UI. Adopting TAC UI early is preferred to avoid costly merging of separate implementations later, and deployed functionality must be immediate.

**Task Interpretation and Priority**
Immediate priorities are updating the plugin to version 5.6 for stability and stability and researching the TAC UI migration timeline and cost. Major improvements should be avoided to prioritize stability on version 5.6 before deployment to real users.

**SOW Clarification and GOTS**
Clarification is needed regarding the GOTS Modularity and Scalability requirements and whether TAC UI is the sole GOTS capability to be evaluated. This evaluation is potentially sensitive due to tension between SOCOM and the TPC, with SOCOM seeking justification for development resources.

### DETAILS

**Pre-Kickoff Strategy Discussion and Alignment:** Research Goals and Deliverables: The initial eight-week period is centered on researching how to migrate the plugin and potential model improvements. 

**TAK UI (T A K UI)** is considered particularly important because adopting it sets the foundation for future development. Conversations are still required with the customer and internally regarding how model improvements will be delivered to devices. The intent is to move to TAC UI sooner rather than later to avoid building separate implementations that would later need to be merged, indicating a preference to incur that cost early (00:00:00). The team's existing plugin, built during a previous challenge, did not adhere to TAC UI standards, requiring the current migration effort (00:01:52). A key action item for Abel Hernandez is to determine the extent to which various Android devices with the plugin will receive the model/plugin update, leading up to the eventual move to TAC UI (00:00:00). The first version of the ATAC plugin should be designed for operational use. The customer, SOCOM, confirmed that the current phase is collaborative, but any working functionality must be immediately deployed to the range and users (00:01:52). Once the plugin runs on the latest version, 5.6, and clears bureaucratic testing and gates, the intention is to deploy it to real users, as the specific users are already identified (00:03:17).

Framing the Initial Tasks and Priorities: The team, based on notes and discussions with Kevin, identified two immediate tasks: 

* First, **AI/ML enable GRG ATAK plugin updated to the latest version (5.6)** and ensuring compatibility with SOCOM releases, addressing non-TAC Forge/bureaucratic requirements. 

* Second, **AI/ML enable GRG ATAK plugin TAK UI migration research**, including timeline estimates, cost, and effort. The sequence is to first update the plugin to version 5.6, and then separately research the migration to TAK UI. The research for TAK UI migration may require starting the actual implementation work to determine the scope and complexity. The focus for the latest version (5.6) should be on stability, fine-tuning, and production readiness. Major improvements should be avoided unless they are extremely low-risk and considered easy wins, prioritizing getting the plugin stable on ATAK version 5.6. Once deployed on version 5.6, indirect feedback is expected from real users. Abel Hernandez needs to determine what "indirect feedback" entails, with the assumption that it will come from contacts like Nik Klein or John Miller, rather than the end users directly. The customer appears to be impatient, necessitating a highly focused approach in the initial conversations (00:05:03).

**Interpreting Statement of Work (SOW) Language and TAK UI:** Kevin created a secondary document, 'The four tasks, Kevin enable discussion,' to help interpret the SOW language. The SOW uses terms like "conduct research," which needs to be translated into practical actions for the team. For example, the TAC UI task requires timeline and cost estimates, and the effort needed to rewrite the plugin to function across TAC UI environments. Abel Hernandez must clarify what TAK UI is and what constitutes TAC UI environments. The ultimate goal seems to be a single plugin deployable across all TAK ecosystems using TAK UI components

**GOTS Modularity and Scalability Requirements:** The SOW also includes requirements for **GOTS (Government Off-The-Shelf) Modularity and Scalability**, which ties into **MOSA (Modular Open Systems Approach)**. GOTS refers to government-developed software or hardware that is not publicly available, used to save costs, and maintain control over sensitive security and interoperability. The SOW mandates evaluating existing GOTS capabilities for modularity and scalability and briefing the PMO (Program Management Office) about the findings. Key clarifications needed are whether the customer has a specific list of GOTS capabilities for evaluation, and whether TAC UI falls under this GOTS evaluation (00:07:57).

**Potential Overlap and Conflict Regarding TAK UI and GOTS Evaluation:** If TAK UI is included in the GOTS evaluation alongside the migration effort, there could be overlap or conflict. TAK UI is the component used to build the plugin and is classified as GOTS software, though GOTS encompasses more than just TAK UI. The SOW explicitly mentions TAK UI but not other GOTS capabilities, raising the possibility that TAK UI is the intended subject of the evaluation, even if not explicitly stated in the contract language. This situation introduces a potential sensitivity due to the relationship between SOCOM and the TAK Product Center (TPC) (00:09:27).

**SOCOM vs TPC Tension and Justification for Development:** The GRG plugin is considered SOCOM software, while TAK UI is maintained by TPC (TAK Product Center) (00:09:27). SOCOM may be seeking justification for developing their own capabilities rather than relying entirely on TPC, due to existing tension between SOCOM and TPC. Kevin believes this evaluation may be a means for SOCOM to justify additional development resources on their side. SOCOM is not trying to leave the TAK ecosystem; TPC provides the baseline platform, and organizations like SOCOM build capabilities on top. The need for justification stems from SOCOM wanting to secure development resources for a large, long-term contract that will require additional personnel (00:11:25).

**Clarification Needed for GOTS Research Deliverables:** For the GOTS research deliverables, ambiguity remains. The team needs to clarify whether specific templates or formats for deliverables are required. It is also unclear if implementing the TAK UI migration itself counts as the required research. One potential approach is to begin the TAK UI migration and document the process, using that documentation as the research output, summarizing any incomplete work in a closeout cost analysis report (00:13:21) (00:16:30).

**Model Improvement Feedback Requirements:** For model improvement feedback (Task four), the main issue is the current lack of performance evaluation data. Abel Hernandez must ask SOCOM if they have a written evaluation report from the earlier competition, and if a working session can be scheduled for them to explain the feedback (00:13:21). Information is needed on what user feedback exists from the initial evaluation phase, including what users liked, what didn't work well, and any bugs encountered, as over six months have passed since the competition ended without the team reviewing this feedback (00:14:37).

**Task Clarity and Immediate Focus:** Clarification is needed for the TAK UI migration, GOTS modularity evaluation, and model improvement feedback, as the definition of "done" is unclear for these tasks. 

The most straightforward task is the first one: **AI/ML enablement GRG ATAC plugin updated to the latest version (5.6)** and ensuring compatibility with SOCOM release processes, TAK Forge, and bureaucratic hurdles. Kevin believes this first task could potentially be completed in the first week, provided there are no previously unknown compatibility requirements stemming from the prototype challenge. The team must confirm that the compatibility requirements and release processes with SOCOM, TAK Forge, and bureaucratic hurdles, handled during the competition, still hold true for the current contract (00:14:37). The immediate focus must be aligning with SOCOM on the remaining ambiguous questions, with anything beyond that addressed in follow-up communications. The proposed approach for the TAK UI migration is to simply start the migration, extrapolating any incomplete work into a cost/analysis closeout report

# TAK Delivery Process Mapping

### SUMMARY

Software delivery process review identified security scanning controls for code challenge, simplifying internal pipelines via TAK Forge, and establishing the critical need for Mil-Tagged APKs for production use.

**Code Review and Branching**
The initial development stages required 2 approvals for every merge request to ensure NIST compliance, utilizing conventional commits for branching and commits. Internal project pipelines are triggered upon merge to the main branch for security scanning, but the current internal GitLab lacks this setup.

**Pipeline Security and TAK Forge**
Security scanning in internal pipelines was recommended against for the 8-week period, as TAK Forge performs necessary security measures like Fortify scans to meet NIST compliance. Code is pushed manually to TAK Forge's restricted GitLab instance via AppGate, which provides Zero Trust Access.

**Mil-Tagged APK Production**
A critical requirement for production is a mil-tagged APK, which requires the Program Office to submit an official request to the TAK Forge team for pipeline setting updates. This configuration change will enable every commit to produce both civ and mil versions of the APKs and other artifacts.

### DETAILS

**Objective of the Discussion and Methodology:** The primary goal of the meeting was to identify unknowns, gaps, blockers, and assumptions in the software delivery process from code inception to production deployment on an Android device (00:00:00). The process involves mapping typical software delivery stages, identifying actors/owners, acknowledging systems/tools used, and documenting areas requiring customer confirmation. This exercise also aims to provide product design and other parties a general understanding of how engineers will work within the TAK ecosystem and collaborate with the TAK Product Center and Program Office (00:00:58).

**Initial Development and Review Stages:** The initial phase involves a developer picking up a full-stack story, coding locally, pushing their branch, and initiating a merge request (00:00:00) (00:02:14). During the code challenge, the process required two approvals for every merge request, which is cited as a NIST compliance control. The conventional commits naming convention was utilized for branching and commits (00:03:22).

**Branching Strategy and Internal Pipelines:** There was no specific branching strategy used during the code challenge, though standard naming conventions were employed (00:03:22). When code is merged to the main branch, it triggers internal project pipelines for security scanning and security policy creation. However, it was noted that internal GitLab currently lacks the setup for these pipelines (including dynamic/static code analysis, pen testing, and secrets checking) (00:05:21).

**Recommendation on Internal Pipelines and Security Compliance:** Kevan Mordan recommended against setting up internal pipelines for security scanning during this eight-week period, suggesting that the internal GitLab instance be used purely as a repository (00:06:33). This recommendation is based on the understanding that TAK Forge now performs necessary security measures, such as fortify scans, fulfilling NIST compliance requirements that the team previously addressed themselves. The team should confirm with the customer on day one if they still require all of that information (00:07:32).

**Pushing Code to TAK Forge:** Code is pushed manually to the main branch from a local machine using AppGate, which provides Zero Trust Access (ZTA) to the restricted get.tak.gov GitLab instance (00:05:21) (00:08:46). Thomas Reynolds clarified that the team pushes code, not the built Android Package Kit (APK), to TAK Forge, where it performs its own scans and builds the APKs (00:15:15).

**Need for Military (Mil) Tagged APKs:** A critical requirement for real production use in a military ATAK environment is having a "mil tagged" APK. By default, a successful TAK Forge build only produces a "civ tagged" ATAK APK. To obtain the mil tag, the Program Office must submit an official request, such as a Memorandum of Agreement (MOA) or Memorandum of Understanding (MOU), to the TAK Forge team to update the repository's pipeline settings (00:11:07) (00:15:15). The mil-tagged APK is literally the same file as the civ-tagged version, just with different signing/tagging (00:12:20) (00:14:18).

**Mil Tagging Request and Build Process:** The team must submit a request to the Program Office to obtain the mil tag early in the contract (00:11:07) (00:25:07). The TAK Forge team will modify the repository settings to enable the production of both civ and mil versions of the APKs and other artifacts for every commit, which are then stored in Artifactory (00:13:21) (00:16:37). This tagging configuration is expected to be a one-time setup upon kickoff (00:26:11).

**Testing and Handoff of Final APK:** The team performs local testing of the APK on an emulator or the actual Android device, with emphasis on stability and functional correctness (00:20:40). The team needs to communicate when a version is ready for release, most likely via email to Nick in the Program Office, and send them a link to the generated APK (00:18:35) (00:27:17). The process for how the Program Office handles deployment from that point remains a "black box" to the team, though they assume the Program Office takes the file from TAK Forge and distributes it (00:18:35) (00:28:24).

**Government Approval and Access:** The team retains ownership of the code repository within TAK Forge. The government's involvement is required for granting access to AppGate and TAK Forge, which requires personnel to declare themselves a U.S. person; a CAC is not required but may expedite access (00:32:59).

**Future Deployment and Communication:** The team noted that they never had problems with submissions during the competition, as their deliverables were reviewed only at the final submission, not incrementally (00:29:34). The team will not have direct communication with end-users downrange, as the Program Office will serve as the sole facilitator of communications and feedback. Defense Works is noted as only a contractual vehicle and has no say in the actual technical work (00:31:38).

# March 13 - Friday - GitLab Set up part 1

### SUMMARY
Impact Template review populated existing information, resulting in assignment of the Impact epic owners and temporary metric definition.

**Populating the Impact Epic**
The Impact epic template was populated with existing kickoff information and assigned Kevin as Delivery Lead Owner and Abel Hernandez as Product Manager. All metrics and measurements were temporarily designated as TBD since the specific mission safety metrics are not yet defined.

**Defining Enabling Outcome Template**
A new template for an enabling outcome was introduced to capture delivery goals, which are necessary for user outcomes but are not user outcomes themselves. The template was modified by removing the outcome status and the entire metric and measurement section since these outcomes are binary deliverables.

**Differentiating Outcome Types**
A gray area exists between feature output and enabling outcome, and it was concluded that items representing a large output should be classified as a feature epic for now. The team decided to update the label strategy to reflect `type of output` instead of `type of feature epic`.

### DETAILS

**Reviewing and Populating the Impact Template:** Jonathan Van Dalen and Abel Hernandez reviewed a blank epic template for "Impact" to populate it with existing information from their kickoff board. The goal of the impact template is to capture how "less bad things happen because operators have better maps, right? Even in tight time scenarios" (00:00:00). The template is already linked to a child outcome placeholder, which needs to be filled out later (00:01:25).

**Addressing Template Copy Artifacts:** Jonathan Van Dalen noted that the template contained leftover information from a previous project, "Tracer," specifically mentioning "Josh Pritchette" as the delivery lead owner, which they decided to delete. They confirmed that the template is now ready to use, despite any minor lingering artifacts (00:01:25).

**Discussing Required Labels and Strategy:** The impact template requires labels for both "type of impact" and "status for impact," but these labels are currently missing. Jonathan Van Dalen has messaged L and Jeff to request that the necessary labels be created so they do not have to manually create thirty labels (00:02:15).

**Defining the Impact Metric:** Abel Hernandez sought clarification on whether the current impact articulation in the template is accurate, and Jonathan Van Dalen clarified that "impact is a metric that moves that it means something for the mission," which should indicate that missions are "safer and more effective" (00:03:59). They acknowledged that the specific metrics for impact are "not defined yet" (00:05:01).

**Exploring Secondary Impact Definitions:** Jonathan Van Dalen suggested that a secondary impact could focus on the timely creation of GRGs (Ground Reference Graphics), which might be a more realistic and measurable goal than focusing on mission safety metrics (00:05:55). The template also includes instructional fields, a free notes section, and an "Automation save section" designed to be automatically updated by a pipeline (00:06:48).

**Populating the Impact Epic and Ownership:** Abel Hernandez began manually populating the Impact epic using the content from the kickoff board and discussed creating a copy for the secondary impact idea, though they decided to grab the template content and change it, as a copy function was not apparent (00:07:38). They assigned Kevin as the Delivery Lead Owner and Abel Hernandez as the Product Manager for the impact epic (00:10:01).

**Defining Metrics and Constraints for Impact Epic:** The metrics and measurement fields were temporarily marked as "TBD" (To Be Defined) since the criteria are not yet established (00:10:55). Abel Hernandez added a note in the constraints section about the contract being "limited to eight weeks" and the goal to measure impact directly despite potential difficulties due to the short time frame (00:12:26).

**Introducing the Enabling Outcome Concept:** Abel Hernandez initiated a discussion about capturing delivery goals, like those on their list, and Jonathan Van Dalen proposed using a new template type called "enabling outcome" (00:14:46). Jonathan Van Dalen explained that these are "like delivery goals" or "table stakes" necessary for user outcomes but are not user outcomes themselves, citing examples like setting up a dev environment (00:16:28) (00:21:17).

**Modifying the Enabling Outcome Template Structure:** They reviewed the structure for an enabling outcome, deciding it would need a new label like `enabling_outcome`. Jonathan Van Dalen suggested removing the outcome status because enabling outcomes are typically checked for completion (finished or not finished) rather than behavior change and metrics (00:17:19) (00:25:56). The template placeholder text was changed to reflect that the statement should explain why the work is necessary to enable user outcomes (00:19:45).

**Clarifying the Relationship Between Outcomes and Enabling Outcomes:** Jonathan Van Dalen and Abel Hernandez determined that an enabling outcome should be a child of a user outcome, and the language in the template's enabled outcome section was adjusted (00:22:34). Although the linking order does not matter initially, Jonathan Van Dalen noted that they could always fix the parent-child structure later (00:23:48).

**Refining the Enabling Outcome Fields:** They decided to delete the "Output hypothesis" section and the entire "metric and measurement section" for enabling outcomes, as they tend to be finished or not finished deliverables (00:24:44). While there might be cases where metrics are helpful, the default stance is to remove them (00:26:53).

**Distinguishing Between Feature Output and Enabling Outcome:** Abel Hernandez asked where items like "AIML enabled GRG A tech plug-in updated to V6 to 5.6" should be placed, and they concluded that there is a "gray area" between a feature output and an enabling outcome (00:29:50). Jonathan Van Dalen concluded that items representing a large output with many underlying issues should be classified as a "feature epic" for now (00:31:40).

**Concluding and Next Steps for Structure:** Jonathan Van Dalen agreed to update the label strategy to reflect `type of output` instead of `type of feature epic`. They decided that they would start using the framework and collaboratively determine the best way to represent "enabling outcome" information, which might be through a label or another mechanism (00:32:29).


---

# PM Action Items

## Waiting on Gov

1. **TAK Forge Access** — Ask Kevan or Sharon to reach out to Jordan or Jonathan and request TAK Forge access before kickoff. Don't wait until March 18th — every day without it is a day the team can't start.
2. **Updated SOO** — Ask Kevan or Sharon if an updated Statement of Objectives (SOO) is coming from the Gov with corrected dates and clearer requirements. Yes or no — need to know before kickoff.
3. **Model Improvement Criteria** — Request from the Gov (likely Jonathan Miller) the specific areas they want the detection model improved in — whether that's inference strategies, accuracy, or other criteria. Without this, the team can't scope or plan that workstream.
4. **Kickoff Attendees from Gov** — Confirm with Kevan or Sharon who the Government is sending to the March 18th kickoff so we can align on how many Risers should attend. Too many on our side without expectation could be off-putting given the contract's small size.

## Kickoff Agenda Items

1. **Definition of Done for the 4 Deliverables** — Confirm with the Government what "done" looks like for each goal, specifically: what does "improve the detection model" require as an output, and what does the GOTS (Government Off-The-Shelf software) evaluation need to produce — which software is in scope and what does a passing assessment look like?

2. **Confirm Key Dates** — Correct the dates from the SOW: PI planning status, code baseline expectation, final demo date, and management status report date.
> Kevan should be consulted about the "code baseline expectations" - remember Kevan mentioned that these are just contract terms, but we are likely responsible for provoding htat.. 

3. **Validate the Delivery Process Map with Gov** *(dependent on Internal Action #6)* — Bring the Rise8 draft Delivery Process Map to kickoff and walk Jonathan Miller or Nik Klein through it. The goal is to get him to correct it — not to impress him. Specific unknowns to confirm: How does code move through TAK Forge to a deployed APK? Who approves? How long does review take? What role does TAK Product Center play in accepting the plugin? What does DefenseWERX require from Rise8 as a contracting intermediary — do they need any specific reporting artifacts from the PM?

4. **Validate the Stakeholder Map and Org Structure with Gov** *(dependent on Internal Action #8)* — Present the Rise8 draft Stakeholder Map and Org Chart to Jordan Boring and Jonathan Miller. Let them fill in the gaps: Who else belongs on this map? Who has decision authority? Who do we escalate to? Where does Nik Klein fit — is he a core collaborator or just FYI? Is Britney Busher someone we need to loop in, and at what level?

## Internal Actions

## STACK RANK [#]

[#1] 6. **Map the Rise8 Side of the Delivery Process Map (Before Kickoff)** — Schedule a working session with Thomas and Kevan, Mases before March 18th to map what the team knows from the bakeoff: Rise8's sprint cycle, internal GitLab, and how the APK was built and delivered during the prototype. Their knowledge is limited — they were in a competition context, not a real deployment context — so treat everything they produce as a hypothesis, not ground truth. Also map the known unknowns: TAK Forge approval process, TAK Product Center's role, DefenseWERX requirements, and where appgate sits in the chain. Output: a draft Delivery Process Map with gaps explicitly labeled "TBD — confirm with Gov at kickoff." *Required output: explicitly call out which Gov checkpoints are needed at sprint planning, sprint review, and prod deployment — these touchpoint owners must appear in the map.*

[#2] 8. **Draft the Stakeholder Map and Org Structure (Before Kickoff)** — Schedule time with Kevan and Jonathan Van Dalen before March 18th to map what the team already knows: Jordan Boring (Acquisition PM), Jonathan Miller (Technical PC), Nik Klein (customer-side operator proxy/PM), Britney Busher (unknown — likely DWX/SOFWERX liaison), and the broader org structure — USSOCOM, SOFMC, TPC, DWX, SOFWERX. This is not a finished deliverable. It's a hypothesis map — label anything uncertain as "TBD." Output: a draft Stakeholder Map and Org Chart ready to bring to kickoff for the Gov to correct. *Required output: explicitly name which stakeholders attend sprint reviews and who has authority to approve production deployments — these roles must appear in the map.*

[#3] 1. **Align on the 4 Goals Internally** — Draft a single, clear definition for each of the 4 deliverables and align with Kevan, Thomas, Masses, and Jonathan before kickoff. One name, one description, agreed by the team — so everyone walks into March 18th saying the same thing.
> not only do we not have a common language, those goals are not well defined.

[#3] 2. **Clarify Kevan's Model Training Pipeline Ambition** — Kevan's goal to "codify a model training pipeline" is NOT one of the 4 contract deliverables. It's his long-term vision, likely aimed at positioning R8 for an OT contract. Before kickoff, have a direct conversation with Kevan to answer: Is this a stretch goal, a spike, or stealth work? Does the Gov customer know about it? Does it fit within the 8-week ceiling? If it's out of scope, it needs to be named as such — so the team isn't quietly burning capacity on work that won't count toward delivery.

[#3] 3. **Define the North Star Outcome and Set Baseline on Day 1** — Working drafts exist for user outcome and mission impact, but both need refinement and measurable criteria before they're usable. More importantly: the production baseline starts at zero on kickoff day. If we don't capture starting state on March 18th, we have nothing to measure progress against 8 weeks from now. Action: identify what data points we can actually capture at kickoff — model confidence scores, GRG generation time, operator feedback — and commit to tracking them from day one.

4. **Capture Operator Pain Points — Model Performance in the Field** — During the bakeoff, the team didn't have direct access to operators to learn where the model actually fails in use. Nik and John are the closest proxy. Before or at kickoff, get time with them specifically to ask: Where does the detection model break down operationally? What does a "bad" GRG output cost the operator in the field? This is the missing voice that Gov's model improvement criteria won't give you — program offices don't run missions.
> update: they did have access to 2 operators and they tested, limits. Figma and screen share working software, it wasn't self-guided testing using the ai model, "70%" (Nik was the "honorary user") Nik could open up more and share these baselines/assumptions.

5. **Document TAK UI Limitations and Requirements** — Separate from model performance, there are known usability concerns with TAK UI components. Before the team starts the UI rewrite estimate (one of the 4 deliverables), document what's actually broken or constrained from a UX standpoint. What does the kit allow? What are the hard limits? This prevents the estimate from being built on assumptions and sets up the OT contract conversation with a clearer picture of what a real UI investment would require.[consider refactoring this, so it doesn't seem too prescriptive. -- remember, what was deliver to them was not what was tested from users]
> RACI for the Balanced team , given the technical aspects, having two (Product Designers) PDs for a while, we need more involvement, so that Engineers dont make decisions in silo.. have some sort of strucucture, avoide "hidden work" and having designers ask to "see" HMW people working ahead.. 

7. **Clarify Which Risers Are Customer-Facing Before Kickoff** — The contract is small (1.5 FTEs for 8 weeks). Showing up with a large team without warning could come across as off-putting or misaligned with contract scope. Before March 18th, align internally on: Who is cleared to be in the room (or on the call) with the Gov? Who is on the project but stays internal? This isn't about excluding people — it's about managing first impressions with a customer we don't fully know yet. Owner: Abel, in coordination with Kevan.

9. **Draft the Sprint Reporting Template (Before Sprint 1 Ends)** — Abel owns the format and content for two contractual reporting obligations: weekly management updates (SOW 4.2.6) and sprint review/demo artifacts (SOW 4.2.3). The final report is also a living document that should be started on day one, not assembled at the end (SOW 4.2.3.2). Before the first sprint ends, draft a template for each: what goes in the weekly update, what the sprint review covers, and how the living document gets updated each sprint. Don't improvise the format mid-delivery — that's how things get missed.

---

# STAND UP March 12 

- waiting on final contract, funding dispursement, 18th likely start date, 
- he wants to start seeing a backlog getting creating. High level epic around the 4 task and we can start templating eveyrthing, for BRidge contract expectations.
- check in and see how the local ATAK plug in is going, building and running.. is it going ok?

Thomas:
- He got it up an running.. swapted it.. 
- emulator are going
- plug-in running well?
- winTAK clones
- Repot for switching to TAK UI lelements? assuming?
- He needs Git LFS, work around

Got back on Git. LFS, Lakshmi said it was compliance.. 
LFS is an S3 bucket, part o our issue ABS, getting through
What did kevan suggest we use instead?

Does anyone have TAK Forge access? - No, no access yet
BLOCKER

5.5, 5.6 down? we can start doing that right now

---

GitLab SaaS ()
Where i
AOI - 

JVD
4 main areas

sDk cap
UI framework
improve model
eval gov

The UI Framework, establish a way we make decsions, establish a process.
ONE WAY-- sharing screen

VSM, constraint... Value Stream.. BIGGER IMPACT out there for SOCOM.. whats their big picture is..  5 million for 

/////
# Kevan strategy - March 11

Convo w/SOCOM form Shannon

migrate ATAK UI
5.6

ATAK 5.6 First + any improvements (high wins)
- stability
- fine tuning
TAK UI later

KEvab, FOCUS
0 
SOFMC - 

What's in the doc
4.3.1
4.32.
4.3.3
4.3.4

what we were told on the call

Reseach and Software Development to get to 5.6 (we are 5.4 or 5.5)

Research and provide cost and timeline estimates for the effort to require to rewrite with the end state of having a Single plug-in that deploys everywhere TAK UI works.. "it will go to any TAK ecosystem supported"

modularity and scalabity (MOSA)
- Do they ahve a specofic list GOTS software capability ro review
- is TAK UI part of this? IF SO, if we are also evaluating Should we loop this to 4.3.2?

TAK UI is GOTS, 
if this is the case

---

We should keep in mind
Govern off-shelf Software (OSIT)
--

Our plug in is SOCOM
- 
TAK UI is TPC
-
Tention betwen SOCUM and TPC
--

Establish justifccaton to seprate for TPC
TPC has "the baseline"
plug any TAK ecocystem, but waht if is not enough
TPC 
--

justifying SOCOM deve on top of TPC is doing
--
qualm questions 

**SOCOM -** we are making their plug in 

TPC - runs the pipeline

1. Ai/ML ENABKED GRG ATAK PLUG IN UPDATED to 5.6

2. Ai/ML 
GIO

2. RESEARCH/DELIVERABLE REQUIREMENTS:
- format or specs ofor how conent is delivered

5. model improvements

WHAT IS DIFFERENT THAN WHAT WE DID FOR THE PROTOTYPE
4.3.1
4.3.2











---

Google Doc - Mission OS



---

Abel
Nick W
Art T
Roshni P
Matt O
Adam M
Evan M
Rob M
Mary P
Clarl P
Alex B
Becca J

11
