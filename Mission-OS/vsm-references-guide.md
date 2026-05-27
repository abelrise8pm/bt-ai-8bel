### What is Value Stream Mapping?
A visual tool that analyzes and improves the mission/business process flow required to deliver more and/or better outcomes in prod (i.e. measurable user/system behavior changes, that generate measurable changes in mission impact) with the products or services we deliver. 

VSMs enable teams by mapping out all steps in the mission/business process that deliver a product or service ensuring we highlight waste that’s effecting our mission/business impact.

### Why is it valuable?
- Helps ground us in existing operational realities.
- Identifies if fundamental delivery assumptions are broken/inefficient, and could impact user experience
- Aligns stakeholders to real outcomes with real mission impact, so that we lead with data-informed goal-setting and change decisions
- Reveal how each step affects mission/business value and exposes waste (e.g., bottlenecks, delays, excessive hand-offs, over-processing, unused talent, or defects)
- Foster systems thinking by mapping inter-dependencies for holistic optimization
* What are the key inputs and outputs?
* How are outputs used downstream?
* How does our VSM performance impact other areas?

### Frequency
Here are moments when you’ll want to either start or revisit your VSM
- Beginning of the project
- After an outcome in prod
- After synthesizing new insights

### Continously improve current state vs target state
This is a repeating four-step routine by which an organization improves and adapts. It makes continuous improvement through the scientific problem-solving method of plan, do, check, act (PDCA) a daily habit.

> Improvement kata
1. Get the direction or challenge
2. Graps the current condition
3. Establish next target condition
4. Conduct experiments to get there

### Current State Value Stream Mapping Facilitation Guide

**Agenda**
5 min: Introduction
5 min: Overview 
50 min: Generate VSM
(Optional) 10 min: Break
20 min: Refine VSM
10 min: Close + Action Items

**Prep Checklist**
- Identify appropriate workshop participants
- Facilitator: PM
- Co-facilitator: Design or Anchor
- Participants: Balanced team, client stakeholders, any relevant subject matter experts
- Confirm known and unknown Mission Impact(s) 
- Align on goals for the workshop 
- Facilitation plan
- Stopwatch or timer

**Set the Stage**

1. Establish the mission impact - "What’s the core mission this value stream supports?" “How do we measure business/mission impact success today?” (e.g., “Deliver approved benefits to Veterans”) - the result (mission gets done better, faster, cheaper, etc)
2. Identify the initiator (supplier) - “Who starts the desired outcome of our value stream?”
3. Identify the triggering event and/or inputs - "What starts the process?" (e.g., “Veteran submits claim”)
4. Identify the end-user (customer) - “Who realizes the desired outcome(s) of the value stream?”
5. Generate any outputs our customer receives - "What outputs do customers/end-users receive from our value stream?"

**First Pass - Value Flow**
1. Create the last mission/business process block (i.e. final step before desired outcome(s) + mission impact(s) are realized).
2. Create the initial mission/business process block (i.e. the step that initiates the flow of work through the value stream).
3. Continue adding mission/business process blocks, and confirm the following for each:
* a. Action-verb/noun phrase for the block
* b. Function/Department/Team responsible
* c. Number of people required to complete, and move, the work
* d. Queuing and Batching context

> First Pass "stickies example": [Action Verb/Noun Phrased Process Block] -> [Action Verb/Noun Phrased Process Block]


**Second Pass - Information Flow**
1. Identify IT systems that support the value flow.
2. Confirm the direction of information flow (i.e. pull or push), between IT Systems and Process Blocks.
* a. Use different colors to represent information flow lines and IT system relationships.
> Second Pass "stickies example": A rectangle shape
info from Karen Martin's Valur Stresm Mapping Book: At this stage the team should place thse rectangles containing the names of all the IT systems and aplpicatins in use across the value stream in the space between the customer block and the process blocks (grey stickies). The IT systems and process blocks should be cpmmected with arrows. where the head of the arrow indicates the direction of information flow: an arrowhead pointing to a process block means the data is viewed or retrieved: an arrowhead on both ends means that informatin is both entered and retrieved for that process. A lightnight bolt ⚡️ type arrow depicts information that automatically flows from one system to another (e.g., auto-uploads), or from a system to a person (e.g, auto-generated emails when an approval is required) Again, the arrowhead direction indicates the direction of information flow. The icon is shown in 

**Third Pass - Metrics Flow**
1. Confirm the current PT, LT and %C&A for each process block
* a. Estimate Lead Time - “How long does it take to complete this process block?” 
* a. Estimate Process Time - “How long does it take from when the work arrives until it’s passed on?”
* a. Estimate % Complete & Accurate (%C&A) - “What percentage of time can the internal customer/user do their work without having to do rework?”

2. Then confirm the total PT and LT, as well as Activity Ratio and Rolled %C&A
* a. Calculate total lead time -- Add up all of the lead times for each step within the value stream
* b. Calculate total process time -- Add up all of the process time for each step within the value stream
* c. Calculate a standard VSM Quality Metric
i. Calculate rolled %C&A -- Most overall accurate performance metric for a system
ii. Calculate simple average %C&A -- A quick comparison across equal-sized units
iii. Calculate weighted average %C&A -- A comparison when unit size impacts performance

**Fourth Pass - Add Visual Aides**
1. Add icons or other visual aides that help describe what happens in the Value Flow.
2. Add any questions or assumptions that would improve context for next steps.

**Fith Pass - Process Block Classificaiton**
1. Classify process blocks as value added, non-value added, or required non-value added.

**Final Pass - Waste Category**
1. Identify and label appropriate waste categories.

### Curren State Faciliator Tips

💡 There can be multiple initiators and end-users; A VSM can start & end with an end-user

💡 Steps should be high-level enough to demonstrate the overall process flow, but 
specific enough to be able to identify waste, hand-offs, and improvement areas.
Examples
❌ Too broad: Testing happens
✅ Just right: Lab tech runs blood test
❌ Too detailed: Lab tech labels the sample (we will get into deep, user-specific, behaviors with other artifacts)

💡 Consider doing  Summary Calculations post-workshop or time-permitting

💡 This exercise can be mentally taxing. Try to set an initial time frame of 90 minutes max and communicate to participants that you might need additional time in later sessions.

💡 Post-Workshop
Synthesize insights - Highlight biggest bottlenecks, gaps, or silos.
Facilitate discussion about whether the team can provide value to the customer based upon the produced VSM and our identified project scope. Include CSMs or other leadership as necessary.
Map your “Target State” VSM next!

💡 Apply a “Go See and Find Out” mentality – Encourage participants to describe what really happens, not what should happen.

💡 While we tend to favor present tense / action verbs since VSMs are meant to visualize how work flows through a system, and not just document what has already occurred, we recommend matching the style to your organization’s standards (if they exist). For example, some healthcare or government teams prefer noun phrases or past tense for audit-readiness, while Lean product or software teams almost always stick with present-tense verbs.

💡 Ask probing questions - What mission impact are we trying to enable? What causes delays here? Where do hand-offs break down? Where do you wait on feedback? Where do we often repeat steps/work?

💡 Avoid mapping wishful thinking – It’s about the current state, not the ideal (this is more of a focus for Service Blueprint artifacts).

💡 How to calculate % Complete & Accurate
1. Per step %C&A
- Count the total outputs produced by the process block (1000 documents)
- Count the defective outputs (150 defective documents)
- Subtract the (total outputs - defective outputs) / total outputs
> Ex: (1000 - 150) = 850, 850 / 1000 = .85 or 85% C&A

2. Rolled %C&A → This is the standard preferred metric most VSMs capture
- Convert each step %C&A to a decimal -- 85% → .85
- Multiple converted %C&A decimal values together → .85 x .90 = .765 - 76.5%

3. Simple average %C&A
- Covert each step %C&A to a whole number -- 85% → 85, 95% → .95 (2 steps)
- Add all whole number %C&A from each step together -- 85 + 95 (2 steps)
- Divide by total number of steps -- 180 / 2 == 90 avg %C&A

4. Weighted average %C&A
- Convert each steps %C&A to a decimal -- 85% → .85
- Multiply each steps converted %C&A x the processing time for each step -- .85 x 5 min = 4.25
- Add all of the weighted C&A values together -- 4.25 + 5.25 = 9.5
- Calculate weighted average C&A by converting value back to percentage = 95%

### Object & Icon Legend

* Supplier/Initiator & Inputs Context: who are the initiators. What inputs are provided or required from initiators to drive our mission/business process?
* Customer/End-User & Output Context: Who are the customers/end-users?. What outputs do customers/end-users receive from our business/ mission process?

* Process Block + People Required to Complete

* Information/Material Flow Context is pushed...
- Digitally pushed (e.g. API calls) -> 
- Manual pushed (e.g. email, phone calls, physically deliver) --->
- Automatically (e.g. scheduled or event-based) ⚡️

* Basic Metric Summary Context
> Dept/Function/Team/
> PT (process time) = x min/hrs/weeks/months/years
> LT (lead time) = x min/hrs/weeks/months/years
> %C&A (complete and accurate)= x%

* Mission/business Process Block Color-coding
- Green Sticky = "Value Added"
- Yellow Sticly = "Non-Value Added"
- Blue Sticky = "Required Non-value added"

* Context Questions & Assumptions
- Red Sticky = "Questions"
- Pink Sticky = "Assumptions"

* Kaizen Burst (yellow-cloud icon)
- Replace w/ potential improvement opportunity context

* IT System "rectangular block"
Systems and our IT Systems that also support a specifici process, they have arrows going in and coming out from process blocks. Sytems can also be application. We dont usually include apps like Email and Ms Word (Google Doc), but we do include Excel(google sheet) and ACT (CRMs) Given they are being used to house data and drive decisions relevant on the value stream. 


**Eight Forms of Waste Icon Library**

- 🐞 Defects: products or services requiring rework due to errors or non-conformity
- 🏭 Overprodiction: making more than required or before needed
- ⛓️‍💥 Over-processing: doing more work than the customer needs or expects
- ⏳ Waiting/Queuing: idle time when processes or people wait for the next step
- 📋 Inventory: excess materials or work-in-progress not yet adding value
- 🛣️ Transportation: unnecessary movement of materials or information
- 🔀 Motion: unnecessary movement by people or equipment
- 🫙 Unused Talent: under-utilizing employees’ skills, creativity, or knowledge

# VSM Planning Resource Templates
A multi-tab google sheet to guide VSM faciliators prepare for Value Stream Mapping. These tabs have questions and other information that we need to define to "set the stage" and help us determine Level 1, 2 or 3 VSMing session.

**Tabs** relevant to our work, "set the stage"
- Prep Checklist
- Macro-level Similarities & Variations
- Defining Value Stream Notes
- VSM Tranformation Charger

**Post VSM Tabs**
- Transformation Action Plan (TAP)
- Tips & Definitions for TAPs

### Prep Checklist
* Send facilitator a copy of the org chart consisting of leadership or high-ranking officials (consider stakeholders that are upstream or downstream dependencies to how we get out work done).
* Identify macro-level list of processes that are supporting the mission/business (screen share with client is advised as you develop this), and then define the value stream(s) we have prioritized (screen share with client is not advised as you develop this)
* (not as urgent for us) Develop and refine Value Stream Charter (Having several iterations is to be expected), Given this is an internal VSM, we can trim down some of the requirements
* Identify strategic level process owners as potential interviewees for each process block in the value stream (i.e. Mapping team representatives).
* Socialize charter with all individuals referenced on Value Stream Charter Key Stakeholders list. (Adjust as required; Recommend 1:1 or small group conversations to build consensus more easily), again not as strict for us. We need to minimize our charger, sicne this is intenrl work.
* Identify, collect, and analyze baseline data (whenever possible).
* Review final charter with Executive Sponsor, Value Stream Champion and any other stakeholders who may have veto power for decision-making
* Set schedule (location; dates; start & stop time; breaks & meals; briefings).
* Confirm any technology required for workshop or debriefs is available. Considerations:
- access and permissions to leverage virtual whiteboards, virtual meeting/conferencing software, and any applications that support a value stream walk
- wifi, projectors, large TVs, or virtual meeting/conferencing software for delivering VSM education material
* Determine value stream walk logistics (e.g., virtual or physical? One or two walks?).
* Facilitate value stream overview training session with Executive Sponsor, VSM Champion, and Mapping Team representatives ahead of the workshop. Review charter; discuss interview purpose and format (e.g., focus will be on the process, not the people, understanding barriers to flow, PT, LT & %C&A or RPY, WIP, work triggers, etc.).
* Facilitate value stream overview training session with VSM Champion, on-call support, briefing invitees, and others as interested (virtual or in person).
*  Arrange for Executive Sponsor to make opening remarks at workshop. (Send separate meeting invites when sponsor is not a Mapping Team teammate)
* Confirm that processes within the value stream scope are scheduled to run the during the workshop. (this gives an opportunity to observe realities in real time; ie Gemba Walk)
* Complete discovery, publishing and debriefing of Current State VSM
* Complete design, publishing and debrief of Target State VSM
* Complete and debrief value stream Transformation Action Plan

### Macro-level Similarities & Variations
Partnering with Planning Teammates, identify and assess priority for the value stream(s) that are impacting mission/business needs, and then define them

- Column A: what Goods, Services, Products, or Combination of these do we manage end-to-end?
- Column B: What types of customers/segments do we serve? 
- Column C: What conditions cause significant variations in how work gets done?
- Column D: Notes

### Defining Value Stream Notes
Partnering with Planning Teammates, walk and define the value stream(s) you prioritized in Macro-level Similarities & Variations
* Row 2: Define Your Value Streams
* Row 3: Process, Operation, or Equipment
* Row 4: Refinement 1->2->3->4....15+
- Column A: Goods, Services, or Combination Products
- Column B: Refinement
* Row 5: As described
* Row 6: Action verb/noun translation


