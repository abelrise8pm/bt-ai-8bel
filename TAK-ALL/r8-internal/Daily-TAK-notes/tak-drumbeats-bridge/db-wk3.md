## SOW Context:

Task 1 — SDK Update to v5.6
4.3.1 — Modernize the AI/ML GRG plug-in to the most current SDK release, while maintaining SOCOM compatibility.

Task 2 — TAK UI Research and Migration
4.3.2 — Research and provide a cost and timeline estimate for rewriting the plug-in into the TAK UI framework. Goal is to establish TAK UI Bridge language cross-compatibility.

Task 3 — AI/ML Model Improvements
4.3.3 — Research and make improvements to the AI/ML model for the GRG plug-in.

Task 4 — GOTS Evaluation
4.3.4 — Evaluate existing GOTS software capabilities for modularity and scalability as directed by the Government.
4.3.4.1 — Deliver an assessment of those capabilities in a briefing to the PMO.

Supporting/Overarching Deliverable Sections:

4.4.2 — TAK Forge Fortify scan thresholds (zero critical, zero high, <10 moderate, <20 low)
4.5 — Software delivery expectations
8.1.4 — Sprint demo and performance metrics
8.1.5 — Application demonstration to USSOCOM TPOC
8.1.6 — Deliver application code to USSOCOM TPOC
8.1.7 — Weekly status meetings with prepared progress reports



## RECIPEINTS

nizme.n.cuin.ctr@socom.mil, david.akers@sofwerx.org, gabrielle.robles@sofwerx.org

chad.j.raaymakers.civ@socom.mil, shane.d.toner.mil@socom.mil, nikolas.a.cline.ctr@socom.mil, jonathan.r.miller.civ@socom.mil,
daniel.a.lynch.civ@socom.mil, robert.k.boone.ctr@socom.mil, james.vernon2.ctr@socom.mil

Sharon, Kevan

--

### 🚀Mission-Outcome: 
> SOF Operators increased their focus on the mission environment, as the frequency and manual effort required for configuring and correcting GRGs on the device screen is reduced.(work in progress)

### 📊 WEEK’S PROGRESS

- [4.3.2] **TAK UI migration strategy presented to program leadership and BAH collaboration initiated.** Rise8 confirmed a two-phase approach — TAK UI compliant first, fully native second and scheduled a working session with the BAH TAK UI team to align on the migration path forward.

- [4.3.3] **Two detection bugs resolved and validated at SOCOM demo.** Building detection now performs consistently regardless of zoom level, and repeated detection runs no longer produce unreliable results, improving operator confidence in the field.

- [4.5] **AI GRG plugin entered the official TAK release pipeline.** Plugin metadata merged to the TAK Plugin Master List and a signed .mil distribution build was produced. Final certification validation is in progress before the build reaches production.

### 🗓️ LOOKING AHEAD

- [4.3.1] **Complete regression and acceptance testing on SDK 5.4 and 5.6.** Confirms the latest plugin updates are ready for production release on both supported versions.

- [4.3.2] **TAK UI workflow mapping underway across GRG Creator stories.** Four of eight end-to-end workflows documented with native versus escape hatch breakdown, to inform Rise8 and BAH on the TAK UI migration scope.

- [4.3.2] **First working session with BAH TAK UI team scheduled.** Rise8 will walk through discovery findings, align on the compliance-first migration approach, and establish a shared collaboration model with Nathan and Kelly.

- [4.3.4] **GOTS plugin assessment kick-off.** Rise8 begins structured review of Trailblazer, Combat Swim, and SpotPlot across compliance risks, SOCOM fit, and MOSA architecture.

- [4.5] **Signed .mil distribution build delivered to SOCOM.** Pending resolution of the signing issue with TPC, Rise8 will deliver the validated build to SOCOM for field distribution.

### 🙋 Asks, Risks & Mitigations

**Plugin Release Certification**
Rise8 completed the release pipeline and produced a signed .mil distribution build. Final certification validation is still in progress as we work through the signing process with TPC for the first time. COA: Rise8 and TPC are actively working to confirm the build is field-ready. We expect resolution by end of day Friday.
