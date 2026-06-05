# TAK Output Assumptions

> Part 1 of the pipeline: `tak-output-assumptions -> experiments-framework.md (Experiment Card) -> hypothesis`.
> Each card takes one output and surfaces the unstated, unvalidated bet behind it as a testable assumption (David J Bland sticky format).
> Cards are listed in the order worked, each noting its bucket (Competition or Bridge).
>
> Tags: 🟧 = Claude's inference (react to it), not from source. Citations point to source files.

---

<!-- Cards added below as pairing completes. -->

## 🅿️ Parking Lot

### #2 Single AI SDK (Competition) — first pass, NOT finalized

> Status: paused mid-pairing. Two questions still open for the Balance Team. Not yet an approved card.

**Output:** A single "Building Detection SDK" performs inference and labeling with an ONNX YOLO model and feeds **both** the WinTAK plugin and the ATAK plugin. (`pre-sow-tak-competitions.md:399`, `:44-47`)

**Pain + who:** The engineering team (and downstream, the operator). 🟧 Without one shared SDK, the AI logic would be written twice across two unrelated frameworks (Android/Java vs .NET WPF), where the two copies drift and behave differently, and every security patch or model swap has to be done twice. Docs frame this as the benefit side ("train once, build once," patched once, deployed everywhere, `:40-41`; "same reliable experience regardless of the device," `:56`) rather than naming the pain directly.

**Assumptions** (🟧 Claude's inference from the pain context, react to them):
- `[Feasibility] We believe one ONNX-based SDK produces the same building detections and labels on both ATAK (Android) and WinTAK (.NET WPF), with no behavior drift between the two plugins.`
- `[Viability] We believe maintaining the AI logic in one shared SDK costs the team meaningfully less over time than embedding it separately in each plugin, because security patches and model swaps are done once and deployed to both.`

**For the Balance Team:**
- Is **behavior parity across the two plugins** the real bet here, or is the team actually betting on the **maintenance/patch-once payoff** as the reason the single SDK was worth it?
- Beyond consistency and maintenance, is there a **user-facing** bet worth naming, e.g. that operators notice and care that WinTAK and ATAK give the same result, or is that genuinely not something users feel?

**Riskiest** (nomination, not the final pick): the **Feasibility / behavior-parity** one. The whole "consistent experience" value rests on it, and we have no measurement that the two plugins actually agree. The Viability cost-savings bet is likely true but only observable over a long horizon.

**Open questions paused on:** Which framing is the real bet, and is there a user-facing assumption worth adding?

**Restart prompt (paste to resume):**
> Resume the parked first pass of the bet for **#2 Single AI SDK** in tak-output-assumptions.md. Re-read the parking-lot draft (Output, Pain+who, two Assumptions, Riskiest), then put the two open questions back to me: (1) is behavior parity across the two plugins the real bet, or the maintenance/patch-once payoff? (2) is there a user-facing assumption worth adding? Once I answer, finish the card (baseline check + to-test) and move it out of the parking lot.

---

### #3 Advanced labeling algorithm (Competition) — first pass, NOT finalized

> Status: paused mid-pairing. Two questions still open for the Balance Team. Not yet an approved card.

**Output:** Advanced labeling algorithm (`pre-sow-tak-competitions.md:159`).
*What it does:* numbers buildings the way a human would; naturally adapts to complex, irregular layouts.

**Pain + who:** GRG creators (operators). Labeling complex or irregular layouts takes human judgment, "roads, rivers, and natural or man-made gaps influence label order" and "circular or irregular patterns require judgment and 'artful' adjustment" (`:186-187`). 🟧 When the AI's order doesn't match what the operator expects, they re-sequence it by hand, which is the slow, frustrating part.

**Assumptions** (🟧 Claude's inference from the pain context, react to them):
- `[Desirability] We believe operators will accept the AI's default label order without re-sequencing it by hand, because the order matches how they would have numbered the buildings themselves.`
- `[Desirability] We believe the intuitive ordering holds up on the messy, varied layouts operators meet in the field, not only on the two AOIs it was validated against.`

**For the Balance Team:**
- Is "accepts the order without re-sequencing" the real behavior shift, or is the bigger one trust, that the operator believes the order is right and stops double-checking it?
- Beyond Ft. Magsaysay and Razish, which real layouts worry you most, the ones where you'd expect the intuitive order to break?

**Riskiest** (nomination, not the final pick): the first. It's the in-field acceptance behavior the whole "intuitive" claim rests on, and we have no in-field measure of it. The second has some evidence (two AOIs, SME endorsement) but only n=2.

**Outcome mapping (plain):** informs the Model Improvements target outcome (`tak-oor.md:46`, operators focus more on the environment as manual effort to configure/correct GRGs drops). That outcome is framed around detection improvements; this output works a different part of the same "fewer manual corrections" theme, the order of the labels rather than whether the buildings were found.

**Open questions paused on:** Is the acceptance/trust framing right, and which field layouts do you expect to break the order?

**Restart prompt (paste to resume):**
> Resume the parked first pass of the bet for **#3 Advanced labeling algorithm** in tak-output-assumptions.md. Re-read the parking-lot draft (Output + what it does, Pain+who, two Desirability Assumptions, Riskiest, outcome mapping), then put the two open questions back to me: (1) is "accepts the order without re-sequencing" the real behavior shift, or is it trust (operator stops double-checking)? (2) which real field layouts do you expect to break the intuitive order? Once I answer, finish the card (baseline check + to-test) and move it out of the parking lot.
