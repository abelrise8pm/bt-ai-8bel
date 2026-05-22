**Opportunities**
- TAK UI migration enables **single plugin deployment across multiple platforms** (WinTAK, TAKX, WebTAK, OASIS) — massive reuse potential vs. rebuilding per platform
- Floating toolbar, radial menus and similar UI components are **shared across ATAK, WinTAK, TAKX** — reusability is a real opportunity worth quantifying during story work
- You are on the **ground floor of TAK UI v1.0** — Rise8's findings and requests can directly shape the framework, not just consume it
- XCheck was already migrated successfully — a **reference implementation exists** to learn from

---

**Pain Points / Problems**
- **~80% of plugin components are not natively supported** by TAK UI today — escape hatches are the bridge, not the destination
- **Grid engine specifically flagged as complex** — no clear native path yet
- Escape hatch approach risks **burying tech debt** if not explicitly tracked as temporary vs. permanent
- Three separate parties (BAH, Black Cape, Rice8) working on TAK UI **without fully gelled coordination yet** — Nik acknowledged this is still a "touchy-feely learning phase"

---

**Explicit Goals / Milestones**
- Migrate the AIGRT plugin into TAK UI
- **Primary deploy target: WinTAK** (desktop tool in use today)
- Downstream targets: TAKX → WebTAK → OASIS
- Avoid recreating the plugin from scratch for each platform — portability is the entire point
- Jointly resolve the trailing 80% with BAH/Nathan
- Work toward **TAK UI v1.0** readiness across the plugin ecosystem

---

**Nik's Explicit Recommendations**
- All TAK UI changes and feature requests **must be coordinated through Nathan (BAH)**
- **Reach out to Nathan proactively** — don't wait, start the conversation now
- Bring findings, concerns and risks to Nathan as they emerge — Nik wants visibility
- Confirm **closed repo access** (WebTAK/OASIS included) — Nik said it should already be set up
- Work **jointly** with BAH to resolve the 80% — this is not a Rice8-only effort

---

**Risks, Blockers & Assumptions**
- **Nathan's bandwidth** — flagged explicitly; he's active in current sprint work while Rice8 is about to increase direct engagement with him
- **TAK UI roadmap is unknown** to Rice8 today — writing escape hatch stories without roadmap visibility risks throwaway work
- Assumption: escape hatches are **temporary** — not yet confirmed with BAH
- **Coordination overhead** across 3 vendors (BAH, Black Cape, Rice8) is a real risk with no formal process established yet
- Repo access **assumed but not yet confirmed** by Rice8

---

**Top of Mind for You as PM**
- Don't let escape hatch decisions get made in a vacuum — Nathan needs to be in the loop as findings surface
- Track native vs. escape hatch explicitly in every story — this distinction drives future effort and BAH conversations
- Your 7 workflow-based user stories are the right start, but **grid engine stories need an early risk flag**
- You are both a consumer and a **contributor to TAK UI v1.0** — position your findings as input to the framework, not just blockers to your migration

---

**AI GRG — TAK UI Migration: Proposed Approach**

**The Strategy**
Instead of building a component checklist and migrating piece by piece, we're going to map the actual end-to-end workflows a GRG Creator and Operator use today — and use those as the foundation for everything: scoping, prioritization, testing, and our conversations with BAH and Nik.

---

**How We're Doing the Work**

1. Write 7-9 user stories that cover the full GRG Creator and Operator workflows end to end
2. Walk through each story live in the plugin with our engineers — screen by screen, interaction by interaction — and document exactly what UI components are involved
3. For each component, we call it: **TAK UI Native** or **Escape Hatch (ATAK)**
4. That breakdown gets attached to every story, giving each one a clear native vs. escape hatch split
5. We flag gaps, unknowns, and risks at the story level and across all stories combined
6. We bring this to Nathan and Nik as our starting point for the migration conversation
7. Run a full demo, so they can see where the various components exist or dont

Refinements to Consider

* Step 2 will take longer than expected on complex stories — especially anything touching the grid engine or building detection. Budget extra time, don't treat all stories as equal effort to map
* Capture "unknown" as a category in your breakdown table — some components may not have a clear native or escape hatch answer yet. Don't force a call prematurely, those unknowns become your explicit questions for Nathan
* The table format should translate well — meaning Nik and Nathan should be able to read it without you in the room. Keep it simple: component/interaction | TAK UI Native? | Escape Hatch? | Notes/Risk
* Gaps and risks should be story-level AND aggregate — individual story risks matter, but Nik and Nathan will want to see the full picture across all 7-9 stories at a glance

---

**Why This Way**

- **It's grounded in real user workflows.** Every decision ties back to whether a user can actually do their job end to end — not whether a component exists on a checklist
- **It gives Nathan and Nik something actionable.** Instead of a vague list of technical gaps, they get a story-by-story picture of what's native, what needs an escape hatch, and where the complexity lives
- **It helps Nik prioritize TAK UI development.** If a story comes back 90% escape hatch, that's a clear signal to Nathan and BAH on where to focus native component development — moving that story from 90/10 toward something more balanced over time
- **It makes testing honest.** Acceptance criteria tied to real workflows means we're validating that users can actually complete tasks — not just that individual screens render correctly
- **It surfaces risk early and in plain terms.** Risks framed around user capabilities are easier for everyone — engineers, BAH, and the customer — to understand, prioritize and act on

---

**What We're NOT doing**

We are not starting development. This is discovery and scoping work that ensures when we do start building, we're building the right things in the right order — and Nathan and BAH have everything they need to support us.

**EXAMPLE**
The workflow process step column is the missing link between the user story and the component breakdown. It makes the table readable as an actual user journey, not just a flat list of components.

---

**User Story:** As a GRG Creator, I need the ability to upload an image into the plugin, so that I can start the grid placement process.

**User Story Template**

As a {personal or group}

I want {specific capability in the app,plug-in/software}

So that {expected result or value add in the real world}

| Workflow Process Step | Component / Interaction | TAK UI Native? | Escape Hatch (ATAK)? | Notes / Risk |
|---|---|---|---|---|
| 1. Open the plugin | Plugin launch / entry point | ✅ Yes | No | Baseline — expected to be native |
| 2. Tap upload image icon | Floating toolbar button | ❌ No | ✅ Yes | Toolbar not natively supported — shared across ATAK/WinTAK/TAKX, confirm reusability with Nathan |
| 3. Browse device images | File browser / system dialog | ❌ No | ✅ Yes | Likely OS-level or ATAK component — needs confirmation |
| 4. Select image | Selection interaction / UI control | ⚠️ Unknown | ⚠️ Unknown | Unclear until we walk through live in plugin — flag for engineer session |
| 5. View image on map | Map display / render layer | ✅ Yes | No | Map tools flagged as TAK UI native in Josh's discovery |

---

**Two things to note:**

- The ⚠️ Unknown category is important — don't skip it or force a call. Those rows become your explicit questions for Nathan
- Some stories will have 10+ rows, some maybe 4 or 5. That variance itself tells a story about complexity — and that's useful data for Nik and Nathan


we dont need TAM (teaming agreement)? We dont care about it..

--

---

#help abel set up 

--
everything is FORGE NOW
1. git pull
2. ./gradlew installCivDebug

if it fails
`sdk env install`
`./gradlew clean` --> to whip build 


 ./scripts/deploy_atak.sh 