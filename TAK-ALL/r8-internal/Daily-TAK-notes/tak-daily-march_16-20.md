# Week of March 16–20 - 

## Definition of success/done for TAK Bridge - Monday, March 16

### SUMMARY
Project scope discussion confirmed focus on 8-week enabling outcomes with emphasis on defining ultimate production value and model improvement accuracy.

**Define Exercise Outcomes**
The 8-week exercise scope primarily focuses on organizational enabling outcomes, such as setting up environments or codifying pipelines, rather than production user outcomes. Every enabling outcome must be framed with a clear sense of what ultimate production outcome, like enabling faster GRG generation, is being enabled.

**Plugin SDK Update Requirements**
The definition of done for the Plugin SDK update to version 5.6 is successful completion, ensuring all existing modules function, and correcting all resulting bugs. Success requires demonstrating stability and quality, documenting breaking changes, and adhering to TacForge security finding thresholds.

**TAC UI Migration and Model Improvement**
TAC UI migration requires a research report and cost estimate, with a critical output being a mapping artifact to inventory UI components. Model improvement is crucial for creating accurate GRGs, with the team needing client clarification on the scope, such as focusing on architecture or training data

### DETAILS
**Defining Scope for Outcomes:** The participants agreed to primarily focus on enabling outcomes for the current eight-week exercise due to the time constraint and uncertainty regarding deployment to production with real user data. While user outcomes in production can be considered if they arise naturally, the core scope is centered on enabling organizational success, such as setting up an environment or codifying a model training pipeline
> Abel's takes: This was ONLY for the workshop/team exercise. We are always eye-ing and looking to identify and execute user outcomes, mission outcomes. Very important. That is still something we are very open to doing. 

**Connecting Enabling Outcomes to Production:** Jonathan  emphasized that even when focusing on enabling outcomes, there must be a sense of what ultimate outcome in production is being enabled. For example, a successful outcome could be framed simply as enabling people to make GRGs faster or better in the field (00:02:54).
> Abel's takes: While I agree whole-heartely, I personally still need to understand who are the users, what are their problems (pain points) and what is "value" and yes, what change of behavior do we want to measure, outside the competition they ran a few months ago. So an action item for me, compile all we know now from the competion (user personas, pain-points, workflows, jobs to be done, what do they want to improve, potential outcomes) I know we have this info and Jonathan is also putting stuff together. but I also need to get on it.

**Updating the Plugin SDK to Version 5.6:** Definition of Done: The primary definition of done for the SDK update is the successful completion of the update to version 5.6 -  This also includes ensuring that all existing modules function with the new version and correcting any resulting bugs (00:16:00).
> [*]Abel's takes: agreed! So this is one of two "definiton of done" for the most part when it comes to updating the plug-in SDK to 5.6, what we believe is an output/deliverable

**Updating the Plugin SDK to Version 5.6:** Success and Quality: Success in updating the SDK involves demonstrating stability and quality, such as ensuring all breaking changes are documented. The update must adhere to TAK Forge requirements, including meeting security finding thresholds, which is considered a baseline requirement. The updated plugin must be runnable on version 5.6 without crashes or errors, ensuring the installation, launch, and AI GRG generation workflow are completed reliably.
> [*]Abel's takes: Also, other outputs/deliverables that the team considers "done" for the task regarding "updating the plug-in SDK to v5.6"

**TAK UI Migration: Focus on Research and Estimation:** The stated task is to "conduct research while engaging with the government team to provide a cost and estimate" for rewriting the plugin into the TAC UI development framework, with the goal of establishing cross-compatibility. The output is a research report or estimate.
> [*]Abel's takes: So, this is what the team largely considers, "part of the output/deliverable" for Taks #2 "TAK UI Migraion", while the SOW/contract language emphasizes research and estimates, the following context conveys the second one.. 

**TAK UI Migration: Alternate Expectation and Mapping Artifact:** There is an expectation from Kevan, channeled by Jonathan, that the task might evolve into executing the framework implementation rather than just estimating the cost. Regardless of estimating or implementing, a critical output is a mapping artifact that inventories the current UI, identifies equivalent components in the new framework, and flags necessary decisions for unsupported components (00:40:25).
> [*]Abel's takes: I echo, Jonathan's call out. This might not be in the SOW/contract language, however even some transcripts from speaking with the customer have called out when speaking with Kevan that implementing the TAK UI migration is something we could do, However it will be useful for us to establish this internally and get advise from Customer Success and also Kevan (delivery) on how we bring this up at kick off or before.. 

**TAC UI Migration: Defining Success:** Success can be demonstrated by achieving a consistent UI experience across platforms, such as Windows and Android, which is the objective of the UI framework. Another key aspect of success is the confirmation that future feature additions will not require a UI rewrite for different platforms, proving that UI parity has been achieved at a code/data level (00:44:29).
> [*]Abel's takes: Yes, this is something we all seem to be in alignment with.

**Model Improvement - Undefined Scope and Initial Research:** The team acknowledged they need clarification from the client regarding the scope of model improvements, such as whether they should focus on improving architecture, training data, or inference strategy. Initial research into building a machine learning data pipeline for computer vision outlined essential stages, including understanding data requirements, selecting collection methods, data preparation, labeling, augmentation, and continuous maintenance.
>  [*]Abel's takes: I personally believe that the model training pipeline, "codifying" that is not just an enablement outcome, but has potential to lead to user mission-outcomes. I want to expand on this with Kevan and the rest of the team. So, one output/deliverable is this and the success criteria, tbd

**Model Improvement:** Past Work and Challenges: Previous work on the AI model involved extensive training and improvement, though details were mostly handled by others on the team, including Mases and Kevan. Past challenges included achieving quality results across various terrain types and different image qualities, such as clear desert images versus areas with tree cover, or complex urban environments (00:57:51).
Kickoff Rescheduled: The project kickoff meeting has been pushed to the 25th, providing the team with additional time for preparation and workshops (00:50:08).
> Abel's takes: no comment at this time, just worth noting that we do have some baselines metrics, and I need to categorize them, while we await information from the customer.

**Importance of Model Improvements and Accuracy:** The discussion highlighted that model improvements are crucial for preventing negative outcomes during missions and for creating more accurate Graphical Reference Graphics (GRGs) and building labels, especially under time pressure. When the model performs better, greater accuracy is achieved, requiring less correction time and effort. The specific nature of model improvements needs to be defined in collaboration with the client (00:59:43).
> [*]Abel's takes: Very important and relevant context and callouts for potential user mission-oucomes. However we need to segment/diferentiate what are actual model improvements, vs algorithm, and ui/ux. Once we start defining actaul user outcomes and enabling outcomes we can arrtive at some potential KPIs here.. 

**Distinction Between Model, UI, and Algorithm Work:** The team explored how much effort should be dedicated to user experience (UI) work versus model or algorithm work. The model provides building detection, while the algorithm handles the ordering and labeling of those detected buildings based on their map position, which sometimes requires user correction. The goal is to achieve an accurate map in less time, involving improvements across the model, UI, and algorithms .
> Abel's takes: It's worth noting that an outcome/key result is enabling operators/users to "achieve an accurate map in less time", This is already somthing the team achieved during the competition, now he have the opportunity to take those baselines and improve them in prod!

**Consideration of Medium Confidence Tags**: Zach suggested that displaying a "medium confidence" tag for potential buildings (e.g., between 30% and 70% confidence) could be valuable. This would reduce the user's workload by allowing them to focus only on a few uncertain buildings rather than having to scan the entire section for possible omissions (00:59:43).
> Abel's takes: I might need to ask Zach to explain this to me again, I don't remember what brought on this comment. 

**Clarification of SOCOM and SoftMC Roles:** Abel sought clarification on the roles and capabilities of SOCOM and SoftMC, noting that SoftMC was frequently mentioned by stakeholders but was not referenced in the Statement of Work (SOW). The key question was whether SOCOM and/or SoftMC have the capability and interest in independently running their own model training pipeline, or if their engagement with the team suggests a lack of internal capability. Jonathan clarified that the current stakeholders (including Jonh, Nik, Chad, and JB) are understood to be under SoftMC, which is why that term is being used over the broader SOCOM term (01:06:15).
> Abel's takes: An action item for, not related to outcomes or success.. I need to understand the function of SOFT-MC.

**Conclusion and Next Steps:** The meeting concluded as they reached the time limit, with Abel  planning to finalize their synthesis of the notes . The extended timeline provides more time to complete outstanding tasks . Jonathan V and Abel  plan to synchronize later to determine the next steps .

## Figjam synthesis

1. AI/ML enabled GRG ATAK plug-in updated to v5.6: `4.3.1` The contractor shall conduct research and software development to modernize the AI/ML enabled GRG plug-in up to date with the most current software release, specifically the Software Development Kit (SDK) delivered on an established schedule by the TAK Product Center (TPC), while also maintaining compatibility with the SOCOM releases.

#### WHAT DOES "DONE" Mean?

* Technical Documentation: [Documentation: release notes for SKD v5.6, Technical/Architecture decisions table, breaking changes/risk documented], [Release notes / documentation of edge cases and breaking changes],[Ensure that all modules work with 5.6 correct bugs that arise from update or existing], [Code baseline → changes], _(related outcome: Security/quality requirement are met? TAK Forge scans findngs, etc.)_

* new version works with the TAK delivery process: [The .mil label, “signed APK”, the hand-off process with the new version is stable, working], [Make sure the release package has everything that folks downstream would need]

* v5.6 works across devicesnot just passes test and or emulator: [Plug-in is tested, verified working on v5.6 across a couple of android devices]

#### What does success look like once we've delivered it?

* new version demonstrates stability in Production: [We/SOFMC demonstrates The plugin can be run on 5.6 without crashes or errors (installs, launches, and workflow completes a AI GRG generation without a crash or build error)], [Security/quality requirement are met? TAK Forge scans findngs, etc.], _(related outcome: Security/quality requirement are met? TAK Forge scans findngs, etc.)_

* SOCOM’s v5.6 SDK is secure compliant with TAK Forge standards:[Security/quality requirement are met? TAK Forge scans findngs, etc.] 

* latest version is consistent with theGov Release Schedule: [A compliant, tested, deployable and stable GRG plug in version consistent with TPC or SOCOM release schedule(s)]

* intuitive user experience and UI: [Ensure final product has smooth action, with easy to understand icons],[Documentation] 
> Risked flagged: Risk - Clarify scope/client expectations for “improve” vs “convert / get existing working”, unknown how SDK version affects UI/experience <>

////

2. AI/ML enabled GRG ATAK plug-in TAK UI migration cost/timeline research: `4.3.2` "conduct research, while engaging with the government team, to provide a cost and timeline estimate for the effort required to re-write the AI/ML enabled GRG plug-in into the TAK UI development framework. The goal is to establish TAK UI Bridge language cross compatibility."

#### WHAT DOES "DONE" Mean?

* Assumption that done is actually implementing TAK UI, not just doing research: [Kevan - “we should execute the framework implementation, not estimate it”], [“look we did it, here’s how long it takes”], > Flagged Risk: scope/expectations of client, time in period
* Comprehensive documentationoutlining features, use casesand decisions:[Framework mapping artifact: Inventory of current UI components and patterns, Verify if equivalent exists in new framework, Decisions which framework component or pattern to adopt], [outlined risks for some implications for migrating to TAK UI],[Verify if any moduels used have been updated or broken, Mock up of what the plug in would look like with new UI]
* A roadmap showing the work across a timeline: [An estimate with proposed milestones and and estimate target dates.]


#### WHAT DOES SUCCESS LOOK LIKE once we've delivered it?

* Demonstrate that the GRG Plug-in compatible across devices and platforms under the TAK ecosystem: [We/SOFMC demonstrates that same UI components render and function correctly across key platforms from shared code],[SOCOM’s GRG-Plug-in can deploy across all TAK “clients” since it uses the TAK UI standard.], [It works and doesn’t break the existing experience], [With code/data: multi-platform parity confirmed/proven; future platform additions require no UI rewrite(data & code)], [The plugin can survive future updates],_(related outcome:To get to “outcome in prod” a mil TAK user must verify that the UI experience is consistent across platforms)_
> Risk Flagged: we do not control deploy or access to mil users

* SOCOM has the Ability to make informed decisions: [SOCOM can make a no go/yes go decisions on funding a migration to TAK UI as part of the “long term contract”]

////

3. AI/ML enabled GRG ATAK plug-in model improvements (and research): 4.3.3 The contractor shall conduct research, while engaging with the government team, to make improvements to the model for the AI/ML enabled GRG Plug-in.

#### WHAT DOES "DONE" Mean?

* callout: we didn't have time to create themes here, here are the stikcies: [better detection and inference on certain AOIs/terrain types?], [A codify model training pipeline, end to end from Data Collection to Evals and validation to Monitoring in Prod], [Documented baselines for all relevant metrics for the specific use cases], [We have improvements metrics from existing (real-world) baselines.]

#### WHAT DOES SUCCESS LOOK LIKE once we've delivered it?

* callout: [SOCOM and or SOFMC can independently run their own model training pipeline - has the capability], [We/SOFMC demonstrates that more accurate GRGs are created in short time frames (the model better identifies buildings across AOIs) compared to previous version],
* suggested outcome: :"To get to “Outcome in prod” a mil TAK user must create complex GRGs in less time than with the previous version of the plugin"


--

# Post Stand-up Open Questions, Tues March 17

### Summary
Data import and labeling were confirmed, and the team faced the challenge of a wiped ADS infrastructure with no available SageMaker logs, necessitating on-device model deployment.
> Abel's takes: I think ADS is supposed to be AWS

**Data Status and Infrastructure**
The team successfully imported 6 data packages into ATAK, confirming that while the ADS infrastructure was wiped, a backup of the Cebat labeling tool exists. All SageMaker run logs and data were lost, although the necessary Infrastructure as Code configuration is still available.
> Abel's takes: I think ADS is supposed to be AWS. Where would that infastructure still be avaialable?

**Model DDIL Requirement and ONNX**
The core requirement is that the AI model must run locally on the device in a Denied, Degraded, Intermittent, and Limited network environment, necessitating immediate on-device operation. The team confirmed using ONNX for model conversion to meet this requirement.
> definitions: DDIL stands for Denied, Disrupted, Intermittent, and Limited (Bandwidth), a term primarily used by the military and tech sectors to describe challenging network environments. It represents situations where connectivity is unreliable, constrained, or non-existent, requiring systems to operate autonomously, such as at the "tactical edge"
> definitions: Open Neural Network Exchange (ONNX) is an open-source, standardized file format designed to represent machine learning models, enabling interoperability between different frameworks like PyTorch, TensorFlow, and Keras. It allows developers to train models in one framework and export them to another for inference, facilitating "train once, run anywhere" capabilities across various hardware (CPUs, GPUs) and platforms

**Hybrid Detection and Performance**
The team adopted a hybrid detection approach using user-defined sections to improve performance and simplify the de-duplication process, replacing a struggling YOLT implementation. This section-by-section approach significantly reduced the model's runtime to approximately 30 seconds for 10 sections.
> abel's takes: 

### DETAILS

**Training Images and Data Packages:** The team received six data packages, which they imported into ATAK for the competition [i]. The training images were derived from locations such as the Philippines and California [i]. The images Abel viewed that looked like actual pictures were not the source data, but rather screenshots the team took of the data when it was rendered on ATAK, as the source data itself is stored as a SQLite file.

**Image Labeling and Infrastructure:** The team collectively performed the initial and continuing labeling using the tool CVAT [iii]. Although the entire AI/Data Science (ADS) infrastructure was compromised, a backup of CVAT is available on Miss's local computer, allowing the team to provision a new instance if necessary [iii].

**Access to SageMaker and Data Logs:** The team confirmed that all of their ADS data has been wiped, meaning there are no available logs or run data from SageMaker [iv]. Although the data required to restart the system, such as the Infrastructure as Code (IaC) config, is available, the team is currently unsure if they will use SageMaker again during the current eight-week period [iv]. The decision to conduct further training depends on receiving additional data or specific feedback, as justifying more training without new data would be difficult [iv, v].
> I think ADS means AWS... 

**Model Server Requirement and ONNX:** The AI model is required to run on device in a Denied, Degraded, Intermittent, and Limited (DDIL) network environment, meaning the core requirement is that everything must run locally on the device with assumed communication outages [vi, vii]. While a model server might be desired as an eventual backup for additional processing, the immediate necessity is for on-device operation [vi]. The team confirmed they use ONNX [vi].

**YOLO vs. Yolt Implementation:** The team struggled to fully implement Yolt within their ATAC plugin, although it worked locally in a Python environment, it failed to perform well when converted to Java [viii]. Yolt, which stands for "you only look twice," is essentially an extension of YOLO that involves passing a larger image and running kernel sliding multiple times, requiring complex de-duplication processes [vii, viii].

**Hybrid Detection Approach:** The team adopted a hybrid approach, using the user's defined sections to improve detection performance and simplify the process [ix]. This method involves the model scanning one section at a time (similar to Yolt) and discarding any detections outside the section boundaries, eliminating the need for de-duplication [ix]. They also run one final scan of the entire Area of Interest (AOI), though performance is usually worse (around 60%) compared to section-based scans (around 80–90%) because YOLO performs better on small to medium scales [ix, x].

**Performance and Latency:** The new section-by-section approach significantly reduced the model's runtime to about 30 seconds for 10 sections, which is a major improvement compared to the several minutes the full Yolt implementation took [x, xi]. The priority for the customer is the building detection results, as they value the savings in tedious manual work and are willing to tolerate some latency, even if it takes a few minutes, to achieve a high detection rate [xi, xii].

**Future Development and Real-World Data:** The team currently lacks real-world production data regarding the tool's use and performance, with their current knowledge based on initial user assumptions and feedback about saving tedious work [xii, xiii]. They expect that as the tool is used more often, they will receive more frequent requests regarding latency and performance [xiii].

**Next Steps:** Abel indicated they will schedule time later in the day to screen share with Jonathan Van Dalen and walk through a user workflow on the emulator [xiii].

--

## Tues March 17 - TAK user workflow overview

### SUMMARY
Imagery importation and loading were successful, while the core plugin demonstration was hampered by an emulator memory crash, resulting in a successful partial demo.

**Imagery Importation and Loading:** High-resolution Fort Magay Maxar imagery was successfully downloaded and loaded into the ATAC application to address the lack of map detail. The imagery package was named Maxar for reference, emphasizing clear naming for data packages.

**Mission Planning Workflow Established:** The mission scenario was established requiring operators to plan a target building entry within 3 hours, highlighting map building as crucial for shared situational awareness. The informal role of the planner, who creates a shareable artifact like a Geographic Reference Graphic, was clarified.

**Plugin Demo and Emulator Crash:** The team successfully demonstrated setting the planning grid and drawing operational sections before an attempted automatic building detection resulted in a consistent out-of-memory emulator crash. Despite the crash, a subsequent attempt to run the demo progressed further after implementing JPEG compression, confirming progress on resolving the issue.

### DETAILS

**Locating and Importing High-Resolution Imagery:** The discussion began by addressing the need for high-resolution imagery, as the default map in ATAK lacked sufficient detail. They decided to try importing a small image package,Abel successfully downloaded the required SQLite file, unzipped it, and copied it to the phone's file system, noting that the larger file would be the one needed (00:01:00).

**Loading Imagery Data Package into ATAK:** Jonathan guided Abel through loading the data package into the ATAK application through the hamburger menu and 'data packages' section. The file was found under 'downloads' and was checked for inclusion as an attachment before being named 'Maxar' for reference, emphasizing the importance of naming packages after their source for clarity (00:03:10). The package was then built and loaded, confirming that the imagery was now available (00:04:00).

**Verifying Plugin Load Status:** After successfully loading the imagery and zooming in on a village, the speakers confirmed that the necessary plugin, internally referred to as the 'gr8 plugin' and previously a prototype, was loaded. They identified the plugin's user interface (UI), noting that the UI was placed in an unobtrusive location, which was an expediency given the short development timeframe.

/// Use cases, pain-points and user personas
**Establishing Mission Context and Preparation:** Jonathan established the scenario where operators in the field have three hours to plan and execute a mission to enter a target building, identified as a large red building on the map. The preparation includes mapping and labeling all buildings, gathering gear, and other necessary communication prep, highlighting that map building is crucial for mission planning and execution. The completed map needs to be shared with all executing personnel to ensure shared situational awareness and common communication references, such as grid sections (00:08:09).
> Abel's takes: This is where the first user journey and description come into play. I am interested in documenting this user persona, their jobs, role.. but also keep in mind that we still need to learn more, as in are there more use cases, roles?

**Clarifying the Role of the Mission Planner:** Abel sought clarification on the term "planner," which Jonathan explained is an informal term referring to the person who plans and shares the map, not a specific title (00:08:09). The planner could be someone like a gunnery sergeant or a fire support specialist in special operations, and the role can be fulfilled by a high-level intelligence person or an operator making impromptu plans in the field (00:09:08). The output of the planning phase is a shareable artifact, such as a Geographic Reference Graphic (GRG), in a format like KMZ (00:09:57).
> Abel's takes: Here, Jon talks about other user types..It would be important to clarify all this with the customer and figure out who we have access to vs not.. what are the different types of user segments?

**Discussing Communication Standards and Terminology:** The conversation covered the military communication standards relevant to the map, including the role of a Joint Terminal Attack Controller (JTAC) who is qualified in mission planning and communication, and the "nine lines" ritual for communicating needed support (00:10:45). These standards require a shared definition of building identities for coordinating air or artillery support with ground forces, which underscores the necessity of having a clear, labeled map.
> Abel's takes: Here is another use case, and workflows as well as potential user roles. Worth nothing this as we build out personas and jouney maps, most importantly determing outcomes.

**Demonstrating Manual Labeling (The "Old Way"):** To illustrate the problem the plugin solves, Jonathan demonstrated the existing manual method of labeling buildings in ATAK using the 'point dropper' tool (00:13:58). Users would manually place markers on every building, then long-press or use the radial menu to edit marker properties and change the auto-generated name to a systematic name like A1, A2, and so on (00:14:44). This manual process is time-consuming and painful, particularly when needing to reorder many points (00:17:24).
> Abel's takes: an example of "the current state" it will be worth to flag this for the Value Stream, current state and waste, as a starting point. We need more fromt the customer


**Addressing Labeling Conventions and Discretion:** Abel questioned the discretion of the labeling order, which Jonathan confirmed is not prescripted and often relies on "tribal knowledge" or team preference (00:18:12) (00:20:13). Different approaches include naming the target building A0 and assigning higher numbers concentrically outward, or systematically sectioning the village and numbering buildings within each section (e.g., A1, C1) based on preferred entry direction (00:19:17).
> Abel's takes: It be interesting to find out if this can be validated further with other users, if we get access to other users. Maybe there is a benfit of not having some sort of "standard" or prescribed method of labeling, specially if it can be done quicker now with AI
///

**Setting the GRG Grid and Bounds:** Before labeling, the planner typically defines the grid boundaries for the area of operation, which informs the building labeling. After deleting the manually placed markers, the team transitioned to using their plugin, which handles the grid creation. They successfully toggled on the grid from the plugin menu.

**Customizing and Locking the Planning Grid:** The grid functions, accessed by tapping the center point, allow for changes to the number of columns and rows, spacing, and locking the grid position (00:23:26). Abel locked the grid, ensuring that the grid coordinates, such as D3, remain fixed and serve as a consistent communication reference, which is the minimum viable way for a team to communicate (00:25:14). The grid was expanded using the column and row functions to cover more of the map.

**Drawing Operational Sections:** The next step in GRG creation involves drawing sections, which military users typically base on natural landscape breaks like roads (00:27:27). They used the segment-drawing tool to outline a section on the map, intentionally following the road borders, as users generally avoid crossing landmarks when drawing sections. The system automatically assigned the name "Section A" to the first completed section (00:28:32) (00:32:42).
> Abel's takes: important user behavior and standards "drawing sections...base on natural landscape breaks like roads", question about the model's and the AI's capabilities... does it flag or throw some sort of callout to the user if they "cross landmarks". 
- Jon did tell me later that: _There are too many variations and the grg planners are very opinionated in different ways. One thing we did consider but did not have time for was auto-defining the sections for the user, based on the natural marks and roads, which would be optional and able to be turned off.-

**Customizing Section Properties and Sequence:** After drawing a second section (Section B) around the target building, they examined the section's radial menu and the plugin's specific functions for that section. Tapping the plugin icon revealed options for changing the section name, color, and setting parameters, such as the starting number for the buildings within that section, allowing the user control over the labeling sequence (00:38:00). Planners typically aim for 50 or fewer buildings per section for clear communication (00:35:13).
> Abel's takes: I would like to dig a bit more in the building count preference.. 

**Attempting Automatic Building Detection and Inference:** The next intended step was to use the plugin's "detect buildings" icon, which runs inferences to maximize building identification within the drawn sections and the overall grid. The model's inference strategy is more efficient with smaller sections because it can process smaller image tiles at higher resolution. Running the detection resulted in a crash, which Zach identified via the log cat as an "out of memory error" caused by the emulator's limitations 
> Abel's takes:

/// plug-in walkthrough stopped due to crashes, continued discussing "what would happen next:
**Reviewing Failed Inference and Post-Detection Steps:** Jonathan explained that if the inference had successfully run, it would have automatically labeled buildings within the sections, and the planner's subsequent task would be to correct or reorder those labels. The reordering tool, which resets the label order, is found within the section radial menu (00:44:16) (00:46:57). They noted that the crash had caused the shape to become dissociated from the plugin's section context (00:51:59).

**Explaining the Manual Labeling Feature within the Plugin:** The final controls discussed included the manual "add label" feature, which differs from the standard ATAC point dropper by adding labels that conform to the specific section's naming strategy and settings. For instance, if a section was labeled A1-A6, the plugin's manual label function would automatically add the next label as A7, avoiding manual name editing and rework (00:48:05) (00:50:01). The discussion concluded with another attempt to run the inference, which also failed due to the emulator's memory issue.
///

**User Workflow for Correcting Inference Results:** Jonathan outlined the process for correcting building labeling after the inference is run and labels are automatically applied. The user has three primary functions: adding a missed building using the "add label" tool, deleting markers incorrectly identified as buildings (e.g., a tree), and reordering assigned labels using the section radial plug-in settings. The system will ensure that any added label follows the existing labeling scheme to avoid breaking the plugin (00:59:37).
> Abel's takes:

///Building detection and inferance ran successful following day, (march 18)
**Virtual Device Configuration Demonstration:** Zach explained that the VM heap setting should be switched to 300 megabytes from the typical 256 megabytes to stabilize the virtual device [ix, x]. They provided a step-by-step guide for Abel on how to edit the existing device settings in the device manager, though Thomas suggested editing the device might suffice instead of a full rebuild.
**TAK UI Documentation and Access:** Thomas provided a brief update, stating they are continuing to research documentation around TAK UI, although they doubt its availability because it is restricted behind a TAK Forge access the team lacks [xi]. Abel requested that the team review the success definition drafts posted on Slack and provide feedback or comments directly in the thread for team visibility [xi, xii].

**Virtual Device Rebuild and Configuration:** After the initial edit attempt failed, Zach  guided Abel through completely rebuilding the virtual device, selecting the medium phone with API 29 Q, and setting the VM heap size to 300 [xvi, xvii, xviii]. This process involved running the deploy ATAK shell and install civ debug scripts after the new device was active.

**Building Detection Success and Next Steps:** Abel successfully ran the building detection with the newly configured virtual device in a less populated area, which resulted in "41 total buildings detected" and allowed for relabeling [xxix, xxx, xxxi]. The new setup resolved the previous KML file error, creating a more stable environment for running demos [xxv, xxvi, xxxi].
////

///Crash and Trouble Shooting, (march 17)
**Emulator Crash and Troubleshooting:** An attempt to run a demo resulted in a system failure, which appeared to be a factory reset (00:58:08). Abel Hernandez inquired about the status of debugging the emulator crash, which Zachary Greenlief confirmed they were actively working on to improve performance, noting that the application works better on hardware. Zachary Greenlief has been attempting solutions, such as adding a recycler and reducing the size of JPEGs, to address the crashes and is using this process to become more familiar with the codebase (01:01:43).

**Successful, Partial Demo Run Attempt:** Zach implemented a change to compress JPEGs and made progress in resolving the crash, allowing the demo to run further than before and move on to Section B before ultimately crashing at the capturing grid area (01:02:35). Although the run ultimately failed, Abel Hernandez acknowledged this as progress, and Zach committed to continuing to investigate the issue.

**Development Change Status:** Abel asked if they would need to pull changes if Zachary Greenlief fixes the emulator crash, but Zachary Greenlief suggested this might not be necessary since the issue is specific to the emulator and the device is currently working fine. Jonathan Van Dalen encouraged Abel Hernandez to watch the demonstration video for context, believing the video will be more helpful now with the information discussed
///

# Friday March 20th - "Get thec current direction" scans

## [1] pre-sow-tak-competitions.md

1. Manual GRG creation effort doesn't scale
Perceived effort "explodes" as building count increases. 100 buildings = manageable; beyond that, stress and time spike disproportionately — especially under tight mission windows.

**2. Time pressure is the critical pain point**
Under 2–3 hour windows, AI GRG creation is "the difference between having a sheet of music or having none." Speed directly determines whether a mission can be planned at all.

**3. Labeling accuracy and sequence correction is the worst UX**
9–12% of labels require manual correction. Fixing numbering sequences after hundreds of labels are placed is described as extremely frustrating and time-consuming.

4. Labeling is an art, not a science
No universal standard exists — terrain, approach direction, unit preference all influence labeling decisions. This creates inconsistency and knowledge gaps across operators.

5. The operator is always the final authority
AI automates building detection but the operator reviews, corrects, and approves. The system is augmentation, not automation — trust and correction UX are critical.

**6. Post-mission feedback loop is absent**
No built-in mechanism exists to capture operator corrections or field performance for model retraining. The feedback cycle from mission execution back to model improvement is a known gap


## [2] sow-tak-bridge-project.md

**1. TAK is a decision-cycle enabler, not just a mapping tool**
SOW frames TAK as critical to SOF operator decision cycles, force responsiveness, and mission command — GRG creation sits inside a much larger operational context than the plugin alone addresses.

**2. Cognitive load reduction is the stated outcome**
The SOW explicitly names "decreasing the cognitive workload by generating an AI/ML GRG" as a core objective — the only user-facing outcome explicitly called out in the contract language.

[3] tak-kickoff-strategy.md
[4] tak-repo-info.md

## [5]tak-vsm-first_pass.md

**1. Manual building labeling is the worst user experience**
Identifying buildings manually, tapping hundreds of items, and fixing label sequences when mistakes occur is described as extremely frustrating. Effort doesn't scale linearly — it explodes with building count and time pressure.

**2. Image preparation is a hidden friction point**
Downloading large imagery packages, managing multiple data packages, and dealing with connection instability is the first step in the workflow — and already a barrier before GRG creation even begins.

**3. Grid and section definition is entirely manual and finicky**
No automation exists for placing the grid or drawing sections. Getting section sizes, shapes, and naming flow right is time-consuming and relies on judgment — a known pain point across users.

**4. Labeling conventions are tribal knowledge**
No prescribed standard for label order or direction. Teams rely on preference and habit, creating inconsistency across GRGs and potential for miscommunication during mission execution.

5. The exported GRG is a static artifact
The KMZ export is described as a "glorified image" — recipients cannot edit it the way the creator could. Real-time updates or corrections during a mission are not currently possible.

**6. Mission time windows vary dramatically**
Some missions allow days for planning; others allow 10 minutes. The plugin's value proposition and success criteria change significantly depending on the window — and no framework exists yet to account for both.

7. What "better" means has no agreed definition
The plugin is a modernizer, not an enabler — GRGs were already possible. "More complete" and "more accurate" appear in the mission impact statement but have no metric, threshold, or validated definition behind them.

**8. The post-mission feedback loop is almost entirely unknown**
What happens after the GRG is shared — during execution and debrief — is the least understood part of the value stream. No mechanism exists to capture field corrections or GRG effectiveness for model improvement.

## [6] tak-daily-march_16-x.md

**1. Model accuracy degrades across terrain types**
Prior work confirmed quality results varied significantly across terrain — clear desert performed differently than areas with tree cover or complex urban environments. Consistent accuracy across diverse AOIs remains an unsolved problem.

2. The plugin only works reliably on real hardware, not emulators
Building detection caused consistent out-of-memory crashes on emulators. The plugin performs better on physical devices — a constraint that limits development, testing, and demo access for the team.

3. No real-world production data exists
The team's current knowledge is based on competition assumptions and user feedback, not field use. How the tool actually performs in production — latency, accuracy under real conditions — is still unknown.

4. DDIL is a hard constraint, not a preference
The model must run entirely on-device with no cloud dependency. Denied, Degraded, Intermittent, and Limited network environments are the assumed operating condition — not an edge case.

**5. Section drawing relies on operator judgment with no standard**
Planners draw sections based on natural landscape breaks — roads, tree lines, intersections — but there is no prescribed method. This creates variability in GRG quality across operators and missions.

6. Model improvement scope is undefined by the customer
Whether improvements should focus on architecture, training data, or inference strategy has not been clarified by SOCOM. Without that direction, the team risks improving the wrong thing.

--

---

# Google Meet Invite — Success + Enabling Outcomes Workshop
*Internal | Full team | Before kickoff*

## Description

We have 4 SOW tasks and almost no shared definition of "done" for any of them. Before kickoff on March 18th, we need to align as a team on what success actually looks like for each deliverable — in our own language, not the customer's. This is not a refinement session. It's a shared context exercise to make sure we walk into kickoff saying the same thing and ready to validate our assumptions with SOCOM.

## Agenda

**1. Task-by-task review (40 min)**
We'll go through each of the 4 SOW tasks in order. For each one, we answer 4 questions as a group:
- What does "done" mean for this task?
- What does success look like once we've delivered it?
- Who does what — and by how much?
- What assumptions are we making?

**2. Assumption gut-check (15 min)**
Review the full list of assumptions surfaced across all 4 tasks. As a group, identify the top 3 that are the riskiest — the ones where being wrong would hurt us most.

**3. Kickoff agenda alignment (5 min)**
Those top 3 assumptions become explicit agenda items for March 18th. We leave with a shared list of what we need SOCOM to validate on Day 1.

**Output:** A plain-language definition of "done" for each task + a short list of assumptions to confirm at kickoff.

# 

**WHAT IS AN ENABLING OUTCOME**

get an environment stood up

## STAND UP

YESTERDAY
- VSM
- Synthesized and share "key take aways"

TODAY
- Clean up and finish the value stream
- Share out some of the assumed constraints for each process
- Outcome drafting in GitLab
- will post "My focus for the week"



---

Orders! Red building!
- "Planner", kmz = format or other formats

jtak qualified
9 lines

section drawings (roads, )

1. the planning phase

2. exported

3. shared

TAK stand-up Tues, March 17th

- Finish the "what does success look like"
- Starting adding Epic-Features to GitLab + Enabling Outcomes
- Team Norms, arond 

JVD - User Journey foundation
Wayland - devices, status of them

Plug-in demo,

DDEL network
Distributed, Deneid in

YOLT
de-duplicate (based off neg)
YOLT hard to run
trying to get YOLT , worked well locally
not doing well in Java
Hyrbrid approach
see the sectin "pop up, scanning" = YOLT, is a way
for us to get better detection perfroce
when you draw a section, 
make a square that overlaps
one scction at time
anything outside we throw it away

YOLO
aio 
80 to 90
60 to 70


---

# PM Must Do's

## 1. Define Outcomes and Impact for the 4 Contract Tasks
*ref: tak-kickoff-strategy.md — Work Track #1*

Define the North Star (impact) and map each of the 4 tasks to either a user outcome or an enabling outcome — using the enabling outcome template developed with JVD. Enabling outcomes are binary deliverables (done or not done) and don't require metrics; user outcomes require measurable behavior change. For each task, establish what "done" looks like and what success criteria the team can track. Start from outcomes, not stories.

> **Supporting action:** Finalize the GitLab issue board — get the enabling outcome and impact epic templates, labels, and structure set up so the team is tracking work against outcomes from Day 1, not retrofitting later.

---

## 2. Build a Shared Design and Engineering Collaboration Foundation
*ref: tak-kickoff-strategy.md — Work Track #4*

Support Jon and Coby in leading a team exercise — likely grounded in HCI principles — that gives the whole team a shared language for design decisions. The goal is a foundation everyone can fall back on, so the team knows when to move independently and when to loop someone in.

---

## 3. PM Personal Action — Domain Fluency
*ref: tak-kickoff-strategy.md — Work Track #5 and Work Track #9*

Build a working foundation on computer vision and model training pipelines. Enough to understand what the team is building, ask informed questions, and flag tradeoffs. Key concepts to get grounded in: how images are labeled, how a model learns from labeled data, what "retraining" means, and what a repeatable pipeline looks like end-to-end. Lean on Kevan to fill in the gaps specific to this project.

Watch the demo recordings and review the release slide decks from the competition. Kevan specifically recommended this as the fastest way to understand how the plugin aligns with MOSA and where the team's prior thinking landed. Do this before the Kevan demo session so the internal discussion is more productive.

---

## 4. Codify the Model Training Pipeline as a Parallel Work Track
*ref: tak-kickoff-strategy.md — Work Track #5*

Align the team internally that codifying the pipeline is part of how we work, not a separate deliverable. Work with Kevan to understand how to determine whether the pipeline can run inside TAK Forge — that answer shapes the architecture. Surface this with the customer at kickoff so they can weigh in and help clarify constraints.

---

## 5. Build Shared Domain Understanding Before Kickoff
*ref: tak-kickoff-strategy.md — Work Track #9*

Schedule two internal sessions before kickoff: Kevan demos the GRG plugin end-to-end (how it works, what it produces, where it fails), and Jonathan runs the team through the user journey and workflow. PM should also independently review the demo slides and release recordings from the competition to build personal domain context.


# RISK + URGENT + MONITOR

* The political wrinkle (which we identified earlier): TAK UI is TPC's GOTS, not SOCOM's. If Rise8 evaluates it and concludes it's not modular or scalable, we're essentially critiquing TPC's software — which puts us in the middle of the SOCOM vs TPC tension. That's exactly why Work Track #3 in the kickoff strategy flags this as something to clarify at kickoff before Rise8 takes any position.

---