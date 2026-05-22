# TAK Kick-off Work tracks
---
## 1. Define Outcomes and Impact for the 4 Contract Tasks

**Description**
Three of the 4 tasks have no confirmed acceptance criteria. Kevan acknowledged the contract is vague and the customer views the tasks as a checklist.

**What the PM needs to do**
Define the North Star (impact) and map each of the 4 tasks to either a user outcome or an enabling outcome — using the enabling outcome template developed with JVD. Enabling outcomes are binary deliverables (done or not done) and don't require metrics; user outcomes require measurable behavior change. For each task, establish what "done" looks like and what success criteria the team can track. Start from outcomes, not stories.

**Why this matters**
Without shared outcomes, the team optimizes for activity over impact. Iteration decisions have no anchor and delivery becomes subjective.

**Risk if not done**
Internal misalignment on how Rise8 defines success, and a missed opportunity to establish with the customer how progress and outcomes will be measured throughout the contract.

> **Supporting action:** Finalize the GitLab issue board — get the enabling outcome and impact epic templates, labels, and structure set up so the team is tracking work against outcomes from Day 1, not retrofitting later.

---

## 2. Understand the SOCOM vs TPC Political Landscape

**Description**
SOCOM builds on top of TPC's baseline platform. There may be underlying tension between the two orgs — and this contract could be playing a role in how SOCOM justifies its own development resources. Worth being mindful of before kickoff.

**What the PM needs to do**
Understand the dynamic before kickoff. Identify who in the room represents which org, and avoid framing deliverables in ways that inadvertently escalate the tension.

**Why this matters**
How you present the GOTS evaluation and TAK UI work will land differently depending on who's in the room and which org they represent.

**Risk if not done**
Walk into kickoff blind to the political context, misread a stakeholder's org affiliation, and frame something in a way that creates friction before work begins.

---

## 3. Clarify the Scope of the GOTS Evaluation

**Description**
4.3.4 requires a GOTS evaluation, but no in-scope software list exists. TAK UI is technically GOTS — yet it's TPC's component, not SOCOM's. Evaluating it puts Rise8 in the middle of an unresolved SOCOM vs TPC tension.

**What the PM needs to do**
Confirm with the customer which GOTS capabilities are in scope. Determine whether evaluating TAK UI is expected — and if so, understand whether that's meant to validate it or question it.

**Why this matters**
Rise8 could end up simultaneously recommending TAK UI adoption (4.3.2) and evaluating whether it's the right fit (4.3.4) — without realizing those two positions may conflict.

**Risk if not done**
Walk into kickoff and unknowingly take a position on a political question SOCOM and TPC haven't resolved. That's not Rise8's call to make.

> **Note:** Verify that the SOCOM vs TPC conflict framing above is accurate. This is based on Kevan's interpretation — confirm before kickoff whether this tension is real, assumed, or overstated.

---

## 4. Build a Shared Design and Engineering Collaboration Foundation

**Description**
The TAK ecosystem is engineer-centric by nature. During the competition, design and PM were not consistently in the loop. Without shared norms established early, the same pattern will repeat.

**What the PM needs to do**
Support Jon and Coby in leading a team exercise — likely grounded in HCI principles — that gives the whole team a shared language for design decisions. The goal is a foundation everyone can fall back on, so the team knows when to move independently and when to loop someone in.

**Why this matters**
When the team shares the same principles, engineers can make decisions without waiting for approval, and design can trust those decisions were made within a framework everyone agreed on.

**Risk if not done**
The team defaults to familiar patterns. Design plays catchup, engineers feel slowed down, and collaboration becomes reactive rather than built-in.

---

## 5. Codify the Model Training Pipeline as a Parallel Work Track

**Description**
Kevan confirmed the team should simultaneously deliver short-term results and architect a repeatable model training pipeline — cooking in the home kitchen while designing the commercial one.

**What the PM needs to do**
Align the team internally that codifying the pipeline is part of how we work, not a separate deliverable. Work with Kevan to understand how to determine whether the pipeline can run inside TAK Forge — that answer shapes the architecture. Surface this with the customer at kickoff so they can weigh in and help clarify constraints.

**Why this matters**
Without a repeatable pipeline, every model improvement is a one-off. The foundation built during these 8 weeks directly affects the team's readiness for the OT contract.

**Risk if not done**
The team ships short-term fixes without building the underlying system. When the OT contract arrives, there's nothing to scale from.

> **PM Personal Action — Domain Fluency:** Build a working foundation on computer vision and model training pipelines. Enough to understand what the team is building, ask informed questions, and flag tradeoffs. Key concepts to get grounded in: how images are labeled, how a model learns from labeled data, what "retraining" means, and what a repeatable pipeline looks like end-to-end. Lean on Kevan to fill in the gaps specific to this project.

---

## 6. Secure Day 1 Access and Government-Gated Prerequisites

**Description**
Two hard blockers require Program Office action at or before kickoff: enabling the mil-tagged APK pipeline and provisioning TAK Forge / AppGate access for the Rise8 team. Neither can be self-served.

**What the PM needs to do**
Bring both requests to kickoff explicitly. Identify the right person to initiate the MOA/MOU for mil tagging and confirm the AppGate access process and timeline for each team member who needs it.

**Why this matters**
Without the mil tag, we can't deploy to real users. Without AppGate access, engineers can't push code to TAK Forge. Both are Sprint 1 blockers that depend entirely on the government moving first.

**Risk if not done**
Sprint 1 starts without the ability to ship or push code. Rise8 is blocked waiting on gov action that was never formally requested.

---

## 7. Establish Release and Feedback Communication Norms with the Customer

**Description**
How Rise8 communicates a release is ready, who receives it, how the Program Office deploys it, and how feedback returns to the team — none of this has been formally confirmed.

**What the PM needs to do**
At kickoff, confirm the release contact, submission process, expected deployment timeline, and the feedback loop back to Rise8. Establish Nik's role as the primary communication bridge — or identify who it actually is.

**Why this matters**
Without agreed communication norms, releases become ad hoc and feedback arrives late, incomplete, or not at all.

**Risk if not done**
Rise8 ships and hears nothing. No feedback loop means no learning, and no learning means the model improvement work has no input.

---

## 8. Clarify Rise8's Security Compliance Obligations

**Description**
During the competition, Rise8 ran internal security checks and required 2 merge approvals for NIST compliance. Kevan recommends skipping internal pipelines this contract since TAK Forge handles Fortify scans — but this hasn't been confirmed with the customer.

**What the PM needs to do**
Confirm on Day 1 whether TAK Forge's scanning satisfies the contractual compliance requirement or if Rise8 is still expected to run its own checks.

**Why this matters**
If the customer expects Rise8 to run internal security pipelines and we show up without one, that's a compliance gap nobody flagged.

**Risk if not done**
Discover mid-contract that Rise8 has a compliance obligation it didn't fulfill, creating a reporting or contractual issue.

---

## 9. Build Shared Domain Understanding Before Kickoff

**Description**
The team needs a shared baseline understanding of the GRG plugin and the user workflow before March 18th. Without it, the team walks into kickoff unable to ask informed questions or connect customer feedback to the actual product.

**What the PM needs to do**
Schedule two internal sessions before kickoff: Kevan demos the GRG plugin end-to-end (how it works, what it produces, where it fails), and Jonathan runs the team through the user journey and workflow. PM should also independently review the demo slides and release recordings from the competition to build personal domain context.

**Why this matters**
Kickoff is the first real conversation with the customer. If the team doesn't have a shared mental model of the product, the discussion stays surface-level and the team can't probe meaningfully on model improvements or usability gaps.

**Risk if not done**
Team members ask basic questions the customer expects us to already know. Missed opportunity to ground kickoff feedback in specific product moments.

---



- team needs android studio set up
- need Android devices
- have

> **PM Personal Action — Domain Fluency:** Watch the demo recordings and review the release slide decks from the competition. Kevan specifically recommended this as the fastest way to understand how the plugin aligns with MOSA and where the team's prior thinking landed. Do this before the Kevan demo session so the internal discussion is more productive.