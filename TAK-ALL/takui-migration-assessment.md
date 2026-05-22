# TAK UI Migration Assessment: AI GRG Plugin

**SOW Reference:** 4.3.2
**Prepared by:** Rise8
**Delivery Date:** May 15, 2026

---

## 1. Purpose

This document presents Rise8's research findings and cost and timeline estimate for rewriting the AI GRG plugin into the TAK UI framework, as required by SOW task 4.3.2. The research addresses whether and how the plugin's current workflows can be migrated to TAK UI native components, where ATAK-native dependencies remain required, and what the path toward cross-platform compatibility across ATAK, WinTAK, and TAKX would require.

## 2. Research Approach

Research was conducted in three phases between April and May 2026.

**Phase 1: TAK UI Prototype**
The AI GRG plugin was rebuilt using the TAK UI framework in a prototype environment to establish a baseline of what TAK UI covers natively, where ATAK-native APIs are still required, and what technical constraints affect the migration path. This produced a component-level inventory of the plugin's current architecture against the TAK UI framework. [link here]

**Phase 2: Workflow Analysis**
The GRG Creator's end-to-end workflows were mapped into user stories, documenting each UI component and interaction against TAK UI native status. Each component was classified as TAK UI native, ATAK-native required (escape hatch), or unknown pending validation. The full set of workflows covering the GRG creation process is documented in the supporting workflow analysis. [link here]

**Phase 3: BAH Collaboration**
Working sessions were held with Booz Allen Hamilton's TAK UI team on a recurring basis to validate findings, establish a contribution framework, and determine which components are on BAH's development roadmap. These sessions run in parallel with the ongoing workflow analysis and component research, and continue through May 15.

## 3. Findings: Framework Coverage

The following findings reflect the current state of the TAK UI framework against the AI GRG plugin's components and workflows as of May 2026. The research assessed each component across the full GRG creation workflow against three classifications: native TAK UI support, ATAK-native dependency required, and unknown pending validation. These findings form the basis for the scope and cost estimate in Section 5.

### Plugin Component Reference

This table lists every UI component and interaction the AI GRG plugin currently uses, classified by TAK UI status. It is the technical reference behind the scope summary in Section 4. For full workflow and scenario context, see the supporting workflow analysis.

| Component | Role in Plugin | TAK UI Status | Referenced In |
|---|---|---|---|
| `CustomGrid` + `GridLinesMapComponent` | Places and renders the GRG grid on the map | Escape Hatch | Story 1 |
| `GridTransformer` | Updates grid dimensions and spacing via ATAK-native coordinate math | Escape Hatch | Story 1 |
| `MapMenuWidget` / `MapMenuFactory` | Radial menu for grid center actions (Delete, Settings, Rows, Cols, Spacing, Lock) | Escape Hatch (contribution candidate) | Story 1, radial path |

*[Remaining components to be added as spike research completes.]*

---

## 4. Migration Scope Summary

This section summarizes what a full migration of the AI GRG plugin to the TAK UI framework would require, based on the findings in Section 3. The scope is organized into three categories: what is ready to migrate using TAK UI today, what requires a TAK UI component to be built or contributed before migration can proceed, and what stays in the plugin by design because it is too specialized for the framework. Several items remain pending validation and are noted where they affect scope.

### Migration Scope Summary

This section organizes the GRG Creator's workflows into migration scope categories, based on Rise8's research and BAH collaboration sessions. Each category defines what a group of workflows requires — whether they are ready to migrate using TAK UI today, require a new or updated TAK UI component, or remain ATAK-native by design. The scope defined here is what Section 5 translates into sprint estimates. Component-level detail for each workflow is in Section 3.

**Requires a TAK UI Component**

The following workflows require a new or updated TAK UI component before migration can proceed. Rise8 and BAH have identified the contribution path; the review and merge cycle with BAH is the active dependency.

- **Grid center actions via radial menu** (Story 1, radial path)
TAK UI has an existing radial menu but it does not support the nested menu structure the GRG workflow requires. A V2 update has been identified as the contribution path; the current version will be deprecated. Rise8 has a working implementation drafted and ready for Nathan's review. The BAH review and merge cycle is the active dependency.
*Components: `MapMenuWidget`, `MapMenuFactory` — see Section 3.*

**Stays in the Plugin by Design**

The following workflows rely on ATAK-native APIs that are too specialized for the TAK UI framework, not present in the TAK kernel, or confirmed by Nathan and BAH as not appropriate for core inclusion. These workflows remain ATAK-native within the plugin regardless of migration scope.

- **Place and define grid parameters** (Story 1)
Grid placement and rendering are confirmed ATAK-native. Nathan confirmed on April 27 that GRG APIs are not in the TAK kernel and are not general enough for TAK UI core inclusion. This workflow stays in the plugin on ATAK. WinTAK requires a separate custom implementation with no existing bindings today.
*Components: `CustomGrid`, `GridLinesMapComponent`, `GridTransformer` — see Section 3.*

*[Remaining workflow entries to be added as research and BAH sessions complete.]*

---

## 5. Cost and Timeline Estimate

This section translates the scope categories in Section 4 into sprint estimates, broken out by platform — ATAK and WinTAK — where the research confirmed separate implementation paths are required. Each row corresponds to one scope category; the sprint estimate, confidence level, and notes reflect the findings and dependencies documented in Section 4 for that group of workflows.

| Scope Category | Sprints (ATAK) | Sprints (WinTAK) | Confidence | Notes / Dependencies |
|---|---|---|---|---|
| Ready to Migrate | 2–3 | 2–3 | Medium | Structural integration applies across all items in this category — not a component-by-component swap |
| Requires a TAK UI Component | 2–3 | TBD | Low | BAH review and merge cycle is the gating dependency; WinTAK path for contribution items not confirmed — radial menu V2 addresses ATAK only |
| Stays in Plugin by Design | Excluded | TBD | Low | WinTAK parity requires a custom implementation independent of TAK UI migration — no existing bindings, no GRG spec document; separate scoping required |
| Pending Validation | 1–3 | TBD | Low | Range reflects how the 4 open items resolve; label reordering is the most complex unknown — `SwipeRelabelManager` not yet ported to TAK UI |

**Assumptions**
*[List the key assumptions that underpin this estimate — team composition, BAH coordination dependencies, sprint schedule, and any constraints that affect the confidence level.]*

**TAK UI Coverage Note**
*[Summarize what share of the AI GRG plugin's workflows TAK UI native components actually cover versus what remains ATAK-native, and address whether the migration investment delivers proportional value given what stays escape hatch. Note that the components TAK UI covers today are general-purpose — settings panels, confirmation dialogs, polygon drawing. The workflows that define the AI GRG's core capability — grid rendering, building detection, and marker placement — remain ATAK-native and are not migration candidates. Surface the Jetpack Compose architectural risk and the ATAK version variant support question as factors that affect the long-term value of the migration investment.]*

## 6. Risks and Open Items

### Technical Risks

**TAK UI Migration Integration Complexity**
Migrating an existing plugin from ATAK-native to TAK UI is not a component-by-component swap. The current plugin has deep ATAK dependencies woven throughout its architecture. Research confirmed that introducing TAK UI components into the existing plugin will require significant structural work before any individual component can be migrated cleanly. This affects both effort estimates and sequencing.

**WinTAK Kernel Gap**
The GRG plugin's core APIs exist within ATAK but are not present in the TAK kernel — the shared foundation that WinTAK and TAKX run on. Cross-platform compatibility, a stated goal of 4.3.2, cannot be achieved through TAK UI migration alone. A WinTAK implementation would require a separate, custom approach using lower-level primitives. This gap was confirmed during the BAH collaboration sessions and was not previously known to BAH. BAH has committed to investigating the historical context internally.

**TAK UI Architectural Direction and AI Agent Compatibility**
Android's App Functions framework (`androidx.appfunctions`) is the mechanism Google provides for exposing app capabilities to AI agents on Android. It works by annotating functions with metadata at development time; those annotations are compiled into an XML schema that the Android OS indexes at install time, making the app's capabilities discoverable and invocable by agents. App Functions are a separate Jetpack library and are independent of Jetpack Compose — TAK UI's non-Compose architecture is not itself the barrier. The open question is whether the TAK UI framework and the ATAK plugin ecosystem can participate in App Functions: whether plugins can carry the required annotations, whether the schema generation pipeline works within the plugin build system, and whether the OS-level indexing model is compatible with how ATAK loads plugins. App Functions require Android 16+ and are currently in experimental preview. If the plugin ecosystem cannot participate in App Functions, plugins built on TAK UI would be excluded from the AI agent integration layer Google is establishing for Android. This presents a consideration for SOCOM's investment in TAK UI as a long-term platform.

**ATAK SDK ProGuard Obfuscation**
ATAK's SDK uses ProGuard obfuscation in .mil builds, which renames class and method identifiers at packaging time. This creates two related risks: it is a source of developer friction for plugin development, and it is incompatible with AI agent runtimes that require readable method signatures to interact with app functionality. This risk was identified during both plugin development and the TAK UI research and surfaced as a compounding factor alongside the App Functions compatibility question.

### Program and Dependency Risks

**BAH TAK UI Team Capacity**
BAH's TAK UI team has limited staffing. Rise8's contribution work — including the radial menu update — requires BAH review and merge before it can be incorporated into the framework. The timeline for that review cycle is outside Rise8's control and represents a dependency that affects when contribution work can be considered complete.

**BAH Roadmap Dependency**
Several components identified as pending validation may require new TAK UI abstractions that are not currently on BAH's roadmap. Until those roadmap positions are confirmed, Rise8 cannot fully scope or sequence the contribution work. This dependency affects the confidence level of the estimate in Section 5.

**Research Completeness**
Four workflow areas remain under active research — floating toolbar, slider/grid spacing control, grid labels and legend, and label reordering. Their scope assignments are not yet confirmed. The cost and timeline estimate in Section 5 will require an update once these items are resolved.

**GRG Specification Gap**
No formal specification document exists for the GRG plugin's grid component. BAH identified this as a gap during collaboration sessions. Without it, WinTAK implementation work cannot be properly scoped and BAH lacks a shared reference for future collaboration. Creating this document is an open item.

**Cross-Platform Value of TAK UI Contributions**
The TAK UI radial menu component has no functional support on WinTAK or TAKX today — only placeholder code with no active implementation on those platforms. A V2 update would address ATAK only, leaving WinTAK and TAKX unchanged. This is consistent with how GRG grid rendering was assessed — ATAK-specific and not suitable for TAK UI core inclusion. If both components are effectively ATAK-only in the near term, Rise8 recommends BAH and SOCOM clarify what cross-platform compatibility means in practice before migration scope and contribution decisions are finalized. Without that clarity, investment in TAK UI contributions may not advance the cross-platform goal stated in SOW 4.3.2.

## 7. Recommendation

Based on the research findings in Section 3 and the risks identified in Section 6, Rise8 offers the following assessment and recommendation.

Migration of the AI GRG plugin to the TAK UI framework is feasible for a defined portion of the plugin. The components confirmed as TAK UI native today can be migrated without additional framework dependencies. The radial menu requires a TAK UI contribution before migration can proceed, and that work has been scoped and is ready to begin coordination with BAH.

The components confirmed as staying in the plugin by design — grid rendering, building detection, map markers, and GRG file persistence — should not be included in the migration scope. Migrating these would require either recreating GRG-specific APIs in the TAK UI framework or accepting a significant increase in complexity and risk with no corresponding platform benefit.

Cross-platform compatibility across WinTAK and TAKX, as stated in 4.3.2, requires work beyond TAK UI migration. WinTAK will need a separate implementation approach. Rise8 recommends this be scoped as a distinct effort with BAH, informed by the GRG specification document that is currently an open item.

Rise8 recommends SOCOM weigh TAK UI's current architectural direction against long-term platform investment. Whether the TAK UI framework and ATAK plugin ecosystem can participate in Android's App Functions — the mechanism through which AI agents discover and invoke app capabilities — has not yet been confirmed. This is not a blocker for near-term migration work, but it is a factor for SOCOM's roadmap planning beyond this contract period.


---

# TAK UI Assessment + Contribution

## Contribution Criteria

The following criteria define what a qualifying TAK UI contribution must achieve to serve as evidence in this assessment. These apply to the one end-to-end contribution Rise8 will complete as part of the research for Section 5.

**1. One complete contribution, end-to-end**
Pick one component and take it all the way through — from writing the code to submitting the MR to getting it reviewed and merged by BAH. Not a prototype. Not a draft. A real contribution.

**2. ATAK and WinTAK parity**
The contribution has to work on both ATAK and WinTAK — not just ATAK. TAK UI's core value is cross-platform support, and a contribution that only works on ATAK is a plugin-level dependency, not a shared framework investment. Before the contribution can be scoped, the candidate component must be validated against WinTAK. If no realistic candidate achieves WinTAK parity, that finding belongs in the assessment — it is a direct challenge to TAK UI's cross-platform promise as it applies to the GRG plugin.

**3. Testing methodology documented**
Before Rise8 can estimate what contributions cost, the team needs to understand what it takes to validate a TAK UI change works correctly across platforms. What does the CI/CD pipeline check? How is a WinTAK variant confirmed? This has not been done before by Rise8 and must be figured out and written down.

**4. Evidence for the assessment**
The contribution itself becomes a data point in the assessment. Rise8 can say: "We contributed X component — here is what it took, here is how long, here is what the BAH review cycle looked like." That makes Section 5 credible because it is based on actual experience, not guesswork.

**5. Grounds the cost and timeline estimate**
Without doing at least one contribution, the estimate in Section 5 is speculative. One real contribution gives the team a calibrated baseline for how much effort each future contribution would take.

---

Kevin Gates, join their team
THEN and NOW
have ran a few retros
Sky Instructors
People who put on the vent
Jeff Muller/BK

couple angles at this

1. We do have a lot of feedback (various chanenls)
- there is more iteration to do, as opposed to execute it?
2. Jeff - that type of retro was not on their radar, feedback from the survey
- synthesize data from 2nd survey
- NOT the full company
- doesn't know when it will fit in their backlog
> Kevin Gates? 
- Sky Structor


---

Category 1: Consolidate/synthesized into stuff that was completed, but we are awaiting feedback on it (because we sent it on Friday)
1. ProGuard/reflection fix 
2. App-crashing export bug (5.6)
3. User manual delivery

Category 2: Consolidate/Synthesized into items in the backlog that have been priortiized for this week's sprint
5. DT bug backlog items #62 and #63 

Category 3: Consolidate/Synthesized into things that need to be reviewed, triaged and priotized or marked as not required or done
6. `dt-defect-report-spreadsheet-v5.4-v5.6.csv` (22-23 DT issues)
7. `dt-issues-doc-v5.4.md`
13. 5.6 operator stability: DT feedback scope — Drumbeat calls for triaging DT feedback and scoping priority fixes for 5.6 in the next two weeks. Scope against May 15 vs. extension not yet defined. Source: db-wk6.md, Looking Ahead 
20. assembleProduction job slowness — Intermittently exceeds GitLab 60-minute limit. Parked as lower priority. No confirmed resolution. Source: tak-daily-april_20-24.md, PM card line ~888

Category 4: Top Priority #1 -  TAK UI Migration effort and also prep for Sync tomororw, Monday May 4th with Nathan/BAH
8. TAK UI migration assessment document — In progress. Content target May 7-8. Delivery May 15. Thomas feedback needed Monday. Section 3/4 structure still being finalized. Source: tak-daily-april_27-may1.md, April 30 PM planning / db-wk6.md, Looking Ahead
9. Remaining TAK UI workflow stories for assessment — Stories 3, 4, and 5 not yet walked through for the assessment. BAH sync May 4 intended to close open component findings on Story 2. Source: tak-daily-april_27-may1.md, TAK UI internal team review section / db-wk6.md
10. Radial menu TAK UI contribution (first end-to-end) — Josh building it. Nathan alignment on Monday May 4 flagged as first action. First-time review/merge process is a flagged risk. Source: db-wk6.md, Looking Ahead and Risks sections / tak-daily-april_27-may1.md
11. `ActionBarView` spike (Thomas) — Thomas testing Nathan's shared MR changes against Rise8's use case. Finding feeds into the assessment document. Source: tak-daily-april_27-may1.md, April 29 standup and IPM sections

Category 5: Top Priority #2 - Demo prep and PM update on Weds May 6th 11am
12. Sprint 3 demo, May 6 — Pre-caching and imagery status feature as the demonstration focus. Demo script prep noted as needed. Source: db-wk6.md, Looking Ahead / tak-daily-april_27-may1.md, April 30 PM planning
18. Tile caching messaging: user story and documentation — Jonathan and Abel agreed no development until a story is formally captured. Jonathan to help create documentation and stories. Source: tak-daily-april_27-may1.md, April 30 post-standup discussion

Category 6: Top Priority #3 - GOTS Evals, progress. mostly own and drivem by Kevan and Jonathan, Potential VSM by me, Abel
14. GOTS maneuver domain follow-up — Not yet scheduled. Nik is out of town until May 15. Kevan is the path forward. Source: db-wk6.md, Looking Ahead / Abel update, May 3
15. GOTS/MOSA eval WIP visibility — Abel needs a read from Kevan and Jonathan on where the GOTS eval stands heading into the final stretch. Source: Abel update, May 3

Category 7: Lowest priortiy
16. Post-mortem / retro — Lower priority now. Abel considering folding it into a regular retro. No date or format confirmed. Source: Abel update, May 3

Category 8: Top Priorty #4 - We need to start drafting hypothesis where needed (misison outcomes) and also ensure our Enabling outcomes can be submitted, Work woth Jonathan he has more insights from his user mapping and ideal state with Nik
17. Outcomes in prod: hypothesis and metric formalization — April 29 session produced a measurable target: 50% time reduction for labeling 200 buildings. Standardized Figma template in use. GitLab documentation and stories not yet created. Source: tak-daily-april_27-may1.md, April 29 Outcomes session

Category 9: Low priority - because we need to be in May 15 or post to seriously discuss and laing
19. Contracting blocker: production access — From the April 24 Nik meeting, Nik indicated that for Rise8 to contribute code to production TAK systems, they would need a SOCOM email and CAC. No action or owner assigned. This one is worth flagging as an item to clarify with Kevan before the week runs out. Source: tak-daily-april_20-24.md, Nik meeting notes section
21. TAK Offsite, August 17-21 — Nik recommended making hotel reservations. Who from Rise8 attends is not confirmed. Source: tak-daily-april_20-24.md, Nik meeting notes