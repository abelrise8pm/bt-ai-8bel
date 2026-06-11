# TAK AI GRG Hypotheses (June)

> Pipeline: `tak-output-assumptions (the 9 cards) -> tak-hypothesis (this file) -> experiments-framework.md (Experiment Card)`.
> Each hypothesis takes one finalized output-assumption card and shapes it into a testable Lean UX hypothesis (thin slice + persona + pain + behavior change + KRs).
> Source cards: `tak-output-assumptions.md`. Anchor outcome: Model Improvements (`tak-oor.md:44-46`).
> Bracketed [X]/[N] thresholds are unset: no prod baseline yet, blocked until we have access to users in prod.

---

## 1. AI building detection, sliding-window method (Bridge)

> Source card: `tak-output-assumptions.md` card #1. Behavior bet is Thread B (run AI first instead of manual labeling); Thread A (single-run reliance) is kept as a KR.

**We believe** the sliding-window AI building detection

**For** GRG creators (operators)

**will address** the slow and manual process of placing many markers over a map image to label buildings

**resulting in** operators running AI building detection first, instead of manually labeling them

**We will know we are successful when**

Lagging Indicator (Thread A):
- **KR-1:** GRG creators complete a GRG from a single AI detection run over the AOI, without re-running detection to check it, in [X] of GRGs created during the experiment window.

Leading Indicator:
- **KR-2:** GRG creators start the GRG by running AI detection before placing any markers manually, in [X] of GRGs created in the first [N] days.

**Open:** [X] thresholds (no baseline); whether KR-2 is the right leading signal.

---

## 2. Smart default labeling (Competition)

> Source card: `tak-output-assumptions.md` card #2. Drafted on the smart default bet only (the card's riskiest nomination); scheme-picking set aside per Abel.

**We believe** the smart default labeling order

**For** GRG creators (operators)

**will address** the slow and manual work of renumbering buildings when the labeling order isn't the one the operator would use

**resulting in** operators accepting the default labeling order, instead of manually renumbering the buildings

**We will know we are successful when**

Lagging Indicator:
- **KR-1:** GRG creators leave the default labeling order unchanged, without manually renumbering, in [X] of GRGs created during the experiment window.

Leading Indicator:
- **KR-2:** GRG creators manually renumber fewer than [X] of the buildings in a GRG, in the first [N] days.

**Open:** ⚠️ Abel to revisit and think hard about the metrics: what are we actually measuring, speed? reduction in manual renumbering? something else? KRs above are placeholders pending that call.

---

## 3. Automatic renumbering (Competition)

> Source card: `tak-output-assumptions.md` card #3. Behavior bet is edit-in-place vs starting the numbering over. Distinct from #2: #2 is accepting the default order (no renumber at all); #3 is what happens once an edit IS made.

**We believe** automatic renumbering

**For** GRG creators (operators)

**will address** the slow and manual work of re-sequencing every affected marker by hand when a change is made to the numbering

**resulting in** operators editing or re-sequencing markers in place, instead of starting the numbering over

**We will know we are successful when**

Lagging Indicator:
- **KR-1:** GRG creators make a numbering change and let the sequence update in place, without restarting the numbering from scratch, in [X] of edited GRGs during the experiment window.

Leading Indicator:
- **KR-2:** GRG creators complete a marker edit without starting the numbering over, in the first [N] days.

**Open:** ⚠️ Same metrics caveat as #2: Abel to revisit what we are actually measuring (speed? reduction?). KRs are placeholders pending that call.

---

## 4. Swipe gesture to resequence (Competition)

> Source card: `tak-output-assumptions.md` card #4. Team-invented, not user-requested, so the bet leans on adoption/discovery. Distinct from #3: #3 is auto-renumber on any edit; #4 is the deliberate gesture to reshape the whole sequence.

**We believe** the swipe gesture to resequence markers

**For** GRG creators (operators)

**will address** the slow and manual work of re-sequencing a long set of markers into a different order or shape one at a time

**resulting in** resequencing the marker order with a single swipe gesture, instead of one marker at a time

**We will know we are successful when**

Lagging Indicator:
- **KR-1:** GRG creators complete a full resequence of a GRG's markers in [X] less time than the manual one-at-a-time method, during the experiment window.

Leading Indicator (discovery):
- **KR-2:** GRG creators try the swipe gesture at least once, in [X] of GRGs created in the first [N] days.

**Open:** ⚠️ Revisit the KRs.

---

## 5. Add marker that adopts the section's prefix and numbering (Competition)

> Source card: `tak-output-assumptions.md` card #5. Reframed with Abel: the solution is the enhanced drawn section (it now carries its own prefix/numbering); the behavior is the added marker inheriting that label. The upstream "trust AI's first pass" bet was set aside as a duplicate of #1's Thread B.

**We believe** the drawn section that carries its own prefix and numbering

**For** GRG creators (operators)

**will address** the manual work of setting up a marker the AI missed to match the section's label

**resulting in** adding a missed marker that takes on the section's label, instead of setting it up manually

**We will know we are successful when**

Lagging Indicator:
- **KR-1:** GRG creators add the markers the AI missed without setting up the label manually, in [X] of added markers during the experiment window.

Leading Indicator:
- **KR-2:** GRG creators add a missed marker and keep the label it's given, in [X] of GRGs in the first [N] days.

**Open:** ⚠️ Abel to go back and check all three on this one: the **solution** ("We believe" framing around the enhanced section), the **outcome** ("resulting in" behavior change), and the **KRs**. This card took the most reshaping and the line between #5 and #3 (automatic renumbering) is thin, revisit whether they stay separate.

---







## Session Summary + Hand-off (through #5)

> This session drafted hypotheses #1 through #5 from the finalized output-assumption cards, and made small wording fixes to card #5 in `tak-output-assumptions.md`.

### What got done
- Drafted hypotheses **#1, #2, #3, #4, #5** into this file, one card each, in order.
- **#1 Sliding-window detection:** behavior bet is Thread B (run AI first instead of manually labeling); Thread A (single-run reliance) kept as KR-1.
- **#2 Smart default labeling:** drafted on the smart default bet only (the card's riskiest); scheme-picking set aside per Abel.
- **#3 Automatic renumbering:** behavior bet is edit-in-place vs starting the numbering over; kept distinct from #2.
- **#4 Swipe gesture:** adoption-first (team-invented, not user-requested); resulting-in is "single swipe gesture, instead of one marker at a time"; KR-1 is a time measure.
- **#5 Add marker (section's prefix/numbering):** took the most reshaping. Reframed the solution around the **enhanced drawn section** (it now carries its own prefix/numbering), with the behavior being the **added marker taking on that label**. Set aside the upstream "trust AI's first pass" bet as a duplicate of #1's Thread B. Also fixed wording in card #5 of `tak-output-assumptions.md` (removed coined terms "conforming"/"add path", cut "at all").

### Craft rules reinforced (carry forward, Abel corrects these every time)
- Say **"manually," never "by hand."** Don't pair "manual ... by hand."
- **No invented/coined words** (e.g. "add path", "conform"). Use the team's plain words: "adding a missed marker," "takes on the section's label."
- No intensifiers or subjective qualifiers (easily/quickly) in the bet; speed/magnitude belongs in the pain line.
- Don't re-reference the persona in "resulting in" (it's established in "For"); cut fluff and word-padding.
- Behavioral contrast carries the change (single swipe vs one at a time; run AI first vs manual labeling).
- One behavior per hypothesis; don't smuggle a second behavior into "resulting in."
- Abel tires of long messages: keep responses short, draft first, fewer words in front of him.

### Open / not done
- **#6, #7, #8, #9** not drafted. **Next up: #6 Skip ambiguous letters.** Note from its card: this one does **not** sit on the Model Improvements "less manual effort" theme; it's about clarity/accuracy of identifying a building over comms, and has **no named outcome yet** (flagged for `tak-outcomes`).
- **#5** flagged for Abel to recheck all three (solution, outcome, KRs); the #5/#3 line is thin, revisit whether they stay separate.
- ⚠️ **All KRs and [X]/[N] thresholds are placeholders.** No prod baseline; blocked until prod users. Abel to revisit metrics across the board: what are we measuring (speed? reduction? adoption?).
- Leftover nit: #3's "will address" still says "by hand"; sweep it to "manually" on the next pass.

### Hand-off prompt (paste into a new context)

```
You are assisting Abel (PM, Rise8) on the SOCOM TAK AI GRG project, OTA gap period. Pipeline: tak-output-assumptions (9 finalized cards) -> tak-hypothesis (this file) -> experiments-framework.md (Experiment Card). We draft one Lean UX hypothesis per card into TAK-ALL/r8-internal/Daily-TAK-notes/gap-period/tak-ai-grg-hypotheses-june.md.

Done: #1, #2, #3, #4, #5. Next: #6 Skip ambiguous letters, then #7, #8, #9.

Source cards: tak-output-assumptions.md. Anchor outcome: Model Improvements (tak-oor.md:44-46). Note: #6, #8, #9 and the status half of #7 have NO named outcome yet (flagged for tak-outcomes), so their mission linkage is open.

Work one card at a time, one question at a time. Draft in chat, stop for Abel's reaction, THEN write to the file. Craft rules (Abel corrects these every time):
- Say "manually," never "by hand."
- No invented/coined words (no "add path", no "conform"); use the team's plain words.
- No intensifiers or subjective qualifiers (easily/quickly) in the bet; magnitude belongs in the pain line.
- Don't re-reference the persona in "resulting in" (established in "For"). Cut fluff/word-padding.
- One behavior per hypothesis. Behavioral contrast carries the change.
- Never the em dash. Keep messages short; fewer words in front of Abel.
- All KRs/thresholds are placeholders pending Abel's metrics rethink (blocked until prod users).

Start by confirming with Abel whether to take #6 next.
```


