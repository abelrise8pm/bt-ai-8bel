

## Draft: feat: modernize RadialMenu with declarative builder, Reactive state, StateSpace

### Overview
Replaces the @FragileTakUIApi RadialMenu (legacy XML wrapper, flat menus only) with a declarative API on the modern
kernel (IMapMenuWidget, IMapMenuButtonWidget, MapMenuFactory). Aligns with SOMPE-5914 (ActionBarMenu)
conventions for new @UI primitives.

### Approach
New builder. RadialMenuBuilder DSL with button { } and recursive submenu { }. Per-button enabled/visible
and per-button + whole-menu geometry. @FragileTakUIApi dropped; constructors marked @ExperimentalTakUIApi.
SOMPE-5914 alignment. enabled/visible use Reactive<T> (not StateFlow). RadialMenu exposes
stateSpace: StateSpace<Unit> so structure is unit-testable without a device.
ATAK actual rewritten. Programmatic widget construction (no XML, no broadcast intents). Reactive state via a
Reactive.observe(ctx, onChange) listener helper, cleaned up via ctx.invokeOnCancellation. PerItemMenuRegistry
replaces XML-in-metadata for per-UID attachment. New PluginScope.radialMenuFactory { } for plugins to handle
long-press on any item.

### Details
Legacy concretes are required. ATAK ships modern (gov.tak.platform.*) and legacy (com.atakmap.android.*) widget
classes. Render paths do unchecked downcasts to legacy:

MenuLayoutBase.layoutAsSubmenu casts to legacy MapMenuButtonWidget (modern crashes on submenu click).

GLMapMenuButtonWidget.onButtonIconChanged casts to legacy WidgetIcon (modern Icon NPEs on render).

Both fixed. Same trap likely applies to other widget types we haven't audited.

Plugin icons. asset:/// URIs in MapDataRef resolve against host ATAK's assets, not the plugin's. Switched to

self-contained base64:// data URIs for both drawable and asset paths.

WinTAK / TAK-X. Signatures updated. WinTAK accepts but no-ops submenu / enabled / visible (C# wheel-menu
renders flat items only). TAK-X stays TODO(). No regressions.

Routes. Per-route-part menus (editMenu / shapeMenu / etc. metadata XML) don't translate. setControlPointRadial
is a stub for now. Routes attach a single menu via the registry. Per-part factories are a follow-up.

Tests. RadialMenuStateSpaceTests (commonTest, 3 tests) covers element shape, submenu flattening, and perform

tolerance. State-space classes are pure Kotlin (no Android mocks needed).

Verification. All targets compile (5.5, 5.7, WinTAK, TAK-X). 152+3 unit tests pass. Side-loaded on ATAK 5.5 via
takui-grg-plugin-discovery (the proving-ground migration).

Followups: reactive text on buttons; wire background; WinTAK submenu binding; per-route-part factories.

### Quality Checklist
Basic checks:
* Does the code compile?
* Did the tests pass?
* Does the code follow the TAK-UI Style Guide?

### Testing strategy / Verification:
* If adding a new feature, have appropriate tests been added?
* Could examples be added to hello-world? Proven in takui-grg-plugin-discovery.
* Screenshots? Device-tested on ATAK 5.5; can add if requested.
* Bug-fix unit test? N/A, feature work.

### Documentation:
- Has new code been properly documented?
- API docs (KDoc)?
- Module.md? N/A.

**Developer manual?** Worth a follow-up entry on authoring new @UI primitives (Reactive<T> + StateSpace +
@ExperimentalTakUIApi).

If changes have been made to the API, has the documentation been properly updated?

Companion MR for hello-world / template repos? TBD.

### ACTIVITY
Josh: Hey, please add comments. Don't hold back. I just need to know if I'm on the right path. Need to understand the expectation with WinTAK and how we should proceed.
-- Nathan: Hey Josh, just got back in office. Will keep looking, but at first glance, this looks like awesome work and a good write-up! :)
-- Nathan: I think Malachi will also be doing some testing on some of our existing plugins to make sure this does not cause any unintended regressions. 

Nathan: 
> Worth a follow-up entry on authoring new @UI primitives (Reactive<T> + StateSpace + @ExperimentalTakUIApi)
Nathan: Yes, that's a good point. Do you mean a guide for TAK-UI developers showcasing how to build new implementations of "core" APIS? (e.x. widget implementations, tool implementations, etc...)? I think this is something jeremy may find helpful as well.
I can see if I try to do a quick write-up. At first glance though, I think you've done a good job at following the existing patterns.
Josh: Yeah, exactly that. A few things came up while matching `ActionBarMenu` that would be worth capturing in a guide:
* Reactive<T> vs StateFlow<T> on public surfaces (per your call, Reactive internal-only for now)
* exposing StateSpace for testability (one Element per interactable, hashCode keying, perform delegating to children)
* @ExperimentalTakUIApi placement (constructor functions yes, value classes no, to avoid forced opt-in across internal callers)

--

Nathan: `tak-ui/tak-platform-api/xxx/atakMain/kotlin/xxx/tak/ui/map/RadialMenu.atak.kt ` Good, updating this to an `ImageResource` has been something that's been bothering me for a long time. I am assuming this "just works" with the auto-generated `Res.drawables` from the tak-ui gralde plugin?
-- Josh: Yeah, should work. The drawable branch of `toKernelIcon` calls `getResourceID(resourceContext)`, which is just Resources.`getIdentifier(name, "drawable", packageName)`, same path `Res.drawable.foo` lands on. Asset fallback covers raw plugin assets under assets/ where there's no R-class entry. Tested both during device validation in the discovery plugin.

Nathan: I believe updating with the latest master may fix the CI issues on this branch.

Nathan: `tak-ui/tak-platform-api/xxx/commonMain/kotlin/xxx/tak/ui/map/RadialMenu.kt `
Nathan: So `Reactive` is kind of a new thing designed to support the new `StateSpace-based` testing API.
Until the API has been vetted for longer and stabilized, I think it would probably be better for public APIs to use `StateFlow` instead.
(But also: This is great! We've been thinking about adding something similar for a long time, but just never got around to it.) To be clear: You can still use `Reactive` internally, I just want the public API to use `StateSpace` for now.

--> Josh M: Changed this line in version 3 of the diff 23 minutes ago 
--> Josh M: changed this line in version 4 of the diff 23 minutes ago

Josh M: Switched `enabled/visible` back to `StateFlow<Boolean>` on the public side. ATAK actual collects them on a per-menu `CoroutineScope` cancelled by `ctx.invokeOnCancellation.` Kept s`tateSpace: StateSpace`<Unit> since it's a separate concern.

Nathan: `tak-ui/tak-platform-api/xxx/commonMain/kotlin/xxx/tak/ui/map/RadialMenu.k`
Nathan: Is this a new feature in ATAK? I wasn't tracking this. One minor concern I have is whether or not this feature (having a background per each radial button) is supported on all TAK platforms? If not, we may want to investigate a way to try to make this an ATAK-specific API.
--> Joshua Miller changed this line in version 3 of the diff 23 minutes ago 
--> Joshua Miller changed this line in version 4 of the diff 23 minutes ago 
-- Josh: This is a good callout. I don't have notes on this one and I can't remember exactly what I was thinking. I may have been confused and forgot to remove it. That's my bad.

Nathan: `tak-ui/tak-platform-api/xxx/commonMain/kotlin/xxx/tak/ui/map/RadialMenu.kt`
Nathan: What is `layoutWeight` used for? I am wondering whether or not this is the best API for radial menus. IIRC I think at least previously ATAK specified things like this using angles (e.x. "this radial button spans 60 degrees, this radial button spans 90 degrees). Is that not the case anymore in the new (non-XML) APIs? I'm also wondering how other platforms are handling this currently.
-- Josh: The modern ATAK kernel uses relative weighting via `IMapMenuButtonWidget.setLayoutWeight(Float).` A button with weight 2.0 gets twice the arc of one with 1.0. Combined with `coveredAngle`, you get the same effect as fixed degrees: `coveredAngle = 360`, weights [1, 1, 2, 2] gives 60/60/120/120 automatically. The advantage over absolute angles is that adding or removing a button doesn't force recomputing every other button's degree value. WinTAK's C# wheel-menu only renders flat equal-weight today, so the param is accepted but ignored. TAK-X has no construction API. Both noted in code as known limitations. If you'd rather just expose `arcSpan:` Float directly, that maps 1:1 to the same kernel call `(coveredAngle / sum(weights) * weight)`.

Malachi: I tried this new api on Combat Swim and it appears to work great, with the caveat that after this we will need to refactor a bit to use the "enabled" and "selected" parameters on a radial button. We have been depending on the string version which does a lot of work for us under the hood, and we won't be able to use that after this. As long as I can find a way to replace the "pairingline_on" and the "nonremoveable" flags then that would be fine.
-- Josh: Thanks for running it through Combat Swim. Both `pairingline_on` and `nonremoveable` should translate to a `StateFlow`<Boolean> derived from item state. If the flag lives in `MapItem` metadata, you can wrap `getMetaBoolean(...)` in a flow that re-emits on metadata change (I believe). 

Nahtan: `tak-ui/tak-ui-core/xxx/atakMain/kotlin/xxx/xxx/ui/plugin/RadialMenuFactoryComponent.kt` 
Nathan: I'm fine with this API, but we might want to add a service interface for this capability in `tak-platform-api`. This will make it easier to stub out calls with test fakes in unit tests. I know that at the very least ATAK and WinTAK have a comparable capability to this.
Josh: Added `IRadialMenuFactoryService `+ expect class `RadialMenuFactoryService` modeled on `ITakMapService`. ATAK actual wraps `MapMenuReceiver.registerMapMenuFactory` and returns an unregister lambda. Wired up in DI on each platform `(TakUI.android.kt, TakUI.wintak.kt, TakUI.takx.kt)`, with `FakeRadialMenuFactoryService` in tak-ui-testing (has a resolve(target) helper). The `radialMenuFactory` { } DSL moved to `commonMain` now that the service abstracts the platform call. WinTAK actual logs a warning and returns a no-op unregister, same shape as how submenu already handles the WinTAK gap. TAK-X throws.

Malachi: `tak-ui/tak-platform-api/xxx/commonMain/kotlin/xx/tak/ui/map/RadialMenu.kt `
Malachi: Why replace the two parameter `onClick`? I don't see how this makes a practical difference, but it does introduce a new class so unless I'm missing something it introduces unnecessary complexity
Nathan: I actually kind of like this TBH. It adds a bit more self-documentation to the parameters of the `onClick`. Users can see exactly what the two parameters are supposed to represent by looking at the parameter names.
Josh: Two things behind it. Named access reads better than positional `(GeoPoint, HasRadial)` at the callsite, and bundling them as a class means we can add e.g. `modifierKeys` or `wasLongPress` later without breaking the lambda signature. If there's a downstream cost I'm not seeing, lmk.

--

Nathan: `tak-ui/tak-ui-core/xxx/commonTest/kotlin/xxx/tak/ui/map/RadialMenuStateSpaceTests.kt `
Nathan: This is a good start. I won't hold up the MR for this, but it would be good as future work to add some better integration for these.
In other words, I should be able to execute a TestScript, and go through actions like:

* Drop a marker on the map
* Click on the marker
* Click on item with X text in the radial menu
* Verify that the radial menu action is actually performed.
within a `platformTest.`
-- Josh: Yeah, agreed. The state-space tests cover structure (button counts, submenu flattening, perform tolerance) but don't drive the action side. Wiring TestScript integration would need radial-menu Elements addressable by text/identifier the same way withIdentifier(...) works for Button. Straightforward extension, but possibly out of scope here. I am open to exploring it though 😄

--

Malachi: `tak-ui/tak-platform-api/src/atakMain/kotlin/gov/tak/ui/map/RadialMenu.atak.kt `
Malachi: It's more idiomatic in Kotlin to use the property setter syntax, i.e `innerRadius = geometry.innerRadius` This can be fixed in most places where you call a `set` function

Josh: Good call, swept the file. Most converted cleanly: `innerRadius, coveredAngle, startAngle, widgetIcon, text, layoutWeight, submenu, isDisabled, isVisible. Kept setButtonWidth(...)` as a method call since the Java side doesn't expose a matching property. Left builder fluent APIs alone `(WidgetIcon.Builder().setSize(...).setAnchor(...)).` [Most Recent Message, minutes ago as of 22:31]

Malachi (5 hours ago) I believe that wintak does support submenus, however that would require a C# change since we don't currently have an api for that. It's probably out of the scope of this MR, so we should probably track that at some point.
>Josh flagged this, huge dependency.. C# development
-- Josh: Agreed, out of scope here. The WinTAK actual currently logs a one-time warning and renders submenus as flat buttons. Noted in code as a known limitation. I was actually waiting for someone to talk about the C# change. I didn't know how you would all feel about that, so I wanted some feedback

---

Joshua M added 21 commits 1 hour ago
b30522xx...5c91a2xx - 20 commits from branch master
c842e7xx - feat: `modernize RadialMenu with declarative builder, Reactive state, StateSpace`
Compare with previous version

Joshua M added 1 commit 23 minutes ago
972fdcxx - fix: address MR open review `(StateFlow, factory service, drop background)`
Compare with previous version

Joshua Miller added 1 commit 23 minutes ago
972fdcxx - fix: address MR open review `(StateFlow, factory service, drop background)`
