# TAK AI GRG Hypotheses (June)

> Pipeline: `tak-output-assumptions (the 9 cards) -> tak-hypothesis (this file) -> experiments-framework.md (Experiment Card)`.
> Each hypothesis takes one finalized output-assumption card and shapes it into a testable Lean UX hypothesis (thin slice + persona + pain + behavior change + KRs).
> Source cards: `tak-output-assumptions.md`. Anchor outcome: Model Improvements (`tak-oor.md:44-46`).
> Bracketed [X]/[N] thresholds are unset: no prod baseline yet, blocked until we have access to users in prod.

---

## 1. AI building detection, sliding-window method (Bridge)

> Source card: `tak-output-assumptions.md` card #1. Behavior bet is Thread B (run AI first instead of manual labeling); Thread A (single-run reliance) is kept as a KR.
> Folded in June 11 Yi review: re-run signal (lines 308, 313), precision/recall/F1 as an enabling outcome (line 310, Decision line 336).

**We believe** the sliding-window AI building detection

**For** GRG creators (operators)

**will address** the slow and manual process of placing many markers over a map image to label buildings

**resulting in** operators running AI building detection first, instead of manually labeling them

**We will know we are successful when**

Lagging Indicator (Thread A, trust a single run):
- **KR-1:** GRG creators complete a GRG from a single AI detection run over the AOI, without re-running detection or re-adjusting the zoom to check it, in [X] of GRGs created during the experiment window.

Leading Indicator (Thread B, run AI first):
- **KR-2:** GRG creators start the GRG by running AI detection before placing any markers manually, in [X] of GRGs created in the first [N] days.

Enabling outcome (instrumentation, not operator behavior):
- An automated pipeline reports precision, recall, and F1 for building detection against a golden image dataset, across the imagery environments operators work in. (Yi, June 11; logged Decision line 336.)

**Open:**
- [X]/[N] thresholds unset, no prod baseline (chase the recall % Yi cited in demos, line 233).
- ⚠️ Metric placement to confirm: keep precision/recall/F1 OUT of the behavioral KRs as the enabling outcome above, or express the metric inside the KRs? (Abel's line 313 take leaned toward KRs; my read is it stays an enabling outcome, since a KR needs a human actor.)

---

## 2. Smart default labeling (Competition)

> Source card: `tak-output-assumptions.md` card #2. Drafted on the smart default bet only (the card's riskiest nomination); scheme-picking set aside per Abel.
> Folded in June 11 Yi review: "less re-work" is the measurement (line 318); cost-of-rework function parked as a candidate enabling outcome.

**We believe** the smart default labeling order

**For** GRG creators (operators)

**will address** the slow and manual work of renumbering buildings when the labeling order isn't the one the operator would use

**resulting in** operators accepting the default labeling order, instead of manually renumbering the buildings

**We will know we are successful when**

Lagging Indicator (reduction in manual renumbering):
- **KR-1:** GRG creators renumber fewer than [X] of the buildings in a GRG, during the experiment window.

Leading Indicator (acceptance of the default):
- **KR-2:** GRG creators keep the default labeling order unchanged, without renumbering, in [X] of GRGs created in the first [N] days.

Enabling outcome to consider (not a behavioral KR):
- Cost-of-rework function (lines 317-318): weight the re-work by time-to-fix and mission cost (a false marker costs X to remove; missing markers cost more than extra ones). Parked as a candidate enabling outcome.

**Open:** [X]/[N] thresholds unset, no prod baseline.

---

## 3. Automatic renumbering (Competition)

> Source card: `tak-output-assumptions.md` card #3. Behavior bet is make a change and move on vs stopping to renumber manually. Distinct from #2: #2 is accepting the default order (no renumber at all); #3 is what happens once an edit IS made.
> Folded in June 11 Yi review: time-saved is the measure (line 320); cost function adopted for renumbering (Decision line 338), parked as a candidate enabling outcome.

**We believe** automatic renumbering

**For** GRG creators (operators)

**will address** the slow and manual work of re-sequencing every affected marker when a change is made, across the 10s or 100s of buildings in a GRG

**resulting in** operators making a change and moving on, instead of stopping to renumber the affected markers manually

**We will know we are successful when**

Lagging Indicator (behavior held):
- **KR-1:** GRG creators make an edit and keep building the GRG without manually renumbering the affected markers, in [X] of edited GRGs during the experiment window.

Leading Indicator:
- **KR-2:** GRG creators complete a marker edit without manually renumbering, in the first [N] days.

Enabling outcome to consider (not a behavioral KR):
- Time-saved / cost function (line 320; Decision line 338): estimate the time saved by removing manual resequencing, weighted by time cost and mission impact. Parked as a candidate enabling outcome.

**Open:** [X]/[N] thresholds unset, no prod baseline.

---

## 4. Swipe gesture to resequence (Competition)

> Source card: `tak-output-assumptions.md` card #4. Team-invented, not user-requested, so the bet leans on adoption/discovery. Distinct from #3: #3 is auto-renumber on any edit; #4 is the deliberate gesture to reshape the whole sequence.
> Folded in June 11 Yi review: swipe addresses the inaccuracies of earlier automatic numbering; Yi calls it high-value for returning control to the operator at 100% accuracy (line 322). Speed and accuracy/control both parked as candidate enabling outcomes.

**We believe** the swipe gesture to resequence markers

**For** GRG creators (operators)

**will address** the slow and manual work of re-sequencing a long set of markers into a different order or shape one at a time

**resulting in** operators reshaping the whole marker sequence with one swipe, instead of one marker at a time

**We will know we are successful when**

Lagging Indicator (behavior held):
- **KR-1:** GRG creators use the swipe to complete a full resequence, instead of going one marker at a time, in [X] of resequenced GRGs during the experiment window.

Leading Indicator (discovery):
- **KR-2:** GRG creators try the swipe gesture at least once, in [X] of GRGs created in the first [N] days.

Enabling outcomes to consider (not behavioral KRs):
- Speed (line 253): the time saved reshaping with one swipe vs. the one-at-a-time method.
- Accuracy / control (Yi, line 322): the swipe returns control to the operator, reaching the exact order at 100% accuracy rather than relying on automated estimation.

**Open:** [X]/[N] thresholds unset, no prod baseline.

---

## 5. Add marker that adopts the section's prefix and numbering (Competition)

> Source card: `tak-output-assumptions.md` card #5. Reframed with Abel: the solution is the enhanced drawn section (it now assigns its own prefix/numbering to the markers inside it); the behavior is the added marker inheriting that label. The upstream "trust AI's first pass" bet was set aside as a duplicate of #1's Thread B.
> Pain reframed solution-agnostic: sections were native ATAK shapes with no meaning until AI GRG gave them meaning, so the pain stated for the old world is the manual labeling burden, not "matching the section" (which presupposes our solution). The section then does its work in the solution and KRs.
> Folded in June 11 Yi review: Yi confirmed the section auto-assigns prefixes/sequence numbers, establishing the link between operator needs and the graphic output so markers align with sectioning conventions (line 324).

**We believe** the drawn section that assigns its prefix and numbering to the markers inside it

**For** GRG creators (operators)

**will address** the manual work of labeling an added marker to keep it consistent with the buildings around it

**resulting in** operators adding a marker and letting it take the section's label, instead of labeling it manually

**We will know we are successful when**

Lagging Indicator:
- **KR-1:** GRG creators add markers that keep the section's label without labeling them manually, in [X] of added markers during the experiment window.
  - _Example: [X] = 90% of added markers (9 of every 10 added markers keep the section's label without manual relabeling)._

Leading Indicator:
- **KR-2:** GRG creators add a marker and keep the label the section gives it, in [X] of GRGs in the first [N] days.
  - _Example: [X] = 8 of 10 GRGs, [N] = 14 days (in the first two weeks, 8 of the first 10 GRGs show an added marker where the operator kept the section-given label)._

**Open:** [X]/[N] thresholds unset, no prod baseline. (Resolved: the #5/#3 line is no longer thin, #3 renumbers *existing* markers after an edit; #5 is a *newly added* marker inheriting the section's label. They stay separate.)

---

## 6. Skip ambiguous letters (Competition)

> Source card: `tak-output-assumptions.md` card #6. Does NOT sit on the Model Improvements "less manual effort" theme. Mission outcome proposed here is comms accuracy, not yet a named outcome (flagged for `tak-outcomes`).
> Folded in June 11 Yi review (lines 326-327): the filter excludes ambiguous letters to prevent comms errors; operators were already manually avoiding them, so Yi reads it as matching an existing human behavior. Per Abel, comms accuracy is the higher-impact bet; the manual-effort angle folds in as the leading KR.

**We believe** the filter that skips ambiguous letters when labeling buildings

**For** Operators

**will address** ambiguous characters (like I/1, O/0, 8/B) getting misread when a building ID is called out over comms, risking a misread of the building's location

**resulting in** operators calling out building IDs over comms without having to decipher or second-guess them

**We will know we are successful when**

Lagging Indicator (comms accuracy, the mission outcome):
- **KR-1:** operators reference a building ID over comms without a misread or a request to repeat or clarify, in [X] of callouts during the experiment window.

Leading Indicator (build-time signal):
- **KR-2:** GRG creators leave the skip-ambiguous-letters filter on when labeling, in [X] of GRGs in the first [N] days.

**Open:** [X]/[N] thresholds unset, no prod baseline. Mission outcome (comms accuracy) not yet named, flagged for `tak-outcomes`.

---

## 7. Imagery pre-caching + operator status messaging (Bridge)

> Source card: `tak-output-assumptions.md` card #7. Drafted out of order (#8 still to come, slots between this and #9).
> Reframed with Zach (Jun 10): the bet is about knowing the quality of imagery going into detection (catching silent failures), not trust in the model's output. June 11 Outcomes-in-Prod review did not cover this card.
> DDIL scope set aside per Abel: the hypothesis is about the behavior change from the background pre-caching and the status toasts; how often operators are connected vs disconnected is Abel's to handle separately, not carried in the hypothesis.
> Documented status states (`tak-final-demo.md:35`, `:53-54`): full success / partial (1-2 tiles missing, lower-quality used) / fetch failure ("Tile Capture Failed", over 25% of tiles missing). The 25% failure threshold was set by Zach (`tak-daily-april_27-may1.md:931`) and is unvalidated (`tak-final-demo.md:185`).

**We believe** background imagery pre-caching with status notifications (full success, partial, or fetch failure)

**For** GRG creators (operators) connected to a server

**will address** running detection on imagery that came in incomplete without any signal that it did, a silent failure

**resulting in** operators re-fetching imagery the status flags as incomplete, instead of running detection on it

**We will know we are successful when**

Lagging Indicator (behavior held):
- **KR-1:** on a "Tile Capture Failed" status (over 25% of tiles missing), operators re-fetch before running detection, in [X] of failure notifications during the experiment window.

Leading Indicator:
- **KR-2:** on a partial-completion status, operators re-fetch rather than run on the lower-quality imagery, in [X] of partial notifications in the first [N] days.

Alternative KRs (state-agnostic, if we'd rather not split by status state):
- **KR-1 (lagging):** when the status flags imagery as incomplete, operators re-fetch before running detection, in [X] of flagged cases during the experiment window.
- **KR-2 (leading):** operators re-fetch flagged imagery instead of running on it, in [X] of flagged cases in the first [N] days.

Enabling / learning outcome to consider (not a behavioral KR):
- Validate the 25% missing-tiles failure threshold (`tak-final-demo.md:185`): does it line up with where operators actually stop trusting the imagery? The experiment is the chance to learn that.

**Open:** [X]/[N] thresholds unset, no prod baseline. Status-half mission outcome not yet named (knowing input imagery quality / catching silent failures is a different lever than Model Improvements), flagged for `tak-outcomes`. Pre-caching half sits on the Model Improvements "tile caching" output.

---

## 9. Grid configuration via the radial menu (Bridge)

> Source card: `tak-output-assumptions.md` card #9. Drafted out of numeric order; #7 and #8 skipped per Abel, to be filled in between #6 and this card later.
> Pain grounded in June 11 line 332: the team migrated grid configuration from a legacy drawer interface to an ATAC-native radial menu, tested with operators, to reduce usability risk. The "side-panel drawer" is our own plugin's other config path (per Abel), distinct from the separate legacy GRG Builder plugin. Pain kept at the grounded level per Abel: the drawer not being the ATAK-native way; the "more steps/taps/confirmations" characterization was set aside as an unconfirmed read.
> Engineering maintainability (line 332) is a viability driver, not an operator behavior, so it is noted here, not made a KR.

**We believe** grid configuration through the radial menu

**For** GRG creators (operators)

**will address** configuring the grid through a separate side-panel drawer, which isn't the ATAK-native way operators work

**resulting in** operators configuring the grid through the radial menu, instead of the side-panel drawer

**We will know we are successful when**

Lagging Indicator (behavior held):
- **KR-1:** operators complete grid configuration through the radial menu without falling back to the side-panel drawer, in [X] of GRGs during the experiment window.

Leading Indicator:
- **KR-2:** operators open the radial menu to configure the grid, rather than the drawer, in [X] of GRGs in the first [N] days.

**Open:** [X]/[N] thresholds unset, no prod baseline. Mission outcome not yet named (config-workflow change, off the Model Improvements theme), flagged for `tak-outcomes`. June 11 strengthens the case (operator-tested, usability-risk reduction).

---







## Session Summary + Hand-off (through #9, #8 gated)

> **TL;DR:** Folded the June 9 + June 11 (Yi) updates into the four already-drafted Competition cards and refined them, then drafted three new cards (Skip ambiguous letters, Imagery pre-caching + status messaging, Grid configuration via the radial menu). Auto-generated legend is the only one not drafted, gated on an "is it ours?" question. All eight drafted cards are complete except for thresholds. #1 was reviewed by Abel before this session.

### What got done
- **Smart default labeling:** KRs split into reduction-in-renumbering (lagging) and acceptance-of-default (leading); cost-of-rework parked as a candidate enabling outcome.
- **Automatic renumbering:** outcome reworded to "make a change and move on, instead of stopping to renumber manually"; behavioral KRs; time-saved / cost function parked as enabling outcome.
- **Swipe gesture to resequence:** outcome given a human actor ("reshape the whole marker sequence with one swipe"); lagging behavior + leading discovery KRs; speed and accuracy/control parked as enabling outcomes.
- **Add marker (section's prefix/numbering):** solution = the section "assigns" its prefix/numbering; pain reframed solution-agnostic (manual labeling to stay consistent with surrounding buildings, the pre-AI-GRG burden); KRs carry worked examples; the line against Automatic renumbering resolved (existing-marker renumber vs newly-added-marker inherit).
- **Skip ambiguous letters (new):** mission outcome = comms accuracy (lagging KR); manual-effort = leading KR; For Operators. Outcome not yet named (flagged for `tak-outcomes`).
- **Imagery pre-caching + status messaging (new):** For operators connected to a server; behavior = re-fetch imagery the status flags incomplete; primary KRs anchored on documented states (Tile Capture Failed >25% missing / partial), plus alternative state-agnostic KRs; 25% threshold validation parked as a learning outcome. DDIL frequency set aside per Abel (not carried in the bet).
- **Grid configuration via the radial menu (new):** pain grounded in `gap-tak-june_8-12.md:332` (separate, non-native side-panel drawer); behavior = configure via the radial instead of the side-panel drawer; engineering maintainability parked as a viability driver, not a KR.

### Craft rules reinforced (carry forward, Abel corrects these every time)
- Call each card by its **name**, never "#N", in conversation.
- **Never the em dash.** Say **"manually," never "by hand."** No invented/coined words; use the team's plain words.
- **Pain must be solution-agnostic.** Don't smuggle the solution into the pain (Add marker: pain is the manual labeling burden, not "matching the section").
- **Cite, don't infer.** When a pain or claim is your inference, flag it and find the source anchor (the radial pain was anchored to `:332`, not invented).
- **"resulting in" needs a human actor and must be tight**, not word salad. Behavioral contrast carries the change. One behavior per hypothesis.
- **Park metrics / cost / instrumentation as enabling outcomes**, not behavioral KRs (precision/recall, cost-of-rework, time-saved, accuracy/control, the 25% threshold). A KR needs a human actor.
- **Lead with the most impactful behavior (the mission outcome); use the others as KRs.**
- No intensifiers/qualifiers in the bet; magnitude belongs in the pain. Keep responses short, draft first, fewer words in front of Abel.

### Open / not done
- **Auto-generated legend (#8) NOT drafted, gated.** The gate: is the auto-legend ours, or copied from an existing plugin? Yi said it was likely copied during the competition (`gap-tak-june_8-12.md:329-330`); there's an open verify-legend-capability step (`:285`) and a source-card flag (`tak-output-assumptions.md:245`). If it's ours, the defensible slice is the **version-on-export** bet (Abel's "did we add value with the GRG version?"). Persona is **downstream** (team leads / mission execution team), possibly out of scope (`:269`). Hold until Abel confirms ours-vs-copied with the team.
- **Card ordering:** #8 slots between #7 and #9 once drafted. #9 was drafted before #7/#8 per Abel.
- ⚠️ **All KRs and [X]/[N] thresholds are placeholders.** No prod baseline; blocked until prod users.
- **Unnamed mission outcomes** flagged for `tak-outcomes`: comms accuracy (Skip ambiguous letters), the status half of Imagery pre-caching, Grid configuration, and the legend (#8).










### Hand-off prompt (paste into a new context)

```
You are assisting Abel (PM, Rise8) on the SOCOM TAK AI GRG project, OTA gap period. Pipeline: tak-output-assumptions (9 finalized cards) -> tak-hypothesis (this file) -> experiments-framework.md (Experiment Card). One Lean UX hypothesis per card lives in TAK-ALL/r8-internal/Daily-TAK-notes/gap-period/tak-ai-grg-hypotheses-june.md.

Drafted and complete (except thresholds): #1, #2 Smart default labeling, #3 Automatic renumbering, #4 Swipe gesture, #5 Add marker, #6 Skip ambiguous letters, #7 Imagery pre-caching + status messaging, #9 Grid configuration via the radial menu.

NOT drafted: #8 Auto-generated legend, GATED. Do not draft until Abel confirms whether the auto-legend is the team's contribution or copied from an existing plugin (Yi said likely copied, gap-tak-june_8-12.md:329-330; verify step :285). If ours, the draftable slice is the version-on-export bet; persona is downstream (team leads / mission execution), possibly out of scope (:269). Once drafted, #8 slots between #7 and #9.

Sources: tak-output-assumptions.md (source cards), gap-tak-june_8-12.md (June 9 team review lines 210-286; Yi's June 11 Outcomes-in-Prod review lines 290-345), tak-oor.md (Model Improvements outcome, 44-46), tak-final-demo.md. Never outputs-outcomes-tak.md (stale).

Work one card at a time, one question at a time. Draft in chat, stop for Abel's reaction, THEN write to the file. Craft rules (Abel corrects these every time):
- Call each card by its name, never "#N", in conversation.
- Never the em dash. Say "manually," never "by hand." No invented/coined words; use the team's plain words.
- Pain must be solution-agnostic; don't smuggle the solution into the pain. Cite, don't infer; flag your inferences and anchor them to a source line.
- "resulting in" needs a human actor and must be tight, not word salad. Behavioral contrast carries the change. One behavior per hypothesis.
- Park metrics/cost/instrumentation as enabling outcomes, not behavioral KRs. A KR needs a human actor.
- Lead with the most impactful behavior (mission outcome); use the others as KRs.
- No intensifiers/qualifiers in the bet; magnitude belongs in the pain. Keep messages short; fewer words in front of Abel.
- All KRs/[X]/[N] thresholds are placeholders, blocked until prod users.


```


## Outcome Submission Form

A. PROBLEM - Describe the issue or gap identified
> *commanders manually cross-reference HR and Mission systems to verify crew qualifications, causing dispatch delays?*

B. OUTPUT - Select the type:
[New Feature, Feature Iteration, Bug Fix, Secured Vulnerability, Other]
DESCRIBE THE OUTPUT:
> *API integration of HR system data into mission dashboard*

C. MISSION OUTCOME - What bevahior changed?
> *Mission Commanders(human) validate qualifications in-system (behavior change), saving 25 mins per shift (measurement)."*
- [Human/System] + [behavior-change]+[measurement]
- How was this measured?
[Qualitative, Quantitative, Both]

D. MISSION IMPACT - What was the mission result?
> *10% faster mission dispatch times (measured changed) for improved fleet readiness (organization value)."*
- [measured-change] + [organization value(performance, cost OR time)]
- How was this measured?
[Qualitative, Quantitative, Both]

F. EVIDENCE - Explain the validation of measurements for behavior change and mission result
> *10-day audiot of 15/20 users (75%) via timestamps. logs confirm 100% accuracy and the total removel of manual portal login attempts across all shifts*
-focus on methodlogy and scale


---

GRG creators manually renumber buildings when the labeling order isn't the one they would use, slowing GRG creation.

Smart default labeling order, numbering buildings the way a human would and adapting to complex, irregular layouts.

GRG creators (human) accept the default labeling order instead of manually renumbering buildings (behavior change), renumbering fewer than [X]% of the buildings in a GRG during the experiment window (measurement, from KR-1, WIP).

How measured: Quantitative

Pre-prod: internal/SME validation on two AOIs (Ft. Magsaysay, 30 buildings; Razish, 68 buildings) via mocked algorithm output and async user-representative feedback; ~90% of labels accepted out of the box, 9-12% edited. In-field validation of the behavior change (C) and mission result (D) is pending prod access.


