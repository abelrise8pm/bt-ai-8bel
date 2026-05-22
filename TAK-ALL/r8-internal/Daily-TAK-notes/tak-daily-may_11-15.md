# TAK Bridge — Week of May 11 to May 15
---
## Hand-Off Summary and Monday Prompt

You are picking up TAK Bridge PM work as of Monday, May 11, 2026.
> This is the final week of the bridge contract. Sprint 3 closed with Josh's MR #314 under final BAH review (Nathan called the work "really great," only Malakai's Combat Swim verification and Nathan's final pass remain), the TAK UI Migration Assessment content target hit May 7/8, the Sprint 3 demo delivered May 6, and the DT bug spreadsheet triaged with Jonathan. The first priority Monday morning is monitoring MR #314 to close out, then locking the assessment content (Stories 3, 4, 5 plus the WinTAK platform gaps) so Kevan can finalize Section 5 sprint estimates ahead of May 15 delivery.

**Open threads to be aware of:**
- New defects #72 (label bleed across collocated GRGs, operator P confirmed via Jonathan that the duplicate alpha-numeric pattern is unacceptable) and #73 (skip-sections still reporting building counts) — engineering scope and sprint inclusion decision against the May 15 window
- WinTAK platform gaps from the May 7 BAH sync (radial menu C# work + composite map items / OpenGL render) need to land in the migration assessment with the API stability page reference
- GOTS Maneuver Domain follow-up — Nik returns May 15, possible closeout discussion opportunity

**Reference files:**
- Outcomes: TAK-ALL/tak-oor.md
- Latest drumbeat: TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/db-wk7.md
- Last week's discussions and notes: TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-may_4-8.md
- This week's notes: TAK-ALL/r8-internal/Daily-TAK-notes/tak-daily-may_11-15.md

---

## Focus for the Week of May 11 to May 15

1. Get Josh's MR #314 merged. Nathan's final pass and Malakai's Combat Swim verification are the two remaining gates. Once it merges, Rise8's first end-to-end TAK UI contribution is in the books, which is what makes the enabling outcome reportable.
*Outcome: Rise8 team shifted from TAK UI consumer to key contributor*

2. Lock the TAK UI Migration Assessment content for delivery. Stories 3, 4, 5 and the WinTAK platform gaps need to be in the document so Kevan can finalize Section 5 sprint estimates. The assessment plus the merged MR is what gives SOCOM and BAH a shared basis for the migration roadmap. Delivery May 15.
*Outcome: Rise8 team shifted from TAK UI consumer to key contributor*

3. Finalize 5.6 operator stability through Sprint 4 wrap. Resolve priority DT defects, scope new bugs #72 and #73 against the May 15 window, and confirm field-deployable state with the DTs. What is stable and confirmed by closeout determines what operators carry into the field after the bridge.

4. Deliver the GOTS/MOSA evaluation report and PMO briefing. Full report by May 13, briefing closes out the evaluation by May 15. Abel provides the TAK UI synthesis content; Kevan owns the final deliverable.

5. Document operator improvements as a prioritized backlog. Capture government testing feedback and operator input from Sprint 3 and Sprint 4 into a structured set ready for follow-on development. That backlog is what gives any continuation contract a starting point on day one.
*Outcome: Operators produce accurate GRGs in less time and with less effort*

---

## Resolved/Open Issues and Matters: Week of May 4 to May 8

### CATEGORY 1: Resolved / Solved

**Critical Defect Fixes Delivered to DTs (Radial Menu Delete, Export Crash, ProGuard/Reflection)**
Description: Three priority fixes addressing app-crashing and silent-failure defects on 5.6 and 5.4 builds delivered to DTs over the past two weeks. Internal verification complete on all three.
- Resolution: SOLVED
> COA: Abel to confirm acceptance with DTs as field testing progresses.
---
**Sprint 3 Demo**
Description: Demo delivered May 6 covering pre-caching and imagery status feature. Operators now get a signal on imagery state before building detection runs instead of launching blind.
- Resolution: SOLVED
> COA: No further action.
---
**BAH Contribution Dependency Cleared**
Description: BAH review dependency flagged in db-wk6 has resolved. Nathan reviewed Josh's MR with positive feedback and minor surface-level comments only.
- Resolution: SOLVED
> COA: Tracked as part of MR #314 closure (see WIP).
---
**DT Bug Triage (May 4 Spreadsheet and v5.4 Issues Doc)**
Description: Abel and Jonathan triaged `dt-defect-report-spreadsheet-v5.4-v5.6.csv` and `dt-issues-doc-v5.4.md`. Items sorted into existing tickets, redundancies, items needing more DT info, and priority buckets.
- Resolution: SOLVED
> COA: Engineering picks up prioritized items in Sprint 4. Abel to follow up with DTs on items needing more info.
---
**DT Feedback Process Alignment**
Description: May 7 sync with Josh and Cliff established that future feedback must include starting state, expected versus actual behavior, and operator impact. Removes guesswork from triage.
- Resolution: SOLVED
> COA: Abel to apply this expectation in the next round of DT feedback intake.
---

### CATEGORY 2: In Flight / WIP (May 15 Deliverables)

**Josh's MR #314 — First TAK UI Contribution**
Description: Radial menu MR. Nathan called the work "really great." Josh addressing minor comments. Awaiting Nathan's final pass and Malakai's verification that no Combat Swim plugin breakage occurs.
- Resolution: WIP
> COA: Josh owns implementation. Abel monitoring MR comments. Merge expected once Nathan and Malakai close out.
---
**TAK UI Migration Assessment Document**
Description: Cost and timeline assessment for migrating AI GRG to TAK UI. Content target May 7/8, delivery May 15. Section 5 sprint estimates depend on Section 4 closure.
- Resolution: WIP
> COA: Abel to lock content for Kevan to finalize Section 5. Delivery to SOCOM by May 15.
---
**GOTS / MOSA Evaluation Report**
Description: Single consolidated report covering current state, target state, and MOSA scorecard against Trailblazer, Combat Swim, and Spot Plot. Outline due May 8, full report May 13.
- Resolution: WIP
> COA: Kevan owns synthesis. Jonathan contributes UX risk content. Abel provides TAK UI synthesis.
---
**Mary Pollin Onboarding**
Description: New team member ramping up via context meetings with Abel, Kevan, and Jonathan. Pairing on demo prep and bug triage scheduled.
- Resolution: WIP
> COA: Jonathan leading context for Mary. Abel scheduling pairing sessions.
---

### CATEGORY 3: Open / Needs Action

**New Defects from May 5-7 Testing (#72 and #73)**
Description: #72 — building labels bleed between collocated GRGs; operator P confirmed via Jonathan email that duplicate alpha-numerics across GRGs are unacceptable. #73 — "Skip sections with existing markers" reports building counts when no new buildings should be detected.
- Resolution: OPEN
> COA: Engineering to review and scope. Abel to confirm sprint inclusion against the May 15 window.
---
**WinTAK Platform Gaps for Migration Assessment**
Description: Two gaps surfaced in the May 7 BAH sync. WinTAK radial menu requires C# work and is out of scope. Composite map items and OpenGL render have no TAK UI equivalent. Both reinforce the "ATAK ahead, WinTAK behind" pattern.
- Resolution: OPEN
> COA: Abel and Thomas to document both gaps in the migration assessment, including the API stability page reference.
---
**Outcomes Work in GitLab**
Description: April 29 session established a 50% time-reduction hypothesis for labeling 200 buildings. GitLab documentation and formal stories not yet created.
- Resolution: OPEN
> COA: Abel to create GitLab documentation and stories. Jonathan to contribute user mapping insights. Abel to conTAKt Michael Maye on Claude Code to GitLab integration.
---
**AI / Claude Code Team Collaboration Methods**
Description: Abel and Jonathan met with Adam Gardner and David Croney to learn their AI-assisted work methods. Goal is to set up Rise8's own approach for team collaboration with Claude Code, including evaluation of Kevan's project or delivery assistant.
- Resolution: OPEN
> COA: Abel and Jonathan to draft an approach. Decision on adopting Kevan's assistant pending evaluation.
---
**Path to Prod TAK Process Map**
Description: Process map capturing the phases and stages worked through during the bridge contract. Most stages have now been touched, making the map completable.
- Resolution: OPEN
> COA: Abel to finish the map. Owner TBD for ongoing maintenance.
---
**GOTS Maneuver Domain Follow-Up**
Description: Maneuver domain working session with SOCOM completed previously. Follow-up session to advance the shared capabilities framework not yet scheduled. Nik unavailable until May 15.
- Resolution: OPEN
> COA: Abel to follow up with Kevan on the next step.
---

### CATEGORY 4: Strategic / Post-May 15

**Production Path and Follow-On Continuity**
Description: Two threads tied to staying on contract after May 15. SOCOM CAC and production access (Nik's plan). Kevan's white paper submission to Chad for the September follow-on.
- Resolution: OPEN
> COA: Kevan owns white paper. Abel to clarify production access scope with Kevan. No action expected until post-May 15.
---
**Mini PI Planning Windows**
Description: Nik mentioned June 15 and September 1 as upcoming PI planning windows. Rise8 may take a larger TAK UI scope (potentially WinTAK ownership) once on contract.
- Resolution: TBD
> COA: Abel to track windows and confirm Rise8 attendance once Nik formalizes plans.
---
**TAK Offsite August 17-21 Reservations**
Description: Nik recommended Rise8 make hotel reservations for the TAK Offsite conference. Attendee list from Rise8 not confirmed.
- Resolution: OPEN
> COA: Abel to confirm attendee list with Kevan and Sharon before reservations are made.

---

## Adam Garnder, David Croney, Jonathan and Abel, Claude Code in AI talk

Summary
Team explored centralizing AI context management and defining collaborative workflows to improve project outcomes and efficiency.

Context Consolidation Challenges
Teams identified that siloed AI tool adoption hinders collaborative progress. The core challenge involves integrating diverse professional roles into a unified, high-quality context environment.

Treating Context as Code
The team reached the decision to store project context within code repositories using structured documentation and indexing. This approach treats iterative project sessions like game runs to systematically refine rules.

Balancing AI and Human
Participants expressed concern that rapid AI processing outpaces human comprehension and threatens individual project involvement. Future efforts will focus on inventing mechanisms to maintain team engagement alongside automated assistance.

Next steps
[David Croney] Schedule Meeting: Schedule 20 minute meeting with Jonathan Van Dalen to review epic template usage.
[David Croney, Jonathan Van Dalen] Review Templates: Discuss experience using templates, noting elements retained versus removed.


Details
Introduction and Context Setting: Abel Hernandez outlined the motivation for the meeting, stemming from their work on the TAC contract team and the initial efforts to integrate outcome tracking using GitLab, which included templates developed by Jonathan Van Dalen (00:00:00). The adoption of cloud code, particularly after ShipSummit and Impact Lab, resulted in individuals using the tools in silos, prompting the need to discuss how to consolidate efforts and learn from other teams' workflows. Jeff Wills suggested they speak with David Croney and Adam Gardner's team, as the original outcome-tracking templates were designed for a "legacy workflow" before cloud coding was common (00:01:07).
Team History and Project Evolution: David Croney and Adam Gardner provided context on their project, noting that the team members have changed, and the current phase involves only the two of them working together (00:02:09). Adam Gardner explained that the project originated right before ShipSummit when Jeff asked them and Ethan Reed to work on the "allocate" project for eight weeks, focusing on using AI tools for allocation business domain and learning about the multi-player versus single-player paradigm (00:02:55).
Lessons Learned from AI Tool Adoption: Adam Gardner described the project's constraint of using AI tools as much as possible, which forced them to integrate the tools into their workflow and deal with associated struggles. They have been recording lessons and progress in their repository, noting both helpful aspects and blockers or frictions (00:04:09). The current focus is on how to apply the AI tool experience to the outcome and multiplayer perspective (00:05:26).
The Multiplayer Perspective and Context Alignment: Jonathan Van Dalen expressed particular interest in the multiplayer perspective, emphasizing the need to link AI assistance with outcomes to ensure value alignment (00:05:26). They noted that their current Claude setup is fragmented, with local use for sensitive projects and the web version for general design questions, but they are able to feed it necessary context (00:06:38). The core problem is marrying the work of different roles—such as Jonathan's design and research synthesis, Kevin's delivery vision drafting, engineers' coding, and Abel's product management tasks—in a single collaborative Claude environment (00:07:43).
Multiplayer Setup and Importance of Context: Adam Gardner stressed that context is the most important element, and it must be "well engineered and compact and up-to-date," like fresh milk. They suggested that each discipline should ensure context is maintained and merged into a centralized location. The team explored various platforms for context storage, moving from "beads" to GitLab, but faced technical limitations, as they were told "no more claude to GitLab" due to internal technical decisions (00:10:24).
Context as Code and Delivery Assistance: Adam Gardner introduced the concept of treating context as code and suggested using a framework, like the delivery assistant Kevin Mortyn developed, to help keep everyone aligned (00:11:57). Context was defined through the analogy of the movie *Memento* and "Rogue Light" video games, where every project session is a "run" (00:12:56). Based on learnings from each run, the team needs to actively refine and add context, gotchas, and rules to build a more efficient "delivery factory" (00:15:05).
Storing and Refining Context: Adam Gardner described their current context storage pattern: the most critical items are in a central repository with ClaudeMD acting as the index, along with a "rules" folder and a "docs" folder (00:15:05). The context window should be compact and not overloaded, comparing it to an unmanageable mural board (00:16:15). The team should systematically add context—like personas or security agents—to improve each subsequent run, essentially turning the process into a "rogue-like game" (00:18:15).
Integration of Context and Code: Abel Hernandez confirmed their understanding that Adam and David's team keeps their cloud skills and documentation context within the same code repository, not as a separate project (00:19:22). Adam Gardner confirmed this setup is helpful for the coding perspective by having consolidated documentation or pointers to a system of record, such as MD files (00:20:30). David Croney added that having all context consolidated in the repository has been a difficult but important adjustment, as they were previously accustomed to looking in places like Figma or the GitLab backlog (00:21:39).
Impact of AI Speed on Human Understanding: David Croney shared a concern that the speed of context processing in Claude "vastly outpaces" the speed of context absorption in the human brain, which is not beneficial. Abel Hernandez related to this, noting they felt relegated to a scrum master role and overwhelmed by technical overhead; upon looking up, they found beautifully scaffolded documents created by Claude that lacked necessary product management or user perspective discussions (00:22:34). Adam Gardner summarized this by quoting Confucius: "Involve me and I will understand," suggesting that involvement is being "stripped away with the new tools" (00:23:24).
Future Steps and Template Review: Abel Hernandez suggested that a primary action item is addressing the single-player versus multiplayer mode, referencing Kevin Mortyn's delivery assistant as a potential path forward (00:25:17). David Croney agreed that figuring out teamwork in the AI/Claude operational model is the hardest current challenge and requires inventing new mechanisms (00:26:27). Abel Hernandez confirmed they will ideate on a current balanced team workflow, determine where Claude can be a 10x factor, and align on using a shared project for all context, as Adam and David's team does (00:27:23). David Croney specifically mentioned that he used Jonathan's epic template to link Epics (as outcomes) to tracking, but found it potentially "too much stuff" and wordy (00:28:21). Abel Hernandez confirmed they would move forward with taking learnings from the team, and Jonathan Van Dalen requested a follow-up meeting to hear more about David's experience with the templates (00:30:19).
