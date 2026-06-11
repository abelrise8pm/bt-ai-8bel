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

### KMZ interoperability (Competition / export) — parked, "is it ours?" open

> Status: parked before first pass. Can't surface a bet until the team confirms whether KMZ export is the team's contribution or a pre-existing native TAK / legacy capability. Not yet a worked card.

**Output:** Finalized GRGs are exportable as KMZ files, supporting data sharing and interoperability with other mission planning software (`pre-sow-tak-competitions.md:393`, Gemini summary; `tak-all-outputs.md:102`, `:179`).

**Why parked:** the legacy tooling could already export KMZ/PDF/PNG before our plugin (`tak-vsm-first_pass.md:279`), so it's open whether KMZ export is ours or native TAK (`tak-all-outputs.md:105`). If it's native, there's no team-output bet to surface here, and the "legacy features excluded from outcomes" decision would drop it (`gap-tak-june_8-12.md:278`). The editable-KMZ-vs-"glorified image" idea is a possible future outcome, not a shipped output (`tak-all-outputs.md:105`, `tak-vsm-first_pass.md:280`, `:337-339`).

**Open question for the team:** is KMZ export the team's contribution, or a pre-existing native TAK / legacy GRG Builder capability?

**Restart prompt (paste to resume):**
> Resume **KMZ interoperability** in tak-output-assumptions.md once the team confirms whether KMZ export is ours or native TAK. If ours, run the normal flow (starting-point check → assumption → react → baseline → card). If native/legacy, drop it per the "legacy features excluded from outcomes" decision (`gap-tak-june_8-12.md:278`).

===

## Finalized Cards

### 1. AI building detection, sliding-window method (Bridge)

**Output:** AI building detection with the sliding-window method, giving consistent detection across zoom levels and stable results across repeated runs (`tak-final-demo.md:34`, `:43-44`). Team-confirmed the sliding-window approach shipped, with zoom locked to 19 for reliable repeat runs (`gap-tak-june_8-12.md:238`).
*What it does:* the detection returns the same building result every time, whether run on a single drawn section or the whole grid, instead of varying run to run or by zoom level.

**Pain + who:** GRG creators (operators). Before AI building detection existed, the operator had to find and place a marker on every building in the area manually. On areas running to dozens or hundreds of buildings, that manual identification and placement was the slow, effortful work that consumed the planning window and could force submitting an incomplete GRG rather than miss the mission window (`tak-oor.md:42`). AI detection automated that work; the sliding-window method is what makes the automated detection reliable enough to depend on instead of placing markers manually.
> ⚠️ UPDATED (Jun 9, per Abel): replaced an earlier inferred pain (operators re-running detection / hand-verifying because results varied run-to-run). Abel flagged that as not true. The problem anchored here is now the pre-AI manual marker placement.

**Assumption** (🟧 Claude's inference from the pain context, react to it):
`[Desirability] We believe operators will use the AI generated building detections for a GRG without the need to re-run it multiple times over an AOI, because they come to trust the results are consistent enough to rely on after a single run.`

**For the Balance Team:**
- Before AI/CV-assisted building detection, how did operators make sure the buildings over the AOI were all captured? Did that mean manually verifying each one, or resorting to building multiple GRGs to cover the area? (We're assuming one of those, which was it?)
- With AI detection today, do operators actually re-run it multiple times over an AOI because the results vary run to run, or is that not really a behavior we'd see?
- Beyond trusting a single run, what other behavior did this consistency unlock that we should turn into its own assumption?

**Riskiest:** single assumption, no nomination needed.

**Outcome mapping (plain):** informs the Model Improvements mission outcome (`tak-oor.md:44-46`), which names "sliding window detection" as its output and bets operators focus more on the environment as manual GRG effort drops. It differs from the other detection outputs on that same outcome: the model upgrade and the 124% figure are about finding more buildings, while this one is about getting a consistent-enough result that the operator stops double-checking.

**Baseline:** partial. 124% improvement in building detection accuracy over repeated runs, with 5.5 holding steady at 66 buildings across five emulator runs in a fixed zoom range (`tak-daily-april_20-24.md:520`, `:529`); side-by-side validation tied to consistent results regardless of zoom (`db-wk5.md:46`). This measures the detection's stability, not the operator behavior the assumption bets on. No in-field behavior measure.

**To test it:** operators creating GRGs in prod. Blocked until we have access to users in prod.

---

### 2. Smart default labeling + selectable schemes (Competition)

**Output:** Smart default labeling plus selectable schemes, the operator-facing side of the advanced labeling algorithm (`pre-sow-tak-competitions.md:159`, `:320`; `gap-tak-june_8-12.md:244`, `:250`). One bet covers both, decided with Abel: smart default is the everyday case, selectable schemes are the override. (Skip-ambiguous-letters is a separate output, saved for later.)
*What it does:* numbers buildings the way a human would. The smart default produces an order that reflects established operator patterns out of the box (`:250`); when the operator's real-world approach differs (top-down, left-right, reading order, and zone/spiral/approach-direction styles), they pick a scheme that matches instead of renumbering manually (`:244`, `:320`).

**Pain + who:** GRG creators (operators). Labeling buildings is not a fixed sequence, "roads, rivers, and natural or man-made gaps influence label order," and "circular or irregular patterns require judgment and 'artful' adjustment" (`pre-sow-tak-competitions.md:186-187`). 🟧 When the label order does not match how the operator would have done it, they renumber manually, which is slow and grows with building count.

**Assumptions** (🟧 Claude's inference from the pain context, react to them):
- `[Desirability] We believe operators will accept the smart default labeling order without renumbering buildings manually, because it reflects the labeling schemes they personally use.`
- `[Desirability] We believe that when the default labeling order isn't what they want, operators will pick a labeling scheme that matches their preference instead of renumbering manually, because the plugin is intended to give them final authority.`

**For the Balance Team:**
- Do the offered schemes actually cover the real approaches operators use, or are there common ones missing?
- Beyond the order itself, what else about labeling the real-world way did this touch that we should turn into its own bet?

**Riskiest** (nomination, not the final pick): the **smart default** bet. It's the everyday path the whole "smart" claim rests on, and the only evidence we have (90% out-of-box acceptability, 9-12% edits) speaks to it, though only on two AOIs and internally. The scheme-picking bet has no evidence at all, but it only comes into play when the default misses, so the default is the first to validate.

**Outcome mapping (plain):** informs the same Model Improvements mission outcome as the detection bets (`tak-oor.md:44-46`), the "less manual GRG effort" theme. It differs in what it changes: detection is about whether the buildings get found; this is about whether the order they are numbered in is the one the operator wanted, so they do not reorder it manually.

**Baseline:** split by bet. For the **smart default**: partial. ~90% out-of-box acceptability with only 9-12% of labels needing edits, validated on two AOIs (Ft. Magsaysay, 30 buildings; Razish, 68); SME Hayes called the default "acceptable and valuable" as-is (`pre-sow-tak-competitions.md:192-202`, `:197`). Internal/SME testing on two areas, no in-field operator measure. For the **scheme-picking** bet: none. No measure of whether operators pick a matching scheme or whether the offered schemes cover their real approaches.

**To test it:** operators creating GRGs in prod. Blocked until we have access to users in prod.

---

### 3. Automatic renumbering (Competition)

**Output:** Automatic renumbering (`pre-sow-tak-competitions.md:386`).
*What it does:* "The plugin automatically renumbers and updates marker sequences when changes are made" (`:386`). Jonathan added context that it maintains contiguous sequences within a section after edits (`gap-tak-june_8-12.md:253`). ⚠️ That added phrasing is from the Gemini summary; the core description is confirmed, the extra context can be folded in once the team confirms the wording.

**Pain + who:** GRG creators (operators). Before AI, renumbering was manual. When a mistake was made, or the operator wanted a different sequence or scheme after numbering had already started, every affected marker had to be re-sequenced manually. There was a lot of user feedback on how painful this was: across an extensive set of markers, into the 10s and 100s, losing the sequence of the numbering scheme meant re-doing the whole thing (`gap-tak-june_8-12.md:254`). 🟧 The cost of fixing the sequence manually was high enough that starting the numbering over from scratch was often the lesser evil **(Abel's words, pending team confirm).**

**Assumption** (🟧 Claude's inference from the pain context, react to it):
`[Desirability] We believe operators will edit or re-sequence markers in place instead of starting the numbering over, even across an extensive set of markers, because automatic renumbering keeps the sequence contiguous for them, removing the manual re-sequencing burden.`

**For the Balance Team:**
- Is "edits in place instead of starting over" the real behavior shift (Abel leans yes over "avoiding edits," since they wouldn't knowingly take an inaccurate GRG to a mission), or is it simpler, e.g. they just finish correcting a GRG faster?
- Was starting the numbering over from scratch really the fallback when re-sequencing manually got too costly, or did operators handle it some other way?
- Beyond re-sequencing after an edit, what else about renumbering did this touch that we should turn into its own bet?

**Riskiest:** single assumption, no nomination needed.

**Baseline:** none tied to renumbering itself. The 9-12% edit figure (`pre-sow-tak-competitions.md:200-202`) is about how often labels need correcting, not the re-sequencing burden after an edit. No in-field behavior measure.

**To test it:** operators creating GRGs in prod. Blocked until we have access to users in prod.

---

### 4. Swipe gesture to resequence (Competition)

**Output:** Swipe gesture to resequence (`pre-sow-tak-competitions.md:387`).
*What it does:* "Renumbering can be adjusted through a quick swiping gesture, allowing the user to optimize the marker sequence for mission flow" (`:387`). The operator places a finger on the map and drags in a shape (e.g. "S", spiral, circle in or out) to relabel buildings, eliminating the manual burden of re-labeling up to 100 markers when a change is made (`gap-tak-june_8-12.md:256-257`). ⚠️ The transcript line is Gemini-summarized; the finger-drag/shape detail is Abel's own description.
> Open: whether this belongs with labeling, with review-and-correction, or both (`gap-tak-june_8-12.md:257`). Abel and the team's to settle. This was team-invented, not user-requested, so the bet leans on adoption rather than feasibility.

**Pain + who:** GRG creators (operators). Re-sequencing a long set of markers into a different order/shape manually is slow and grows with building count, into the 10s and 100s (`gap-tak-june_8-12.md:254`, `:256`). 🟧 No user asked for this gesture; the team built it as a technical solution to that re-sequencing effort.

**Assumption** (🟧 Claude's inference from the pain context, react to it):
`[Desirability] We believe operators will reach for the swipe gesture to reshape a marker sequence into the order they want, rather than ignore it or fall back to editing markers one at a time, because dragging the sequence is faster than the alternatives.`

**For the Balance Team:**
- Since this was team-invented and not requested, is "they adopt the swipe over the other ways to re-sequence" the real bet, or is it more basic, e.g. whether operators even discover the gesture exists?
- Beyond reshaping the sequence, what else about the swipe did this touch that we should turn into its own bet?

**Riskiest:** single assumption, no nomination needed.

**Baseline:** none. Brand-new, team-invented capability, no measure of whether operators adopt it, and no data on the discovery question. No in-field behavior measure.

**To test it:** operators creating GRGs in prod. Blocked until we have access to users in prod.

---

### 5. Add marker that adopts the section's prefix and numbering (Competition)

**Output:** Add marker that adopts the section's prefix and numbering (`gap-tak-june_8-12.md:253`, `pre-sow-tak-competitions.md:385`).
*What it does:* when the operator adds a marker the AI missed, the marker takes the section's own prefix and continues its numbering sequence, instead of dropping in a stray label. A section carries its own convention: a prefix, name, color, and numbering (`pre-sow-tak-competitions.md:359`, `:391`) plus the chosen scheme (row, grid, etc., `:320`). Native ATAK tools do not do this; the operator would set the prefix and number manually (`gap-tak-june_8-12.md:253`). ⚠️ The convention detail and the operator final-authority line (`pre-sow-tak-competitions.md:385`) are Gemini-summarized.
> Context: this lives in Review-and-correction (`gap-tak-june_8-12.md:253`), but it leans on the Section concept (`:268`) having already given the drawn shape a labeling convention to conform to.

**Pain + who:** GRG creators (operators). AI detection can miss a building, and "missing a building is missing a marker" is ranked Critical (`pre-sow-tak-competitions.md:297`). 🟧 With native tools the operator adds that marker manually and then fits it into the section's prefix and numbering themselves; this feature does that fitting for them.

**Assumption** (🟧 Claude's inference from the pain context, react to it):
`[Desirability] We believe operators will add markers that AI detection missed and accept the drawn section's prefix and next sequenced number, assigned automatically, instead of setting them manually, because the markers already match the section's convention, with nothing to fix.`

**For the Balance Team:**
- Is "adds the missed marker and accepts the prefix and number it's assigned" the real behavior shift, or is the bigger one upstream, e.g. they are willing to let the AI take the first pass, because they trust they can cleanly add whatever it misses?
- Beyond adding a missed marker, what else about a marker taking on the section's prefix and numbering did this touch that we should turn into its own bet?

**Riskiest:** single assumption, no nomination needed.

**Baseline:** none tied to adding a missed marker. No measure of how often operators add missed markers or whether the auto-convention holds. No in-field behavior measure.

**To test it:** operators creating GRGs in prod. Blocked until we have access to users in prod.


---

### 6. Skip ambiguous letters (Competition)

**Output:** Skip ambiguous letters (`pre-sow-tak-competitions.md:380`, `gap-tak-june_8-12.md:244`).
*What it does:* a default setting (on by default, toggleable) that keeps the labeling from using letters easily confused with numbers, e.g. 'B'/'8', 'I'/'1', so the convention can be aligned to a unit's mission SOP (`pre-sow-tak-competitions.md:380`; `gap-tak-june_8-12.md:244`). It is a literal on/off toggle. ⚠️ The Jun 9 line is Gemini-summarized.

**Pain + who:** GRG creators (operators) and their teammates over comms. The labeling requirement is "unique, clear letter and number combinations ensure clarity over radio or digital comms" and "quick visual and verbal identification of buildings" (`pre-sow-tak-competitions.md:182-183`). 🟧 An ambiguous label (B read as 8, I as 1) risks an operator calling out or hearing the wrong building over comms during a mission.

**Assumption** (🟧 Claude's inference from the pain context, react to it):
`[Desirability] We believe operators and their teammates will correctly identify and call out a building over comms without mixing it up, because the labels skip ambiguous letters (B/8, I/1).`

**For the Balance Team:**
- Is "fewer misidentifications over comms" the real value, or is it more that the labeling matches the unit's existing SOP so they trust and adopt the GRG at all?
- Beyond the comms read-out, what else about avoiding ambiguous labels did this touch that we should turn into its own bet?

**Riskiest:** single assumption, no nomination needed.

**Outcome mapping (plain):** this one does not sit on the Model Improvements "less manual effort" theme like the other cards. It is about clarity and accuracy of identifying and communicating a building, not about reducing manual corrections. There is no named outcome in `tak-oor.md` for comms clarity. Flagged for `tak-outcomes` to name later (Abel agrees), not invented here.

**Baseline:** none. No measure of comms misidentification with or without the toggle. No in-field behavior measure.

**To test it:** operators creating GRGs in prod. Blocked until we have access to users in prod.

---

### 7. Imagery pre-caching + operator status messaging (Bridge)

**Output:** Imagery pre-caching plus operator status messaging (`tak-final-demo.md:35`, `:52-54`; `tak-all-outputs.md:28`, `:42-43`).
*What it does:* the plugin pre-caches imagery before a detection run and surfaces a status notification on the result, full success, partial completion, or fetch failure, with a "Tile Capture Failed" popup when capture fails. The operator sees the imagery state up front (`tak-final-demo.md:35`). ⚠️ Connected-only: pre-caching and the status messaging depend on connecting to a server to fetch imagery, so they have no role when the plugin operates disconnected (DDIL), which the plugin is otherwise built to support (per Abel). ⚠️ Whether 256x256 tiling is still a necessary part of this is being verified by the team (`gap-tak-june_8-12.md:261`, `:331`).

**Pain + who:** GRG creators (operators). Detection used to run on incomplete or backup imagery with no signal to the operator: it could trigger before the map finished loading, and it ran on backup imagery when tile capture failed (both since fixed, `tak-final-demo.md` detection-timing fix #4 and backup-imagery fix #6). 🟧 Without a status signal, the operator ran detection on whatever imagery had loaded from the server without knowing it was incomplete, so a run on low-quality imagery looked the same as a run on a clean one, a silent failure.

**Assumption** (🟧 Claude's inference from the pain context, react to it):
`[Desirability] We believe operators will use the imagery status the plugin shows, whether the imagery loaded fully, partially, or failed, to know the quality of the imagery their detection runs against, instead of being unaware that low-quality image data is being used, avoiding silent failures, because the plugin surfaces that imagery quality up front.`
> The bet is about knowing the quality of the imagery going in (catching silent failures), not trust in the model's output (per Abel/Zach, Jun 10). Scope: this applies only when connected to a server to fetch imagery; in disconnected (DDIL) ops the operator runs on already-cached or local imagery and this status feedback does not apply.

**For the Balance Team:**
- Is avoiding silent failures (running on low-quality imagery unaware) the real value, or is there a more concrete behavior we should name?
- How often are operators actually connected and fetching imagery vs working disconnected (DDIL) when building GRGs? The bet only bites in the connected case, so this scopes how much the feature matters.

**Riskiest:** single assumption, no nomination needed.

**Outcome mapping (plain):** the Model Improvements outcome names "tile caching" as part of its output (`tak-oor.md:44`), so the pre-caching half sits there. But the status-messaging bet works a different lever than that outcome's "less manual correction effort" theme: it is about operators knowing the quality of the imagery going into detection and catching silent failures, not the number of corrections. No named outcome covers awareness of input imagery quality; flagged for `tak-outcomes` to name later, not invented here. (The demo doc itself files pre-caching/imagery feedback under a separate header from detection/model improvements, `tak-all-outputs.md:29`.)

**Baseline:** partial, feature-level only. The team confirms messaging is accurate across all three states (full success, partial, fetch failure), with a "Tile Capture Failed" popup on capture failure (`tak-final-demo.md:35`, `:53-54`). That measures the signal is correct, not that operators use it to know the input imagery quality. No in-field behavior measure.

**To test it:** operators creating GRGs in prod while connected and fetching imagery (the feature is inert in DDIL). Blocked until we have access to users in prod.

---

### 8. Auto-generated legend (Competition / export)

**Output:** Auto-generated legend on the exported GRG (`pre-sow-tak-competitions.md:392`; `tak-all-outputs.md:103`, `:178`).
*What it does:* the plugin generates a legend on the finished product with critical product details, operation title, location (MGRS), and version (`pre-sow-tak-competitions.md:392`). Legend is one of the display toggles (`:359`). Overlaying text on the screen was not natively supported by the core platform at the time, so the team's implementation was a real advancement (`gap-tak-june_8-12.md:270`). ⚠️ The legend-contents line and the not-natively-supported confirmation are both Gemini-summarized, and there is an open team item to verify the auto-legend was not a pre-existing capability (`:288`).

**Pain + who:** Team leads and the mission execution team, the downstream readers of the finished GRG. 🟧 Without an auto-generated legend, legend labeling was inconsistent and there was no reliable versioning, so the team could not tell at a glance which GRG was the latest or what operation and location it covered (Abel's read, Jun 10).

**Assumption** (🟧 Claude's inference from the pain context, react to it):
`[Desirability] We believe team leads and the mission execution team will act on the correct and latest GRG, identifying at a glance which version is latest and what AOI it covers, instead of being unsure whether they have the current one, because every exported GRG carries an auto-generated legend with operation title, MGRS, and version.`

**For the Balance Team:**
- Is the bet about acting on the correct/current version (the versioning angle), or is the heavier half consistency, every GRG labeled the same way so there is no ambiguity reading one, regardless of versioning?
- Beyond identifying the GRG, what else about a consistent auto-legend did this touch that we should turn into its own bet? (Abel expects other bets live here; raise to the team before confirming.)

**Riskiest:** single assumption, no nomination needed.

**Outcome mapping (plain):** this does not sit on the Model Improvements "less manual GRG effort" theme like the detection and labeling cards; the pain-holder is downstream (team leads / mission execution team), not the GRG creator. No named outcome in `tak-oor.md` covers downstream trust in the correct/current GRG. Flagged for `tak-outcomes` to name later, not invented here.

**Baseline:** none tied to the behavior. The legend feature shipped (operation title, MGRS, version, `pre-sow-tak-competitions.md:392`) and text overlay is confirmed not natively supported (`gap-tak-june_8-12.md:270`), but there is no measure of whether the downstream team acts on the correct/current GRG, or any before/after on version confusion. ⚠️ Open team item to confirm the auto-legend was not a pre-existing capability (`:288`). No in-field behavior measure.

**To test it:** team leads / mission execution team reading GRGs in prod. Blocked until we have access to users in prod.

---

### 9. Grid configuration via the radial menu (Bridge)

**Output:** Grid configuration via the radial menu, column / row / spacing (`tak-all-outputs.md:53`; `tak-final-demo.md:88`, `:162`). The nested, hierarchical radial menu is the unique-value implementation; the radial concept itself is native ATAK, not the team's invention (`gap-tak-june_8-12.md:264`).
*What it does:* the operator sets grid parameters (column, row, spacing) through the radial menu rather than a separate settings interface. In the GR8 plugin the operator also defines a center point over the target building and sets mission-area boundaries (`pre-sow-tak-competitions.md:376`, Gemini-summarized).

**Pain + who:** GRG creators (operators). The legacy "GRG Builder" plugin in the ATAK store handled grid configuration through a separate, manual settings drawer, which was more complicated and not the typical ATAK workflow. 🟧 The drawer detail is Abel's read from the GRG Builder plugin (pending team confirm); the cited source only says the legacy tool was "basic functionality" (`gap-tak-june_8-12.md:264`).
> ⚠️ Abel flagged this output as possibly "not a ton of juice" for an outcome unless operators raise it in feedback; don't let it get lost (`gap-tak-june_8-12.md:265`).

**Assumption** (🟧 Claude's inference from the pain context, react to it):
`[Desirability] We believe operators and GRG creators will configure GRG parameters directly through the radial menu, using the native ATAK workflow they already know, instead of stepping through the legacy GRG Builder's separate, manual settings drawer, because the nested, hierarchical radial menu puts grid configuration in a familiar ATAK-native component.`

**For the Balance Team:**
- Is the heavier half that the radial is familiar (it matches how they already operate in ATAK, less friction), or that it's faster/simpler than the drawer regardless of familiarity?
- Does this output have enough operator value to merit its own outcome, or does it only matter if operators raise the radial workflow themselves in feedback? (Abel's open question, `:265`.)

**Riskiest:** single assumption, no nomination needed.

**Outcome mapping (plain):** does not sit on the Model Improvements "less manual GRG effort" detection/labeling theme; this is a configuration-workflow change, not a reduction in detection corrections. No named outcome in `tak-oor.md` covers an operator using a familiar native component to configure the grid. Flagged for `tak-outcomes` to name later, not invented here. Abel flagged its outcome potential as uncertain (`gap-tak-june_8-12.md:265`).

**Baseline:** none tied to the behavior. Grid configuration via the radial menu shipped on 5.4 (`tak-final-demo.md:88`), though radial column/row/spacing adjustments on 5.4 had a defect flagged in-progress for a Sprint 4 fix (SDT-72, `:162`), and a radial-menu delete crash was fixed (`:156`). No measure of whether operators find the radial workflow more natural than the legacy drawer, and the drawer comparison itself is Abel's read pending team confirm. No in-field behavior measure.

**To test it:** operators configuring GRGs in prod. Blocked until we have access to users in prod.

===





## Session Summary + Hand-off (editing/refinement pass, Jun 10)

> This session refined the existing finalized cards; it did not create new ones. Part 1 of the pipeline: `tak-output-assumptions -> experiments-framework.md (Experiment Card) -> hypothesis`.

### What changed this session
- Refined cards **#1, #2, #3, #5, #6, #7, #8**, plus a global "by hand" -> "manually" sweep across the file.
- **#1 Sliding-window detection:** dropped the "same result every time" oversell; assumption now AOI-based with "trust after a single run." First Balance Team question split into two (pre-AI world vs re-running with AI), third kept. Outcome mapping softened to "consistent-enough result."
- **#2 Smart default labeling + selectable schemes:** split the combined bet into two assumptions (smart default / scheme-picking), added a Riskiest nomination (smart default), swapped the redundant first question for a schemes-coverage one, split the baseline by bet.
- **#3 Automatic renumbering:** Pain strengthened to carry the real magnitude (10s-100s, restart as lesser evil); because tied to the burden removed; added a third question to validate the inferred "starting over was the fallback" pain.
- **#5 Add marker (section's prefix/numbering):** killed the circular because; assumption now "accept the drawn section's prefix and next sequenced number... because the markers already match the section's convention, with nothing to fix." Q1 verb aligned to "accept."
- **#6 Skip ambiguous letters:** replaced the coined "letters that look like numbers" with the team's term "ambiguous letters."
- **#7 Imagery pre-caching + status messaging:** reframed from output-trust to input data quality / silent failures (per Zach); threaded the connected-only / DDIL scope boundary through the output flag, assumption note, a Balance Team question, and "to test it."
- **#8 Auto-generated legend:** confidence framing (act on the correct/latest GRG, identify version + AOI at a glance, instead of being unsure they have the current one).

### Craft rules reinforced (carry forward)
- Keep the "because" on the user's side (desirability); never a feasibility/performance claim like "every time."
- No subjective qualifiers (easier/less annoying) in the bet; pain magnitude belongs in Pain + who.
- Don't assert the counterfactual; frame as confidence vs uncertainty.
- One mechanism per assumption; two sources means split into two bets (plus a Riskiest nomination).
- Use the team's exact words (ambiguous letters, AOI, manually, prefix, convention, drawn section).

### Open / not done
- **#4 Swipe gesture** and **#9 Grid configuration** not reviewed this session.
- **#5** header/output line still say "section's prefix" while the assumption says "drawn section's" (add "drawn"?).
- **#8** Pain still says "operation and location" while the assumption now uses "AOI."
- **KMZ interoperability** still parked pending an "is it ours?" answer from the team.

### Hand-off prompt (paste into a new context)

```
You are assisting Abel (Product Manager, Rise8) on the SOCOM TAK AI GRG project during the OTA gap period. This is Part 1 of the roadmap pipeline: tak-output-assumptions. The 9 output-assumption cards already exist and are finalized in TAK-ALL/r8-internal/Daily-TAK-notes/gap-period/tak-output-assumptions.md. We are doing an EDITING/REFINEMENT pass over those cards, not creating new ones.

Refined last session: cards #1, #2, #3, #5, #6, #7, #8, plus a global "by hand" -> "manually" sweep.

Still to review: #4 Swipe gesture and #9 Grid configuration (untouched). Small open items: (a) #5 header/output line still say "section's prefix" while the assumption says "drawn section's", Abel to decide whether to add "drawn"; (b) #8 Pain still says "operation and location" while the assumption now uses "AOI"; (c) KMZ interoperability is parked pending an "is it ours?" answer from the team; (d) the bottom Session Summary section may need refreshing.

Work one card at a time, one question at a time. Propose, then stop for Abel's reaction before writing anything to the file. Craft rules reinforced this session:
- Keep the "because" on the user's side (desirability); never a feasibility/performance claim like "every time."
- No subjective qualifiers (easier/less annoying) in the bet; magnitude of pain belongs in Pain + who.
- Don't assert the counterfactual; frame as confidence vs uncertainty.
- One mechanism per assumption; if there are two sources, split into two bets (plus a Riskiest nomination).
- Use the team's exact words (ambiguous letters, AOI, manually, prefix, convention, drawn section).
- Never the em dash character. Tag inferences with the orange square as Claude's. Cite sourced claims.

Sources: tak-all-outputs.md, tak-oor.md (Model Improvements outcome), gap-tak-june_8-12.md (lines 213-289), pre-sow-tak-competitions.md, tak-final-demo.md. Never outputs-outcomes-tak.md (stale).

Start by asking Abel which card to take, or whether to finish #4 and #9 first.
```

---
### Source / reference files used
- `tak-output-assumptions.md` (this artifact)
- `tak-all-outputs.md` (outputs list, VSM blocks #1 to #6)
- `gap-tak-june_8-12.md` (team confirmation, lines 213-289)
- `tak-oor.md` (named outcomes; Model Improvements)
- `pre-sow-tak-competitions.md` (Competition outputs and labeling validation)
- `tak-final-demo.md`, `tak-daily-april_20-24.md`, `db-wk5.md` (Bridge detection evidence)

```




