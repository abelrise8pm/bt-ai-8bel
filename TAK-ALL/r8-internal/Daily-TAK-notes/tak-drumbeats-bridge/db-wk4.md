## SOW Context:

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

## RECIPEINTS

nizme.n.cuin.ctr@socom.mil, david.akers@sofwerx.org, gabrielle.robles@sofwerx.org

chad.j.raaymakers.civ@socom.mil, shane.d.toner.mil@socom.mil, nikolas.a.cline.ctr@socom.mil, jonathan.r.miller.civ@socom.mil,
daniel.a.lynch.civ@socom.mil, robert.k.boone.ctr@socom.mil, james.vernon2.ctr@socom.mil

Sharon, Kevan

--

### 🚀Mission-Outcome: 
> SOF Operators increased their focus on the mission environment, as the frequency and manual effort required for configuring and correcting GRGs on the device screen is reduced.(work in progress)

### 📊 WEEK'S PROGRESS

[4.3.1] Signed .mil AI GRG plugin delivered to SOCOM for ATAK 5.6 field review. Sent directly to Chad Molyet and Nik, initiating the government-side review process before field deployment.

[4.3.2] Rise8 and BAH TAK UI team held first working session and aligned on a collaboration model. A recurring weekly sync and communication channel are now in place to coordinate TAK UI development priorities and identify opportunities for native component contributions.

[4.3.4] GOTS plugin evaluation kicked off with initial direction from SOCOM. Rise8 and Nik agreed on the evaluation approach and which plugins to assess first, keeping the initial scope focused.

### 🗓️ LOOKING AHEAD

[4.3.1] Awaiting SOCOM field feedback and completing 5.4 compatibility testing. Successful validation on both clears the path to advance development to SDK 5.7.

[4.3.2] First technical working session with BAH to review four TAK UI workflow stories. Nathan's input on each determines whether to pursue native development, further research, or a custom approach.

[4.3.3][8.1.4] April 22 sprint demo showcases before-and-after building detection improvements. Side-by-side comparison gives SOCOM a concrete, data-backed view of how detection performance improved this sprint — connecting model progress to real operator impact.

[4.3.4] Combat Swim and Trailblazer analysis shared with SOCOM leadership. Initial findings show duplicate capabilities built in isolation across plugins — giving SOCOM the evidence to shape a more connected portfolio.

### 🙋 Asks, Risks & Mitigations

[First End-to-End Delivery — Timeline Visibility]
Running the full delivery process with SOCOM for the first time; timeline from DT validation to field deployment is not yet fully mapped.
COA: Nik will walk Rise8 through the complete post-handoff process next week to establish a shared understanding.

### Rise8 / BAH / USSOCOM Sync Summrary from Monday April 17
1. Collaboration Norms Agreed
Rise8 and BAH will hold a 30-minute weekly sync. Abel will send availability to Kelly to get the recurring call on the calendar. A private Mattermost channel will be set up for async communication. For bug fixes that do not change any APIs, Rise8 will submit a merge request directly. For new or changed APIs, Rise8 will email Nathan before any changes are made.

2. Documentation
Nathan requested access to Rise8's repo and documentation, which we are preparing to send. Kevan requested BAH's API stability guide. The TAK UI documentation site is currently expired and unavailable. TPC is working to restore it. In the short term, Rise8 is coordinating directly with Nathan for technical questions.

3. Pending Actions
Abel will send Nathan screenshots of Rise8's UI components for review. Nathan flagged that the Floating Toolbar is currently in progress this sprint for xCheck. Nathan also requested access to Rise8's repo to see how we are using Radial Menus, a TAK UI component he confirmed is available, though the version in use may be older.

### Proposed outline of the four work streams for the one-month extension following May 15.

**1. Maintain Active Compatibility Support for ATAK Versions 5.4 and 5.6 (related to 4.3.1)**

* Continue development against version 5.7
* Monitor upcoming ATAK releases and prepare for upgrade, testing, and delivery
* Incorporate field operator feedback into plugin improvements
 

**2. TAK UI Contributions and Migration (related to 4.3.2)**

* Collaborate with the TAK UI maintainer team to develop a prioritized roadmap for TAK UI capabilities required by the AI GRG plugin
* Provide greater granularity on cost and timeline estimates based on actual development effort
* Conduct research on TAK UI development
 

**3. Model and Plugin Improvements Based on Operator Feedback (related to 4.3.3)**

* Iterate on model and plugin improvements based on operator feedback, and assess capacity for new feature requests and refinements
* Assess the scope and effort required to codify a repeatable model training pipeline
 

**4. Plugin (GOTS) Evaluation (related to 4.3.4)**

* Continue evaluating the broader plugin portfolio beyond the initial assessment — including modularity, scalability, and interoperability — identifying gaps and patterns across SOFMC/SOCOM
* Workshop the MOSA baseline with Nik, moving from observations to actionable recommendations documented as agreed-upon baseline findings
* Synthesize findings from the portfolio evaluation and MOSA workshops into an initial working draft of what a shared core library and schema standard could look like for the plugin ecosystem
 
 ---

1. 5.4, 5.6 Verification and Testing, and Bumping to 5.7 
4.3.1
Signed .mil plugin loading on device and acceptance testing is underway. Team is resolving build issues that surfaced during testing, once resolved, the validated build and Artifactory link will be shared w/Chad. SDK 5.7 development will follow as the next baseline once the 5.6 release is clean and approved. 
- Expected Deliverable by or before May 15th: Validated, .mil signed AI GRG plugin on SDK 5.6 delivered to SOCOM, with 5.7 development baseline established.

2. TAK UI Migration Efforts 4.3.2
Rise8 and BAH established a collaboration plan. For each workflow, Rise8 will align with Nathan to confirm native TAK UI support. For components without native support, both teams will determine priority together: whether BAH is already developing, adds it to their roadmap or if Rise8 develops escape hatch or contribute to TAK UI framework. 
- Expected Deliverable by or before May 15th: Migration effort estimates and assessments across GRG workflows, with some TAK UI development started on specific workflows..

3. Model Improvements 4.3.3
Detection reliability improvements are underway and the team is quantifying performance gains ahead of production release. 
- Expected deliverable before or by May 15: Side-by-side detection performance comparison documented as part of the plugin release notes.

4. GOTS Evaluation 4.3.4
Initial plugin review is underway. Early findings show siloed tools with inconsistent schemas and disconnected workflows. Finalizing evaluation criteria and initial MOSA framework to identify improvement opportunities and interoperability gaps across the portfolio. 
- Expected Deliverable by or before May 15th: Assessment of plugin capabilities delivered as a briefing to the PMO.
