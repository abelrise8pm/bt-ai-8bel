# TAK Demo Notes and Handoffs

---

# HANDOFF — April 7, 2026
**Context for the next Claude session — 48 hours before the April 8 demo**

---

## Where Things Stand Right Now

Sprint 2 started April 6. Demo is Wednesday April 8 at 11am. Kevan leaves Wednesday afternoon for San Jose through Friday. Highest-pressure window of the contract.

**Two bug fixes confirmed:**
- Zoom detection bug — fixed, merged, SDK v1.0.2 published. Zoom level 19 is the sweet spot.
- Intermittent detection bug — Josh believes fixed as side effect of the filtering fix. Not officially confirmed closed as of April 7 morning.

**Three open engineering items (not demo blockers, but active):**
- Tile loading guarantee — Zach investigating, not fixed
- Debug snapshots — still in codebase, ticket needed
- Memory leak — flagged April 6, no ticket yet

**Release state:**
- TAK Plugin Master List MR merged — prerequisite done
- .mil APK unsigned — still blocking field deployment
- PRR not submitted — waiting on Nik's explicit request
- MFR signed in week one — but early notes called it MOA/MOU. Likely same document. Kevan needs to confirm. Active source of confusion.

---

## What Was Built in This Session (April 7)

| File | Contents |
|---|---|
| [tak-dev_n_release-process.md](tak-dev_n_release-process.md) | 5-stage TAK dev and release reference. Built collaboratively. PM-level. 274 lines. |
| [tak-daily-april_06-10.md](r8-internal/Daily-TAK-notes/tak-daily-april_06-10.md) | Standup questions (~line 408), Nik's 4 requests (~line 285), release glossary (~line 366), Tues/Wed action plan (~line 439) |

---

## Nik's 4 Outstanding Requests

1. PRR Process — every release, keep him updated via Jira ticket
2. SDK Strategy — develop on 5.7, release to 5.6 and 5.4
3. Dual-Track / No new ATAK features — TAK UI is the destination, August 17-21 offsite is the milestone
4. GOTS Evaluation — shortlist received (Trailblazer, Combat Swim, SpotPlot), not started, deliverable format undefined

---

## Open Questions Still Needing Answers (as of April 7 morning)

1. MFR = MOA/MOU? — Slack message drafted, waiting on Kevan
2. Who owns submitting the PRR?
3. Intermittent detection bug officially confirmed closed?
4. Demo recording — who owns it, is it done?
5. Docs discrepancy (README vs Confluence) — status unknown
6. TAKJenkins Reporter access — status unknown

---

## Suggested Opening Prompt for Next Session

> I am Abel Hernandez, Senior PM at Rise8 on the TAK Bridge contract (8-week SOFMC/SOCOM engagement). We have a demo tomorrow Wednesday April 8 at 11am. Kevan leaves Wednesday afternoon through Friday. Please read these two files before we start:
> - TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-april_06-10.md (DEMO PREP section, action plan, and handoff at the bottom)
> - TAK-ALL/tak-dev_n_release-process.md (our 5-stage release reference)
>
> Open items I still need to close today:
> 1. Did standup confirm MFR = MOA/MOU?
> 2. Who owns submitting the PRR?
> 3. Is the intermittent detection bug officially confirmed closed by Josh?
> 4. Is the demo recording done or scheduled?
>
> Start by asking me what came out of standup this morning.

----

# MARCH 26 Sprint Planning Sync

what we are showing, updating and dempoing
PI PLANNING - Forecasted Sprint Schedule

### SPRINT 1: March 23 – April 5: 
- Plugin SDK Update to v5.6 and Functional Regression Testing
- TAK UI Research, Component Mapping and Migration Exploration
- Developer Infrastructure and Plugin Housekeeping
- Sprint 2 Prep: GOTS and Model Improvement Scoping

### FORECASTED SPRINT 2: April 6 - April 19
- Finish SDK v5.6: Regression and Usability Testing
- TAK UI Migration: Initial Stories and Early Implementation
- GOTS Evaluation Kickoff (Pending Scope from Nik)
- Model Improvement Discovery and Scoping (Pending Direction from Nik)

### FORECASTED SPRINT 3: April 20 - May 03
- TAK UI Migration: Continued Implementation and Testing
- GOTS Evaluation: In Progress
- Model Detection Performance: Improvements Underway


# APRIL 7 Demo Prep

## PI Planning: Forecasted Sprint Schedule


## Work in progress and planned effort

1. Show/go over Josh's TAK UI research/discovery "initial-findings-takui.md
> what is the comms here?, reference it back to `4.3.2` @ tak-pm-weeklyBriefings
- Summarize it
- Highlevel Slide
- keep one repo for both
- its not two baselines, we are gonna have the rebuild the UI/UX
- we are only using 20%, + "escape patches"

2. Show/go the plug in SKD version updates:
- 5.6 (to support and release)
- 5.7 (latest on development)
> what is the comms here?, reference it back to `4.3.1`

3. DEMO "Model Improvements" Bug fixes
- Reduced building detection when zoomed out and Intermittent building detection failure on repeated runs
> What is the comms here, reference back to `4.3.3`

**DRAFT SCRIPT**

### Set the scenario
A couple of weeks ago, Jonathan and Nik, both requested that we looked into two issues that were causing {negative experience}. One was about/regarding {Reduced building detection when zoomed out}, a very brief description {Model performance seems to degrade when the operator is zoomed out. Detection improves when zoomed in over the same area.} and a releated one was, {Intermittent building detection failure on repeated runs}, which basically was {intermittently fails to detect buildings in a defined AOI on the first run, Exiting the GRG plug-in and rerunning on the same area with the same zones produces buildings detections on the second or third attempt.}

A couple of weeks ago, Jonathan and Nik flagged two issues they were seeing in the field. 
* The first: building detection was degrading when operators zoomed out — the further out they were, the fewer buildings the plugin found. 
* The second, a related issue: detection would intermittently fail entirely on the first run, but work on the second or third attempt over the same area. So, the users had no way to know if a failed run was real or a glitch.

Both issues eroded trust in the plugin. Today we're showing you that both are fixed.

## Demo and Describe the improvements

`INTRO` 
During PI planning back on March 26th, Jonathan and Nik brought up two issues they were running into — reduced building detection when zoomed out, and intermittent detection failures on repeated runs. The team dug in, and that's what we're showing you today

`Step 1 —` Open the plugin with an area of interest already defined. Show the AOI at a zoomed-out view. - Level 19

```
it's gonna take slightly longer, however the benefit is X


```
`Step 2 —` Run detection. Buildings are detected accurately despite the zoomed-out view.
> **Track 1 — the fix:** The fix ensures the plugin always analyzes at the highest fidelity level — regardless of what the operator sees on screen. It also uses tile caching — basically, it pre-loads the imagery before detection runs — so results aren't dependent on network conditions in the moment.

> **Track 2 — the trade-off:** You'll notice this run takes a moment longer than before — that's intentional. The plugin is now doing more work upfront to ensure it doesn't miss anything. The payoff: more buildings detected, consistent results every time, and after this first run the imagery is cached locally so future runs are faster.

`Step 3` — Run detection again on the same area without changing anything.
> Before this fix, running detection a second time could produce completely different results — or nothing at all. That was happening because the plugin wasn't fully resetting between runs, causing newly detected buildings to get incorrectly filtered out. That's now resolved. What you're seeing here — consistent results on every run — is the fix.

`Step 4` — Run detection a third time.
Three for three. The plugin is now reliable and repeatable.

---

a tile is being fethced and then immediately recycled.. not sure that indicatres if is beinged cached/sved?

# JOSH IS HERE

- kmz
- things are getting download before we stich a bitmap
* you are on a kmz
* switch over to the maps
* Josh fixed, 
we werent doing inference..  condencing the iamge 640 bty 640, istead
lets do sliding windiow, MAX REZ 20
FORCING the CACHING under the hood
they are using mapoverlaps, woll be compeltely fine
the only problem, see the bitmap
NOT ALL tiles getting cache..  creates the bitmap image

Kevan: Sliding Window, 

Josh, "memory profiling"?
- things clean up
- Get logs of decices
- A memory profile, Josh ask if Thomas can do that.. MEMORY LEAK, closing some threads.
- S20 deviec 8GBs of RAM min, 

Josh, when we run the model, and run the inferance.. memory?
- Update

Kevan, GOTS plugin.. planout swim routes.. tidal waves.. route planing
CombatSPOKT> mortar fire control, how to fire at a target
Route planning - marker shows up on the route, dunamic
BIGGEST PROBLEM: they is no cohearted mean of them orchestraing, outside of MIL? call markers.. COMETSOM has no idea what a mission is,.. SPOC
THINK OF, libraries, SpokFire 1, all math baked in, is a library
FIRES COOR PLUG IN, your misison.. it uses 
COMBAT SWIM
No ontology.. 
they are done in isoliation, manual
KEV --> go for quick wins, enhance functionality.
we dont have the info. 
HE WANTS TO PICH TOP LEVEL PLUG IN
CORE PLUG INS, 
PARENT OBJECTS --> CORE FUNCTIONS -> "libraries"
COTS? lots of continuaty and schema definition

---

PROD, pipeliens.. 

---
 4.06-09
5.4, 5.6 verification and testing, and bumping to 5.7 
SDK bumped to v5.7 with regression testing on 5.6 and 5.4 underway, establishing the version management cadence Nik outlined: develop on latest, release and support fielded versions.
4.07-19


TAK UI Migration in Progress
Sprint 2 work is focused on making the plugin TAK UI compliant, where every component is either direct TAK UI or an ATAK escape hatch. In parallel, identifying gaps to share with BAH, and preparing a recommendation for Nik on the path forward.
4.06-13


Model Improvements
Completing detection reliability improvements, including ensuring imagery is fully loaded before detection runs and pre-caching map tiles at the operators defined elevation. Identifying and resolving performance issues ahead of production release.
4.07-
GOTS Evaluation
Evaluation of Trailblazer, Combat Swim, and SpotPlot underway. Work this sprint includes deepening product and UX understanding, mapping them to mission domains, and identifying shared AI improvement opportunities across the portfolio.

and Kevans Raw Sprnt 2 plan

Sprint 2

ATAK Plugin
—> get 5.4 and 5.6 to prod release ASAP

TAK UI (Week 1 + 2)
—> ATAK Plugin repo to be TAK UI compliant. Every component is either direct TAK UI OR escape hatch to ATAK…”TAK UI Plugin” (we know 80% will be escape hatch) (week 1)
—> Provide gap list to Nate (BAH TAK UI), understand their roadmap, complexity/feasibility to implement in TAK UI (Week 1-2)
—> Provide a recommended path for wait for TAK UI to support, change our UX because complexity.feasibility of TAK UI supporting, or support ATAK longer term for better UX (Week 2)
	—> follow up with Nik and co on recommendation

Model Improvements
—> Finish the prefetch/cache as part of the solution to fix identified issues (elevation, etc)



GOTS Eval
—> Continue evaluation based on the evaluation framework (grade each plugin on framework)
—> UX/product understanding of plugins a bit more
—> DDD, domain mapping/modeling of plugins and mission areas

---

let's make it modular

## PART 1: SET UP AND INTRO + AGENDA

Morning, everyone. I'll start with the agenda for our 1st TAK Demo and the Product update.

First, we'll go over Sprint 1 accomplishments, this includes sharing out our initial TAK UI findings, 
Second we pre-recorded a demo of the {zoom issues}
Third, This is gonna the be "bulk" of our presentation, I'll talk about Sprint 2's work in progress, planned effort for the week and next week, Then Kevan will discuss our initial takeaways for the plugins list we received to evaluate and their MOSA evaluation..
Folled by our PI planning, What we are forecasting for Sprint 3 and 4
And we will conclude with some Issue Resolution - We have some ask to go over (risk and mitigations)

## PART 2: REFERENCE "SCHEDULE AND MILESTONES"
(viewing slide 3: Schedule and Milestones)
Alright, so based on our Milestone's schedule, Today, april 8th is our first Sprint Demo. We will get underway, shortly. 
(goes to slide 3)
Let's go over Sprint 1's accomplishents

## PART 3: SPRINT ACCOMPLISHENTS
(viewing slide 4:Sprint Accomplishments table )
Ok. so from these past 2 weeks. starting with

* Developer Infrastructure and Plugin Housekeeping
--> _what the actual slide reads: GRG Plugin SDK published to GitLab registry via Maven, plugin renamed to AI GRG, and full team equipped with TAK Forge access and physical test devices_
> {just a high-level concide description to make them feel confident that we knocked out these tasks and got set up fairly quickly}


* Second, Plugin SDK Update to v5.6 and Stability Verification
--> _what the actual slide reads: GRG Plugin SDK published to GitLab registry via Maven, plugin renamed to AI GRG, and full team equipped with TAK Forge access and physical test devices._
>script draft: {another easy win, and call out the .mil pending issue}, we def have more to say about this, however we have a whole section later where we can get into detail..


* 3rd, Initial TAK UI Discovery completed
--> _what the actual slide reads: TAK UI framework mapping completed and validated on emulator and physical device. Discovery work captured in takui-grg-plugin-discovery, establishing the approach: every plugin component will be direct TAK UI or an ATAK escape hatch_
> script draft: So, towards the end of the 1st week after we mapped out the UI framework componetns, Josh was able to run a version of the plug-in on the emulator and device, all his discovery work is capture in a repo, quite detailed outline I have a slide dedicated to showing you this info and can provide the link to the repo where we have it.. {concise, just tell em that we feel this is the approach: every plugin component will be direct TAK UI or an ATAK escape hatch}


* Model Improvements
--> _what the actual slide reads:Two detection improvements validated: model no longer degrades when operators are zoomed out, and detection is now consistent on the first run without requiring repeated attempts._
> script draft:we This is what we are going to demo shortly, {since we are gonna talk a lot of this, just give em the succicnt gist of what the deliverble is, make sure you reference the actual language/terms of the bug fixes} 

* And for Plugins list GOTS Evaluation
--> _what the actual slide reads: Priority plugin shortlist received from Nik. Trailblazer, Combat Swim, and SpotPlot identified as starting points. Initial review underway and repository access secured._
> script draft:We got the list, access to some of repositoroies and Kevan has a couple slides dedidcated to this update and sprint 2 plans. So more on that after the demo.

**TALK ABOUT: Initial TAK UI Discovery**
(Show Slide 6:Initial TAK UI Discovery: What We Found)
The findings report is available in TAK Forge, under the rise8 group, in the TAK UO plugin discovery repo, and I want to briefly highlight {the core or foundational themes or concepts we discoved}, {what should this tell them, the 20/80 to be aware about as we continue with this effort}, 
Any questions? 

Ok. next the demo...

## DEMO
- We pre-recorded this yesterday, Thomas is doing the honors. He will go over
{concisely describe the zoom bug issue}

**[Play video about 2 mins]**

**Quick Recap and Questions**
- Ok, so basically the team used {how they solved it, concisley describe tile caching and sliding window approach in a way that's natural and gor general audinece}
- Any questions, before we go into this past sprint's accomplishments?



## PART 4: WORK IN PROGERSS, PLANNED WORK AND PI PLANNING
with that, let's take a look at Sprint 2's work in progress and some of the planned work we have the remaining of the week and next. 

1. 5.4, 5.6 verification and testing, and bumping to 5.7 
--> _what the actual slide reads: SDK bumped to v5.7 with regression testing on 5.6 and 5.4 underway, establishing the version management cadence Nik outlined: develop on latest, release and support fielded versions._
> starting with, the first workstream, We wanted to confirm that the team has begin to establish working norms around the version management cadence Nik outlined:, we bumped the plugin version to 5.7, and conducting regression/acceptance testing for 5.6 & 5.4, in dev environment at this moment, later on we have some request for help on getting that .mil tag signed to do this in prod.. (more of that later)

2. TAK UI Migration -  
--> _what the actual slide reads: Sprint 2 work is focused on making the plugin TAK UI compliant, where every component is either direct TAK UI or an ATAK escape hatch. In parallel, identifying gaps to share with BAH, and preparing a recommendation for Nik on the path forward._
> Now with the discovery findings documented and as reference, this week we are starting to {the dev approach and strategy}

3. Model Improvements, 
--> _what the actual slide reads:Completing detection reliability improvements, including ensuring imagery is fully loaded before detection runs and pre-caching map tiles at the operators defined elevation. Identifying and resolving performance issues ahead of production release._
> So you seen the demo, While doing that work the team identify other opportunties to improve.. 
AND
4. GOTS Evaluation
--> _what the actual slide reads: Evaluation of Trailblazer, Combat Swim, and SpotPlot underway. Work this sprint includes deepening product and UX understanding, mapping them to mission domains, and identifying shared AI improvement opportunities across the portfolio._

The fourth workstream is the evaluation of some of the plugins, One of the approaches is {} and Kevan cna speak more about this, -- 

-- THEN TRANSITION TO KEVAN TO GO OVER GOTS EVALS & MOSA: 
**KEVAN: Initial Plugin Takeaways**

**KEVAN: SOCOM TAK MOSA Baseline**

**KEVAN: Plugin MOSA Layers**

**KEVAN: SpotPlot-Grade-Reason**

Any questions, before we move on to our PI Planing, Sprint forecast for Sprint 3 and 4?

## PART 5: PI Planning: Forecasted Sprint Schedule (slide 14)

- Focusing here on the second column, currently on Sprint 2, April 6th to the 19th.. So we already went over this in more detail, in the previous slide. however you can see here the 4 main worksreams, and forecasing ahead to April 20th to May 3rd, Sprint 3, We are anticipating that
- If a new verison of the SDK is out, that be 5.8 we will bump it and will continue to follow the versionins strategy of developing on the lates and supporting 2 versions back (even numbers)
- We anticipate we'd be further along migrating to TAK UI, likely learning new things and engaing with both BAH folks and Nik to determine directions and next steps
- As far as Model Improvements, I am optmistic and feel we would be in prod, start getting feedback and we would continue iterating on thos elearnings and focus on ensuring the detection process is efficient..
- For GOTS evaluation, This should be in full swing, progressin to some specific recommendations and. 

Sprint 4, 

Any questions? before we go over to Risk & Mitigations?

## PART 6:ISSUE RESOLUTION, Risks and Mitigations. 

- 1. The first one, I realized we are all aware of this, It's just for continiuous transparency and to ensure it's always on our radar, TAK UI Prod readiness.. Now that we have compelte the reasearch and will start getting in there, it's just worth nothing that there's risk around x.. By our next demo (april 22), we'd likely have a better understanding of the "risks" and we can determine next steps..
- 2. We've been having trouble last couple of days with the release pipeline {COA}
- 3. Part of the release process, our .mil APK is not signed.. and {negative impact}, {COA}
- and last #4, PRR visibility


We have a demo and presentation today with our SOCOM stakehlolders. The Agenda is: Sprint Accomplishments, Demo, WIP - Planned work and PI planning, Issues Resolutions.

I have experience conducting these type of presentations and speaking to audiences. The script needs to mimic, natural conversation style and vibe, It's more of a reference of key topics and relevant insights rather than a vebaitum, word-for-word transcript for me to follow to the tee. The focus is more on natural transitions between slides, and topics, rather than sounding overly polish or pretentious.

Review my initial drafts, make your recommened "tweaks" to the grammar and delivery, and most importantly double check and scan the relevnat topics to ensure the information is backed by conrtext and resources from the project files (discussions). Once we are done, we can include "cheat sheets" and "refenrces" if the stakehodler request more information. 

Collaboration instructions

1. review my promopt and request, then check my draft
2. Ask clarifying questions
3. Before your output the script text, check relevant resources and context
4. Do not fabricate, do not inject assumptions.
5. Again, this is not meant to be a polished word for word transcript, it's a natural conversaitonal script that focuses on provding me with reference/guidance on how to kick off the information for each slide, the key themes/concepts I need to hit and the natural transitiona between them. 


we, SOFMC owns TAK UI, coodiante with Nate and Balck Calp and BAH, TAK UI is our future for plugin development if there need to be changes, this is he ground floor
reach out to Nathan.. "hey we saw this"
THE GOAL OF GETTING AI GRG into TAK UI, so we can get it into WIN TAK.. 

Nizme, Nic
as rise8 interacts with Nathan (any concerns)

sqllite
if i am using offline Sqlie
its gonna cache the more zoomed in?
or does it know this is a local saved file
We are only pulling for the SQLiite files
ATAK mapping enin

**KEVAN: Initial Plugin Takeaways**
going down this road?
- "i like the mOSA" keep talking about that
push back.. for this initial look..
the inconsistant schemas and repeaed func
what can we do about the manual steps
some of the silo func..

FOCUS FOR THIS 8 week effort, LATER FOCUS ON THE BIGGER STUFF


**KEVAN: SOCOM TAK MOSA Baseline**
- whats is COTS
- Questions
- The though part is because TAK is open to Civilians.. including partners countries
some of the core stuff is difficult. Law enfrocements doesnt need , red diadmond.. 
- at is base ad core, TAK is open source and done as a .civ.. and there is the "flavors" after
- KEV: 100% concour, it will need some back and forth workshoping.
- Nizme: layout some of the concersn and risk, s we can all see that.. RiSk.. 

SHANE!!! 

AD20 Gap?

**KEVAN: Plugin MOSA Layers**

**KEVAN: SpotPlot-Grade-Reason**


help from CHAD

5.4, 5.6 -- 5.7

Nik: CHAD MOLYET is SOCUM's lead DT. Once yall get the signed 5.4 and 5.6 push to him.. he is the lead for our DT
once we are done with regression testing ,Chad M starts the Gov side process of releases 5.4 and 5.6 they will test it also (as soon as yall are done) they will also do "some paper" work, As soon as You (rise8) are done with internal regression testing GET THAT TO HIM
Chat M: "Just send me a link to the software build and I can download (but add me to the permissions to the page/project)"

Build cut with the PRR, include Nik on any emails

Nik: I am gonna get Brandon LaPorte involved (Nik Email him) to see what the issue is

Nik's email: Brandon,
I’m coming to the party late. But the Rise8 team is having issues with their PRR to get a signed build for the AI GRG tool. What can I do to help get this going?

Kevan: Here is a link to the PRR, been trying to troubleshoot the .releaseInternal for a couple days now with no luck. It seems like Gitlab runner issues but hard to pinpoint

issues.tak.gov/browse/PRR-15xx 

Brandon LaPorte Support Enginer (TPC): Hello folks, FYSA, I believe that Jared is digging into this as we speak:
Brandon Shows a comments thread from Jira (ak.gov/browse/PRR-15xx)
> Kevan: Currently unable to do the .releaseInternal successfully, and here are build logs here: //git.tak.gov/rise8/rise8-atak-grg-plugin/-/jobs/6153xxx
> jared hepp: Kevan Thank you for the report, I'll make a ticket and look into it.


---

JEFF W - Code Jeff

IssueSummi

"beads"
LLM, check ot stories, parallel
Jeff W (not fast enough for me now)

his vision..

1. team comes up with impacts
2. instead of creating it manually in GitLab, or have a SKILL.md
"whats your impact"?
the agent puts it oup[]

Jira
a linker that updates stuff in and updates

a test team identified..
setting up alloc8
multi agent, multi-purpose
not go to pure beads, we could
install remote server
add a linker put everything in linker

SKILL.md

Adam G and Stephen P
claude plug in
create skills..
he mad one

BLOCKER --> we cant interact Claude Code with GitLab

employee portal, work head
OUTCOMES FLOW in the Employee Portal

PROJECT PAGE

---

1. DEMO
> less than an our
2. Sharon has used a script
- it helps her with her filler words
- so yeah, 
3. Sharon, Nik's involvement and questions
WE ARE ALWAYS DRY RUN IT
THEY ARE SPECIAL OPS
THEY ARE INTENSE
