# ASSUMPTION DRAFTING GUIDELINES
## Framework: David J Bland
---
### Why Test Assumptions

An assumption is a thing accepted as true or certain to happen, without proof. We all make assumptions, but it is important to be aware of them and to test them.

> "Your assumptions are your windows on the world. Scrub them off every once in a while, or the light won't come in." — Isaac Asimov

Your perception of true does not make it true.

---

### Rules for Writing Assumptions

- Do not write them as questions. They are statements that would have to be true for this to succeed.
- Based on what I or we know today.
- Looking towards 2 to 6 months out.
- Begin each assumption with:
  - **We believe** (for the team)
  - **I believe** (for an individual)
- One sentence per assumption. It should fit on a single sticky note.
- Write in the positive, unless you are trying to disprove a negative (null hypothesis).
- Do not worry about perfect. You can always refine later.

---

### The 4 Categories

---

#### Desirability - Do They Want it?
**Definition:** Statements on whether your customer or user has an unmet need. What would have to be true for operators, warfighters, or mission planners to actually want and use this?

**In military and government mission-oriented domains**, the "customer" is split. The end user is the operator or warfighter in the field. The buyer is the program office or contracting officer. Their needs may not align. Adoption is not driven by preference alone — it is constrained by doctrine, training, command direction, and workflow fit. An unmet need in this domain means a real mission risk or operator burden that has no adequate solution today.

**Key questions to pressure-test desirability assumptions:**
- Will operators actually use this in the field, or will they work around it?
- Does command care enough to direct adoption, or will it remain optional?
- Does the solution fit existing doctrine, training, and standard operating procedures?
- Is the unmet need validated by actual users, or assumed by the team?

**Guardrails:**
- Do not confuse program office interest with operator need. They are not the same actor.
- Do not assume adoption will happen because the capability exists.
- Do not write desirability assumptions about features. Write them about behavior change and unmet need.

**Example patterns:**
- We believe operators will adopt this capability without requiring command-directed mandates.
- We believe the unmet need exists at the operator level, not just at the program office level.
- We believe the current workaround creates enough mission risk that operators are motivated to change behavior.

---

#### Viability - Should we do it?
**Definition:** Statements on whether the solution can be sustained, funded, and expanded. In commercial contexts this is about revenue and profit. In military and government contexts, viability means whether this becomes a lasting capability or ends when the contract does.

**In military and government mission-oriented domains**, there is no revenue model. Viability is about contract sustainability, follow-on funding, program office support, and whether the solution fits within acquisition constraints and budget authority. A viable solution in this domain has a path to program of record status or a follow-on contract — not just a successful delivery.

**Key questions to pressure-test viability assumptions:**
- Will the program office fund follow-on work based on what we deliver?
- Does this solution fit within existing contract scope and acquisition authority?
- Is there a path to program of record status, or is this always a bridge contract?
- Are the costs of compliance (ATO, CMMC, TAK Forge) sustainable within the contract vehicle?
- Does the value delivered justify continued government investment?

**Guardrails:**
- Do not conflate delivery success with program viability. Delivering on contract does not guarantee follow-on funding.
- Do not assume the program office has budget authority. Confirm it.
- Do not write viability assumptions about features or technical outcomes. Write them about funding, scope, and sustainability.

**Example patterns:**
- We believe the program office has budget authority and intent to fund a follow-on contract based on Sprint 1 through 4 deliverables.
- We believe the deliverables from this contract are sufficient to initiate a program of record conversation with SOCOM.
- We believe the cost of ATO and security compliance is within the scope the government is willing to fund on a follow-on contract.

---

#### Feasibility - Can We do it?
**Definition:** Statements on whether you can build and deliver. In commercial contexts this is about access to technology, IP, and key partners. In military and government contexts, feasibility is constrained by classified system access, network limitations, hardware requirements, security compliance, and partner dependencies outside your control.

**In military and government mission-oriented domains**, the most common feasibility blockers are: access to data and classified systems, ATO and CMMC compliance timelines, DDIL network and hardware constraints, TAK Forge pipeline dependencies, and partner relationships with entities like BAH and TPC that are not fully under your control.

**Key questions to pressure-test feasibility assumptions:**
- Do we have access to the data, systems, and networks required to build and test?
- Can we meet ATO, CMMC, and TAK Forge compliance requirements within the contract timeline?
- Do we have the right partner relationships in place to deliver?
- Can we build and validate on hardware and network conditions representative of actual field use?
- Are there clearance or access requirements the team does not yet have?

**Guardrails:**
- Do not assume data access. In military domains, training data and field feedback are often controlled, classified, or simply nonexistent.
- Do not assume partner cooperation. BAH, TPC, and TAK Forge operate on their own timelines and priorities.
- Do not write feasibility assumptions about what you hope to access. Write them about what would have to be true for access to be confirmed and usable.

**Example patterns:**
- We believe we can access sufficient training data to improve the model without relying on production field data.
- We believe the TAK Forge pipeline can be configured to support signed .mil APK delivery within this contract period.
- We believe we can build and validate the plugin under DDIL-representative conditions without access to classified operational networks.
- We believe our key partner dependencies with BAH and TPC will not block or delay delivery within the 8-week timeline.

---

#### Miscellaneous
**Definition:** If an assumption does not fit cleanly into desirability, viability, or feasibility, capture it here. Miscellaneous assumptions may relate to macroeconomics, environment, usability, competition, sustainability, or adaptability.

**Guardrails:**
- Use this category sparingly. If you find yourself putting most assumptions here, revisit the other three categories.
- Miscellaneous assumptions are still assumptions. Apply all the same rules: no questions, positive framing, one sentence, We believe or I believe.

---

# Problems, Risk and Blockers + COA's Course of Actions

RISK If {Condition or Context} is true, then {consequence}

BLOCKER Template: Because of {condition/context} we're more or less likley to {event} resiltresulting in {consequence(s)}
REQUEST HELP:
- Course of Actin (COA) {person(s)} is doing/delivering {action} by {date}
- Ask: We need {person or group} to help with {action item} by {time-frame or date} so that {impact}
