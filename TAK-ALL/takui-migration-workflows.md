# TAK UI Migration — Workflow User Stories

---

## Story 1: Place and Define Grid Parameters

**As a GRG Creator,
I want to place a grid and start defining its parameters,
So that the GRG that gets created is within specified bounds.**

**Scenario 1: Place the grid over the AOI**

| Task | Component / Interaction | TAK UI Native? | Escape Hatch (ATAK)? | Notes / Risk |
|---|---|---|---|---|
| 1. View AOI image in plugin | Map display / image render layer | ✅ Yes | No | Map tools confirmed TAK UI native in Josh's findings |
| 2. Zoom in to AOI | Map zoom / pan interaction | ✅ Yes | No | Standard map gesture — expected native |
| 3. Tap grid icon | Floating toolbar button | ❌ No | ✅ Yes | Floating toolbar is `ActionBarView` — TAK UI has no abstraction for this, must use ATAK native API |
| 4. Grid placed over AOI | Grid placement / render | ❌ No | ✅ Yes | `CustomGrid` + `GridLinesMapComponent` — explicitly listed as ATAK native required |

**Scenario 2: Define grid parameters via settings menu**

| Task | Component / Interaction | TAK UI Native? | Escape Hatch (ATAK)? | Notes / Risk |
|---|---|---|---|---|
| 5. Tap settings icon (cog wheel) | Floating toolbar button | ❌ No | ✅ Yes | Lives on the floating toolbar — same `ActionBarView` escape hatch as step 3 |
| 6. Switch to Grid tab | Tab navigation / settings panel | ✅ Yes | No | `Tab` component confirmed working — note version-sensitive parameter name (`content` vs `contents`) |
| 7. Update grid parameters | Form controls (+/- buttons, input fields) | ✅ Yes | No | `Button`, `IntEntry`, `DoubleEntry` all confirmed working in TAK UI |
| 8. See updates in real time | Grid re-render on map | ❌ No | ✅ Yes | Grid updates use `GridTransformer` via reflection — explicitly listed as ATAK native required. `grid.place()` cannot be used for updates or it corrupts the grid |

**Note:** Alt Scenario 2 (radial menu path) is deferred — will cover in a separate session.

**Story-level risk:** Steps 3, 4, 5, and 8 are all escape hatch. The floating toolbar and grid engine are the two heaviest ATAK dependencies in this story and have no TAK UI native path today. Grid updates specifically use a 500+ line `GridTransformer` class with reflection — flag both for Nathan as priority native candidates.

---

## Story 2: Draw Sections Within the Grid

**As a GRG Creator,
I need the option to draw sections within the grid,
So that I can organize the buildings' markers.**

**Scenario 1: Activate the section drawing tool**

| Task | Component / Interaction | TAK UI Native? | Escape Hatch (ATAK)? | Notes / Risk |
|---|---|---|---|---|
| 1. Tap section button | Floating toolbar button | ❌ No | ✅ Yes | Lives on `ActionBarView` floating toolbar — TAK UI has no abstraction for this |
| 2. ATAK drawing tools open | `AtakBroadcast / SET_TOOLBAR` broadcast | ❌ No | ✅ Yes | Opens via `com.atakmap.android.maps.toolbar.SET_TOOLBAR` broadcast — `SectionToolStateManager` confirmed ATAK native |
| *(auto)* Drawing color and fill applied | `DrawingPreferences(mapView)` | ❌ No | ✅ Yes | Happens automatically in background — yellow color + transparent fill applied via ATAK native API. Original preferences saved and restored on close |

**Scenario 2: Draw a section polygon on the map**

| Task | Component / Interaction | TAK UI Native? | Escape Hatch (ATAK)? | Notes / Risk |
|---|---|---|---|---|
| 3. Select desired drawing shape | ATAK shape drawing toolbar (via `SET_TOOLBAR`) | ❌ No | ✅ Yes | Jonathan confirmed Rise8 reuses ATAK's existing shape drawing toolbar — activated by the `SET_TOOLBAR` broadcast in Scenario 1 |
| 4. Draw section boundary on map *(repeat until done)* | `PolygonCreationTool()` | ✅ Yes | No | Confirmed working in TAK UI — used inside `SectionCreationPane`. Repeat per section until GRG Creator is satisfied |
| 5. Section saved to map | ATAK `DrawingTools API` | ❌ No | ✅ Yes | Thomas confirmed April 30 — section shape persistence is handled by the ATAK `DrawingTools API` |
| 6. Section tool closes ATAK drawing tools | `AtakBroadcast / UNSET_TOOLBAR` broadcast | ❌ No | ✅ Yes | Same broadcast pattern as open — `SectionToolStateManager` handles both |

**Scenario 3: Configure section options**

| Task | Component / Interaction | TAK UI Native? | Escape Hatch (ATAK)? | Notes / Risk |
|---|---|---|---|---|
| 7. Tap settings icon (gear) | `ActionBarView` / `DropDownReceiver` | ❌ No | ✅ Yes | Same `ActionBarView` escape hatch as Scenario 1 entry — settings pane delivered via ATAK `DropDownReceiver` |
| 8. Select section color | `ColorPickerButton` (TAK UI) | ✅ Yes | No | Thomas confirmed TAK UI has `ColorPickerButton` — April 30 internal review |
| 9. Tap help icon | `android.app.AlertDialog` (`showRelabelHelpDialog()`) | ❌ No | ✅ Yes | Code confirmed in `GridSettingsDropDownReceiver.kt` line 1032 — `android.app.AlertDialog`, not `AlertWidget`. TAK UI native equivalent (`AlertWidget`) exists |
| 10. Select label flow type | `ImageButton` (TAK UI) | ✅ Yes | No | Thomas confirmed TAK UI has `ImageButton` — April 30 internal review |
| *(covered)* Text, checkbox, button controls | See Story 1, Scenario 2 | — | — | `Button`, `IntEntry`, `DoubleEntry` patterns covered — same TAK UI native path applies |

**Note:** Radial menu path for configuring section options is deferred — will cover in a separate session.

**Story Assessment:**
`ActionBarView` appears in Scenario 1 (section button entry) and Scenario 3 (settings gear entry) — both entry points are escape hatch, the same pattern identified in Story 1. The `SET_TOOLBAR` and `UNSET_TOOLBAR` broadcasts in Scenarios 1 and 2 activate and close the ATAK drawing toolbar with no TAK UI abstraction today. Shape persistence in Scenario 2 is confirmed escape hatch via the ATAK `DrawingTools API`; `PolygonCreationTool` is the one confirmed TAK UI native component in that scenario. In Scenario 3, `ColorPickerButton` and `ImageButton` are confirmed TAK UI native; the `android.app.AlertDialog` help modal is escape hatch with `AlertWidget` available as the TAK UI native equivalent.

**Nathan Decision Points:**

**`AtakBroadcast / SET_TOOLBAR + UNSET_TOOLBAR`** — Escape Hatch
In Scenario 1, when the GRG Creator taps the section button, the ATAK drawing toolbar opens and closes via `SET_TOOLBAR` / `UNSET_TOOLBAR` broadcasts through `AtakBroadcast` — there is no TAK UI abstraction for this today.
- Any feedback or insights we should know before we proceed?
- Is this on your sprint? If yes, when?
- Before we decide on a path — is there anything in TAK UI today we should be looking at for this, or guidance on where to look?
- If nothing surfaces: we see two paths — stay on the escape hatch, or Rise8 contributes a native version. What would you recommend?

**`DrawingPreferences(mapView)`** — Escape Hatch
In Scenario 1, when the section drawing tool activates, color and fill preferences are applied automatically in the background via `DrawingPreferences` — this is ATAK native with no TAK UI abstraction today.
- Any feedback or insights we should know before we proceed?
- Is this on your sprint? If yes, when?
- Before we settle on escape hatch — is there a TAK UI path for managing drawing preferences we should know about?

**`ATAK DrawingTools API`** — Escape Hatch
In Scenario 2, after the GRG Creator draws and closes the section boundary, the shape persists on the map via the ATAK `DrawingTools API` — there is no TAK UI abstraction for shape persistence today.
- Any feedback or insights we should know before we proceed?
- Is this on your sprint? If yes, when?
- Before we decide on a path — is there anything in TAK UI today we should be looking at for shape persistence, or guidance on where to look?
- If nothing surfaces: we see two paths — stay on the escape hatch, or Rise8 contributes a native version. What would you recommend?

**`android.app.AlertDialog` (`showRelabelHelpDialog()`)**  — Escape Hatch
In Scenario 3, when the GRG Creator taps the help icon in the settings pane, `android.app.AlertDialog` renders a modal with instructions for relabeling building sequences — `AlertWidget` is the TAK UI native equivalent.
- Any feedback or insights we should know before we proceed?
- Is this on your sprint? If yes, when?
- Before we make a call — is `AlertWidget` the right replacement here, or is there guidance on the preferred approach?

---

## Story 3: Detect and Label Buildings Within Grid Sections

**As a GRG Creator,
I need to detect and label buildings within grid sections,
So that field operators are aware of the specific points of interest.**

**Scenario 1: Run AI building detection**

| Task | Component / Interaction | TAK UI Native? | Escape Hatch (ATAK)? | Notes / Risk |
|---|---|---|---|---|
| 1. Tap detect button | `ActionBarView` floating toolbar | ❌ No | ✅ Yes | Same `ActionBarView` escape hatch as all toolbar buttons in Stories 1 and 2. TAK UI has no abstraction for this. |
| 2. Confirmation dialog appears | `AlertWidget()` / `AlertForm()` | ✅ Yes | No | Confirmed working in TAK UI. Josh's findings. |
| 3. Detection runs | `InferenceAndroidGrgRuntime` (CV SDK AAR) | ❌ No | ✅ Yes | Requires `grg-tak-sdk-android-debug.aar`. `BuildingDetectionHandler.kt` imports `us.rise8.grg.android.*` (CV SDK, not ATAK native). Detection logic currently stubbed, not yet wired to actual ONNX inference. |
| 4. Building markers placed on map | ATAK `Marker` + `MapGroup` | ❌ No | ✅ Yes | `MarkerManager.kt` imports `com.atakmap.android.maps.Marker` and `DefaultMapGroup`. Confirmed ATAK native. Josh's findings confirm no TAK UI abstraction. |

**Scenario 2: Review and correct building labels**

| Task | Component / Interaction | TAK UI Native? | Escape Hatch (ATAK)? | Notes / Risk |
|---|---|---|---|---|
| 5. Review placed markers on map | ATAK map / `Marker` overlay | ❌ No | ✅ Yes | Markers are ATAK native objects, same as row 4. Passive visual review with no distinct UI interaction. No clear TAK UI abstraction. |
| 6. Correct or reorder label sequence | `SwipeRelabelManager` | ❌ No | ✅ Yes (preliminary) | `SwipeRelabelManager.kt` in original plugin imports `com.atakmap.android.maps.MapView` + `Marker`. No TAK UI equivalent in Josh's findings. Class not yet ported in new TAK UI prototype. VSM flagged this as the worst user experience in the workflow. |

**Story Assessment:**
`ActionBarView` appears in Scenario 1 as the entry point for building detection, the same escape hatch pattern identified in Stories 1 and 2. In Scenario 1, `AlertWidget` is the one confirmed TAK UI native component; detection via `InferenceAndroidGrgRuntime` and marker placement via ATAK `Marker` + `MapGroup` are both escape hatch, with detection logic currently stubbed and not yet wired to ONNX inference. Scenario 2 is escape hatch across both steps: marker review relies on ATAK native map objects, and `SwipeRelabelManager` carries a preliminary escape hatch call based on `com.atakmap.*` imports in the original plugin source, though the class is not yet ported in the new TAK UI prototype. Both `InferenceAndroidGrgRuntime` and `SwipeRelabelManager` have no confirmed TAK UI path and no known BAH timeline.

**Nathan Decision Points:**

**`ActionBarView`** — Escape Hatch
In Scenario 1, when the GRG Creator taps the detect button, `ActionBarView` hosts the floating toolbar button that surfaces the detection action. TAK UI has no abstraction for the floating toolbar today and this is the same ATAK native pattern identified in Stories 1 and 2.
- Based on our findings, what's your take here and/or suggestions?

**`InferenceAndroidGrgRuntime`** — Escape Hatch
In Scenario 1, when the GRG Creator confirms detection, `InferenceAndroidGrgRuntime` runs the ONNX-based building detection model against the AOI. This component requires the `grg-tak-sdk-android-debug.aar` from the original plugin and the detection logic is currently stubbed in the new TAK UI prototype.
- Based on our findings, what's your take here and/or suggestions?

**`ATAK Marker + MapGroup`** — Escape Hatch
In Scenario 1, after detection completes, ATAK `Marker` + `MapGroup` places the building detection results as markers on the map. These are ATAK native map objects with no TAK UI abstraction today.
- Based on our findings, what's your take here and/or suggestions?

**`SwipeRelabelManager`** — Escape Hatch (preliminary)
In Scenario 2, when the GRG Creator corrects or reorders the building label sequence, `SwipeRelabelManager` handles the swipe-based gesture interaction on the map. It uses `com.atakmap.*` APIs in the original plugin, is not yet ported in the new TAK UI prototype, and the VSM identified this label correction step as the point with the worst user experience in the GRG creation workflow.
- Based on our findings, what's your take here and/or suggestions?

---

## Story 4: Manually Label Building Placement

**As a GRG Creator,
I need the option to manually label building placement,
So that field operators have an accurate and complete set of labeled buildings on the final GRG.**

**Scenario 1: Manually place building label in sequence**

| Task | Component / Interaction | TAK UI Native? | Escape Hatch (ATAK)? | Notes / Risk |
|---|---|---|---|---|
| 1. Tap label button | `ActionBarView` floating toolbar | ❌ No | ✅ Yes | Same `ActionBarView` escape hatch as all toolbar buttons across Stories 1, 2, and 3. TAK UI has no abstraction for this. |
| 2. Tap building on map to place marker | `MapEventListener` / map touch | ❌ No | ✅ Yes (preliminary) | `GrgCaptureToolbar.kt` uses `MapEventListener` which imports `com.atakmap.android.maps.MapView` and `com.atakmap.map.MapRenderer2`. Josh's findings also list `PointSelectionTool()` as a confirmed TAK UI map tool — unclear if it applies to this interaction. |
| 3. Marker placed with label | ATAK `Marker` + `MapGroup` | ❌ No | ✅ Yes | Same ATAK native marker pattern confirmed in Story 3. `MarkerManager.kt` imports `com.atakmap.android.maps.Marker` and `DefaultMapGroup`. |

**Story Assessment:**
Scenario 1 has no confirmed TAK UI native components; all three steps are escape hatch. ATAK `Marker` + `MapGroup` for marker placement is confirmed ATAK native. The map touch interaction in Scenario 1 is currently implemented via `MapEventListener` using `com.atakmap.*` APIs; Josh's findings list `PointSelectionTool()` as a confirmed TAK UI map tool and engineers should validate whether it applies to this interaction before a final call is made.

**Nathan Decision Points:**

**`ActionBarView`** — Escape Hatch
In Scenario 1, when the GRG Creator taps the label button, `ActionBarView` hosts the floating toolbar button that activates manual labeling mode. TAK UI has no abstraction for the floating toolbar today.
- Based on our findings, what's your take here and/or suggestions?

**`MapEventListener`** — Escape Hatch (preliminary)
In Scenario 1, when the GRG Creator taps a building on the map to place a marker, `MapEventListener` handles the map touch interaction using `com.atakmap.*` APIs. Josh's findings list `PointSelectionTool()` as a confirmed TAK UI map interaction tool — we don't know if it applies here.
- Based on our findings, what's your take here and/or suggestions?

**`ATAK Marker + MapGroup`** — Escape Hatch
In Scenario 1, after the GRG Creator taps a building, ATAK `Marker` + `MapGroup` places the labeled marker on the map. These are ATAK native map objects with no TAK UI abstraction today.
- Based on our findings, what's your take here and/or suggestions?
