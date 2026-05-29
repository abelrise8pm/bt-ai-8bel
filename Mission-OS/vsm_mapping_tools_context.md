# Mapping Tools in VSM Facilitation Context

## Why this document exists

During VSM workshops, teammates who are familiar with Journey Mapping, Service Blueprints, Event Storming, or Process Mapping will sometimes suggest using those tools instead of — or as a substitute for — the Value Stream Map. This is almost always well-intentioned, but it reflects a mismatch in zoom level and purpose. This document exists to help you recognize when that's happening, understand why it's a problem, and redirect the conversation without dismissing the tool or the person suggesting it.

The core principle: **VSM is a systems-level diagnostic tool. The other mapping practices are zoomed-in analysis tools.** They answer different questions at different levels of abstraction, and using one as a substitute for the other produces a map that can't reveal what VSM is designed to surface.

---

## The critical distinction: VSM is not a process map

This is the single most important thing to hold onto. Value Stream Maps operate at the **macro level** — each process block in a VSM represents an entire activity or function, not the individual steps inside it. A VSM process block might have a full swimlane diagram, a service blueprint, or an event storm living *underneath* it.

When someone suggests mapping the workflow steps *inside* a process block during a VSM session, they've shifted zoom levels without realizing it. That detail is valuable — but it belongs in a follow-on session, not in the VSM itself. Capturing it mid-workshop pulls the team into the weeds of one process block while the rest of the value stream sits unmapped.

**The VSM question is always:** "What is the end-to-end flow of value from request to fulfillment, and where is it constrained?"

**The process map question is:** "How exactly does this specific step work?"

These are sequential, not interchangeable. You need the VSM first to know which step is worth mapping in detail.

---

## Tool-by-tool: how each one relates to VSM facilitation

### Journey Mapping

**What it does well:** Captures a user's emotional arc, pain points, and goals across stages of an experience. Surfaces empathy and reveals friction from the user's perspective.

**Where it fits in VSM work:** Journey maps are most useful *before* a VSM workshop as discovery input, or *after* to explore the user-facing impact of a specific process block. If your VSM reveals a constraint in a customer-facing step, a journey map can help diagnose why that constraint feels painful to users.

**The risk during a VSM workshop:** Journey mapping is user-experience-centric and emotion-centric. VSM is flow-centric and metric-centric. When a team starts journey mapping inside a VSM session, they shift from asking "where is value stuck?" to "how does this feel for the user?" — two completely different questions. The VSM loses its systems perspective and turns into a customer experience exercise. The metrics (Lead Time, Process Time, %C&A) that make VSM diagnostic stop being captured.

**How to redirect:** "That's exactly the right thread to pull — let's flag this process block as a candidate for a journey mapping session after we finish the full value stream. Right now we need to understand the flow and metrics at this level before we go deeper on any one block."

---

### Service Blueprint

**What it does well:** Maps both the frontstage (what users see) and backstage (internal processes and systems) of a service. Reveals how internal operations create or undermine customer experience.

**Where it fits in VSM work:** Service blueprints are a strong follow-on tool for any VSM process block that involves a customer-facing touchpoint. If the VSM identifies a constraint in a step where internal handoffs are affecting users, a service blueprint is an excellent next step to diagnose the frontstage/backstage disconnect.

**The risk during a VSM workshop:** Service blueprints are detailed and lateral — they expand outward into frontstage and backstage lanes for a single service moment. VSM is linear and forward-moving — it traces the flow of value from left to right across the entire system. Introducing service blueprint thinking mid-VSM creates a local deep-dive that stalls the macro mapping. Teams get absorbed in one interaction while the full value stream remains invisible.

**How to redirect:** "The frontstage/backstage breakdown here is really important and worth a dedicated blueprint session. Let's capture that as a hotspot on this process block and keep moving — we need the full stream mapped before we can prioritize where to go deep."

---

### DDD Event Storming

**What it does well:** Discovers domain events, bounded contexts, commands, policies, and ubiquitous language across a system. Builds shared understanding of how a domain behaves and supports technical architecture decisions.

**Where it fits in VSM work:** Event Storming is most relevant when a VSM reveals a constraint rooted in system complexity, tangled logic, or unclear domain ownership — particularly in software delivery value streams. If a VSM process block representing a technical system has high Lead Time and low %C&A, an Event Storm can help the engineering team understand why.

**The risk during a VSM workshop:** Event Storming is technical, domain-focused, and architecture-oriented. It is designed to answer "how should this system behave?" — not "where is value stuck in our end-to-end flow?" Introducing event storming thinking into a VSM session typically pulls engineers into implementation details, domain modeling, or system design debates before the constraint has even been identified. It also tends to narrow participation — non-technical stakeholders disengage when the conversation shifts to aggregates and bounded contexts.

**How to redirect:** "That domain complexity is a real signal — it might explain why we're seeing the delays and quality issues in this block. Let's log it as a hotspot and consider an Event Storm for this area once we know whether this block is actually the constraint we need to address."

---

### Process Mapping

**What it does well:** Documents the detailed steps, decision points, roles, and sequence of a specific workflow. Makes the "how" of a process visible and analyzable.

**Where it fits in VSM work:** Process maps are the natural *drill-down* tool for any process block in the VSM. Once the VSM is complete and the constraint has been identified, a process map of that constrained block gives the team the operational detail needed to design improvements.

**The risk during a VSM workshop:** Process mapping is the most common substitute people reach for — it feels similar to VSM because it also maps steps in sequence. The difference is scope and abstraction level. A process map zooms into one block; a VSM sees the whole stream. If you let a VSM session become a process mapping session, you get deep detail on one area while the rest of the value stream stays invisible. You may optimize a step that isn't even the constraint — one of the most common and costly mistakes in lean improvement work.

**How to redirect:** "We're starting to map the internal steps of this block — that's process mapping territory. Let's treat this whole block as a single unit for now with its Lead Time, Process Time, and %C&A, and then we can break it open with a process map after the full VSM is done."

---

## A framework for reading the room

When a teammate suggests one of these tools during a VSM session, ask yourself:

1. **Are we still mapping the full value stream, or have we dropped into one block?**
   If the team has stopped moving left-to-right across the stream and is drilling into a single step, you've shifted zoom levels. The VSM isn't finished yet.

2. **Are we capturing flow metrics (LT, PT, %C&A), or are we capturing experience and behavior?**
   If the conversation is about emotions, user stories, domain events, or detailed workflows — those are outputs of the other tools. The VSM needs metrics and flow data first.

3. **Have we identified the constraint yet?**
   If not, no amount of deep analysis on any individual process block is justified. The Theory of Constraints is explicit: improving a non-constraint doesn't improve the system. The VSM is how you find the constraint.

4. **Is this a "parking lot" moment or a derail?**
   The insight someone is reaching for is usually valid — it just belongs at a different time. Capture it as a hotspot or a follow-on action item. Don't dismiss it; redirect it.

---

## The sequencing principle

Think of these tools as existing in a natural sequence relative to VSM work:

**Before VSM:** Journey maps and interview synthesis help frame the customer perspective and scope the value stream.

**During VSM:** The value stream map itself. Process blocks, metrics, flow, constraints. Nothing else.

**After VSM — based on what the VSM revealed:**
- A constrained customer-facing step → Journey Map or Service Blueprint
- A constrained technical system → Event Storm
- A constrained operational workflow → Process Map

The VSM tells you *where* to invest the deeper analysis. Without it, the other tools are often applied to the loudest complaint rather than the actual constraint — and that's how improvement efforts stall.
