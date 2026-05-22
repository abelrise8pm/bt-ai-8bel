## March 3rd - Epic Hypothesis Statement
Attachment 02 Epic Statement (AIML Enabled Gridded Reference Graphic (GRG))

For: SOF Tactical Operators
who: plan missions
the: Gridded Reference Graphic (GRG)
is a: tool
that: provides a common reference graphic allowing multiple units to coordinate on an objective
unlike: the current tools
our solution: will leverage AI/ML detect, identify, confirm, and label buildings in the TAK Suite of Software, thereby creating a GRG
> Abel's Takes: On the Epic hypothesis- I would like to know who are the actual users, what does SOF mean. What model are we using and who owns it? Lastly, was the solution "successful"?

* Business Outcomes: SOF Tactical Operators will be able to automate the incredibly manually intensive product creation process
> Abel's Takes: I need to watch the demo to see how this works, and ensure we are align on what "automate" means in this apps or plug-ins use case.

* Leading Indicators: GOV ONLY

* NFRs
- Maintainability: Dependencies for maintaining CI/CD to SOCOM
- Usability: Should not require in-depth new user training 
- Maintainability: MOSA architecture to allow replacement of AI/ML model
> Abel's Takes: It's clear that our customer (SOCOM) want to own the end to end SDLC and path to prod. So everything we do must suport that. Clear on the usability, and I also what exactly is MOSA architecture and why are we replacing the AI/ML model with it?

# March 4th from JVD via Slack

JVD: Set a time up tomorrow to give a rundown on TAK, the engagement, and the deliverable we came out with, figured you could both use that info so may as well come together at the same time. We can do more follow ups over the next week to clarify things more or go more detailed.
> Abel's Takes: I will ne curious to learn/understand if the work we will do, after we update the plug-in and do whatever UI audit.. will be a continuation of this plug in or what exactly will be "the work"

JVD: Here is the video to check out if you want to just jump to the last chapter and read the ending, but you will miss the scene setting and character development. You will hear "SOO [number]" (incorrectly transcribed as "Sue" by the AI notes) a lot, that refers to their requirements doc/challenge needs.
> Abel's takes: Noted! 

### VIDEO SUMMARY - start
The video demonstrates the capabilities of the ATAK system in a fully disconnected environment, starting with the operator using a Samsung Sxx in airplane mode to manually process and manage critical targeting data, which satisfies SUE 4x and SUE 4x.

The demonstration then covers several features and steps:

* Defining the Area of Interest (SUE 4xx): 
> The operator uses the GR8 plugin to place a center point over the target building and manually defines the exact boundaries of the mission area.

* Automated Grid Labeling (SUE 4xx): 
> As the area is defined, the AIML plugin immediately and automatically labels the grid, creating an instant, sharable language (like Bravo 4) for the entire team.

* Organizing the Grid (SUE 4xx): 
> The next step is to create sections using the native TAK shape drawing tool, which logically groups buildings and helps focus the AI on smaller, manageable areas. This use of smaller sections improves model performance because they can be run separately through inference. The shape drawing tool also skips ambiguous letters in section labeling (such as B and H, or I and one) based on user feedback, though this setting can be toggled.

* AI Detection (SUE 4xx and SUE 4xx): 
> A single tap triggers the full AIML capability, automating the detection and plotting of all buildings and thus reducing the cognitive workload (SUE 42). This inference happens entirely on the device, with no external processing (SUE 4x dill).

* Review and Correction (SUE 4xx): 
> The operator acts as the final authority, reviewing and correcting the AI's work. The system automatically renumbers and re-labels markers when a missing building is added or an extra marker is removed. The numbering can also be fixed with one quick swipe, dragging the circles over the markers to follow the desired direction. This re-sequencing (SUE 4xx) is a massive reduction in user effort and cognitive load.

* Changing Section Parameters (SUE 4xx): 
> The operator demonstrates full control over a section's parameters, including name, color, and numbering, to match mission and team conventions and SOPs.

* Exporting the Product: 
> The plugin provides a toggleable legend, which is critical when the product is printed or shared, as it includes the operation title, location (MGRS), and version. The final GRG product, including all grids, sections, labels, and legends, can be exported as a sharable KMZ file, which enables data sharing and direct integration with TAC software.

> Conclusion: The system proves the manual receipt of battlefield information and the automated receipt and interoperability with other mission planning software.

### VIDEO SUMMARY - END ///

JVD: The super short version - We delivered a plugin (the "AI/ML plugin") for ATAK (Android Tactical Assault Kit) which automatically detects and labels buildings on map imagery, according to SOCOM labeling practices and formats, with the goal of dramatically reducing operator time to create these key artifacts (the "GRG" or gridded reference graphic) before a team heads out on a mission. They need these graphics, either printed out or on their own android devices, in order to align on which building has what number, and where people and targets are in relation to building numbers, so Less Bad Things Happen™

---

Planning activities, imagery
- make a GRID
- with Letters and Numbers

aside from 
- updating the version
- auding the UI
-- What are we supposed to do? work on another plug in? scale this? work on the other stuff you guys un cover?
- are we gonna iterate on the "swiping feature?"

---
## March 5th, Thursday- Welcome to TAK:  A TAK Informational Session

### SUMMARY
Jonathan(JVD) opened the meeting to share essential information about the Team Awareness Kit (TAK) platform, noting that Abel and Coby had some existing familiarity with the system, which is used for mission planning, generating gridded reference graphics (GRGs), and displaying team locations. The core pain point identified was the difficult manual process of labeling hundreds of buildings within a short time frame, where the labeling order is non-standardized and subjective. To address this, the team developed an automated plugin for ATAK and WINTAK that uses a custom machine learning model to detect and label buildings, with the highly praised "swipe" feature allowing users to easily reorder and relabel buildings according to their preferences, which was a likely factor in the team winning the challenge. Discussions concluded with the team assuming the focus of the bridge contract will be on polishing the existing feature set and deployment readiness, including a potential UI audit, and emphasizing the necessity of physical hardware for plugin testing.

### DETAILS

**Introduction to the TAK Meeting's Intent:** Jonathan opened the meeting by stating its intent was to share essential information about the Team Awareness Kit (TAK) and that the second half would be open for questions or requests for information. Abel and Coby have some familiarity with the system, with Abel mentioning their first engagement at Tanzu was an ATAK plug-in (00:00:00). The team proceeded without needing an extensive overview of the basic TAK application (00:01:52).


**TAK Platform Overview and Naming Conventions:** TAK stands for Team Awareness Kit or Tactical Assault Kit, and the reason for the two names remains unclear. The platform has different versions, including a civilian version used for activities like paintball, and controlled government and military versions (00:01:52). TAK is multi-platform, including ATAK for Android, WINTAK for Windows, and iTAK for Apple devices (00:02:53).

**Core Functionality of TAK:** TAK is primarily used for planning activities by utilizing overhead and satellite imagery. A common use case involves defining an area of interest around a target (e.g., a building with a "bad guy") and generating a gridded reference graphic (GRG), which uses letters and numbers for spatial commonality in communication (00:03:47). The system displays live views of other team members who possess Android devices, showing their locations on the map (00:05:04).

**Map Detailing and Visualization:** Planners can add various graphical elements to the map, such as drawings, labels, zones, vehicle icons, and floor plan overlays on top of buildings to increase detail (00:05:04). These elements are based on vector graphics and coordinates, allowing them to scale and move proportionally when users zoom in or out. When underlying imagery is blurry, planners can overlay higher-resolution images or floor plans onto the map, similar to using layers in Photoshop (00:06:14).

**Existing Workflow and Pain Points for Labeling:** The existing manual workflow for creating these operational graphics involves importing imagery, drawing a grid (using another tool), and then using a built-in Point Dropper tool to label buildings (00:07:03). Buildings are the primary reference point in these missions, and users must manually identify and label every building within the grid, often using numerical schemes like building 001, 002, etc (00:08:09). If a mistake is made in the labeling sequence, users must manually edit each number or delete and redo the work (00:25:33).


**Non-Standardized Building Labeling Order:** The order in which buildings are labeled is considered an "art" and is determined by "tribal knowledge," often related to the mission, operational direction, and approach, rather than a fixed standard (00:09:10). Different operators have different, strongly-held opinions and strong reasons for their preferred labeling order, which makes it hard to predict (00:10:06) (00:12:13). A further complication is that the definition of "what is a building" is often subjective due to image quality, shadows, and resolution, forcing operators to make judgment calls for communication clarity rather than scientific accuracy (00:13:00).


**The Challenge and Feature Requirements:** The work was set up as an eight-week challenge against three other vendors, where the client provided limited information and would not answer questions about the desired outcome. The nine "must-have" features provided in the initial document were the baseline expectation for delivery (00:14:53). It was discovered that the client's actual priority was seeing "cool stuff that users loved," suggesting a hidden criterion focused on user involvement and engagement in defining additional requirements (00:16:46).


**The Problem Statement and Time Constraints:** The core problem identified was that manually labeling potentially hundreds of buildings on a small screen, often under stress and a strict time constraint (sometimes a 10-minute window before the mission starts), is extremely difficult (00:19:59). Missions can begin regardless of whether the necessary map imagery and grids are complete, accurate, or even in place, sometimes leading to negative outcomes (00:21:01). The solution needed to address this short time window

**The Automated Solution and AI Model:** The team developed a plugin for ATAC and WINTAC that integrates into the existing map setup and grid creation workflow (00:21:58). The plugin uses a custom machine learning model, taught to identify and label buildings, which automatically detects and labels them according to a default acceptable order. This model was optimized for mobile use, utilizing a highly customized version of the YOLO (You Only Look Once) framework (00:22:58) (00:37:35).

**The "Wow" Feature: Swipe to Relabel:** The most highly-regarded feature was the ability to reorder and relabel buildings via a "swipe" gesture on the map (00:23:50). If the user does not like the AI's default labeling order, they can select an icon and draw a path over the buildings in the desired sequence, and the system automatically relabels them accordingly (00:28:15). This feature, developed at the last minute despite being previously deemed infeasible, was considered a likely factor in the team winning the challenge because it allowed users to fix automated output painlessly (00:23:50) (00:31:20).

**Project Management and Team Structure:** The eight-week effort was run in a non-standard way, with a focus on intense work and hitting milestones without typical rituals or standups. The Project Manager, E, maintained the aggressive schedule, while Kevin handled the engineering piece, and the engineering team worked somewhat separately (00:35:48). Bi-weekly presentations included live demonstrations, architecture and security discussions, and user engagement insights (00:39:56).

**The Bridge Contract and Future Work:** Jonathan indicated they do not know the specific requirements of the bridge contract, though Abel Hernandez mentioned hearing about updating the plugin version and a UI audit (00:34:18). The assumption is that the new phase will focus on polishing the existing feature set and getting the product ready for deployment, rather than iterating on the feature set or developing new features (00:35:01) (00:40:48). The current TAK UI is considered "an absolute mess," and a UI review would likely focus on ensuring the plugin's design adheres to existing consistency standards or guidelines

**Necessity of Hardware for Testing:** It was noted that having physical hardware (phones) is critical for testing the plugin because emulators are unreliable for reproducing how the device behaves in real-world scenarios. Jonathan mentioned being unable to get the emulator working at all and relying on hooking up their phone for mirroring and testing (00:43:53).


