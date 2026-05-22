# Monday March 28 , 2026

## Nik & Kevan Sync MARCH 30th INSIGHTS, ASSUMPTIONS (risk) and NEXT STEPS 

###  Dual track, focus on TAK UI
> we are building toward TAK UI as the destination, maintaining ATAK only to stay in production while we get there. 
> This is how we determine priority and scope

### No new features on ATAK GRG
> do the two model bug fixes (intermittent detection, zoom degradation) count as "improvements" or "bug fixes" under Nik's constraint? That line matters for scope.

### August 17 as a *soft* deadline
> after the TAK offsite, Aug 21st, Nik only wants to accept TAK UI Kotlin multiplatform plugins into the baseline.
> While he did not say he expects AI GRG in TAK UI, He does plan to speak on it and BAH's ExCheck. 

### Norming comms with BAH and Black Cape
> Check in with Sharon, who's contact she has and Have Nik set something up.

### *unclear* "ExCheck, Black Cape, balancing act"
- What 3 plug ins?
- Black Cape only doing WebTAK?
- Is the Balancing Act more about 3 teams working in pushing TAK UI?

---
## Questions for Nik

1. GOTS EVAL

2. DUAL TRACK
- Nik acknowledged that TAK UI is in beta

- Nik called out that Booz-Allen Hamilton (BAH) is actively trying to get "ExCheck" Plug-in into TAK UI doing the majority of the development work (ExCheck digitizes Ops communication, Blackhawk down referecne -need more info)

- Nik sees a future state (Goal) where ExCheck and AI GRG are the plug-ins to "pull TAK UI out of beta"

- Nik also mentioned another company, "Black Cape" who's doing some of the work that I bevelie was only specific to the WebTAK capacity? (need to confirm this)
- Nik doesn't want teams to do any more "feature improvements" to ATAK version of the plugins (includeing GRG) because as stated above, the goal is to move all the plug-ins into TAK UI
- Nik also called out that TAK UI also covers WebTAK (cloude base version) and acknowleges it will be a "balancing act"
- Nik used the phrase of "when TAK UI becomes a real boy" as a metaphor of ensuring the work being done today should be focused on that day, so that we are not paying back "tech debt" if we only focus on ATAK
- Kevan and Abel re-affirm Rise8's commitment to TAK UI, and just simply calling out that we don't want to diverge, we must maintain a stable baseline so that when indeed TAK UI is ready for prod, "becomes a real boy", we are in prime position to "get it out the door"
- Nik recommends, advise us to approach TAK UI with incremental steps, and highlighted that is not about deploying immediately
- Nik called out that a future intetion to eventually depricate the ATAK plug-ins
- Nik did acknowledge that this is a measured approach, the intention is not to build all 3 plugins at once (Note: Not sure what 3 plugins he is referring to, AI-GRG, ExCheck and?)
- Nik highlighted that the future state/advantage for TAK UI plug-ins to be in Kotlin and multi-platform.
- Nik informed us about the TAK Community offshite on August 17th thru 21st and his intention to brief them on the upcoming replacement of ExCheck built TAK UI (note: not sure what he mean by on TAK.gov and SOCOM,) and he is also planning to brief them on the latest of AI GRG.
- Nik spoke about how BAH is currently undertaking that effort, convertin ExCheck ATAK and WinTAK version into TAK UI (note: but that's not quite clear to me)
- Nik is fine with the simontenous efforts.
- Kevan confirm to Nik that our current ATAK GRG plugin is in Kotlin, and have done some experimentation with "space paches" to "break out of TAK UI"

- Nik - happy to setup a meeting, between Kevan, Sharon, and Nathan B, and Kelly the BAH PM.. happy to setup a meeting, either one. Sharon has their contact,
Leverage them, they have a decade of comms
Black Cape is doing
Nathan and Kelly = BAH
we are all pushing to tak ui to make it better
Nathan is doong 80% of the heavey pushiung..
Black Cape is not  as much focus onthe booz.

Kevan's Slack Recap: 

> "Nik is pushing really hard for TAK UI. They are currently updating ExCheck (from list above) and Nik wants to present it + AI GRG at the next TAK Offsite for production ready TAK UI plugins August 17th -- Afterwards, he only wants to accept plugins in the baseline that are TAK UI Kotlin multiplatform. He's definitely a bit optimistic but is ok with the churn from being pioneers and is pushing BAH really hard to get TAK UI ready. I'm still concerned about it, and he's ok if we maintain two baselines like we discussed with Jonathan last week."

1. GOTS EVAL --
> Nik is gonna shoot us an email, we have 20 plus plug-ins that they own.
Kev: what he is suggesting, Deeper understanding over the information archite3cture, what date obnjects are we creating.. GRG for example, the GRG is an object is got coordinates, bulding markers, all the info creates a schema, or an ontoglogy
What is your SOCOM ontology/schema 

Nik: these are all the plug ins we own, he broke them down into sections.. He is trying to determine, "whats the best way to improve the plugin with AI"

Nik - we should be working on 5.7, do fixes in the latest version, when you submit your build request, 5.6 and 5.4 this way we
When you do a plug in release, follow the iniatil realses, it creates a jira tocket with the PRR, unless you dont create the jIra ticket nik cant see what we are doing.. 

**NIZME - reply with the feedback we received.. what they provided to us as guidance..**


## PROBLEMS, Risks & COAs

Because the .mil-tagged APK is not signed, we cannot load or test the plugin on devices, resulting in a blocked path to testing and validation.

**REQUEST HELP:**
- COA: Kevan is investigating the TAK Forge signed release submission process by Monday, March 30.
- Ask: We need Nik to confirm the pipeline configuration status on TAK Forge end as soon as possible so that we can unblock device testing and keep Sprint 1 on track.

---

**Risk:** If we don't define the engineering strategy for how the dual-track development should be structured and managed for ATAK AI GRG and TAK UI GRG, then it will be harder to make progress, ensure quality, and parity across both.
**Ask:** We need Kevan, along with the engineers to define how the two tracks will be structured and managed in practice by end of week so that we can plan and execute the forecasted sprint deliverables on time.
> Key question to resolve: Are these two separate repos, two branches, or two build variants? That answer shapes everything — testing, CI/CD, release packaging, and how much overhead the team is actually carrying.
---
**Risk:** If the team does not align on a single source of truth for the GRG plugin source code, then changes made in the Rise8 self-hosted GitLab and TAK Forge repos could lead to conflicts (merging, drift) and delivery risk impacting our ability to go to prod.

**Ask:** We need Kevan to clarify the intended repo strategy — which repo is the source of truth, what moves where and when, and how any deve work being done in the Rise8 GitLabe work connects to the TAK Forge pipeline — by end of week so that we have an established development and delivery process.

## ASSUMPTIONS

**[Viability]** We believe that investing in the foundational model training pipeline during this 8-week contract, even though it is not explicitly required by SOW 4.3.3, will meaningfully strengthen our position for a follow-on OT contract.

**[Viability]** We believe USSOCOM does not currently have the infrastructure, processes, or organizational maturity to independently own and operate a production-grade CV model lifecycle — including data collection, model training, deployment, monitoring, and retraining — without  Rise8's support.

**Risk:** If USSOCOM's CV development and production infrastructure remains undefined and immature beyond this contract, then the ATAK AI GRG plugin — even if delivered successfully — will have no viable path to continuous improvement or production stability, making everything we build now difficult to sustain.

**Risk:** If pipeline codification work is not scoped and time-boxed separately from the four SOW deliverables, then engineering capacity could shift toward work USSOCOM did not ask for, putting the primary contract commitments at risk — specifically getting the ATAK plugin to prod with a signed .mil APK, a clear dual-track strategy, and the GOTS evaluation.

**COA:** Kevan scopes the pipeline foundation work as a separate spike with a defined time-box so it does not compete with Sprint 1 and 2 delivery priorities.

**Ask:** We need Kevan to confirm how much capacity, if any, is being allocated to pipeline foundation work this sprint and whether it is coming at the expense of any SOW-committed deliverable.
---
# TUESDAY March 31st --> Session Handoff Summary - AI GRG Plugin Project / TAK UI

## Goal
Get aligned internally and with the customer (USSOCOM/SOFMC, Nik, Jonathan Miller) on four parallel workstreams:
1. Get the ATAK AI GRG plugin to production -- bugs fixed, .mil APK signed, SDK updated
2. Begin TAK UI migration in parallel as an exploratory track
3. Confirm GOTS evaluation scope and get Nik's plugin shortlist
4. Understand model improvement expectations and what USSOCOM actually asked for
> Externally, the goal was to close the loop with Nizme on the guidance Nik provided in the March 31 sync.

---
## What Was Completed This Session

**Email to Nizme drafted** -- 3 sections covering guidance received from Nik:

1. Dual-track development strategy
2. GOTS evaluation -- initial plugin shortlist provided to Kevan and Sharon in follow-up call
3. Jira PRR -- official release process confirmed by Kevan

**Slack Discussions**
- Clarification on Jira PRR, confirmed: official release process.
- Clarification on SDK 5.7 vs 5.6 development target.

**The piecemeal TAK UI approach surfaced and partially analyzed:**
- Josh posted a rough TAK UI baseline at `git.tak.xxx/rise8/ai-grg-xxx` with an `initial-findings.md`
- Piecemeal = incremental TAK UI migration inside one codebase, not two parallel repos
> Need to confirm with Kevan if this is the way forward.

---
## Key Decisions and Why

| Decision | Why |
|---|---|
| Dual-track confirmed | Nik and Jonathan Miller both signed off. TAK UI not prod-ready. ATAK plugin must ship. |
| ATAK AI GRG is Track 1 (production focus) | Customer needs prod-ready plugin with bugs fixed. TAK UI is still in beta. |
| TAK UI is Track 2 (exploratory, beta) | Nik's end state is TAK UI in production. ExCheck and AI GRG are the two flagship plugins to pull TAK UI out of beta. August 17-21 TAK Offsite is the de facto milestone. |
| Develop on SDK 5.7, release targeting 5.6 and 5.4 | Nik's standing principle: always develop on latest SDK, sign backwards to fielded versions. 5.7 is now latest. |
| Jira PRR required for all releases | Without the ticket, Nik has no visibility into what the team is delivering. |
| GOTS scoped to Nik's shortlist first | 20+ plugins is too broad to evaluate without a priority list. Nik provided 3 to start. |
---
## Assumed Current State of Codebases and Repos

| Repo | Status | Notes |
|---|---|---|
| Rise8 self-hosted GitLab | Active development repo | Source of truth not formally confirmed |
| TAK Forge (gov GitLab) | CI/CD and signing pipeline | .mil APK available but unsigned -- blocks device testing |
| TAK UI baseline (Josh) | Rough draft posted | `git.tak.xxx/rise8/ai-grg-xxx`, includes `initial-findings.md` |

- ATAK AI GRG is currently built against SDK 5.6. Nik said 5.7 is the new development target -- not yet confirmed with Kevan whether the team has updated.
- Rise8 GitLab and TAK Forge may hold separate versions of the source code. No confirmed single source of truth.
- Piecemeal approach (Josh's proposal) means one repo with TAK UI components migrated in incrementally. Not yet confirmed as the team's official strategy.
---
## Blockers and Open Questions

**Active Blockers:**
- .mil APK unsigned -- blocks physical device testing. Kevan investigating TAK Forge signed release submission process.

**Open Questions:**
- Is SDK 5.7 actually released and available? Does Sprint 1 need to update the development target from 5.6 to 5.7?
- Does Josh's piecemeal approach affect the sequencing of getting the ATAK plugin to production first? Or does it run alongside that work?
- Which repo is the single source of truth -- Rise8 GitLab or TAK Forge?
- What are the 3 plugins on Nik's GOTS shortlist? Kevan and Sharon have this -- needs to be shared and scoped.

**Open Assumptions:**
- We believe USSOCOM's model improvement expectations are limited to fixing the two reported bugs (intermittent detection failure, zoom level degradation) -- not a full pipeline codification. Not yet formally confirmed in writing.
- We believe Nik's "no new ATAK features" directive does not block bug fixes on the ATAK plugin. Needs confirmation with Kevan.
---
## Next Steps

**Kevan's Lane:**
- Confirm SDK 5.7 status -- is it released, and does Sprint 1 need to update the development target?
- Clarify with Josh on the piecemeal approach -- does it change the sequencing for getting ATAK to production first?
- Define single source of truth for GRG source code (Rise8 GitLab vs TAK Forge)
- Define dual-track engineering strategy formally -- single repo piecemeal vs two separate tracks
- Share Nik's GOTS plugin shortlist (3 plugins) with Abel so scope can be confirmed

**Engineering Team (Thomas, Zach, Josh):**
- Josh: respond to PM clarifying question on piecemeal sequencing. Share `initial-findings.md` context with the full team.
- Thomas: continue .mil APK testing on emulator. Unblock device testing path.
- Zach: complete TAK UI framework component mapping.

**Abel's PM Lane:**
- Send finalized email to Nizme covering all four guidance topics from Nik sync
- Confirm GOTS plugin shortlist with Kevan and Sharon -- scope what the evaluation covers in this contract
- Document dual-track decision formally and send to SOFMC/SOCOM for written confirmation
- Once Josh responds, assess whether piecemeal changes anything in Sprint 1 or 2 planning
- Read Josh's `initial-findings.md` before next engineering conversation on TAK UI



---

//////NOTES
ok, now here are my thoughts about the "Model Improvement" Task 3 — AI/ML Model Improvements
4.3.3 — Research and make improvements to the AI/ML model for the GRG plug-in.

Here are the thing I learned and heard this past week
- The "improvements" from USSOCOM have only been about bugs and issues with intermitten zoom and accuracy.
- They have NOT brought up anything else about that, while we (internally) have been discussing "codifying the model training pipeline" something Kevan proposed, However we still have many questions, about "where it's gonna live", For example Mases had a lot of questions about it.. Lines 224 to 246 ..
- I thin is worth calling out that we are the ones who is considering the codifying the model training pipeline, as part of "Model improvement" however USSOCOM's "model improvement" based on what they have told us, the bugs (intermitten zoom and accuracy) issues are likely te nly things they are expecting us to resolve in these 8 weeks.. 

The Risk or Maybe is not a Risk, just an assumption? That I have is that the sow (the contract) is NOT requesting us to fully codify the model training pipeline - but as part of setting up the engineering foundation, we want to do tha twork in parallel, HTe goal is to start laying it down properly, so we are set up for the "bigger contract' later after the 8 weeks. Best practices, modularity, scalable, feedback loop,s viable path to prod.. I guess my question for Kevan, as we work through model improvements, what would it take to set up the pipeline foundation the rigth way so we are in a strong position going into the next contract?