# TAK Development and Release Process

A PM reference for understanding the end-to-end process — from writing code to getting the plugin in operators' hands. Includes enough developer terminology to stay oriented in engineering conversations.

---

# STAGE 1 - SOURCE
Where code lives, how it is organized, and how changes move
---
**Process Steps**

- Engineers write code in one or both active repos on TAK Forge — `aigrg` (the plugin operators use) and/or `grg-tak-platform-sdk` (the detection/CV model layer). Changes to the TAK UI exploratory work happen in `takui-grg-plugin-discovery`.
- When a change is ready, the engineer opens a Merge Request (MR) on TAK Forge — a formal request to merge their branch into `master`
- Another engineer reviews and approves the MR. Two approvals are required on every MR into `master` — a NIST compliance control. Based on observed MRs, Rise8 engineers have been approving. Jared Hepp (TPC) has also approved Master List MRs.
- MR merges to `master`, which automatically triggers the CI/CD pipeline (Stage 2)
- Rise8 Internal GitLab is used for epics and issues board only — no code development happens there
- When registering a release, Rise8 also submits a separate MR to `git.tak.gov/devsecops/tak-plugin-master-list` — this is metadata only (plugin name, version, distribution info), not code. TPC's Jared Hepp reviews and merges it. This is a prerequisite to the release pipeline, not development work.
- There are **3 separate active pipelines** — one per branch: `master`, `maintenance-5.4`, and `maintenance-5.6`. Each triggers independently when code merges to that branch. Production `.mil` builds run from the maintenance branches, not master.

---

**Key Terms and Concepts**

**TAK Forge** (`git.tak.gov/rise8`) — the customer's GitLab, hosted by the government, operated by TPC. Active development home for Rise8. Requires AppGate (VPN) to access.
- Confirmed repo URL: `https://git.tak.gov/rise8/rise8-atak-grg-plugin.git`

**Rise8 Internal GitLab** (`gitlab.gl.rise8.us/.../tak/grg-plugin`) — Rise8's own GitLab. Stories and issues board only.
- Confirmed repo URL: `git@git.gl.rise8.us:rise8-all/delivery/engagements/socom/grg-plugin/rise8-atak-grg-plugin.git`

**The four Rise8 repos on TAK Forge**
- `grg-tak-platform-sdk` — the detection capability layer (CV model)
- `aigrg` — the plugin operators use on their device
- `rise8-wintak-grg-plugin` — Windows TAK version, not a priority this contract
- `takui-grg-plugin-discovery` — TAK UI exploratory work, Josh's prototype

**TAK Plugin Master List** (`git.tak.gov/devsecops`) — government registry of all approved plugins. Rise8's MR to register the AI GRG plugin was merged here by Jared Hepp (TPC) on April 10. Pipeline passed. This is a prerequisite step that unlocks the release process — not the release itself.

**Protected Branch** — a specific branch (e.g. `maintenance-5.6`) that triggers the trusted signing cert when the pipeline runs from it. Running from `master` produces an untrusted cert. TPC's signing service only issues the trusted cert from a protected branch. This is a required step before a `.mil` APK can be field-deployed.

**SDK (Software Development Kit)** — the TAK-provided toolkit the plugin is built against. The contract between the plugin and the TAK platform. Rule from Nik: develop on 5.7 (latest), release builds target 5.6 and 5.4 (fielded versions). One engineer handles the SDK bump, merges to `master`, team pulls.

**Plugin Versioning** — currently at `1.0` with no formal semantic versioning strategy. Josh raised this as a gap on April 17 — suggested semantic release or a parallel matrix in the GitLab CI. Kevan's interim direction: stick with `1.0.X` for now. SOCOM may have opinions on versioning convention. Longer-term strategy TBD.

---

**Stage 1: GAPS and OPEN QUESTIONS**

- Single source of truth confirmed: TAK Forge is the active development repo. Rise8 Internal GitLab is stories and issues only. Mirroring was discussed by Kevan but not formally implemented.
- Two approvals required on every MR into `master` — confirmed as a NIST compliance control. Rise8 engineers have been approving; Jared Hepp (TPC) approves Master List MRs.
- PM must-know: AppGate must be running to access TAK Forge. If repos are not visible, check that first.
- ~~Maintenance branches (maintenance-5.4, maintenance-5.6) not confirmed building.~~ **RESOLVED April 21.** Maintenance branches confirmed building. 5.4 build published to Package Registry April 21 by Kevan.
- **New rule (April 21):** Before sending any maintenance branch build to the field, verify that its commit history matches the last known good master build. The 5.4 branch was confirmed against master this week before the link was sent to Nik. This is now a required step in the handoff checklist.
- **OPEN:** Plugin versioning strategy not defined. Josh proposed semantic release or GitLab CI parallel matrix. Kevan interim direction: `1.0.X`. No decision yet.
- **OPEN:** Tagged releases in the pipeline not implemented. Josh raised April 17, Kevan deferred. Still open.
- ~~Parallel matrix pipeline — replacing manual branch maintenance.~~ **DEPRIORITIZED April 21 by Kevan.** Matrix build approach started by Josh but deprioritized given uncertainty on release cadence. Three-branch model remains in place for now.

---

# STAGE 2 - BUILD
How code becomes a testable artifact
---
**Process Steps**

- Engineers push **code** (not an APK) to TAK Forge via AppGate — TAK Forge compiles the code and produces the APK itself
- Every MR into `master` requires **two approvals** before it can merge — a NIST compliance control carried over from the competition
- Once the MR merges to `master`, the CI/CD pipeline triggers automatically — no manual action needed
- The pipeline runs a **Fortify security scan** against the code. Rise8 does not need to run security scanning internally — TAK Forge handles this. Kevan explicitly recommended against setting up internal pipelines for scanning during this 8-week period.

- The pipeline produces two APK variants:
  - `.civ` tag — civilian build, default, available for testing immediately after a successful pipeline run
  - `.mil` tag — military build, required for official production distribution. This variant requires two things: (1) a pipeline config change on Rise8's side to add `variants: 'civ mil'` — identified by Josh, assigned to Thomas; and (2) the pipeline must run from a protected `maintenance-X.Y` branch to trigger the trusted signing cert. Running from `master` produces an untrusted cert that ATAK rejects on device.
  - As of April 10, signed .mil APK was produced but ATAK rejected it — cert was `CN=TAK Product Center ATAK Untrusted Plugin Release`. Root cause identified by Brandon (TPC): the `aigrg.metadata.json` file in the TAK Plugin Master List was on the wrong schema (v4/v2 mix instead of v3). Thomas submitted MR !627 "fix: fit aigrg metadata to v3 template." Jared Hepp reviewed, added corrections, and merged it April 10. Pipeline passed. Brandon confirmed: "a protected master branch will produce a trusted APK as long as the metadata is formatted."
  - ~~ProGuard blocking `assembleProduction`.~~ **RESOLVED April 14 by Josh.** Root cause: manually-set CI/CD variables (`takrepo.user` and `takrepo.password`) were overriding the pipeline's auto-injected credentials, blocking the connection to `takrepo` where the ProGuard mapping file lives. Removing those variables restored the connection and the mapping was successfully pulled. This was a Rise8-side issue, not TPC.
  - `assembleProduction` **confirmed passing April 17 — all 7 jobs green.** This is the only job that produces a signed, field-deployable `.mil` APK. `assembleMilOdk` and `assembleMilSdk` are unsigned and will be rejected by ATAK on device. Always use `assembleProduction` for production validation and field handoff.

- Built APKs are stored in **Artifactory** (TAK Forge's artifact storage) after the pipeline completes

- Engineers and Abel can access the latest build one of two ways:
  - Download the APK directly from Artifactory and manually install it on the Android device
  - Open the plugin project in Android Studio, connect to AppGate, and run "Sync Gradle Project" — it automatically pulls the latest code and SDK without a manual APK download (Josh showed Abel this on April 6)

---

**Key Terms and Concepts**

**APK (Android Package Kit)** — the installable file format for Android apps and plugins. Engineers push code to TAK Forge; TAK Forge builds the APK. Rise8 never manually builds and ships the APK file itself.

**`.civ` vs `.mil` tag** — two variants of the same APK, just with different signing. Functionally identical files. The `.civ` tag is produced automatically. The `.mil` tag requires a pipeline config change on Rise8's side and must run from a protected branch to receive the trusted cert. Kevan confirmed on April 8: Rise8 should only produce debug and .mil variants — the pipeline should not be generating signed .civ variants. That is a config issue Thomas owns to fix.

**Keystore** — a secure file holding the private keys the signing service uses to stamp the cert onto the APK. If the keystore path is misconfigured, the pipeline cannot sign the build. This was the original blocker earlier in the sprint — resolved by Josh on the Rise8 side.

**Signing Service** — TPC's automated system that stamps a build with a certificate proving it is safe to install. ATAK checks this stamp before loading a plugin. Rise8 has no access to this service — Brandon LaPorte at TPC owns it.

**Certificate (Cert)** — the digital stamp applied by the signing service. Two types: trusted production cert (what operators need) and untrusted cert (development/testing only). If the wrong cert is applied, ATAK rejects the plugin. Cert issue resolved April 10 — root cause was the metadata schema mismatch, not the signing service itself.

**MOA/MOU (Memorandum of Agreement/Understanding)** — the government-to-government document that authorizes the TAK Forge team to update the pipeline settings and enable `.mil` APK production. The Program Office submits this to TAK Forge, not Rise8.

**CI/CD Pipeline** — the automated sequence that runs on TAK Forge after every merge to `master`. Compiles the code, runs Fortify, and produces the APK. Rise8 does not trigger or manage this pipeline.

**Fortify** — security scanning tool that runs automatically as part of the TAK Forge pipeline. SOW-defined pass thresholds (4.4.2): zero critical, zero high, fewer than 10 moderate, fewer than 20 low. Rise8 does not need to replicate this scanning internally.

**Artifactory** — TAK Forge's artifact storage. Where the built APKs live after the pipeline finishes. Engineers and Abel can pull builds from here.

**AppGate** — the Zero Trust Access (ZTA) VPN required to connect to TAK Forge. Required to push code, access repos, and sync via Android Studio.

**ProGuard** — Android's code optimization and obfuscation tool. Runs during the build to shrink and rename code. Requires a mapping file (`atak.proguard.mapping`) from `takrepo` so the plugin can reference ATAK's obfuscated class names correctly. The pipeline pulls this automatically — but only if no manual CI/CD credential variables are overriding the auto-injected ones. Blocker resolved April 14 by Josh: manually-set `takrepo.user` and `takrepo.password` variables were removed, restoring the pipeline's connection to `takrepo`.
- **Forward-looking rule (April 17):** Reflection-based code patterns will be stripped by ProGuard on release builds, causing silent failures. Engineers must use direct typed calls instead of reflection wherever possible. Josh fixed existing instances April 17 — but this rule must be maintained as the codebase grows. When adding new code, flag any reflection usage for ProGuard review.

**CI/CD Variables — critical rule:** Do not manually set `takrepo.user`, `takrepo.password`, `CI_JOB_ARTIFACTORY_TOKEN`, or `GITLAB_USER_EMAIL` on the project. These are auto-injected by the pipeline templates. Manual overrides break the connection to `takrepo` and cause ProGuard mapping failures. Confirmed April 14.

**Assemble Jobs** — the individual build jobs visible inside a pipeline run on TAK Forge. Each job produces a specific APK variant. As of April 17, all 7 jobs pass: `assembleCivOdk`, `assembleCivSdk`, `assembleMilOdk`, `assembleMilSdk`, `assembleProduction`, `buildUserManual`, `testRelease`. `assembleProduction` is the job that produces the final signed, production-ready `.mil` APK — the only one suitable for field handoff. The others are unsigned development builds.

**release_internal** — the pipeline job that publishes a completed build to the Package Registry, creating the shareable link that gets sent to Chad and Nik. This job is separate from `assembleProduction`. It is marked "allowed to fail" in GitLab, which means it fails silently — the overall pipeline shows green even when this job fails. If no new entry appears in the Package Registry after a pipeline run, check `release_internal` first. As of April 21, these jobs were timing out at the GitLab CE 17 default of 60 minutes. **RESOLVED April 22** — Josh built `pads-fast` as a drop-in replacement for the TAK Forge PADS sidecar. See `pads-fast` below.

**pads-fast** — a Rise8-built replacement for TAK Forge's `production-artifacts-delivery-service` (PADS) sidecar, which is what `release_internal` uses to publish APKs to the Package Registry. The upstream PADS service was taking 50-60 minutes per publish due to three root causes: (1) unnecessary re-compression of APKs (which are already zip files), (2) a single-worker bottleneck that caused concurrent jobs to queue serially, and (3) HTTP/2 usage that blocked traffic from getting through. `pads-fast` fixes all three. All other PADS behavior is preserved byte-identical — signing validation, registry push, auth flow, and package coordinate derivation are unchanged. Lives at `git.tak.gov/rise8/pads-fast`. Runs a daily cron job to stay in sync with upstream PADS changes. Pipeline updated April 22. **Confirmed working April 22:** job completed in 3m 37s; all 5 ATAK versions published successfully at `git.tak.gov/rise8/aigrg/-/packages/448626`. Note: Josh flagged TPC should be made aware so they can fix it on their end — Kevan's call on timing.

**Job artifact links vs Package Registry links** — a job artifact link (e.g. `https://git.tak.gov/rise8/aigrg/-/jobs/XXXXXXX`) is a direct download tied to a specific pipeline run. These are temporary and can expire. Always use the Package Registry link (`https://git.tak.gov/rise8/aigrg/-/packages/`) for any build sent to Chad or Nik. Never send a job artifact link as a field handoff.

---

**Stage 2: GAPS and OPEN QUESTIONS**

- ~~Cert untrusted — ATAK rejected signed .mil APK.~~ **RESOLVED April 10.** Root cause was metadata schema mismatch in the TAK Plugin Master List (v4/v2 mix instead of v3). Thomas submitted MR !627, Jared Hepp merged it, pipeline passed.
- ~~ProGuard blocking `assembleProduction`.~~ **RESOLVED April 14 by Josh.** Root cause was manually-set CI/CD variables overriding auto-injected credentials. Removed. All 7 jobs confirmed passing April 17.
- Two-approval MR rule confirmed — NIST compliance control carried over from the competition. Still applies.
- Fortify scan failure behavior — does it block the pipeline or flag and continue? Not confirmed.
- **OPEN:** ProGuard rules require ongoing maintenance. As new code is added, reflection-based patterns must be reviewed and replaced with direct typed calls or explicitly protected. No formal process exists yet for catching this before it breaks a release build.
- ~~`release_internal` job times out at the 60-minute GitLab CE 17 default. All five version jobs failed April 21. Kevan ran the job manually as a workaround.~~ **RESOLVED April 22 by Josh.** `pads-fast` deployed as drop-in replacement for PADS sidecar. Manual intervention no longer required.
- **OPEN:** `release_internal` is marked "allowed to fail" — failures are silent and do not alert the team. If the Package Registry has no new entry after a pipeline run, this is the first place to check.

---

# STAGE 3 - TEST
How the build is validated before release

---

**Process Steps**

Testing has two distinct phases with different builds and different owners.

**Dev validation (engineer-owned):**
- Engineers test locally during development using `assembleCivSdk` builds (civ debug - fastest feedback loop, no signing required)
- Physical Android device is the primary and preferred test environment. Emulator is acceptable for early functional checks only.
- Engineers run the model over a target area and verify detection is consistent across multiple runs
- Engineers are responsible for SDK backwards compatibility: the plugin must run on 5.6 and 5.4 even though it is developed against 5.7

**PM acceptance testing (Abel-owned):**
- Abel installs and validates using `assembleProduction` only. This is the only job that produces the signed `.mil` APK that ATAK will accept on device.
- `assembleMilOdk`, `assembleMilSdk`, `assembleCivOdk`, and `assembleCivSdk` all produce unsigned builds. ATAK will reject them on install or they will not represent field conditions. Do not use these for PM acceptance testing.
- Acceptance testing confirms: plugin installs without error, ATAK loads it, detection runs and returns a consistent count across 3-5 consecutive runs.

**Field handoff gate:**
- After Abel confirms acceptance testing passes, Kevan sends the Artifactory link to Chad Molyet
- The Program Office handles distribution from that point. Rise8 has no visibility into what happens after.
- Rise8 does not have direct access to end users or operators in the field. Nik and Jonathan Miller serve as the customer proxy for field-level feedback.

---

**Sprint 2 — Bug Fix Specific Testing**

These items are not standard process. They are specific to what was found, fixed, and learned in Sprint 2.

- **Clean test patch** - zoom fix and intermittent detection fix confirmed stable across 4-5 consecutive runs by Josh. Both tickets closed. Clean test patch complete.
- **Debug snapshots** - temporary image captures taken during detection runs must be removed or hidden behind a debug flag before production. Josh flagged these are still in the codebase and add extra processing overhead. Ticket needed.
- **Tile loading guarantee** - Zach's MR submitted April 17. Detection on large areas may still be inconsistent if tiles have not fully loaded before detection begins. Confirm merged before field handoff.
- **Zoom level 19** - confirmed as the sweet spot for tile fidelity during bug fix validation (Zach pairing session, April 17). The model always runs at this level regardless of what the operator sees on screen. Level 18 produced fewer detections; level 20 produced the same count with no benefit. This was a Sprint 2 testing discovery, not a permanent process requirement.
- **TIFF conversion silent failure** - when the plugin cannot convert an image to TIFF for the model, it falls back silently to a white canvas backup image with red error text. The model detects letter shapes on that canvas and returns them as buildings. The detection output looks valid (a count appears, results show on map) but the buildings flagged are not structures. No error is shown to the operator. This failure is only visible in the logcat debug log. Diagnosed by Josh, April 17. Root cause on Abel's device: wrong APK installed (pre-fix version). Resolved by installing commit fc1f248 APK and clearing content/maps cache.
- **Before/after comparison for April 22 demo (open)** - Abel needs a step-by-step recipe to compare detection before and after the sliding window fix. Requires knowing which commit represents the old behavior, how to install two versions, and which build variant to use for the comparison. Zach and Josh to provide the recipe.

---

**Key Terms and Concepts**

**Emulator** — a software simulation of an Android device that runs inside Android Studio. Allows testing without a physical phone. Useful for early functional checks but does not fully replicate field conditions.

**Local dev deploy scripts** — two commands engineers use to get the plugin running quickly during development without manually pulling from Artifactory:
- `./scripts/deploy_atak.sh` — sets up ATAK in the emulator
- `./gradlew :app:installCivDebug` — installs the civ debug variant directly to the connected device or emulator

**SDK backwards compatibility** — confirming the plugin builds and runs correctly on older SDK versions (5.6 and 5.4) even when the codebase is developed against the latest (5.7). Required because operators in the field are on those older versions.

**`.civ` vs `.mil` tag testing** - both variants run identical detection code. The only difference is signing. If testing whether detection works correctly, a `.civ` build gives valid results for that question. If testing whether an operator can install and run the plugin in the field, `assembleProduction` is required. The cert issue that previously caused ATAK to reject signed `.mil` APKs was resolved April 10.

**Device Validation** — the act of installing a signed APK on a physical Android device and confirming ATAK loads it without a signing or incompatibility error. This is the final test gate before a build can be handed off for field deployment. Rise8 owns this step; TPC owns fixing any cert issues that cause rejection.

**APK decision rule — which build for which purpose:**

| Build | Who | When | Why |
|---|---|---|---|
| `assembleCivSdk` | Engineers | Daily dev | Fastest iteration, no signing, basic functional checks |
| `assembleProduction` | Abel (PM) | Before field handoff | Only signed `.mil` build ATAK accepts on device |
| `assembleMilOdk` / `assembleMilSdk` | Not for device testing | - | Unsigned - ATAK rejects on install |
| `assembleCivOdk` | Engineers | Milestone releases | `.civ` release candidate testing |

**Tile caching** - ATAK in offline mode only uses map tiles already stored locally on the device. If tiles have not been cached by panning and zooming across a target area while online, those tiles appear blank and detection will fail or return garbage results. This is expected offline behavior, not a bug. Before running any test or demo, pan and zoom the target area while online to pre-cache tiles. The model always runs at zoom level 19 regardless of what the operator sees on screen.

**ATAK-MIL vs ATAK CIV + DoD Plugin** — these are not the same environment. ATAK-MIL requires two APKs installed in sequence: (1) the CIV core and (2) the MIL flavor plugin. Adding the DoD plugin to ATAK CIV alone does not replicate ATAK-MIL. Confirmed during April 10 device validation attempt.

**Confirmed working install sequence for PM acceptance testing (updated April 17):**
1. Ensure AppGate is running.
2. Uninstall any existing Rise8 GRG plugin from the device (Settings > Apps > uninstall). On Samsung devices, backup may auto-restore plugins - verify only one version of the plugin is installed before proceeding.
3. Download ATAK 5.6.0.16 from tak.gov: CIV core APK and MIL flavor plugin APK. Install CIV core first, then MIL flavor plugin. The ATAK version on device must match the build target - mixing versions causes an incompatibility error.
4. On TAK Forge, navigate to the successful `assembleProduction` pipeline run. Download `artifacts.zip`. Unzip. Plugin APK is inside the `app/build/outputs/` folder.
5. Install the plugin APK on device - drag and drop into Android Studio while the device is connected, or use `adb install` from terminal.
6. Launch ATAK. Plugin should load without a signing or incompatibility error.
7. Navigate to the target area. Pan and zoom across it while online to pre-cache tiles before running detection.
8. Run detection. Confirm buildings are detected across 3-5 consecutive runs with a consistent count.

**INSTALL_FAILED_UPDATE_INCOMPATIBLE** — Android error when attempting to install an APK whose signing cert does not match the version already on the device. Fix: uninstall the existing version first, then install the new APK. If the error persists after uninstalling, the ATAK version on the device does not match the build target — confirmed April 10 when Rise8 devices were on ATAK 5.6.0.12 and the build targeted 5.6.0.16.

---

**STAGE 3: Process GAPS**

- **Testing structure is undefined.** No formal acceptance test criteria exists beyond "detection runs and returns something." What constitutes a passing PM acceptance test - count threshold, consistency across runs, specific target area - has not been agreed on with the team. Highest-priority gap for Stage 3.
- **Regression testing status is unconfirmed.** Thomas mentioned regression testing April 17 but whether it is formally set up as an automated process or done manually is unknown. Confirm with Thomas what it covers and what a passing result looks like.
- No structured feedback loop from operators in the field. All field-level signal flows informally through Nik or Jonathan Miller. Format and timing not defined.
- SDK backwards compatibility testing process not yet formally defined. 5.6 and 5.4 compatibility testing should be verified on each release build.

---

**Sprint 2 — Active BLOCKERS**

- ~~Physical device testing blocked - unsigned `.mil` APK.~~ RESOLVED. `assembleProduction` confirmed passing April 17. All 7 jobs green.
- ~~Tile loading guarantee fix not yet implemented.~~ Zach's MR submitted April 17. Confirm merged before field handoff.
- Memory leak investigation outstanding - flagged by Josh on April 6, ticket not yet created.
- **OPEN:** Regression testing process not formally confirmed. Thomas said "in progress" April 17. Confirm with Thomas.
- **OPEN:** Before/after comparison recipe for April 22 demo prep. Zach and Josh to provide step-by-step.

---

**Sprint 2 — PM ACTION ITEMS**

- ~~Confirm MOA/MOU status with Kevan.~~ Resolved - `assembleProduction` passing April 17.
- ~~Create tickets for Zach covering tile loading guarantee and grid capture.~~ Zach's MR submitted April 17.
- Confirm with Thomas: is regression testing formally set up? What does it cover? What constitutes a pass?
- Work with Zach and Josh to get the recipe for the April 22 before/after comparison: which old commit, how to install two versions, which build variant for the demo.
- Agree with Kevan on the acceptance test definition: what exactly does Abel need to confirm before sending "go" to Kevan to send Chad the Artifactory link?
- Create ticket to remove debug snapshots or hide behind a debug flag before production release.
- Create ticket for memory leak investigation flagged by Josh on April 6.

---

# STAGE 4 - RELEASE
How a validated build becomes an official release
---
**Process Steps**

- The engineer submits the **Plugin Initial Release PRR form** on TAK Forge (linked on the TAK Forge wiki under "Releasing a Plugin"). This is the official release submission — it captures plugin details, TAK version targets, and distribution guidance.
- Submitting the form automatically creates a Jira ticket in the PRR project at `issues.tak.gov/projects/PRR/issues/`. That ticket is how Nik tracks the release — without it, he has no visibility.
- Rise8 waits. A rotating TPC engineer (changes every two weeks) picks up the ticket and adds the plugin to the production CI/CD pipeline.
- Once TPC processes it, the plugin is live in the TAK registry and distributed according to the **MFR** — the government-signed document that defines who gets it, how, and under what conditions. Nik's side signs the MFR, not Rise8.
- **Note from the docs:** "Plugin release requests are most often actioned by the government's contractor at the government's request." Rise8 should not submit the PRR until Nik explicitly asks for it.
- **What actually happened in Sprint 2:** Rise8 used the MR route to the TAK Plugin Master List directly — Kevan submitted metadata, Jared Hepp (TPC) merged it and ran the pipeline. This served as the functional equivalent of the PRR initiation step. The formal PRR Jira form was not used — this was a workaround confirmed by Kevan.

---
**Alternate Path — Sending APK Directly to Chad and Nik**

This is an informal shortcut that sits outside the official release sequence. **COMPLETED April 17.**

- Abel sent Chad Molyet and Nik a direct link to the signed `.mil` build in the TAK Forge Package Registry (`https://git.tak.gov/rise8/aigrg/-/packages/`). The package contains the signed `.mil` release zip.
- No PRR needed, no TPC involvement — Chad and Nik received it directly
- This is not an official release and does not put the plugin in the TAK registry
- Useful for getting Chad and Nik an early build for user assessment testing while the formal PRR process is still in motion
- **5.4 build sent April 22.** Nik requested a 5.4 build for a mixed-fleet deployment. Package published to the Registry by Kevan on April 21 after manually running `release_internal`. Before sending, Kevan verified the 5.4 branch commit history matched the last known good master build. Always follow this verification step before sending any maintenance branch build to the field.

---
**Key Terms and Concepts**

**PRR (Plugin Release Request)** — the official release submission process. A web form on TAK Forge that, when submitted, auto-creates a Jira ticket. That ticket is the mechanism that gives Nik and TPC visibility into the release. Cannot be skipped for an official release.

**TPC (TAK Product Center)** — the government-operated team that runs the production CI/CD pipeline. A rotating TPC engineer handles PRRs, changing every two weeks. Rise8 has no control over turnaround time. Key TPC contacts on this contract: Jared Hepp (pipeline and Master List MRs) and Brandon LaPorte (signing service and cert issues).

**MFR (Memorandum for Release)** — a government-signed document that defines distribution guidance for the plugin — who gets it, how it gets distributed, and under what conditions. Nik's side signs it. Rise8 does not sign or control it. Confirmed in place for this release — Kevan had it, no new one required.

**TAK Plugin Master List** — the registry of all approved plugins at `git.tak.gov/devsecops`. Rise8's MR was merged by Jared Hepp on April 10. Pipeline passed. Prerequisite complete.

**Mattermost PRR Channel** — the communication channel on TPC's Mattermost where Rise8 can track PRR progress or ask questions. Alternatively, comments can be left directly on the Jira ticket.

---
**STAGE 4: PROCESS GAPS**

- What happens after TPC processes the PRR and the plugin is in the registry — how the Program Office handles distribution from that point is a "black box" to the team. Rise8 does not control or observe that step.
- How long TPC turnaround takes on a PRR ticket is unknown. The rotating engineer cycle (every two weeks) could affect timing.
- Whether Rise8 will always need Nik's explicit request before submitting a PRR, or if that changes for future releases, is not confirmed.

---

**Sprint 2 — Current Release Situation**

These are specific to where things stand right now — not standard process.

- ~~TAK Plugin Master List MR pending.~~ **RESOLVED April 10.** MR !627 "fix: fit aigrg metadata to v3 template" merged by Jared Hepp. Pipeline passed. Prerequisite complete.
- MR route used instead of PRR Jira form — confirmed workaround path for this initial release. Kevan confirmed MFR was already in place.
- ~~Direct APK handoff pending.~~ **COMPLETED April 17.** Abel sent Chad and Nik a link to the signed `.mil` build in the TAK Forge Package Registry. Chad and Nik are now conducting user assessment testing (see Stage 5).

---

**Sprint 2 — Active Blockers**

- ~~Cert issue blocking field handoff.~~ RESOLVED April 10.
- ~~ProGuard blocking `assembleProduction`.~~ RESOLVED April 14.
- ~~Direct APK handoff pending.~~ COMPLETED April 17. Link sent to Chad and Nik.
- **OPEN:** Formal PRR Jira ticket not yet submitted. Confirm with Kevan whether the MR route was sufficient for Nik's long-term visibility or if a separate submission is still needed.

---

**Sprint 2 — PM Action Items**

- ~~Confirm with Nik on PRR and MFR.~~ Direct handoff completed April 17. MFR confirmed in place.
- Confirm with Kevan: does the MR route satisfy Nik's visibility needs, or does a formal PRR Jira ticket still need to be submitted?
- If PRR still needed, track ticket at `issues.tak.gov/projects/PRR/issues/` and monitor Mattermost PRR channel.

---

# STAGE 5 - DEPLOY
How the plugin gets from the TAK registry to operators in the field

---

**Process Steps**

- Rise8 sends Chad Molyet (SOCOM DT) and Nik a direct link to the signed `.mil` build in the TAK Forge Package Registry. **COMPLETED April 17.**
- After receiving the build, Nik and Chad conduct **user assessment testing** — their internal validation before the build moves forward.
- Chad (DT) runs **regression testing** and submits for **Fortify scans** on SOCOM's side.
- Once clear, the build moves into **Nik's SOCOM Jira board**. Two columns track progress:
  - **Bureaucracy** — approvals, administrative steps, coordination. Nothing Rise8 can do to accelerate this. Rise8 currently has no visibility into this column.
  - **Field** — the build is moving toward actual field use by operators.
- **TPC's Jira and PRR process is a separate, parallel track** — distinct from SOCOM's Jira board. Both may be active simultaneously and serve different purposes.
- **Rise8's visibility into SOCOM's board is currently limited.** Nik indicated Rise8 will likely get access once Rise8 has CACs and is participating in PI plannings.
- The `.mil` APK is what goes to operators in the field — the `.civ` build does not.
- Rise8 will have no direct communication with operators downrange — all feedback flows back through Nik or Jonathan Miller, then to Rise8.
- **Nik will share more detailed process steps next week.** This section will be updated when that information is received.

---

**Key Terms and Concepts**

**Program Office** — the government-side entity (SOFMC/SOCOM) that owns distribution after Rise8 hands off.

**Chad Molyet — DT (Development Testing)** — SOCOM's Development Testing lead. Chad receives the build from Rise8 and runs regression testing and Fortify scans before it moves to Nik's SOCOM Jira board. First point of contact after Rise8 sends the package link.

**Nik** — SOCOM's TAK program manager. Owns the SOCOM Jira board that tracks the build from post-DT validation through to field deployment. Manages the Bureaucracy and Field columns.

**SOCOM Jira Board** — Nik's internal board that tracks the plugin after it clears Chad's DT validation. Two columns: Bureaucracy (approvals, admin, coordination — nothing Rise8 can do or see) and Field (moving toward operator use). Rise8 does not currently have visibility into this board. Access expected once Rise8 has CACs and is in PI plannings. Note: this is separate from TPC's PRR Jira at `issues.tak.gov`.

**SOFWERX / DefenseWERX** — the contractual vehicle funding this engagement. No role in technical work or distribution decisions. May have administrative reporting requirements at delivery milestones — not confirmed.

---

**Stage 5: Process Gaps**

- ~~How the Program Office handles distribution is a "black box."~~ Partially resolved April 17. The post-handoff sequence is now confirmed at a high level: user assessment testing (Nik and Chad) > DT regression testing and Fortify scans (Chad) > SOCOM Jira board (Bureaucracy column, then Field column). Full step-by-step detail from Nik expected next week.
- How long each step takes from DT validation through Bureaucracy to Field is unknown to Rise8.
- Rise8 has no visibility into SOCOM's Jira board at this time. Access expected once Rise8 has CACs and is in PI plannings.
- Whether there is a structured feedback mechanism from operators back to Rise8 after field deployment is unknown. Field signal currently flows informally through Nik or Jonathan Miller.
- Whether SOFWERX/DefenseWERX requires any specific reporting artifacts from Rise8 at deployment milestones is not confirmed.

---

**Sprint 2 — Active Blockers**

- ~~Cert untrusted.~~ RESOLVED April 10.
- ~~ProGuard blocking `assembleProduction`.~~ RESOLVED April 14.
- ~~Build not sent to Chad and Nik.~~ COMPLETED April 17. Link sent. Chad and Nik conducting user assessment testing.
- **OPEN:** No confirmed timeline from DT validation through SOCOM Jira Bureaucracy column to Field. Rise8 has no visibility into that timeline. Nik to share more detail next week.
- **OPEN:** Rise8 does not have access to SOCOM's Jira board. Visibility expected once Rise8 has CACs and is in PI plannings.

---

**Sprint 2 — PM Action Items**

- ~~Define "production ready" with Kevan.~~ Done - build validated, link sent April 17.
- ~~Ask Nik and Chad what happens after Rise8 hands off.~~ Confirmed April 17. See Process Steps above.
- Follow up with Nik next week for full step-by-step detail on the SOCOM Jira board process and timeline expectations. Update Process Steps when received.
- Confirm with Kevan: does the formal PRR Jira ticket still need to be submitted, or does the MR route satisfy Nik's long-term visibility needs?
- Ask what the feedback loop looks like after operators have the plugin - how does field feedback get back to Rise8?
- Confirm CAC status for Rise8 team - this is the prerequisite for gaining visibility into SOCOM's Jira board.

---

# PRR Process — How to Submit a Plugin Release Request

Reference: https://wiki.tak.gov/spaces/DEV/pages/3736511/Releasing+a+Plugin

Overview
Releasing a TAK plugin is a coordinated process which results in the plugin being added to the TAK production CI/CD pipeline. Once complete, the plugin will be built automatically at every release of the TAK baseline and will be distributed in accordance with the guidance provided by the sponsor organization. Guidance and plugin status may be updated at any time by submitting a new Memorandum for Release (MFR). The plugin release process is initiated by generating a Plugin Release Request (PRR). The steps for creating a PRR are described in this document.

Process Overview
There are two general process flows for releasing a plugin. One is used when a plugin being added to the TAK production CI/CD pipeline, Plugin Initial Release. Separate CI/CD pipelines exist for each version of the TAK products. This means that even if a plugin has already been added to a particular automated build pipeline in the past, a new Plugin Initial Request must be initiated if it needs to be added to the pipeline targeting a different version of the TAK products. However, multiple versions of the TAK products can be called out in a single request. The second process flow is used when a plugin that is already part of the TAK production CI/CD pipeline(s) needs to be rebuilt because it has been updated. This Plugin Update Release process is simpler/quicker as it involves only the last two  stages of the complete process. More detailed information on each of these processes as well as web based forms that can be used to initiate them can be found in the links below:

Plugin Initial Release
Plugin Update Release
After submitting your request, you can track its progress in the Plugin Release Requests project in JIRA.

Support
Members of the TAK Product Center Development Team are assigned to handle PRRs on a rotating basis (typically changing every 2 weeks). You can see which engineer is currently overseeing PRRs in the header of the dedicated Mattermost PRR Channel. It is recommended that any discussion about a particular PRR be conducted either in that Mattermost Channel or in the comments of the JIRA ticket that gets created after the PRR is submitted so that continuity is maintained as TAK Product Center personnel transition into/out of PRR support capacity.

FAQ
Q: Is there a required project visibility for my plugin to be integrated into the pipeline?
A: Plugin projects that are marked both Internal and Private may be integrated with our pipeline. We require that the GitLab user, TAKJenkins, be added as a user on the project -- with Reporter access -- to enable the pipeline to access the project during execution.
Q: Is there a required version of TAK we must support? We currently support 4.2.
A:   The TAK Product Center supports the latest major.minor version of TAK and 2 major.minor releases back.   This means in an example that when 4.9 is released - 4.9, 4.8 and 4.7 will be supported.
Q: We've reviewed the 'Release a Plugin - TAK Developers' and 'TAK Plugin Release Procedure (Product Center)' and would like some clarity on which steps we are responsible for during a) initial release and b) ongoing SW updates.
A:  Plugin release requests, initial or otherwise are most often actioned by the government's contractor at the government's request. If initial or any change in distribution guidance is required, a government signed MFR will need to be submitted with the request.
Q: There is a new MFR associated with our plugin. How do I get that added to the system?
A: Initiate a new Plugin Initial Release and attached the updated MFR. Once the PRR has been created go into it and add a comment explaining that a new MFR exists that should replace the existing one. This will result in an update to the TAK Plugins Master List. If necessary, entries will be updated in TAK production CI/CD pipeline configurations and plugins will be rebuilt as needed (i.e. if a plugin's domestic releasability changed from MIL to CIV). Entries will also be updated as needed on the tak.gov website.
Q: We saw that our build will be integrated into the production pipelines, are there any pipelines running tests as well? 
A: Plugin developers are have access to their own fully configurable GitLab CI pipeline. The TAK SDKs include custom plugin testing frameworks that are built on Espresso that plugin developers may use. Plugin developers should implement any desired test automation within their own GitLab CI; the Production CI does not currently execute any tests for plugins.
Q: If an Android library deprecates to be replaced by a new library, whose responsibility is it to update the plugin appropriately? For example, the PagedList class is being deprecated in favor of PagedData, which supplies all our Recyclerviews with content. That will eventually break the plugin if nothing is done.
A: The capability sponsor is responsible for maintenance of their plugins. The TAK Product Center may provide maintenance services for plugins that are no longer sustained, subject to demand and other priorities.
Q: Does ATAK have versioning conventions we should adhere to for versioning our Plug-In?
A:  Please utilize the naming conventions as defined in the plugin template project.  
Q: Does ATAK have documentation conventions we should adhere to for documenting our Plug-In?
A: 
Q: Will plugins be automatically migrated with future ATAK releases, or do we need to kick-off integration using the 'Releasing a Plugin Checklist'?
A:  Once a MFR is in place and no large changes are required, the plugin will automatically be built for newer versions, provided that the "All Future Versions" of ATAK was selected in the initial PRR. If it was not a new PRR will need to be generated requesting support for any current TAK product versions that were not called out on the original PRR and/or specifying that this plugin should be built against "All Future Versions" of the TAK products.

**Step 1 — Find the Plugin Initial Release web form**
It is linked inside that Confluence page under "Plugin Initial Release." The link is embedded — Kevan needs to click it to get to the actual form.

**Step 2 — Fill out and submit the form**
This is the official submission. The form captures plugin details, TAK version targets, and distribution guidance.

**Step 3 — Jira ticket is auto-created**
Submitting the form automatically creates a ticket in the PRR Jira project. This ticket is what gives Nik visibility. Without it, he cannot track the release.

**Step 4 — Track progress**
Monitor the ticket at `issues.tak.gov/projects/PRR/issues/` and communicate with TPC in the Mattermost PRR Channel or directly in the Jira ticket comments.

**Step 5 — TPC processes it**
A rotating TPC engineer (changes every 2 weeks) picks it up and adds the plugin to the production CI/CD pipeline.

**Important note from the docs:**
> "Plugin release requests are most often actioned by the government's contractor at the government's request."
Confirm with Nik that he wants Rise8 to submit the PRR now before proceeding.

**Also confirm with Kevan:**
J Hepp's commit "Fix referenced MFR name in metadata" suggests an MFR already exists. Kevan needs to confirm it covers this release or if a new government-signed MFR is required.

---

fallback TIFF

new issue related to it
pre-caching doesnt work, (even tho it tells you its good)
ANOTHER ISSUE =cant cache any tiles during pre-caching
NAIP+ is 18 and we are asking it for pre-19
If those tiles aren't there..
take out the pre-caching if is not working properly - Zach

"one of our features is broken"

on the APK, psckaged

---

back up TIFF -FAILED, this is GONE
solving THAT ISSUE
it will run but it wont run on a backup
