
# *Monday, June 8*

# Output/Deliverable Candidates *UPDATED*

> Categorized list. A category collects delivered outputs regardless of whether they shipped in the Competition or the Bridge period. Each item keeps its source citation and a short description.

## Detection: High Confidence in Delivery

1. **ONNX runtime AI engine.** Chosen after outperforming TensorFlow Lite and PyTorch for Windows and Android edge devices. (`pre-sow-tak-competitions.md:33`)
2. **256x256 image tiling (pre-processing).** The model performs best on a 256x256 image, so the larger AOI is broken into 256x256 image tiles. (`pre-sow-tak-competitions.md:34`)
3. **Upgraded AI model.** Competition docs report integrating YOLT for a 670% improvement in building detection recall (`pre-sow-tak-competitions.md:157`, `:84`). **Team update (Jun 9):** the current model is YOLO, not YOLT; the move to YOLO fixed false and double detections. The 670% recall figure is unverified and pending reverification (Zachary). (`gap-tak-june_8-12.md:235-236`, `:285`)
4. **Multi-inference strategy.** Implemented a multi-inference strategy based on user-defined sections to overcome YOLO's limitations within the user workflow. (`pre-sow-tak-competitions.md:314-317`)
5. **Multi-Model Runtimes.** SDK engineered to allow different AI models, configurable to match mission requirements and device, with support to quickly add new model runtimes. (`pre-sow-tak-competitions.md:161`, `:322`)
6. **Fungible AI model upgrades.** Swapped in latest trained model ONNX files, demonstrating CT/CD (Continuous Train/Continuous Deploy) value. (`pre-sow-tak-competitions.md:324`)
7. **AI Model Training Pipeline.** GitLab model repo to AWS SageMaker (load training imagery via CVAT, epoch training) to artifacts (model, weights, results) in S3. (`pre-sow-tak-competitions.md:270-292`)
8. **atak-cv-model-servers (repo).** Computer vision model server for building segmentation using a trained YOLOv8 model, designed for ATAK/WinTAK GRG plugin integration; batch processing, CSV/zip output. (`tak-repo-info.md:1-60`)
9. **GRG AI MODEL repo.** Trains and evaluates three model implementations (YOLO, YOLT, UNET) on AWS SageMaker with automated CVAT data pulling and S3 artifact storage. (`tak-repo-info.md:64-134`)
10. **Detection accuracy and reliability improvements (Bridge).** Building detection now performs consistently regardless of zoom level, and repeated detection runs produce stable results. (`tak-final-demo.md:34`, `:43-44`)
11. **124% building detection accuracy improvement (Bridge).** Quantified at the April 22 sprint demo, validated through side-by-side comparison with SOCOM. (`tak-final-demo.md:34`, `:45`)

## Detection: Low Confidence (Needs Verification)

1. **Single AI SDK.** Performed inference AND complicated labeling algorithms with an ONNX YOLO computer vision model; feeds both the WinTAK and ATAK plugins. (`pre-sow-tak-competitions.md:399`, `:44-47`)
   - *Why low confidence:* the source says it does inference and labeling, so it spans both Detection and Labeling. It is the shared engine above both buckets, not a detection-only output.
2. **Image Format Improvements (RGB bitmap input).** Created an RGB bitmap input for the model, resulting in better detections. (`pre-sow-tak-competitions.md:326`)
   - *Why low confidence:* one line only, no metric, magnitude, or measurement method given. It got done, but "better detections" is unvalidated in the docs.
3. **Imagery pre-caching + operator status messaging (Bridge).** Plugin pre-caches imagery before detection runs; status notification on full success, partial completion, or fetch failure, with a "Tile Capture Failed" popup. (`tak-final-demo.md:35`, `:50-54`)
   - *Why low confidence:* the demo doc files these under a separate header ("Pre-caching and imagery feedback to operators"), distinct from "Detection / model improvements." They concern the imagery feeding detection, not detection itself.
4. **Three "detection" bug fixes (Bridge).** Detection no longer triggers before the map finishes loading; background threads shut down cleanly (memory leak); no detection on backup imagery when tile capture fails. (`tak-final-demo.md:46-48`)
   - *Why low confidence:* listed under "Detection / model improvements" in the demo, but these are fixes to detection behavior, not new detection capability. Your call whether fixes count.

=====

# Main Capabilities/features and outputs delivered according to VSM

> Each block is a step in the current-state GRG workflow (legacy, pre-AI). Under each, the high-level capability and the specific outputs we shipped on top of it, across Competition and Bridge. 🟧 marks Claude's own framing of a name. Blocks 6 to 9 still to come.

### #1. Prepare AOI imagery for GRG creation
* Main capability/feature: **Imagery handling / preparation**
* Outputs:
  1. Imagery pre-caching before detection runs (Bridge)
  2. Operator status messaging: full success / partial / fetch failure, with a "Tile Capture Failed" popup (Bridge)
  3. 256x256 image tiling of the AOI (Competition). Note: also a detection pre-processing step, so it overlaps the Detection category.
* References: Bridge shipped imagery pre-caching before detection runs, plus operator status messaging on full success, partial, or fetch failure (`tak-final-demo.md:35`, `:52-54`); May 6 walkthrough covered imagery improvements across connected and disconnected setups (`db-wk7.md:45`). Competition: the model breaks the AOI into 256x256 tiles (`pre-sow-tak-competitions.md:34`).
* Confidence Level: **High**

### #2. Define grid parameters over map
* Main capability/feature: **Grid definition and configuration**
* Outputs:
  1. Define a center point over the target building and set mission-area boundaries (Competition, GR8 plugin)
  2. Skip-ambiguous-letters toggle (B, H, I, 1) to match mission SOPs (Competition)
  3. Grid configuration via the radial menu: column / row / spacing (Bridge, on 5.4)
* References: in the GR8 plugin the operator defines a center point over a target building and sets the mission-area boundaries (`pre-sow-tak-competitions.md:376`), with a toggle to skip ambiguous letters like B, H, I, 1 (`:380`). Bridge added grid configuration via the radial menu, column / row / spacing, on 5.4 (`tak-final-demo.md:88`, `:162`). Center-point-vs-spacing behavior is flagged as a feature request, not yet shipped, so it is not listed as an output (`:173`). Note: lines 376 and 380 come from a Gemini-generated summary of the demo video, confirm wording with the team.
* Confidence Level: **High**

### #3. Add non-building details to map
* Main capability/feature: **Nothing delivered**
* Outputs: none
* References: the VSM has this step done with vanilla TAK tools (`tak-vsm-first_pass.md:253`); the demo confirms sectioning and details use native TAK shape tools, not our build (`pre-sow-tak-competitions.md:378`). Flag for the team to confirm.
* Confidence Level: n/a (nothing delivered)

### #4. Draw sections on gridded map
* Main capability/feature: **Section definition/drawing**
* Outputs:
  1. Section parameter control: name, color, numbering (the "name, color, numbering" detail is from a Gemini summary, `pre-sow-tak-competitions.md:391`; that users can define sections has team-slide backing, `:259`)
* References: drawing sections uses native TAK polyline/shape tools, not our build (`pre-sow-tak-competitions.md:378`); "allows users to define sections" (`:259`, team slide); section parameters name, color, numbering (`:391`, Gemini summary). Current state confirms no automation for placing the grid or drawing sections (`tak-challenge_n_current-condition.md:241`).
* Confidence Level: **High** that section parameter control was shipped; the name/color/numbering detail leans partly on a Gemini summary (flagged), and the drawing action itself is native TAK, not ours.

### #5. Label buildings within grid sections
> This block has three main capabilities, following the team's own split of AI improvement into the model, the algorithm, and the UI/UX (`tak-challenge_n_current-condition.md:91`). Each carries its own outputs. These are peers, not nested.

**Capability A: AI detection**
* Outputs:
  1. On-device AI building detection: a single tap finds buildings inside the drawn sections (`pre-sow-tak-competitions.md:384`, `:256`, Gemini summary, confirm wording)
  2. AI model upgrade (competition docs say YOLT, 670% recall, `:157`, `:84`; team Jun 9 confirms current model is YOLO and the 670% figure is unverified, pending Zachary, `gap-tak-june_8-12.md:235`)
  3. Multi-inference (section-based) detection, ~80-90% per section vs 60-70% on a full AOI (`:317`, `tak-challenge_n_current-condition.md:91`)
  4. 124% accuracy improvement, Bridge (`tak-final-demo.md:45`)
  5. Detection reliability: zoom-consistent and stable across repeat runs, Bridge (`tak-final-demo.md:43-44`)
* References: as above. The back-end enablers (ONNX, tiling, RGB input, multi-model runtimes, fungible upgrades, training pipeline, repos) are listed in the Detection category above; they improve detection but are not operator-behavior outputs, so they are kept out of this hypothesis grain.
* Confidence Level: **High**

**Capability B: Labeling algorithm**
* Outputs:
  1. Advanced labeling algorithm: numbers buildings the way a human would, adapts to complex, irregular layouts (`pre-sow-tak-competitions.md:159`)
  2. Additional labeling features: row and grid schemes, operator-selectable (`:320`)
  3. 🟧 Skip-ambiguous-letters toggle (B, H, I, 1) (`:380`, Gemini summary). Note: also listed under block #2 (grid); skipping letters is a labeling-scheme decision, so it likely belongs here. Pick one home.
* References: advanced labeling algorithm (`:159`, team slide); additional labeling features, row and grid schemes (`:320`, team slide); skip-ambiguous-letters toggle (`:380`, Gemini summary).
* Confidence Level: **High** (algorithm and schemes are team slide text; skip-letters wording leans on a Gemini summary)

**Capability C: Review and correction**
* Outputs:
  1. Operator final authority: review, correct, add, or remove building markers (`pre-sow-tak-competitions.md:385`, Gemini summary)
  2. Automatic renumbering when changes are made (`:386`, Gemini summary)
  3. Swipe gesture to re-sequence and adjust numbering (`:387`, Gemini summary)
* References: operator authority and renumbering specifics (`:385-387`, Gemini summary, confirm wording). Bridge fixes touching labels (your call whether they count as outputs): labels clear when a GRG is closed (`tak-final-demo.md:66`); labels outside named sections clear on save and close (`:67`).
* Confidence Level: **High** that these shipped; the review/correct and renumbering wording leans on a Gemini summary (flagged).

### #6. Export the GRG
* Main capability/feature: **GRG export** (producing the finished, shareable GRG artifact)
* Outputs:
  1. KMZ export of the finished GRG, supports data sharing and interoperability with other mission planning software (`pre-sow-tak-competitions.md:393`, Gemini summary)
  2. Auto-generated legend on the product: operation title, location (MGRS), version (`pre-sow-tak-competitions.md:392`, Gemini summary)
* References: legend and KMZ export both appear under the demo's "Customization, Finalization, and Export" bullet (`:392-393`, Gemini summary). Bridge fix (your call whether it counts): GRG export crash on scale bar / meters selection, fixed May 1 (`tak-final-demo.md:59`, `:155`). Not shipped, flagged as a future ask: export menu customization set (point-list editability, compass color, info-box placement), SDT-64 (`tak-final-demo.md:202`).
* Open flags: (a) legacy could already export KMZ/PDF/PNG before our plugin (`tak-vsm-first_pass.md:279`), so confirm with the team whether KMZ export is ours or native TAK; the auto-generated legend reads as the genuinely plugin-built piece. (b) The editable-KMZ-vs-"glorified image" idea (`tak-vsm-first_pass.md:280`, `:337-339`) is a potential future outcome, not a shipped output.
* Confidence Level: **High** that legend generation and KMZ export shipped; wording leans on a Gemini summary (flagged).

===


### Week of June 1st

# Output/Deliverable Candidates (Competition Period) *LEGACY*

> Sourced from: `pre-sow-tak-competitions.md`, `tak-challenge_n_current-condition.md`, `tak-repo-info.md`. Each item uses the source's own wording. For inquired items, sourced facts and technical judgments (not in the docs) are tagged separately — no fabrication.

### Plugins

1. **Fully functional WinTAK plugin** — Built in a different .NET WPF framework, working through its technical limitations. — `pre-sow-tak-competitions.md:398`

2. **Single AI SDK** — Performed inference and complicated labeling algorithms with an ONNX YOLO computer vision model; the same "Building Detection SDK" feeds both the WinTAK plugin and the ATAK plugin. — `pre-sow-tak-competitions.md:399`, `:44-47`
   - **On the question (why a "single" SDK is a thing / what it enables):**
   - *Sourced:* The two plugins live in completely different frameworks — ATAK on Android, WinTAK on .NET WPF (`:398`). The SDK feeds both (`:47`). ONNX runtime was specifically chosen because it runs on *both* Windows and Android edge devices (`:33`). The "train once, build once" framing says security patches get fixed once and deployed everywhere (`:40-41`), and the testing slide claims users get "the same reliable experience regardless of the device" (`:56`).
   - *Technical judgment (not in docs):* The contrast — "do AI without an SDK" — would mean embedding the inference + labeling logic directly inside each plugin. Across two unrelated frameworks (Android/Java vs .NET WPF) that means writing it twice, where the two copies inevitably drift and behave differently. A single SDK is feasible *because* ONNX is cross-platform: one model artifact + one runtime works on both. The SDK is the seam that makes one body of AI logic serve both plugins.
   - *Outcome it enables:* Consistent detection/labeling behavior across ATAK and WinTAK, one place to patch vulnerabilities, one place to swap models — primarily an engineering/maintainability + cross-platform-consistency enabler, not a user-facing feature.

### AI SDK features / enhancements

3. **Advanced labeling algorithm** — Numbers buildings the way a human would; naturally adapts to complex, irregular layouts. — `pre-sow-tak-competitions.md:159`
   - **On the question (why "advanced," and what evidence defines "complex/irregular"):**
   - *Sourced — what "complex/irregular" means:* Buildings normally organize in logical sequences/rows with a top-left origin (`:177-178`), but "roads, rivers, and natural or man-made gaps influence label order" and "circular or irregular patterns require judgment and 'artful' adjustment" (`:186-187`).
   - *Sourced — evidence it works on those:* Validated on two real AOIs of different size/layout — Ft. Magsaysay, Philippines (30 buildings) and Razish Village, California (68 buildings) — reaching ~90% out-of-box acceptability with only 9-12% of labels needing edits (`:192-202`); SME Hayes called the default "acceptable and valuable" for mission use as-is (`:197`).
   - *Technical judgment (not in docs):* "Advanced" is relative to naive sequential numbering (blind left-to-right). This algorithm mimics human ordering and reacts to layout features rather than ignoring them — that's the differentiator.
   - *Outcome it enables:* A labeling order that's "instantly intuitive," reducing cognitive load and corrective actions (`:159`).

4. **Additional labeling features** — Easy strategies for common scenarios like row- and grid-based schemes; operator selects the best scheme. — `pre-sow-tak-competitions.md:320`

5. **Multi-Model Runtimes** — SDK engineered to allow different AI models; configurable to match mission requirements and device, with support to quickly add new model runtimes. — `pre-sow-tak-competitions.md:161`, `:322`
   - **On the question (benefit, the opposite, eng vs end-user):**
   - *Sourced:* "Ideal user workflow needs multi-model support… SDK configurable to match mission requirements and device" (`:322`); operators "select the balance of speed and accuracy to match their exact mission requirements and device" (`:161`). Slide 12 names the drivers: the S20 needs small/fast models at the cost of detection performance; general-purpose models compromise too much, so specialized models are needed; a plug-and-play architecture allows continuous replacement of fungible models (`:262-268`). Slide 16 shows the tradeoff concretely — YOLO is fast (~2s on S20) but misses small objects; YOLT catches small objects but is slow (40s+ on S20) (`:308-310`).
   - *Technical judgment (not in docs):* The opposite is a single hard-coded model baked into the plugin — one fixed speed/accuracy tradeoff for every device and mission. That forces a bad compromise: a fast S20-friendly model underperforms on capable hardware, while an accurate heavy model is unusably slow on the S20.
   - *Eng vs end-user:* Both. Engineers can add/deploy new runtimes without rebuilding the plugin; the end user (or mission config) gets to pick speed-vs-accuracy for their device/mission.
   - *Outcome it enables:* The plugin stays useful across a device range and mission types (fast "hasty" vs. accurate "deliberate") instead of being locked to one tradeoff.

6. **Fungible AI model upgrades** — Swapped in latest trained model ONNX files, demonstrating CT/CD (Continuous Train/Continuous Deploy) value. — `pre-sow-tak-competitions.md:324`
   - **On the question (same as Multi-Model Runtimes):**
   - *Sourced:* "Swapped in latest trained model ONNX files, demonstrating CT/CD value" (`:324`); architecture supports "continuous integration and replacement of fungible models, ensuring ongoing improvement" (`:268`).
   - *Distinction from #5 (judgment):* Multi-Model Runtimes = run *different kinds* of models (YOLO vs YOLT); fungible upgrades = drop in a *newer trained version* as a swappable ONNX artifact.
   - *Technical judgment (not in docs):* The opposite is a statically embedded model — upgrading it means rebuilding and redeploying the whole plugin through TAK Forge (itself a hard, gated path). Fungible = ship just the ONNX file.
   - *Eng vs end-user:* Primarily an engineering/ops enabler that benefits users downstream — it shrinks the cycle from "model improved" to "operator has the better model" (connects to Task 3's repeatable-pipeline outcome in `tak-challenge_n_current-condition.md:86`). **Caveat:** real-world deployment still has to clear TAK Forge.

7. **Image Format Improvements** — Created an RGB bitmap input for the model, resulting in better detections. — `pre-sow-tak-competitions.md:326`
   - **On the question (RGB input / how "better" was measured):**
   - *Sourced:* One line only — "Create a RGB bitmap input for model, resulting in better detections" (`:326`). **No metric, magnitude, or measurement method is given in any of the three files.**
   - *Technical judgment (not in docs):* YOLO-family models are trained on 3-channel RGB imagery, so feeding an input that matches that expected channel format (vs. a grayscale/mismatched encoding) would plausibly improve detection — but the docs don't quantify or describe how this was validated.
   - *Read:* This looks like an engineering pre-processing call-out, not a measured user-facing feature. Low-confidence candidate pending evidence.

8. **Multi-inference strategy** — Implemented a multi-inference strategy based on user-defined sections to overcome YOLO's limitations within the user workflow. — `pre-sow-tak-competitions.md:314-317`

9. **Upgraded AI model (YOLT integration)** — Integrated state-of-the-art detection model YOLT, resulting in a 670% improvement in building detection recall. — `pre-sow-tak-competitions.md:157`, `:84`
   - **On the question (670% compared to what / prior baseline):**
   - *Sourced:* "Integrating the YOLT model resulted in a significant 670% improvement in AI building detection recall" (`:84`), restated as "670% improvement in our model's recall" (`:93`). **The prior model and the absolute before/after recall numbers are NOT stated** in any of the three files.
   - *Supported inference (judgment, partially sourced):* The baseline was almost certainly the original YOLO model (the SDK's stated CV model, `:33`/`:399`). Slide 16 supports the mechanism: YOLO scores "No" on small objects while YOLT scores "Yes" (`:309-310`) — so the recall jump is plausibly driven by catching small buildings YOLO missed. The exact comparison base isn't spelled out, so no number is asserted.
   - *What recall means + outcome:* Recall = of all real buildings, how many the model finds. A large recall gain = far fewer missed buildings up front ("Missing a building is missing a marker," ranked Critical, `:297`) → less manual adding by the operator.
   - *Don't conflate:* This Oct 10 recall figure is a different metric from the Oct 24 experiment's "55% accuracy rate" (`:224`). They measure different things at different dates.

10. **ONNX runtime AI engine** — Chosen after outperforming TensorFlow Lite and PyTorch for Windows and Android edge devices. — `pre-sow-tak-competitions.md:33`

### Plugin capabilities

11. **Automatic renumbering** — System automatically renumbers/updates marker sequences when changes are made; renumbering adjustable via a swipe gesture to optimize sequence for mission flow. — `pre-sow-tak-competitions.md:386-387`
    - **On the question (what it enables):**
    - *Sourced — the pain it targets:* "Labeling accuracy and sequence correction is the worst UX… Fixing numbering sequences after hundreds of labels are placed is described as extremely frustrating and time-consuming" (`:246-250`); 9-12% of labels need manual correction (`:247`). The operator is the final authority who can review/correct/add/remove markers (`:385`).
    - *Technical judgment (not in docs):* Without auto-renumber, removing or inserting one building mid-sequence forces the operator to manually renumber everything after it. Automatic renumbering keeps the sequence consistent on every edit.
    - *Outcome it enables:* Directly attacks the single worst-described UX pain — it removes the "extremely frustrating" manual resequencing while the operator still exercises final authority. Strong evidence-based link to a stated pain point.

12. **Section parameter control** — Users control section name, color, and numbering to match team conventions. — `pre-sow-tak-competitions.md:391`
13. **Legend generation** — Plugin generates a legend with operation title, location (MGRS), and version. — `pre-sow-tak-competitions.md:392`
14. **KMZ export** — Finalized products exportable as KMZ files, supporting data sharing and interoperability with other mission planning software. — `pre-sow-tak-competitions.md:393`

### Pipeline, library & security artifacts

15. **AI Model Training Pipeline** — GitLab model repo → AWS SageMaker (load training imagery via CVAT, epoch training) → generate artifacts (model, weights, results) to S3. — `pre-sow-tak-competitions.md:270-292`
16. **"train once, build once" AI library** — Centralized library so security patches are fixed once and deployed everywhere. — `pre-sow-tak-competitions.md:40-41`
17. **AI Model Training RMF artifacts** — AI Policy Guide, NIST Control Mapping, Secure AI DevSecOps Playbook, AI Security Checklist. — `pre-sow-tak-competitions.md:333-337`

### Repositories — `tak-repo-info.md`

18. **atak-cv-model-servers** — Computer vision model server for building segmentation using a trained YOLOv8 model, designed for ATAK/WinTAK GRG plugin integration; batch processing, CSV/zip output. — `tak-repo-info.md:1-60`
19. **GRG AI MODEL repo** — Trains and evaluates three model implementations (YOLO, YOLT, UNET) on AWS SageMaker with automated CVAT data pulling and S3 artifact storage. — `tak-repo-info.md:64-134`
20. **Security Policy Project for rise8-grg-ai-model** — Repository storing security policies (e.g., enforcing DAST in every pipeline) with protected default branch. — `tak-repo-info.md:136-174`

---

# Output/Deliverable Candidates (TAK Bridge Period)

> Sourced from: `tak-final-demo.md`, `db-wk7.md`, `tak-daily-may_11-15.md`. Each item uses the source's own wording — no fabrication. Running list after Round 2 review cuts.

## Task 1 [4.3.1] — SDK Update to v5.6

1. **`pads-fast` publish service** — Rise8-built publish service replaces the upstream PADS sidecar in the release pipeline; publish time for all five supported ATAK builds cut from 50–60 minutes to under 4 minutes, zero manual interventions since April 22. — `tak-final-demo.md:14`

## Task 3 [4.3.3] — AI/ML Model Improvements

2. **124% building detection accuracy improvement** — Quantified at the April 22 sprint demo, validated through side-by-side comparison with SOCOM. — `tak-final-demo.md:34`, `:45`
3. **Detection accuracy and reliability improvements** — Building detection now performs consistently regardless of zoom level, and repeated detection runs produce stable results. — `tak-final-demo.md:34`, `:43-44`
4. **Imagery pre-caching feature** — Plugin pre-caches imagery before building detection runs, so operators can assess conditions before committing to detection. — `tak-final-demo.md:35`, `:52`
5. **Operator imagery status messaging** — Status notification based on result: full success, partial completion, or fetch failure; includes a "Tile Capture Failed" warning popup when capture fails. — `tak-final-demo.md:35`, `:53-54`
6. **Plugin behavior and operator-experience fixes** — Seven defects resolved: detection no longer triggers before map load; background threads shut down cleanly (memory leak); no detection on backup imagery when tile capture fails; delete-section confirmation shows section name correctly; closed grids no longer reappear on map tap; building labels clear when a GRG is closed; labels outside named sections clear on save/close. — `tak-final-demo.md:37`, `:64-67`
    - **Prioritized by operator-behavior bet (synthesis):** the seven fixes from government testing / operator input (`:38`) grouped by the bet each carries, highest first. Groupings are Claude's read, react and reorder.
    - **1. Operators get detections worth trusting** (high, trust + mission risk):
      - No detection on backup imagery when tile capture fails (`:48`). An operator could have built and acted on a GRG made from the *wrong* imagery without knowing. Bet: operators were trusting detections they shouldn't have.
      - Detection no longer triggers before the map finishes loading (`:46`). Premature runs gave bad or empty results. Bet: those early-failure runs were eroding trust in the plugin's output.
    - **2. The map shows the true current state** (medium, clarity about what's real):
      - Closed grids no longer reappear on map tap (`:65`).
      - Building labels clear when a GRG is closed (`:66`).
      - Labels outside named sections clear on save and close (`:67`).
      - Bet: ghost grids and stale labels left operators unsure what state the map was actually in.
    - **3. Background threads shut down cleanly (memory leak)** (low, hygiene): pure stability, keeps the plugin healthy over a long session (`:47`). No operator would want it as a feature; hard to attach a behavior bet to it.
    - **Set aside from the prioritization (per Abel):** delete-section confirmation now shows the section name, was "undefined" (`:64`).
