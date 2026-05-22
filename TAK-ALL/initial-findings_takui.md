# TAK-UI Migration Findings — AI GRG Plugin

## What We Did

Rebuilt `/Users/joshuamiller/Projects/rise8/atak/prototype/rise8-atak-grg-plugin` using TAK-UI in `/Users/joshuamiller/Projects/rise8/atak/prototype/plugin-template`, renamed to `ai-grg-plugin`.

## What TAK-UI Covers

| Feature | TAK-UI API | Status |
|---------|-----------|--------|
| Plugin entry point | `TakUI.plugin { pluginTool() }` | Works. Replaces IPlugin boilerplate. |
| Pane/Dropdown UI | `Pane()`, `PaneTool()` | Works. Maps to ATAK's DropDownReceiver. |
| Components | `Column`, `Row`, `Text`, `TextDyn`, `Button`, `ImageButton`, `StringEntry`, `IntEntry`, `DoubleEntry`, `Checkbox`, `Spacer`, `EmptyView`, `ScrollView`, `Dynamic` | All work. Required bumping TAK-UI from 1.10.0.33-beta to 1.10.0.102-beta for `Spacer` to resolve. |
| Modifiers | `Modifier.weight()`, `.width()`, `.height()`, `.padding()`, `.fillMaxWidth()`, `.fillMaxSize()`, `.backgroundColor()` | Work. Package is `gov.tak.ui.styling.Modifier` (not `gov.tak.ui.core.styling`). |
| Navigation | `NavigationWidget`, `NavigationTarget`, `NavHost` | Works for in-pane screen switching. |
| Tool composition | `Tool.seq { }`, `Tool.action { }`, `!` operator | Works. Sequential workflow composition. |
| Dialogs | `AlertWidget()`, `AlertForm()` | Work. `AlertForm` returns typed data from dialog. |
| Map tools | `PolygonCreationTool()`, `PointSelectionTool()`, `EnumValuePickerDialog()` | Work. Built-in tools for map interactions. |
| Tool execution | `ctx.executeTool(tool)` | Works. Must use this — NOT `tool.run()` directly — or display context is missing. |
| Map services | `ITakMapService`, `IMapItemService` | Available via `ctx.dependencies.inject()`. |
| DI | `ctx.dependencies.inject<T>()`, `registerPluginService<T>()` | Available but we didn't use it heavily — services instantiated directly. |
| Plugin lifecycle | `onClearContent { }` | Works. |
| Color | `gov.tak.ui.view.Color` | Works. |
| Layout units | `gov.tak.ui.view.dp` | Works. |
| Toolbar component | `Toolbar(title, buttons)` | Exists but is an in-pane component, NOT a floating map toolbar. |
| Map widgets | `MapWidget(parent, content)`, `topLeft`, `topRight`, `ViewWidget`, `DrawableWidget`, `TextWidget` | Exist for placing overlay widgets on map corners. Not used for toolbar. |
| Preferences | `preferenceFragment()` | Exists but `tak-ui-preferences` module not in our dependencies. |
| Progress | `ProgressBarDialog()` | Exists in TAK-UI. |
| Component wrapping | `Component.programmatic { }` | Works for wrapping Android Views as TAK-UI components. |
| Form binding | `Component.build { }`, `formBuilder { }` with Arrow optics | Available but requires KSP for `@optics`. We didn't set up KSP. |

## What TAK-UI Does NOT Cover (ATAK-Native Required)

| Feature | ATAK API Used | Notes |
|---------|--------------|-------|
| Floating toolbar | `ActionBarView` + `ActionBarReceiver.setToolView()` | TAK-UI has no abstraction for this. Must inflate XML layout and use ATAK native API. Must call `root.showCloseButton(false)` to hide ATAK's built-in close button. |
| Radial menus | `MapMenuFactory`, `MapMenuWidget`, `MapMenuButtonWidget`, `MapMenuReceiver.registerMapMenuFactory()` | TAK-UI has no radial menu abstraction. Must implement `MapMenuFactory.create(mapItem)`. Every `MapMenuButtonWidget` MUST have an icon or ATAK crashes with NPE on `WidgetIcon.getIconWidth()`. |
| Radial menu icons | `PluginMenuParser.getItem(pluginContext, path)`, `WidgetIcon.Builder` | Icons must be in `src/main/assets/icons/` (NOT `src/atakMain/assets/`). `PluginMenuParser` needs the plugin context to resolve assets from the plugin APK. |
| Grid placement | `CustomGrid` + `GridLinesMapComponent.getCustomGrid()` | Singleton grid pattern. `grid.place(center, cols, rows)` creates grid but recalculates dimensions based on spacing — cannot be used for updates. |
| Grid updates | `GridTransformer` with UTM calculations + reflection | `grid.place()` does NOT work for updates — it recalculates rows/cols from spacing and corrupts the grid. Must use `GridTransformer.transformGrid()` which generates the full point buffer (`_points`, `_labels`, `_xLines`, `_yLines`) and sets CustomGrid internals via reflection. This is a 500+ line class using `Unsafe.allocateDirect()`, UTM coordinate math, and MGRS label generation. Must be ported 1:1 from original. |
| Drawing tools | `SET_TOOLBAR` / `UNSET_TOOLBAR` broadcasts | Section tool opens ATAK drawing tools via broadcast `"com.atakmap.android.maps.toolbar.SET_TOOLBAR"` with extra `"toolbar" = "com.atakmap.android.drawing.DRAWING_TOOLS"`. |
| Drawing preferences | `DrawingPreferences(mapView)` | Section tool saves/restores `shapeColor` and `fillAlpha`. Applies yellow + alpha=15 for sections. |
| CoT persistence | `CotEvent`, `CotDetail`, `CotMapComponent.processCotEvent()` | Save/load GRG files as CoT XML. |
| Detection | `InferenceAndroidGrgRuntime` (ONNX) | CV SDK for building detection. Requires `grg-tak-sdk-android-debug.aar` from original plugin. |
| Map markers | ATAK `Marker` + `MapGroup` | Detection markers created as ATAK Marker objects. |

## Key Gotchas Discovered

### 1. TAK-UI Version Matters
- 1.10.0.33-beta: `Spacer` was inlined away and not callable from external code. `Modifier` was at `gov.tak.ui.core.styling`. `ImageResource` was at `gov.tak.ui.core.ImageResource`.
- 1.10.0.102-beta: `Spacer` works. `Modifier` moved to `gov.tak.ui.styling`. `ImageResource` moved to `gov.tak.ui.resources`. `tak-ui-framework-api` became a separate transitive dependency. Required bumping `compileSdkVersion` from 32 to 35.

### 2. `ctx.executeTool()` vs `tool.run()`
Never call `tool.run(ctx, scope)` directly. Always use `ctx.executeTool(tool)` from `gov.tak.ui.interfaces`. Direct `run()` doesn't set up the display context, causing `IllegalStateException: displayContext was not associated with the UICtx`.

### 3. `grid.place()` Cannot Be Used for Grid Updates
ATAK's `CustomGrid.place(center, cols, rows)` internally recalculates dimensions based on the current spacing. Changing spacing then calling `place()` with the same cols/rows produces wrong dimensions. The original plugin solves this by ONLY using `grid.place()` for initial creation, then using `GridTransformer.transformGrid()` for all updates — which sets grid internals directly via reflection.

### 4. `grid.clear()` Destroys the Center Marker
Calling `grid.clear()` removes the center marker, which closes any open radial menu. The original never calls `clear()` during updates.

### 5. Radial Menu Icons MUST Exist
Every `MapMenuButtonWidget` added to a `MapMenuWidget` MUST have an icon set via `button.setIcon(widgetIcon)`. If the icon is null, ATAK crashes with `NullPointerException: WidgetIcon.getIconWidth() on a null object reference`.

### 6. Plugin Assets Location
Icons for radial menus must be in `app/src/main/assets/icons/`, NOT `app/src/atakMain/assets/icons/`. The `atakMain` source set doesn't include assets in the default Android build. `PluginMenuParser.getItem()` resolves assets from the plugin APK using the plugin's Context.

### 7. JDK Compatibility
Gradle 8.12.1 does NOT work with JDK 25. Must use JDK 17: `JAVA_HOME="$HOME/.sdkman/candidates/java/17.0.18-amzn"`. The ONNX Runtime AAR requires `compileOptions` with Java 17 source/target compatibility.

### 8. `PaneTool` vs `Pane`
- `Pane(...)` returns `Tool<Unit>` — fire and forget, no return value.
- `PaneTool<B>(...)` returns `Tool<B>` — pane can return a typed result via `continuation.resume(value)`.
- Both map to ATAK's `DropDownReceiver` under the hood.

### 9. TAK-UI `Tab` Parameter Name
In TAK-UI 1.10.0.102, the `Tab` data class parameter is `content` (matching source), but in 1.10.0.33 the deployed JAR had `contents`. Trust compile errors over source tree reads when the source and artifact versions differ.

### 10. Wildcard Imports Don't Always Work
`import gov.tak.ui.core.components.*` does NOT pick up `Spacer` in some TAK-UI versions because it's an inline function that gets eliminated from bytecode. Use explicit import: `import gov.tak.ui.core.components.Spacer`.

## Current State

### What Works
- Plugin loads in ATAK, toolbar icon appears in Tools menu
- Clicking tool icon toggles floating ActionBarView toolbar
- Grid button creates 10x8 grid at 100m spacing at map center
- Grid center marker is clickable with custom radial menu (Delete, Settings, Rows, Cols, Spacing, Lock)
- Radial menu icons load from `assets/icons/`
- Section button opens/closes ATAK drawing tools with yellow color + transparent fill
- Section tool saves/restores original drawing preferences
- Detect button shows confirmation dialog then runs detection
- Label button activates manual marker placement mode with map touch listener
- Menu button opens Grid Settings pane (3 tabs: File, Grid, Section)
- Grid Settings pane has +/- buttons for rows/cols/spacing

### What Needs More Work
- Grid updates from radial menu +/- need the full GridTransformer (ported but may need on-device testing)
- Grid Settings pane styling is basic (white theme, not dark like original)
- Detection logic is stubbed — `DetectionCoordinator` calls aren't wired to actual ONNX inference
- Capture/Export dialog not implemented (split view with preview)
- Save/Load GRG partially implemented (CoT persistence exists but not fully wired to UI)
- SwipeRelabelManager not ported
- Deep link support not implemented
- Per-overlay edit dialogs (Edit Grid, Edit Compass, etc.) not implemented

## Build & Deploy

```bash
# Install ATAK
./scripts/deploy_atak.sh

# Build plugin (must use JDK 17)
JAVA_HOME="$HOME/.sdkman/candidates/java/17.0.18-amzn" ./gradlew assembleCivDebug

# Install plugin
JAVA_HOME="$HOME/.sdkman/candidates/java/17.0.18-amzn" ./gradlew installCivDebug

# If TAK artifact registry is down, build offline
JAVA_HOME="$HOME/.sdkman/candidates/java/17.0.18-amzn" ./gradlew assembleCivDebug --offline

# Start ATAK
JAVA_HOME="$HOME/.sdkman/candidates/java/17.0.18-amzn" ./gradlew startATAKCivDebug
```

## File Structure

```
app/src/atakMain/kotlin/com/atakmap/android/aigrg/
├── AiGrgPlugin.kt                    — TakUI.plugin entry point
├── config/
│   ├── ColorConfig.kt
│   └── GrgPluginConfig.kt
├── domain/model/                     — All data models (ported 1:1)
├── map/
│   ├── CoordinateConverter.kt        — MGRS/DMS via ATAK APIs
│   └── MapEventListener.kt
├── service/
│   ├── BuildingDetectionHandler.kt   — CV SDK wrapper
│   ├── DetectionCoordinator.kt       — Detection orchestration
│   ├── GRGBuildManager.kt            — Build lifecycle
│   ├── GRGCaptureProcessor.kt        — Map tile capture
│   ├── GRGCotPersistence.kt          — CoT XML serialization (ported)
│   ├── GRGExporter.kt               — KMZ/PDF/JPEG export (ported)
│   ├── GRGGridManager.kt            — CustomGrid management (ATAK native)
│   ├── GRGRenderer.kt               — Overlay rendering
│   ├── GridABC123LabelManager.kt
│   ├── GridTransformer.kt            — UTM grid transform (ported 1:1, 250 lines)
│   ├── MarkerManager.kt
│   └── SectionMarkerManager.kt
├── ui/
│   ├── GrgToolbar.kt                 — ActionBarView toolbar (ATAK native)
│   ├── GrgViewModel.kt               — MVVM state
│   ├── components/
│   │   └── GrgPreviewComponent.kt    — Component.programmatic ImageView
│   ├── screens/
│   │   ├── DetectionScreen.kt        — PaneTool with progress/stats
│   │   ├── ExportOptionsScreen.kt    — PaneTool with checkboxes
│   │   ├── GridSettingsPane.kt       — Pane with 3 tabs (TAK-UI)
│   └── tools/
│       └── SectionCreationPane.kt    — PaneTool with PolygonCreationTool
└── widgets/
    ├── GridMenuFactory.kt            — MapMenuFactory for radial menu (ATAK native)
    ├── GridRadialMenuManager.kt      — Radial menu actions (stub)
    ├── GridToggleWidget.kt
    ├── SectionEditDetectionReceiver.kt
    ├── SectionToolStateManager.kt    — Drawing pref save/restore (ported)
    └── ShapeMenuFactory.kt

app/src/main/assets/icons/            — 25 PNG icons for radial menus
app/src/atakMain/res/layout/          — grg_capture_toolbar_action_bar.xml
app/src/atakMain/res/drawable/        — 39 drawable resources
```