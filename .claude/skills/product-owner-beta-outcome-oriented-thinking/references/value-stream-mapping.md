# Value Stream Mapping (VSM)

## Overview

Value Stream Mapping is a Lean methodology for visualizing how value flows from customer request to service delivery. It identifies and removes constraints that limit throughput, increasing both capacity and quality.

As the methodology emphasizes: "It's not about the map. It's about the conversations, insights, decisions, and organizational healing that mapping enables."

## Core Principles

VSM operates on four foundational principles:

1. **Every system has a constraint** - Bottlenecks always exist somewhere
2. **Constraints determine pace** - The slowest step dictates overall throughput
3. **Improving the constraint improves the system** - Focus optimization efforts where they matter most
4. **Continuous improvement is essential** - New constraints emerge as old ones are resolved

## Why VSM Matters

VSM provides seven key benefits:

### 1. Customer-Centric Focus
Ensures all process steps align with what customers value, eliminating work that doesn't contribute to outcomes.

### 2. Holistic Systems Thinking
Optimizes entire processes, not individual components. Local optimizations often create global bottlenecks.

### 3. Leadership Engagement
Enables strategic implementation by visualizing cross-functional dependencies that leaders can address.

### 4. Core vs. Supportive Value Streams
Recognizes both direct customer-facing processes and supporting internal processes.

### 5. Data-Driven Analysis
Uses metrics to identify bottlenecks objectively, not based on opinions or politics.

### 6. Visualization for Clarity
Creates shared understanding across teams and leadership about how work actually flows.

### 7. Iterative Improvement
Enables ongoing refinement as new constraints emerge after resolving current ones.

## Value Stream vs. Process Mapping

**Value Stream Mapping:**
- Macro-level strategic view
- Cross-functional handoffs
- Longer lead times (days, weeks)
- Example: Delivering a car to customers (order to delivery)

**Process Mapping:**
- Micro-level tactical details
- Step-by-step procedures within one area
- Shorter cycle times (minutes, hours)
- Example: Painting car exterior (specific manufacturing step)

Choose VSM when optimizing end-to-end customer value delivery. Choose process mapping when improving specific procedural steps.

## Eight Categories of Waste

VSM identifies waste in eight categories:

1. **Defects** - Errors requiring rework, reducing quality
2. **Overproduction** - Making more than needed, creating inventory
3. **Over-processing** - Unnecessary work beyond requirements
4. **Waiting/Queuing** - Idle time when work sits between steps
5. **Inventory** - Excess work-in-progress accumulating
6. **Transportation** - Unnecessary movement of information or materials
7. **Motion** - Inefficient physical or digital navigation
8. **Unused Talent** - Underutilized skills and knowledge

## Critical Metrics

### Lead Time (LT) & Processing Time (PT)

**Lead Time:** Total time from customer request to delivered value

**Processing Time:** Total time spent actively working (not waiting)

**Formula:**
```
Lead Time = Sum of all time (work + wait)
Processing Time = Sum of only work time
Flow Efficiency = PT ÷ LT × 100%
```

**Example:**
- Lead Time: 10 days (customer submits request to receives result)
- Processing Time: 6 hours (actual work across all steps)
- Flow Efficiency: 6 hours ÷ (10 × 24 hours) = 2.5%

Low flow efficiency indicates waste—work spends 97.5% of time waiting, not progressing.

### Percent Complete & Accurate (%C&A)

**Definition:** Percentage of work downstream teams can use without rework or additional information.

**Why it matters:**
- Predicts rework burden
- Identifies quality issues at handoff points
- Measures process maturity

**Single downstream team:**
```
%C&A = (Items requiring no rework) ÷ (Total items) × 100%
```

**Multiple downstream teams:**
```
Rolled %C&A = %C&A₁ × %C&A₂ × %C&A₃ × ...
```

**Example:**
- Design creates mockups: 80% complete for frontend team
- Same mockups: 90% complete for backend team
- Rolled %C&A = 0.80 × 0.90 = 72%
- Only 72% of mockups are usable by *both* teams without clarification

Low %C&A indicates poor handoff quality, causing delays and rework downstream.

## Process Block Guidelines

Target **5-15 serial process blocks** for effective mapping. Too few lacks detail; too many overwhelms.

**When to create a new process block:**

1. **Handoffs to new work areas** - Ownership changes
2. **Work accumulation** - Queues form as work waits
3. **Predetermined batching intervals** - Work only moves periodically

**What each block captures:**
- Activity name and owner
- Staffing levels (FTE allocation)
- Lead Time and Process Time
- %C&A (quality of outputs)
- Supporting IT systems

## Facilitating a VSM Workshop

### Pre-Work Checklist

Before the session, ensure:

✅ **Clear mission objectives** - What value stream are we mapping?

✅ **Cross-functional participants** - Include representatives from:
   - Customer Leadership (government organization leader)
   - Buyer (responsible for contract decisions)
   - Mission Owner (represents mission interests)
   - User Community (leader, proxy, or member)
   - Frontline workers and process owners from each step
   - Representatives from edges (QA, Ops, Compliance)

✅ **Physical or virtual workspace** - Whiteboard, sticky notes, or Figjam/Miro board

✅ **Facilitation plan** - Who will guide, who will document

✅ **Timer for measuring** - Stopwatch or time-tracking tool

✅ **Executive sponsorship** - Leadership buy-in for changes

### Key Components to Map

Capture these elements:

- **Mission impact and success metrics** - Why does this value stream exist?
- **Trigger events and inputs** - What starts the process?
- **Customer/end-user identification** - Who receives value?
- **Business process flow** - Steps from trigger to delivery
- **Information systems and data flow** - Tools supporting each step
- **Lead time, process time, %C&A metrics** - Quantify performance
- **Handoffs and pain points** - Where does work stall or fail?

### Six-Step Current State Mapping

#### Step 1: Set the Stage (15 minutes)

Establish context:

- **Mission Impact:** What outcome does this value stream enable?
- **Initiator:** Who starts the process?
- **Trigger:** What event kicks off work?
- **Customer:** Who receives the output?
- **Output:** What gets delivered?

**Example:**
- Mission Impact: Reduce veteran claim processing from 90 to 30 days
- Initiator: Veteran
- Trigger: Claim submission
- Customer: Veteran (receives decision + benefits)
- Output: Claim decision with evidence review

#### Step 2: First Pass - Value Flow (20 minutes)

Map process blocks from trigger to delivery:

- Write each major step on a sticky note or box
- Arrange left-to-right in sequence
- Note ownership and staffing for each block
- Focus on high-level steps that reveal handoffs

**Example blocks (claim processing):**
1. Claim Intake (1 FTE, Intake Team)
2. Evidence Gathering (3 FTE, Claims Processors)
3. Medical Review (2 FTE, Medical Staff)
4. Decision Rating (2 FTE, Rating Specialists)
5. Notification (0.5 FTE, Communications)

#### Step 3: Second Pass - Information Flow (15 minutes)

Identify supporting IT systems:

- Below each process block, note tools and systems used
- Draw connections showing data flow between systems
- Highlight integration gaps or manual handoffs

**Example (claim processing):**
1. Claim Intake → VBMS (claims management system)
2. Evidence Gathering → VBMS + VistA (medical records)
3. Medical Review → VistA + DBQs (disability questionnaires)
4. Decision Rating → VBMS + rating calculator
5. Notification → VBMS + email/postal system

#### Step 4: Third Pass - Metrics (20 minutes)

Capture performance data for each process block:

**Process Time (PT):** Actual work time if someone worked continuously

**Lead Time (LT):** Calendar time from input to output (includes waiting)

**%C&A:** Percentage of outputs usable downstream without rework

**Data collection methods:**
- Historical data from systems
- Sampling recent cases
- Team estimates (least accurate, use when necessary)

**Example metrics (claim processing):**

| Process Block | PT | LT | %C&A |
|--------------|-----|-----|------|
| Claim Intake | 30 min | 2 days | 85% |
| Evidence Gathering | 2 hrs | 30 days | 60% |
| Medical Review | 4 hrs | 20 days | 90% |
| Decision Rating | 3 hrs | 7 days | 95% |
| Notification | 15 min | 1 day | 99% |

**Totals:**
- Process Time: 9.75 hours
- Lead Time: 60 days
- Flow Efficiency: 9.75 hrs ÷ (60 × 24 hrs) = 0.68%

#### Step 5: Fourth Pass - Visual Aids (10 minutes)

Add icons and clarifying notes:

- **Queues:** Show where work accumulates (stacks of papers icon)
- **Rework loops:** Draw arrows showing returns to previous steps
- **Pain points:** Add lightning bolts or warning symbols
- **Manual handoffs:** Highlight with different colors

**Common pain point indicators:**
- Long lead times with short process times (waiting waste)
- Low %C&A (quality issues causing rework)
- High staffing with low throughput (over-processing or defects)

#### Step 6: Fifth Pass - Classification (10 minutes)

Mark each process block:

- **VA (Value-Added)** - Customer would pay for this step
- **RNVA (Required Non-Value-Added)** - Regulatory or compliance requirement
- **NVA (Non-Value-Added)** - Pure waste, could be eliminated

**Classification criteria:**

**Value-Added:**
- Transforms the product/service
- Done right the first time
- Customer cares about it

**Required Non-Value-Added:**
- Doesn't transform product
- Mandated by regulation, security, or compliance
- Can be streamlined but not eliminated

**Non-Value-Added:**
- Doesn't transform product
- Not required
- Pure waste (rework, waiting, duplication)

**Example classification (claim processing):**
- Claim Intake: RNVA (required for tracking)
- Evidence Gathering: VA (transforms claim from incomplete to complete)
- Medical Review: VA (evaluates disability severity)
- Decision Rating: VA (determines benefits)
- Notification: RNVA (required to inform claimant)

### Target State Development

After mapping current state, design the improved future state:

#### 1. Review Findings (15 minutes)

Highlight major bottlenecks:
- Longest lead times
- Lowest %C&A scores
- Highest waste blocks (NVA)

**Example insights (claim processing):**
- Evidence Gathering: 30-day LT (50% of total), 60% C&A (causes rework)
- Flow Efficiency: 0.68% (work spends 99.3% of time waiting)

#### 2. Brainstorm Improvements (20 minutes)

Generate ideas targeting the constraint:

**For Evidence Gathering bottleneck:**
- Pre-submission checklist to improve first-time completeness
- Automated document classification
- Parallel medical review instead of serial
- Direct API integration with medical providers
- AI-assisted evidence validation

#### 3. Design Target State (30 minutes)

Redraw process blocks with improvements:

**New Evidence Gathering block:**
- PT: 1 hr (automation reduces work)
- LT: 5 days (parallel processing + API integration)
- %C&A: 85% (checklist + validation)

**New parallel Medical Review:**
- Split into simultaneous tracks
- PT: 3 hrs (unchanged)
- LT: 7 days (parallel instead of 20-day serial)

**Recalculated totals:**
- Process Time: 8 hours
- Lead Time: 17 days (72% reduction)
- Flow Efficiency: 8 hrs ÷ (17 × 24 hrs) = 2%

#### 4. Calculate Improvement Percentages

Present compelling metrics:

- Lead Time: 60 days → 17 days (72% improvement)
- Flow Efficiency: 0.68% → 2% (194% improvement)
- %C&A: 60% → 85% (42% improvement)

## Facilitation Best Practices

### Do's

✅ **Apply "go see and find out"** - Map reality, not ideals or assumptions

✅ **Time-box sessions** - 60-90 min mapping, 30 min analysis, break

✅ **Ask probing questions:**
- "What happens when this step fails?"
- "Why does work wait here?"
- "How often do you need to go back and get more information?"
- "What percentage of your time is rework?"

✅ **Save wishful thinking** - Document pain points now, solutions later

✅ **Focus on high-level steps** - Capture major handoffs, not every click

✅ **Include edge voices** - QA, operations, compliance, support

✅ **Quantify everything** - Estimates beat no data; refine later

### Don'ts

❌ **Don't map ideal state first** - Current reality reveals true constraints

❌ **Don't map individual actions** - "Open email" and "Click button" are too granular

❌ **Don't rush to solutions** - Resist "We just need to..." statements during current state

❌ **Don't exclude stakeholders** - Missing perspectives hide critical handoffs

❌ **Don't over-scope** - Map one value stream per session

## Common Challenges

### Challenge 1: "We don't have data"

**Response:** Use team estimates. VSM reveals insights even with imprecise metrics. Refine data as you instrument.

**Quick estimation technique:**
- Sample 5 recent cases
- Average their lead times and process times
- Note range to capture variability

### Challenge 2: "Everything is a priority"

**Response:** Flow efficiency reveals the truth. The step with longest LT and lowest %C&A is the constraint.

**Prioritization formula:**
```
Impact Score = (LT reduction potential) × (% of total LT) × (Downstream dependency)
```

Focus on high-impact constraints first.

### Challenge 3: "This is too complex to map"

**Response:** Start with a simplified slice. Map one customer journey or product type, then expand.

**Scope reduction techniques:**
- Map happy path only (exclude exceptions initially)
- Focus on one customer segment
- Limit to one product/service line

### Challenge 4: "Our process is different every time"

**Response:** Variability itself is waste. Map the most common path, then add decision points and branches.

**Handling variability:**
- Document frequency of each branch (80% go left, 20% go right)
- Calculate weighted average LT across branches
- Prioritize standardizing high-frequency paths

## Next Steps After VSM

Use VSM insights to inform:

### 1. Domain Modeling (DDD Event Storming)
Map supporting systems identified in the information flow layer. Understand how data moves and transforms.

### 2. Service Blueprint
Define user experience architecture for customer-facing touchpoints. Connect VSM backend processes to frontend journeys.

### 3. Impact Mapping
Tie process improvements to measurable outcomes. Frame VSM improvements as hypotheses about behavior change.

### 4. Outcome-Oriented Roadmaps
Communicate priorities to stakeholders. Translate VSM bottlenecks into roadmap initiatives.

## Real-World Example: App Deployment

### Current State

**Value Stream:** Deploy application changes to production

**Process Blocks:**

| Block | Owner | PT | LT | %C&A |
|-------|-------|-----|-----|------|
| Code Review | Dev Team | 1 hr | 3 days | 70% |
| Security Scan | SecOps | 30 min | 5 days | 85% |
| Approval Workflow | Managers | 10 min | 7 days | 95% |
| Deployment | DevOps | 2 hrs | 1 day | 80% |
| Smoke Testing | QA | 1 hr | 1 day | 90% |

**Totals:**
- Process Time: 5 hours
- Lead Time: 17 days
- Flow Efficiency: 5 ÷ (17 × 24) = 1.2%

**Key insights:**
- Approval Workflow: 7-day LT for 10 minutes of work (extreme waiting waste)
- Code Review: 70% C&A causes rework in 30% of cases
- Security Scan: 5-day LT suggests infrequent batch processing

### Target State

**Improvements:**

1. **Automate Code Review** (AI-assisted linting + pair programming)
   - PT: 30 min (50% reduction)
   - LT: 1 day (67% reduction)
   - %C&A: 90% (28% improvement)

2. **Integrate Security Scanning** (Shift-left to CI/CD pipeline)
   - PT: 5 min (83% reduction via automation)
   - LT: 10 min (99.9% reduction)
   - %C&A: 95% (12% improvement)

3. **Delegate Approval Authority** (Empower tech leads, escalate exceptions only)
   - PT: 5 min (50% reduction)
   - LT: 1 hour (99.7% reduction)
   - %C&A: 98% (3% improvement)

4. **Parallel Deployment + Testing** (Blue-green deployments with automated tests)
   - PT: 1.5 hrs (25% reduction via automation)
   - LT: 2 hrs (0% reduction but parallelized)
   - %C&A: 95% (19% improvement)

**New Totals:**
- Process Time: 2.25 hours (55% reduction)
- Lead Time: 1.5 days (91% reduction)
- Flow Efficiency: 2.25 ÷ (1.5 × 24) = 6.3% (425% improvement)

**Outcome impact:**
- Deployment frequency: Every 17 days → Every 1.5 days (11x increase)
- Lead time for changes: 17 days → 1.5 days (critical DORA metric)
- Change failure rate: Likely improved via higher %C&A scores

## Summary

Value Stream Mapping reveals:
- Where work waits (lead time vs. process time gaps)
- Where quality fails (low %C&A scores)
- Where waste accumulates (NVA process blocks)
- What constrains throughput (longest LT in the chain)

Use VSM to:
- Identify the constraint limiting system throughput
- Quantify improvement opportunities with data
- Align stakeholders around bottlenecks
- Prioritize process improvements by impact
- Connect process changes to outcome metrics

Remember: "It's not about the map. It's about the conversations, insights, decisions, and organizational healing that mapping enables."

Focus improvement efforts on the constraint, measure results, then find the next constraint. Continuous iteration drives continuous improvement.
