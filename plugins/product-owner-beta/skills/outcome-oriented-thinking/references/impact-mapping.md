# Impact Mapping

## Overview

Impact Mapping is a strategic planning technique that visualizes cause-and-effect relationships between desired outcomes and planned deliverables. It helps teams align work with measurable business/mission impact while avoiding the "feature factory trap."

The methodology emphasizes **outcomes over outputs**, focusing on behavioral changes rather than feature production.

## Core Framework: Four Dimensions

Impact Mapping uses four hierarchical layers, working from mission impact down to deliverables:

### 1. Business/Mission Impact (WHY)

**What:** Measurable changes you want to achieve for customers or organizations

**Questions to ask:**
- What mission or business goal are we trying to achieve?
- How will we measure success?
- What's the quantifiable target?

**Characteristics:**
- Strategic level, not tactical
- Measurable with metrics
- Time-bound when possible
- Connected to organizational goals

**Examples:**
- "Reduce veteran claim processing time from 90 days to 30 days"
- "Increase small business contract awards by 25%"
- "Improve patient appointment adherence from 65% to 85%"
- "Decrease production incident MTTR from 4 hours to 30 minutes"

### 2. Actors (WHO)

**What:** People or systems who can influence whether the impact is achieved

**Questions to ask:**
- Who can help us achieve this impact?
- Who might block or hinder progress?
- Whose behavior needs to change?
- Who are the direct and indirect users?

**Actor categories:**
- **Primary users** - Direct beneficiaries of the solution
- **Secondary users** - People who support or enable primary users
- **Decision makers** - People who approve, fund, or authorize
- **Influencers** - People who shape opinions and adoption
- **Blockers** - People or systems that might resist change

**Examples:**
- Veterans submitting benefits claims
- Consular officers processing visas
- Small business owners applying for contracts
- Backend engineers debugging production issues
- Patients scheduling appointments
- Support staff handling inquiries

### 3. Outcomes (HOW)

**What:** Desired behavior changes in actors or systems that lead to mission impact

**Questions to ask:**
- How should actors behave differently?
- What should they start/stop/continue doing?
- What observable changes indicate progress?
- How will we measure these behavior changes?

**Characteristics:**
- Observable and measurable
- Focused on behavior, not features
- Connected to specific actors
- Enables the mission impact

**Examples:**
- "Veterans submit complete claims on first attempt" (instead of multiple rounds of evidence requests)
- "Consular officers verify applicant information in <5 minutes" (instead of 45 minutes across 8 systems)
- "Small business owners complete registration in <1 week" (instead of 3-4 weeks)
- "Backend engineers correlate errors across services in <2 minutes" (instead of 30 minutes of manual log searching)

### 4. Deliverables (WHAT)

**What:** Features, services, or products the team might build to enable the outcomes

**Questions to ask:**
- What could we build to enable this behavior change?
- What's the simplest solution that might work?
- Are there multiple options worth considering?
- Which deliverable has the highest impact-to-effort ratio?

**Characteristics:**
- Multiple options per outcome (brainstorm before committing)
- Described as capabilities, not requirements documents
- Specific enough to estimate, vague enough to adapt
- Evaluated by impact on outcomes, not completeness

**Examples (for "Veterans submit complete claims"):**
- Pre-submission checklist with required evidence
- Inline help explaining each form field
- Automated document classification
- Real-time validation with clear error messages
- Progress-saving draft functionality

**Key principle:** Deliverables are hypotheses about what might work, not commitments. Generate multiple options, then prioritize based on impact potential.

## The Impact Mapping Process

### Pre-Work

Before the session:
1. **Establish clear mission objectives** - What's the strategic goal?
2. **Gather balanced team** - Product, Design, Engineering + key stakeholders
3. **Designate lead facilitator** - One person to guide session and prompt critical thinking
4. **Prepare workspace** - Physical whiteboard or virtual Miro/Figjam board
5. **Collect baseline data** - Current metrics, user feedback, pain points
6. **Prepare context brief** - Background material on problem space, relevant data, mission objectives
7. **Time-box the session** - Use timer to pace each mapping phase and maintain momentum

### Six-Step Facilitation

#### Step 1: Frame Impact (15 minutes)

Start by establishing the measurable mission impact.

**Facilitation approach:**
- Write the impact goal at the center/top of the workspace
- Ensure it's quantified and time-bound
- Confirm everyone agrees on how success will be measured

**Example framing:**
- "Reduce veteran benefits claim processing time from 90 days to 30 days within 12 months"
- "Increase first-call resolution rate from 45% to 75% by Q3"
- "Decrease production incident MTTR from 4 hours to 30 minutes within 6 months"

**Watch out for:**
- Outputs disguised as impacts ("Launch mobile app" is not an impact)
- Unmeasurable goals ("Make users happy")
- Multiple competing goals (pick one per map)

#### Step 2: Identify Actors (15 minutes)

Brainstorm who can help or hinder achieving the impact.

**Facilitation approach:**
- Use sticky notes or map branches for each actor
- Ask "Who else?" repeatedly to surface hidden actors
- Don't filter yet—capture everyone who might be relevant

**Prompting questions:**
- Who directly experiences the problem?
- Who supports those direct users?
- Who approves or funds solutions?
- Who might resist change?
- What systems or processes act as actors?

**Example actors (for claim processing):**
- Veterans submitting claims
- VSO representatives helping veterans
- Claims processors reviewing evidence
- Medical providers supplying records
- IT systems validating submissions

#### Step 3: Define Outcomes (30 minutes)

For each actor, specify measurable behavior changes needed.

**Facilitation approach:**
- Take one actor at a time
- Ask "How should this actor behave differently to enable our impact?"
- Focus on observable behaviors, not feelings or features
- Demand measurability: "How would we know if this behavior changed?"

**Prompting questions:**
- What should [actor] start doing?
- What should [actor] stop doing?
- What should [actor] do more/less of?
- How will we measure this behavior change?

**Example outcomes (for Veterans):**
- Submit claims with all required evidence on first attempt
- Use online portal instead of paper forms
- Track claim status without calling help desk
- Update contact information proactively when moving

**Watch out for:**
- Features disguised as outcomes ("Use the mobile app")
- Feelings instead of behaviors ("Feel confident")
- Unmeasurable changes ("Better understand the process")

#### Step 4: Brainstorm Deliverables (20 minutes)

For each outcome, generate multiple solution options.

**Facilitation approach:**
- Encourage wild ideas—don't filter yet
- Generate 3-5 options per outcome before evaluating
- Focus on "what could we build?" not "what will we build?"
- Describe capabilities, not detailed requirements

**Prompting questions:**
- What's the simplest thing that might enable this behavior?
- What would be the most impactful solution?
- What could we build in 2 weeks to test this hypothesis?
- Are there non-software options (training, policy changes)?

**Example deliverables (for "Submit complete claims"):**
- Pre-submission checklist with evidence requirements
- Inline help explaining each form field
- Automated document classification using AI
- Real-time validation with clear error messages
- Progress-saving draft functionality
- Video walkthroughs for complex sections

#### Step 5: Cluster & Prioritize (15 minutes)

Group related deliverables and assess impact potential.

**Facilitation approach:**
- Look for deliverables that appear under multiple outcomes (high leverage)
- Cluster similar solutions
- Use dot voting or impact/effort matrix for prioritization
- Identify quick wins vs. strategic bets

**Prioritization dimensions:**
- **Impact** - How much does this move the outcome metric?
- **Confidence** - How certain are we this will work?
- **Effort** - How much time/cost to build?
- **Risk** - What could go wrong?

**Output:** Ranked list of deliverables with highest potential to drive outcomes

#### Step 6: Frame Hypotheses (15 minutes)

Convert top deliverables into testable hypotheses using the canonical hypothesis format from SKILL.md.

**Example hypothesis:**

```
We believe implementing a pre-submission checklist with required evidence
will drive veterans to submit complete claims on first attempt (from 40% to 75% complete)
and lead to reduced claim processing time (from 90 days to 60 days)

Our hypothesis is valid if:
- 70%+ of veterans use the checklist before submission
- Evidence requests decrease from 60% to 25% of claims
- Average processing time decreases by 30+ days within 3 months
```

## Key Values and Benefits

### 1. Uncovers Hidden Assumptions

Impact Mapping makes implicit beliefs explicit. When someone says "We need feature X," mapping reveals the underlying assumption: "We believe X will cause behavior Y which will lead to impact Z."

Making assumptions explicit enables:
- Identifying risky assumptions to test first
- Finding alternative paths to the same outcome
- Avoiding sunk cost fallacy when hypotheses fail

### 2. Strengthens Outcome-First Thinking

The hierarchical structure forces teams to:
- Define success before discussing solutions
- Connect every deliverable to measurable outcomes
- Evaluate options based on impact, not features

This prevents "feature factory" syndrome where teams ship constantly without moving metrics.

### 3. Enables Experimentation

By framing deliverables as hypotheses, Impact Mapping encourages:
- Building small experiments to test assumptions
- Learning from failures quickly
- Pivoting when evidence contradicts beliefs

### 4. Aligns Stakeholders

The visual map creates shared understanding:
- Executives see connection to strategic goals
- Engineers understand the "why" behind work
- Users see their needs reflected
- Operations understand downstream impacts

### 5. Preserves Optionality

Multiple deliverables per outcome preserve solution flexibility:
- Teams can choose the highest-leverage option
- Failed experiments don't block progress
- New information enables course correction

## Integration with Other Frameworks

### Complements OKRs
- **OKR Objective** → **Impact Mapping Impact**
- **OKR Key Results** → **Impact Mapping Outcomes**
- Deliverables show *how* to achieve key results

### Feeds Value Stream Mapping
- Actors become process participants to observe
- Outcomes suggest metrics to track per process block
- Impact defines the constraint to optimize

### Informs Outcome-Oriented Roadmaps
- Impact becomes the mission impact section
- Outcomes become the outcome definitions
- Deliverables become hypotheses to test

### Extends Problem Statements
- Problem statement identifies the impact to optimize
- Actors emerge from "who experiences this problem?"
- Outcomes specify desired behavior changes
- Deliverables test solutions to the problem

## Anti-Patterns to Avoid

### Starting with Solutions

❌ **Bad:** "Let's map out the mobile app features"

✅ **Good:** "What mission impact are we targeting? Who needs to behave differently?"

**Fix:** Always start with impact, work backward to deliverables.

### Vague Outcomes

❌ **Bad:** "Users are more engaged"

✅ **Good:** "Users log in 3x per week (up from 1x per month) and complete 80%+ of started workflows"

**Fix:** Demand observable, measurable behavior changes.

### Single Solution Per Outcome

❌ **Bad:** One outcome → One deliverable → Ship it

✅ **Good:** One outcome → 3-5 deliverable options → Prioritize → Test hypothesis

**Fix:** Brainstorm multiple options before committing.

### Feature Roadmaps Disguised as Impact Maps

❌ **Bad:** Impact = "Launch platform," Outcome = "Users have access," Deliverable = "Build feature X"

✅ **Good:** Impact = "Reduce support calls by 40%," Outcome = "Users self-serve common tasks 80% of time," Deliverable = "Knowledge base with inline search / AI chatbot / guided wizards"

**Fix:** Ensure impact is measurable organizational change, not delivery milestones.

### Missing Measurement

❌ **Bad:** Define outcomes but never measure whether behavior changed

✅ **Good:** Instrument metrics before building, monitor during rollout, validate after launch

**Fix:** Treat "Our hypothesis is valid if..." section as critical acceptance criteria.

## Real-World Example: Reducing Claim Processing Time

### Impact (WHY)
**Goal:** Reduce veteran disability claim processing time from 90 days to 30 days within 12 months

**Baseline metrics:**
- Current average: 90 days
- 60% of claims require additional evidence requests
- Each evidence round adds 20 days
- 45% of veterans call for status updates weekly

### Actors (WHO)
1. **Veterans** submitting claims
2. **VSO Representatives** helping veterans
3. **Claims Processors** reviewing submissions
4. **Medical Providers** supplying records
5. **IT Systems** validating and routing claims

### Outcomes (HOW)

**For Veterans:**
- Submit complete claims on first attempt (40% → 75%)
- Track claim status online instead of calling (45% call weekly → 10%)
- Understand evidence requirements before starting (30% → 80%)

**For VSO Representatives:**
- Identify missing evidence before submission (catch 80%+ issues)
- Spend less time on status inquiries (4 hrs/day → 1 hr/day)

**For Claims Processors:**
- Process complete claims in <15 days (currently 30 days)
- Spend less time requesting evidence (30% of time → 5%)

**For IT Systems:**
- Auto-classify uploaded documents with 90%+ accuracy
- Route complete claims directly to processors (skip manual triage)

### Deliverables (WHAT)

**For "Submit complete claims" outcome:**

Option 1: **Pre-submission checklist**
- Shows required evidence for claim type
- Validates documents before submission
- Estimates processing time based on completeness

Option 2: **AI document classification**
- Automatically identifies document types
- Flags missing required evidence
- Suggests what to upload next

Option 3: **Guided claim wizard**
- Step-by-step interview format
- Context-sensitive help for each question
- Progress saving at each step

Option 4: **VSO collaboration portal**
- Share draft claims with representatives
- Real-time review and feedback
- Submit only when VSO approves

**For "Track status online" outcome:**

Option 1: **Status dashboard**
- Real-time claim status updates
- Estimated completion dates
- Next steps guidance

Option 2: **Proactive notifications**
- SMS/email updates when status changes
- Alerts when action needed
- Reminders for pending items

Option 3: **Conversational AI assistant**
- Answer common status questions
- Explain current stage and next steps
- Escalate to human when needed

### Prioritization

Using Impact × Confidence / Effort:

**Quick Wins:**
1. Pre-submission checklist (High impact, High confidence, Low effort)
2. Proactive notifications (Medium impact, High confidence, Low effort)

**Strategic Bets:**
3. AI document classification (High impact, Medium confidence, High effort)
4. Guided claim wizard (High impact, Medium confidence, Medium effort)

**Later:**
5. VSO collaboration portal (Medium impact, Low confidence, Medium effort)
6. Conversational AI assistant (Medium impact, Medium confidence, High effort)

### Hypothesis (for Pre-submission Checklist)

```
We believe implementing a pre-submission checklist with required evidence
will drive veterans to submit complete claims on first attempt (from 40% to 75%)
and lead to reduced claim processing time (from 90 days to 60 days)

Our hypothesis is valid if:
- 70%+ of veterans view the checklist before submitting
- Evidence requests decrease from 60% to 35% of claims within 3 months
- Average processing time decreases by 20+ days within 6 months
- Veteran satisfaction with the process increases from 3.2 to 4.0+ out of 5
```

## Facilitation Best Practices

### Do's

✅ **Time-box ruthlessly** - 90-120 minutes max, then break

✅ **Visualize hierarchically** - Make the impact → actors → outcomes → deliverables flow obvious

✅ **Demand measurements** - If someone can't describe how to measure an outcome, it's not an outcome

✅ **Encourage divergent thinking** - Generate many deliverable options before converging

✅ **Challenge assumptions** - When someone says "obviously," dig deeper

✅ **Include diverse perspectives** - Operations, compliance, support, not just product and engineering

✅ **Document hypotheses** - Capture "we believe" statements for later validation

### Don'ts

❌ **Don't start with solutions** - Resist "We need to build X" statements until outcomes are clear

❌ **Don't skip actors** - Every behavior change happens through someone

❌ **Don't allow vague outcomes** - "Better experience" is not measurable

❌ **Don't commit to deliverables prematurely** - Generate options, then prioritize

❌ **Don't ignore feasibility** - If everything is "high priority," nothing is

❌ **Don't create the map and forget it** - Revisit quarterly as you learn

## Summary

Impact Mapping provides structure for outcome-oriented thinking:

1. **Start with mission impact** - Measurable organizational change
2. **Identify actors** - Who can help or hinder
3. **Define outcomes** - Observable behavior changes
4. **Brainstorm deliverables** - Multiple options per outcome
5. **Prioritize** - Impact, confidence, effort, risk
6. **Frame hypotheses** - Testable beliefs about cause and effect

Use Impact Mapping to:
- Avoid building features without clear outcomes
- Align stakeholders around success definitions
- Preserve solution flexibility through optionality
- Enable experimentation and learning

The goal is not the map—it's the conversations, insights, and alignment that mapping enables.
