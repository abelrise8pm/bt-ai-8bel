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

nizme.n.cuin.ctr@socom.mil, david.akers@sofwerx.org, gabrielle.robles@sofwerx.org, jordan.l.boring.civ@socom.mil

chad.j.raaymakers.civ@socom.mil, shane.d.toner.mil@socom.mil, nikolas.a.cline.ctr@socom.mil, jonathan.r.miller.civ@socom.mil,
daniel.a.lynch.civ@socom.mil, robert.k.boone.ctr@socom.mil, james.vernon2.ctr@socom.mil

Sharon, Kevan

--

### 🚀Mission-Outcome: 
> SOF Operators increased their focus on the mission environment, as the frequency and manual effort required for configuring and correcting GRGs on the device screen is reduced.(work in progress)

### 📊 WEEK'S PROGRESS

[4.3.1] SOCOM Development Testing initiated with AI GRG plugin builds for ATAK 5.4 and 5.6 delivered. Both versions handed off to Chad and Nik, moving the plugin into its first government-side DT cycle.

[4.3.2] Rise8 and Booz Allen aligned on TAK UI development priorities for the GRG plugin migration. Two user workflows reviewed together; the team now has confirmed direction on what to build and a clear path toward cross-platform compatibility.

[4.3.3][8.1.4] April 22 sprint demo quantified a 124% improvement in building detection accuracy. Side-by-side comparison validated that detection improvements deliver consistent results regardless of zoom level, giving SOCOM a concrete data point on model progress.

[4.3.4] GOTS evaluation initial findings presented at the sprint demo, with maneuver confirmed as the starting domain. Nik endorsed the domain ownership model and identified maneuver as the first focus area for developing a shared library framework across the plugin portfolio.

### 🗓️ LOOKING AHEAD

[4.3.1] Embed user manual in the plugin and prepare for 5.7 development. Closes Chad's first documentation request and positions the team on the next ATAK version baseline.

[4.3.2] Submit TAK UI component proposals to Booz Allen and begin development research. Moves the migration effort from planning into active work on the first native component contributions.

[4.3.3] Resolve known operator experience issues and triage feedback from government testing. Three targeted fixes delivered and incoming bug reports scoped against the May 15 delivery window.

[4.3.4] Continue GOTS evaluation and hold working session with SOCOM on the maneuver domain. Advances the case for a shared capabilities framework across the plugin portfolio.

### 🙋 Asks, Risks & Mitigations

DT-Reported Issues — Scope and Priority Pending
Issues reported from Development Testing may range in severity; scope and impact on the current production build have not yet been assessed.
COA: Rise8 will review and reproduce each report and align with SOCOM on effort and priority before committing to any new work.


Claude I want to to create a SKILL.md let's call it `tak-week-pm-prep`

and this agent will basically do the following..

As a Product Manager with Mission Impact, and Outcomes in mind, I want to make sure we are focus on how the past week's efforts aligned or didnt align with our Outcomes @tak-oor.md. and how to get ready for the ucoming week. 

I will trigger this skill usually on Friday's after I have completed the weekly drumbeats

First, we need to "close out the week"
- Resolved/Open issues/matters from this week and last week, what are they?
1. {issue/matter: clear title and concise description that includes the problem/opportunity and why is it important or relevant in under 40 words}, {resolution: [Open, Solved, wip or TBD(need more info)]}], and COA: {what's the expected or documented action item and who is resonsible}

Second, what should be my focus for next week? an itemized list of 4 to 6 "objectives/goals or milestones" that I need to handle the upcoming week, the audience is my internal product team, customer success and Rise 8 leadership.

Here is an example

1. Get SOCOM's first feedback on the 5.6 release from Chad and Nik that the build passes field review. That confirmation is what lets us submit our first Enabling Outcome.

2. April 22 demo: move toward our first Mission Outcome hypothesis. The before/after detection comparison gives us real data to start building the evidence that SOF Operators are spending less time correcting GRGs and more time focused on the mission environment.

3. Advance the TAK UI migration partnership with BAH. The first technical review with Nathan helps us determine where to prioritize TAK UI development and refine our path toward the Enabling Outcome of shifting Rise8 from TAK UI consumer to contributor.

4. Ensure Sprint 3 prioritizes defects and UX improvements that affect operator trust in the field. Groom the backlog around the bugs and UX gaps we discovered this sprint: silent failures and misleading status messages that could negatively impact operators in the field.

5. Iterate on our definition of done for the TAK development end-to-end release and testing process. Update the path-to-prod map and formalize acceptance criteria.

Third, a "hand-off" summary, recap that includes a prompt for a brand new Claude chat and clean slate memory context windown, something I can drop into and pick things up on Monday

Fourth, Generate a new file inside the daily-TAK-notes folder and name it tak-daily-{month}_{weeksDateRange}.md and in the file include. The hand-off summary and prompt, my list of my Focus for next week and last the full list of "Resolved/Open issues/matters from this week and last week," 

Before you edit, or create new content in any files. you have to collaborate with me you have to give me a draft for EACH section at a time. for example

1. Resolved/Open issues/matters from this week and last week, before you show me your proposed items in the chat, you must first scan/review context and chat history, and then scan files from the past two weeks (tak-daily-{month}_{weeksdateRange}) and then output the proposed list. I will give you feedback and once I prompt you then you can create and ad it to the file for the following week "tak-daily-{month}_{weeksDateRange}.md"

2. the same process gets followed for, my focus for next week ad 

Do not make assumptions, do not fabricate new informations that was never cited or resources from files or context, Do not inject words that emphasize urgency or priortiy or inject bias that was never writen, epxressed or instructed. 

[4.3.1] User manual delivered and all reported plugin defects resolved. 
> not "all" reported defects resolved, the main ones that were causing the app to crash, yes. So lets be specifc that a defect that made the app crash were resolved

[4.3.2] TAK UI component scope decisions confirmed with Booz Allen.
> this one is a bit of a word sald, the title should focus on just calling out that we confirmed our first TAK UI contribution with BAH and words like this "the framework team" we never used that term. it's just BAH/Booz Allen or with Nathan, that is it..  and what is this "contribution research "? that just feels like word padding and fillers, and yes call out that we started the migration assessment report

[4.3.3] Plugin now surfaces imagery quality failures directly to operators. 
> We should make this update "broader" the title currentl reads more like the description of one of the improvements/fixes. We should focus the title as an improvement to the operator user experience based on particular/specific conditions and the description can expand on this according to our drafting criteria

[4.3.4] Maneuver domain working session with SOCOM completed. 
> good!