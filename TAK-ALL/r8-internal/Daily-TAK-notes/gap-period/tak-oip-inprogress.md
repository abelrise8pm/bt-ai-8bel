# TAK Outcomes-in-Prod (OIP) Submissions — In Progress

> DRAFT submissions for Rise8's Outcomes-in-Prod (OIP) site. One entry per output, following the OIP form fields (A Problem, B Output, C Mission Outcome, D Mission Impact, F Evidence).
> Source pipeline: hypotheses in `tak-ai-grg-hypotheses-june.md`, output cards in `tak-output-assumptions.md`, named outcomes in `tak-oor.md`.
> [X]/[N] and measured-change values are WIP placeholders: no prod baseline yet, blocked until we have access to users in prod.

---

## Conversation TLDR + Hand-off

> **TL;DR:** Abel is submitting DRAFT outcomes into Rise8's OIP (Outcomes-in-Prod) site, one entry per output, working top-down through the hypotheses in `tak-ai-grg-hypotheses-june.md`. We completed the first full entry (#2 Smart default labeling) as the worked example. #1 (AI building detection, sliding-window) was skipped and still needs doing. The OIP form fields are A Problem, B Output, C Mission Outcome, D Mission Impact, F Evidence (no E).

### Agreed drafting format (per field)

- **A. PROBLEM** — One tight line, not a short story. Shape it actor + behavior + consequence, matching the form's own example ("commanders manually cross-reference HR and Mission systems... causing dispatch delays"). State the pain solution-agnostic (the pre-AI-GRG manual world where relevant; don't smuggle the fix into the problem).
- **B. OUTPUT** — Pick a Type (New Feature / Feature Iteration / Bug Fix / Secured Vulnerability / Other), then one concise output line. Lead with the hypothesis's exact solution phrase; fill the "what it does" detail from the source doc.
- **C. MISSION OUTCOME** — `[Human] + [behavior change] + [measurement]`. Behavior comes from the hypothesis "resulting in" line. Measurement comes from the KRs. Anchored to **KR-1 (lagging, behavior held)** as the achieved-outcome read; KR-2 (leading, first [N] days) is held for the D-side leading signal. Add How measured (Quant / Qual / Both).
- **D. MISSION IMPACT** — `[measured-change] + [organization value (performance, cost, OR time)]`. Anchor the org-value half to the named Mission Impact in `tak-oor.md`. Measured-change is WIP until prod.
- **F. EVIDENCE** — Methodology + scale only. Name the pre-prod evidence we actually have and be explicit about what it does/doesn't validate; in-field validation waits on prod.

### Recognizability rule (the big one)

A reader must see the **same problem / output / behavior** whether they read the hypothesis or the OIP entry. For each field, cross-walk it side by side against the hypothesis wording and use the same words. The OIP entry reshapes the hypothesis into the form's fields; it does not reword the substance.

### Craft rules (Abel corrects these every time)

- **Cite, don't infer.** Pull from the primary source docs (`pre-sow-tak-competitions.md`, `tak-oor.md`), not the derived hypothesis paraphrase. Flag any inference with the orange square and anchor it to a source line.
- **Measurements come from the KRs**, not invented.
- **No workflow scaffolding in the artifact text.** Words like "part 2" are our process, not form content; keep them out of the submitted fields.
- **Concise, no short stories.** Match the form's concise example.
- **Never the em dash. Say "manually," never "by hand."** Use the team's plain words; no coined terms.

### Two-part collaboration

- **Part 1:** A, B, C grounded now; D and F drafted as WIP starting points.
- **Part 2:** use the experiment skill to set the proposed measurements / assumptions / plans in D and F ([X]/[N] thresholds, measured-change, prod methodology).

### How we work (pacing)

One card at a time, one field at a time, one question per turn. Draft in chat, stop for Abel's reaction, THEN write to the file. Keep responses short.

### Status

- **Done:** #2 Smart default labeling, #1 AI building detection (sliding-window), #3 Automatic renumbering, #4 Swipe gesture, #5 Add marker, #6 Skip ambiguous letters, #7 Imagery pre-caching + status messaging (all A, B, C grounded; D, F WIP). Open on #2: D anchor pick (`tak-oor.md:48` vs `:62`). On #1: C measurement leans KR-1 lagging phrasing (the behavior bet maps to KR-2). On #4: A wording to revisit ("a long set of markers"). On #5: A reads flat, sharpen the consequence. On #6: comms-accuracy outcome unnamed (flagged for `tak-outcomes`); D org-value not anchored to `tak-oor.md` like the others. On #7: status-half outcome unnamed (flagged for `tak-outcomes`); C uses the state-agnostic KR; 25% threshold unvalidated. All [X]/[N] placeholders unset pending prod.
- **To do:** #9 Grid configuration. #8 Auto-generated legend is gated (is it ours?).

### Session summary (end of day, 2026-06-14)

Drafted seven OIP entries this session, working down the hypotheses: #1 AI building detection, #2 Smart default labeling (prior worked example), #3 Automatic renumbering, #4 Swipe gesture, #5 Add marker, #6 Skip ambiguous letters, #7 Imagery pre-caching + status messaging. For each: A, B, C grounded against the hypothesis word-for-word; D and F drafted as WIP placeholders.

Patterns held across the set:
- **A. Problem** follows the OIP form example shape (actor + manually does X, causing consequence); solution-agnostic; words pulled from each hypothesis "will address" line.
- **B. Output** is bare: Type + the hypothesis "We believe" solution phrase, no added description.
- **C. Mission Outcome** = behavior from the "resulting in" line + measurement from a KR; [X]% left blank.
- **D. Mission Impact**: the manual-effort cards (#1, #3, #4, #5) share one org-value half, word-for-word from `tak-oor.md:48` (focus on the mission environment, performance). The off-theme cards (#6 comms accuracy, #7 status/silent-failure) do NOT share it; their outcomes are unnamed and flagged for `tak-outcomes`.
- **F. Evidence** is a WIP placeholder pointing at pre-prod competition evidence; explicit that in-field validation waits on prod.

Open items to carry:
- **Wording revisits:** #4 A ("a long set of markers" reads odd, fix in hypothesis too so they don't drift); #5 A reads flat, sharpen the consequence (why adding a marker is painful).
- **Unnamed outcomes** (flagged for `tak-outcomes`): #6 comms accuracy, #7 status half (knowing input imagery quality).
- **#1 C** leans the KR-1 lagging phrasing while the behavior bet maps to KR-2; revisit when measurements get set.
- **#2 D** anchor still unpicked (`tak-oor.md:48` vs `:62`).
- **All [X]/[N] and measured-change values unset**, blocked until prod access (Part 2, the experiment skill).

### Next session: review for submission

Goal: review all drafted entries against the live OIP site fields and confirm they are submit-ready, then close the gaps.
1. Open each entry side by side with the OIP site form; confirm A/B/C/D/F map cleanly to the site's fields and character limits.
2. Re-run the recognizability cross-walk (hypothesis vs entry) one more time per card.
3. Fix the parked wording on #4 A and #5 A.
4. Draft #9 Grid configuration (last draftable card); resolve the #8 Auto-generated legend gate with the team (ours vs copied) before drafting it.
5. Part 2: use the experiment skill to set the proposed measurements/assumptions for D and F ([X]/[N], measured-change, prod methodology).

### Hand-off prompt (paste into a new context)

```
You are assisting Abel (PM, Rise8) on the SOCOM TAK AI GRG project, OTA gap period. We are submitting DRAFT outcomes into Rise8's Outcomes-in-Prod (OIP) site, one entry per output, in TAK-ALL/r8-internal/Daily-TAK-notes/gap-period/tak-oip-inprogress.md. OIP form fields: A Problem, B Output, C Mission Outcome, D Mission Impact, F Evidence (no E).

Done (A, B, C grounded; D, F WIP): #1 AI building detection, #2 Smart default labeling, #3 Automatic renumbering, #4 Swipe gesture, #5 Add marker, #6 Skip ambiguous letters, #7 Imagery pre-caching + status messaging. To do: #9 Grid configuration. Gated: #8 Auto-generated legend (do not draft until the team confirms ours vs copied).

This session is a REVIEW pass for submission: open each entry against the live OIP site fields, confirm A/B/C/D/F map to the site's fields and limits, and re-run the hypothesis-vs-entry recognizability cross-walk. Then fix parked wording (#4 A "a long set of markers", #5 A reads flat) and draft #9.

Sources (cite, do not infer): hypotheses in tak-ai-grg-hypotheses-june.md, output cards in tak-output-assumptions.md, named outcomes/impact in tak-oor.md (Model Improvements 44-48), competition evidence in pre-sow-tak-competitions.md, status states in tak-final-demo.md. Never outputs-outcomes-tak.md (stale).

How we work: one card at a time, one field at a time, one question per turn. Draft in chat, stop for Abel's reaction, THEN write to the file. Recognizability rule: a reader must see the same problem/output/behavior whether they read the hypothesis or the OIP entry; use the same words. Craft rules Abel corrects every time: never the em dash; say "manually," never "by hand"; no coined/hybrid terms; pain solution-agnostic; cite, don't infer; concise, no short stories; no workflow scaffolding in the artifact text. Measurements come from the KRs and stay blank ([X]/[N]) until prod.
```

---

## #1 AI building detection (sliding-window)

**A. PROBLEM**
> GRG creators manually place many markers over a map image to label buildings, an effort that grows with the building count, slowing GRG creation.

**B. OUTPUT**
> Type: New Feature
> Output: Sliding-window AI building detection.

**C. MISSION OUTCOME**
> GRG creators run AI building detection first, instead of labeling buildings manually, on [X]% of GRGs during the experiment window (measurement, WIP).
> How measured: Quantitative

**D. MISSION IMPACT** (WIP)
> Operators spend [X]% less time and effort labeling buildings manually (measured change, WIP), so they keep a more consistent focus on the mission environment during the planning and execution windows (organization value: performance).
> How measured: WIP

**F. EVIDENCE** (WIP)
> Pre-prod (WIP): point to the competition benchmarking of AI building detection (recall improvement, labeling-time reduction shown in demos) as the methodology and scale we have so far. In-field validation of the behavior change (C) and mission result (D) waits on prod access.

**Source anchors:**
- Problem: hypothesis `tak-ai-grg-hypotheses-june.md:19`; `pre-sow-tak-competitions.md:107` (effort grows with building count)
- Output: hypothesis `tak-ai-grg-hypotheses-june.md:15`; `pre-sow-tak-competitions.md:34-35`
- Mission outcome (behavior): hypothesis `tak-ai-grg-hypotheses-june.md:21`, KRs `:26`, `:29`
- Mission impact: `tak-oor.md:44-48`
- Evidence: `pre-sow-tak-competitions.md:84`, `:226`, `:167-172`

---

## #2 Smart default labeling

**A. PROBLEM**
> GRG creators manually renumber buildings when the labeling order isn't the one they would use, slowing GRG creation.

**B. OUTPUT**
> Type: New Feature
> Output: Smart default labeling order, numbering buildings the way a human would and adapting to complex, irregular layouts.

**C. MISSION OUTCOME**
> GRG creators (human) accept the default labeling order instead of manually renumbering buildings (behavior change), renumbering fewer than [X]% of the buildings in a GRG during the experiment window (measurement, from KR-1, WIP).
> How measured: Quantitative

**D. MISSION IMPACT** (WIP)
> Operators spend [X]% less time and effort correcting GRG labeling (measured change, WIP), so they maintain more consistent focus on the mission environment during the planning and execution windows (organization value: performance / readiness).
> How measured: WIP

**F. EVIDENCE** (WIP)
> Pre-prod: internal/SME validation on two AOIs (Ft. Magsaysay, 30 buildings; Razish, 68 buildings) via mocked algorithm output and async user-representative feedback; ~90% of labels accepted out of the box, 9-12% edited. In-field validation of the behavior change (C) and mission result (D) is pending prod access.

**Open / to settle:**
- D anchor not picked: `tak-oor.md:48` (focus on surroundings, used above) vs `tak-oor.md:62` ("more complete GRGs, even when time is short").
- C measurement anchored to KR-1 (lagging); KR-2 (leading, first [N] days) held for the D-side leading signal.
- All [X]/[N] and measured-change values unset, pending prod access.

**Source anchors:**
- Problem / output: `pre-sow-tak-competitions.md:159`, `:174-190`
- Hypothesis (behavior): `tak-ai-grg-hypotheses-june.md:45`, `:51`, KRs `:56`, `:59`
- Mission impact: `tak-oor.md:44-48`
- Evidence: `pre-sow-tak-competitions.md:167-172`, `:192-202`

---

## #3 Automatic renumbering

**A. PROBLEM**
> When a GRG creator changes a marker, they manually re-sequence every affected marker, across the 10s or 100s of buildings in a GRG, slowing GRG creation.

**B. OUTPUT**
> Type: New Feature
> Output: Automatic renumbering.

**C. MISSION OUTCOME**
> GRG creators make a change and keep building the GRG, instead of stopping to renumber the affected markers manually, on [X]% of edited GRGs during the experiment window (measurement, WIP).
> How measured: Quantitative

**D. MISSION IMPACT** (WIP)
> Operators spend [X]% less time and effort renumbering markers manually after an edit (measured change, WIP), so they keep a more consistent focus on the mission environment during the planning and execution windows (organization value: performance).
> How measured: WIP

**F. EVIDENCE** (WIP)
> Pre-prod (WIP): point to the competition demo of automatic renumbering as the methodology and scale we have so far (confirm what specific renumbering evidence we captured). In-field validation of the behavior change (C) and mission result (D) waits on prod access.

**Source anchors:**
- Problem: hypothesis `tak-ai-grg-hypotheses-june.md:77`
- Output: hypothesis `tak-ai-grg-hypotheses-june.md:73`
- Mission outcome (behavior): hypothesis `tak-ai-grg-hypotheses-june.md:79`, KR-1 `:84`
- Mission impact: `tak-oor.md:44-48`

---

## #4 Swipe gesture to resequence

**A. PROBLEM** (wording to revisit)
> GRG creators manually re-sequence a long set of markers into a different order or shape, one at a time, slowing GRG creation.

**B. OUTPUT**
> Type: New Feature
> Output: Swipe gesture to resequence markers.

**C. MISSION OUTCOME**
> GRG creators reshape the whole marker sequence with one swipe, instead of one marker at a time, on [X]% of resequenced GRGs during the experiment window (measurement, WIP).
> How measured: Quantitative

**D. MISSION IMPACT** (WIP)
> Operators spend [X]% less time and effort resequencing markers manually (measured change, WIP), so they keep a more consistent focus on the mission environment during the planning and execution windows (organization value: performance).
> How measured: WIP

**F. EVIDENCE** (WIP)
> Pre-prod (WIP): the swipe gesture is team-invented, not user-requested, so pre-prod evidence is limited; point to any competition demo of resequencing as the methodology and scale we have so far (confirm what swipe evidence we captured). In-field validation of the behavior change (C) and mission result (D) waits on prod access.

**Source anchors:**
- Problem: hypothesis `tak-ai-grg-hypotheses-june.md:105`
- Output: hypothesis `tak-ai-grg-hypotheses-june.md:101`
- Mission outcome (behavior): hypothesis `tak-ai-grg-hypotheses-june.md:107`, KR-1 `:112`
- Mission impact: `tak-oor.md:44-48`

---

## #5 Add marker (section's prefix/numbering)

**A. PROBLEM** (wording to revisit: reads flat, doesn't convey why adding markers is painful; sharpen the consequence)
> GRG creators manually label an added marker to keep its labeling consistent with the buildings around it, slowing GRG creation.

**B. OUTPUT**
> Type: New Feature
> Output: Drawn section that assigns its prefix and numbering to the markers inside it.

**C. MISSION OUTCOME**
> GRG creators add a marker and let it take the section's label, instead of labeling it manually, on [X]% of added markers during the experiment window (measurement, WIP).
> How measured: Quantitative

**D. MISSION IMPACT** (WIP)
> Operators spend [X]% less time and effort labeling added markers manually (measured change, WIP), so they keep a more consistent focus on the mission environment during the planning and execution windows (organization value: performance).
> How measured: WIP

**F. EVIDENCE** (WIP)
> Pre-prod (WIP): point to the competition demo where drawn sections assigned prefixes/numbering to the markers inside them (Yi confirmed the section auto-assigns, `tak-ai-grg-hypotheses-june.md:129`) as the methodology and scale we have so far. In-field validation of the behavior change (C) and mission result (D) waits on prod access.

**Source anchors:**
- Problem: hypothesis `tak-ai-grg-hypotheses-june.md:135` (solution-agnostic per `:128`)
- Output: hypothesis `tak-ai-grg-hypotheses-june.md:131`
- Mission outcome (behavior): hypothesis `tak-ai-grg-hypotheses-june.md:137`, KR-1 `:142`
- Mission impact: `tak-oor.md:44-48`

---

## #6 Skip ambiguous letters

**A. PROBLEM**
> When operators call out a building ID over comms, ambiguous characters (like I/1, O/0, 8/B) can be misread, risking a misread of the building's location.

**B. OUTPUT**
> Type: New Feature
> Output: Filter that skips ambiguous letters when labeling buildings.

**C. MISSION OUTCOME**
> Operators call out building IDs over comms without having to decipher or second-guess them, with no misread or request to repeat or clarify on [X]% of callouts during the experiment window (measurement, WIP).
> How measured: Quantitative

**D. MISSION IMPACT** (WIP, info not available yet)
> Operators make [X]% fewer comms misreads or requests to repeat or clarify a building ID (measured change, WIP), so building locations are communicated accurately during mission execution (organization value: performance; comms accuracy is not yet a named outcome, flagged for `tak-outcomes`). All values WIP, we do not have this info yet.
> How measured: WIP

**F. EVIDENCE** (WIP)
> Pre-prod (WIP): evidence is limited. Yi noted operators already manually avoid ambiguous letters, so the filter matches an existing human behavior (`tak-ai-grg-hypotheses-june.md:156`). No pre-prod comms-accuracy measurement captured. In-field validation of the behavior change (C) and mission result (D) waits on prod access.

**Source anchors:**
- Problem: hypothesis `tak-ai-grg-hypotheses-june.md:162`
- Output: hypothesis `tak-ai-grg-hypotheses-june.md:158`
- Mission outcome (behavior): hypothesis `tak-ai-grg-hypotheses-june.md:164`, KR-1 `:169`
- Mission impact: unnamed outcome (comms accuracy), flagged for `tak-outcomes` (`:174`)

---

## #7 Imagery pre-caching + status messaging

**A. PROBLEM**
> When operators are connected to a server, they run building detection on imagery that came in incomplete, with no indication or awareness that it did, a silent failure.
>
> *Scope: this applies to the connected-to-a-server case, where background pre-caching runs. It is not about the DDIL / disconnected case.*

**B. OUTPUT**
> Type: New Feature
> Output: Background imagery pre-caching with status notifications (full success, partial, or fetch failure).

**C. MISSION OUTCOME**
> Operators re-fetch imagery the status flags as incomplete, instead of running detection on it, on [X]% of flagged cases during the experiment window (measurement, WIP).
> How measured: Quantitative
> (Measurement uses the state-agnostic KR `:202`; status-specific KRs `:196`/`:199` are the alternative.)

**D. MISSION IMPACT** (WIP, info not available yet)
> Operators run detection on [X]% fewer incomplete-imagery cases (measured change, WIP), so GRGs are built on reliable imagery instead of silently-incomplete imagery during mission planning (organization value: performance; the status-half outcome, knowing input imagery quality, is not yet a named outcome, flagged for `tak-outcomes`). All values WIP, we do not have this info yet.
> How measured: WIP

**F. EVIDENCE** (WIP)
> Pre-prod (WIP): the status states are documented (full success / partial / "Tile Capture Failed" over 25% missing, `tak-final-demo.md:35`, `:53-54`), but the 25% failure threshold was set by Zach and is unvalidated (`tak-final-demo.md:185`). No pre-prod measurement of the re-fetch behavior captured. In-field validation of the behavior change (C) and mission result (D) waits on prod access.

**Source anchors:**
- Problem: hypothesis `tak-ai-grg-hypotheses-june.md:189`, persona `:187`, DDIL scope set aside `:182`
- Output: hypothesis `tak-ai-grg-hypotheses-june.md:185`
- Mission outcome (behavior): hypothesis `tak-ai-grg-hypotheses-june.md:191`, state-agnostic KR `:202` (status-specific `:196`/`:199`)
- Mission impact: unnamed status-half outcome, flagged for `tak-outcomes` (`:208`)

---
