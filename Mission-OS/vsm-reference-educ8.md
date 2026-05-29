# Value Stream Mapping (VSM)

> Lean practice for visualizing value flow and identifying constraints to improve throughput

Value Stream Mapping (VSM) is a Lean tool used to visualize the flow of how value is delivered to a customer — from request to fulfillment. Whether we're talking about software delivery, medication prescriptions, or launching rockets into orbit, this means mapping all of the activities required to transform a customer request into a good or service being fulfilled.

At Rise8, we use VSM in relation to Theories of Constraints to help identify and remove constraints that limit throughput, and thus increasing value stream capacity and quality. By revealing how value flows through our system, highlighting inefficiencies, and aligning teams around transformation priorities, we create imbalances to maximize throughput at the constraint.

> For facilitation guidance, see the **Value Stream Mapping Workshop Play** to learn how to run a VSM workshop.

---

## What is it?

- **Every system has a constraint:** This is the factor that most restricts the system's output.
- **Constraints set the pace:** Draw focus to the constraint until it is no longer the constraint.
- **Improving the constraint improves the system:** Focusing efforts on the constraint yields the most significant performance enhancements.
- **Continuous improvement:** Once a constraint is resolved, another will emerge, necessitating ongoing attention and refinement.

---

## Why do it?

To visualize and improve our process of delivering greater value to customers, we follow seven key principles for Value Stream Mapping:

1. **Customer-centric focus:** VSM should always begin with the customer in mind. Understanding what the customer values ensures that the mapping process aligns with delivering that value efficiently.

2. **Holistic systems thinking:** Rather than optimizing individual processes (i.e. individual "component" efficiency), VSM emphasizes viewing the entire value stream to identify and eliminate waste, ensuring systematic improvements and efficiency (e.g. if one rower suddenly changed their stroke rate, they'd immediately cause the boat to change direction and potentially lose the race).

3. **Leadership engagement:** Effective VSM requires the involvement of stakeholders who have the authority and vision to implement significant changes. Their engagement ensures that improvements are strategic and aligned with mission objectives.

4. **Distinction between core and supportive value streams:** Both core value streams (directly delivering products or services) and supportive value streams (such as employee onboarding or software delivery) are crucial for overall organizational performance.

5. **Data-driven analysis:** VSM relies on collecting accurate data for process times, lead times, and other metrics that are relevant to your mission/business process to identify bottlenecks and areas for improvement.

6. **Visualization for clarity:** Creating visual maps of systems and how processes integrate help teams understand current workflows, identify inefficiencies, and design improved future states.

7. **Iterative improvement:** VSM is not a one-time activity. Organizations should regularly revisit and update their value stream maps to reflect changes and continue improving.

> It's not about the map. It's about the conversations, insights, decisions, and organizational healing that mapping enables for continuous value flow.

---

## Core concepts

Once you understand the practice, use the facilitation play to run a VSM workshop.

### Value stream vs. process mapping

Value stream perspectives should focus on the **macro view** of the system. This is where we are thinking about strategic "what" and "why" conversations with leadership based on the organization's context. They're typically broader in scope, involve cross-functional handoffs, and have longer lead times. Some examples:

- A complex overview of a highway system that supports continuous flow of traffic
- Delivering a car to a customer
- Staffing an employee to work on a contract

Process mapping perspectives help us see the **micro level** details. This is where we focus on the tactical "how" conversations. Some examples:

- A state highway patrol officer responsible for radaring traffic on a designated section of I-90
- How exterior car parts are painted
- Writing and posting a job req on external websites

### Categories of waste

The following categories of waste are used by nearly all communities. Software Delivery and Healthcare examples are provided to help translate these for different context settings.

| Waste category | Description | Software delivery example | Healthcare example |
|---|---|---|---|
| **Defects** | Products or services requiring rework due to errors or non-conformity | Bugs in production causing hotfixes or patches | Misdiagnoses or medication errors requiring correction |
| **Overproduction** | Making more than required or before needed | Developing extra features that go unused by end-users | Conducting unnecessary diagnostic tests or preparing surplus supplies |
| **Overprocessing** | Doing more work than the customer needs or expects | Extra documentation or rework due to unclear requirements | Duplicate paperwork or redundant procedural steps |
| **Waiting/queuing** | Idle time when processes or people wait for the next step | Delays waiting for code reviews, QA, or deployment approvals | Patients waiting for test results, physician availability, or beds |
| **Inventory** | Excess materials or work-in-progress not yet adding value | Backlog of unfinished code or features (WIP) | Stockpiling supplies or medications that risk expiration |
| **Transportation** | Unnecessary movement of materials or information | Excessive handoffs between teams or environments | Moving patients between departments more than needed |
| **Motion** | Unnecessary movement by people or equipment | Frequent context switching between tasks | Staff walking long distances to fetch equipment or records |
| **Unused talent** | Under-utilizing employees' skills, creativity, or knowledge | Developers limited by bureaucracy and not tapped for improvement ideas | Staff ideas or advanced skills not leveraged for process improvements |

### Key metrics

VSM metrics can span categories like time, flow, quality, cost, people, or any metric that is relevant to your mission context.

#### Time, flow & efficiency

| Metric | Description | Software delivery example | Healthcare example |
|---|---|---|---|
| **Lead time (LT)** | Time to complete an individual process block, as well as total time from order to delivery — reflects responsiveness of the process | 5 days from ticket submission to production deploy | 35 minutes from prescription request to fulfillment |
| **Process time (PT)** | Time it takes between when the work arrives at a process block until it's passed on to the next step, as well as total time spent executing all process blocks (touch time) | 4 hours — actual coding, testing, and merging time per feature | 4 minutes — actual work in filling prescription |
| **Throughput** | Rate at which units are delivered over time | 3 features released per sprint | 20 prescriptions filled per hour |
| **Utilization** | Percentage of time resources are in active use | Developers active ~80% of day | Nurses spend ~70% of shift on value-added patient tasks |
| **Flow efficiency** | Ratio of processing time vs total lead time | (4h PT ÷ 5 days LT) ≈ 3% | (4 min PT ÷ 35 min LT) ≈ 11% |

#### Quality

| Metric | Description | Software delivery example | Healthcare example |
|---|---|---|---|
| **Defect rate** | Number or percentage of defect occurrences | 10% bug rate found post-release | 2% medication dispensed incorrectly |
| **First pass yield** | Share of units completed accurately without rework | 85% of deployments succeed without hotfix | 90% of patient charts correct on first review |
| **Quality filter mapping** | Percent of defects detected at each stage (e.g., dev, QA) | Dev: 5%, QA: 3%, Prod: 2% | Registration errors: 4%; Diagnostic errors: 6% |
| **% Complete & accurate (%C&A)** | Share of work handed downstream with no issues | 95% of code reviews pass without rework | 92% of patient charts are complete and accurate |
| **Rolled %C&A** | Overall downstream-ready rate across all steps (product of stepwise %C&A) | 0.95 × 0.90 × 0.92 ≈ 79% overall yield | 0.92 × 0.95 × 0.90 ≈ 79% across admission, assessment, care |
| **Simple avg %C&A** | Unweighted average of %C&A across steps | (95% + 90% + 92%) ÷ 3 ≈ 92.3% | (92% + 95% + 90%) ÷ 3 ≈ 92.3% |
| **Weighted avg %C&A** | Average of %C&A weighted by volume at each step | (95% × 50 + 90% × 30 + 92% × 20) ÷ 100 ≈ 92.1% | (92% × 40 + 95% × 40 + 90% × 20) ÷ 100 ≈ 92.4% |

#### Cost

| Metric | Description | Software delivery example | Healthcare example |
|---|---|---|---|
| **Inventory cost** | Cost associated with holding WIP or stock | $5,000 in backlog work-in-progress | $1,200 of unused medications in stock |
| **Waste cost** | Estimated cost of inefficiencies or defects in the stream | $3,000 per sprint from bug-fix rework | $500 per week from patient flow delays |

#### Customer/delivery

| Metric | Description | Software delivery example | Healthcare example |
|---|---|---|---|
| **On-time delivery (%)** | Percentage of units delivered by promised deadlines | 95% of features released on planned date | 90% of patients receive meds on schedule |
| **Customer satisfaction** | User-rated satisfaction | 4.5/5 from product surveys | 4.3/5 from patient feedback surveys |

#### Bottleneck analysis

| Metric | Description | Software delivery example | Healthcare example |
|---|---|---|---|
| **Relative bottleneck frequency** | How often a particular stage becomes a bottleneck | Code reviews are bottleneck 60% of the time | Lab results delay bottlenecks in 40% of patient flows |
| **Relative bottleneck severity** | Degree of impact when a stage becomes a bottleneck | Delays lead to +2 days release delay | Adds +30 min to patient wait time |

#### Mission

| Metric | Description | Software delivery example | Healthcare example |
|---|---|---|---|
| **One Mission Metric That Matters (OMMTM)** | The north star guiding metric, and any other critical KPIs relevant to the mission | Deployment Frequency (target on-demand); Lead Time for Changes (target < 1 day); Change Failure Rate (target < 15%) | Eliminate annual deaths caused by treatment failures (target = 0) |

### Lead time & process time

**Lead time** (aka Elapsed Time, Throughput Time, or Turnaround Time) accounts for all time between work received and work passed to the next process block — including the processing time.

**Process time** (aka Touch Time, Work Time, or Cycle Time) is measured whenever work is not sitting idle. Another way to think about process time is when we're touching, talking, or thinking about the work.

```
Work Received
     │
     ▼
[←────────────── Lead Time (LT) ──────────────────►]
[Work is idle ──► Process Time (PT) ◄── Work is idle]
                                                    │
                                                    ▼
                                         Work passed to next
                                         process or department
```

### Percent complete & accurate (%C&A)

When calculating %C&A, we're trying to understand the quality of both inputs and outputs throughout our value stream. The %C&A of one mission/business process block is calculated based upon the feedback from the downstream mission/business process block(s).

If a process block has 80% C&A, this means only 80% of the work that the next process block receives is "usable as is". In other words, 20% of the time the downstream owner must take one or more of the following actions:

1. **Correcting** information or material that was supplied
2. **Adding** information that should have been supplied
3. **Clarifying** information that should/could have been clearer

**Example — linear flow:**

| Process 1 | Process 2 | Process 3 | Process 4 |
|---|---|---|---|
| 80% C&A | 95% C&A | 50% C&A | 90% C&A |

> %C&A = % of incoming work that's "usable as is"; no need for rework.

**Multiple downstream process owners receiving work from one upstream process owner:**

When multiple downstream process owners use the work provided by one upstream process owner, the %C&A for the upstream owner is calculated by combining feedback from all applicable downstream owners.

Example:
- Process block #5 states %C&A is 75%
- Process block #7 states %C&A is 50%
- Therefore, the overall %C&A for process block #4 = **(0.75 × 0.50) × 100 = 37.5%**

---

## Rise8's three value streams

Regardless of your role at Rise8, it's important to understand the three value streams we influence, and how they support our company's value equation of optimizing for mission value:

```
Rise8 Delivery Service  →  IT Delivery  →  Customer Mission
```

1. **Customer mission:** Represents personnel, capabilities, and outcomes in production that impact real mission operations (e.g. running Air Operations Center missions such as Intelligence, Surveillance, and Reconnaissance).

2. **IT/Software delivery:** Enables the delivery of mission capabilities, measured up through deployment into a production environment (e.g. enabling continuous delivery).

3. **Rise8 delivery service:** How we partner with customers from pre-sales to delivering outcomes in prod. We bridge the gap between output and mission impact through standard Rise8 services such as delivering cloud & platform solutions, mission-critical apps, as well as continuous software delivery capabilities.

---

## Understanding current state maps

A basic current state value stream map will highlight the following at a minimum:

- Whether there is a supplier and customer involved, or the customer plays both roles, for how value is generated
- **Information flow layer** (e.g. IT systems or other products that help move data)
- **Process flow layer** (e.g. the high-level mission/business process blocks that deliver value)
- **Key metrics** (i.e. Lead Time, Processing Time, and Rolled % Complete and Accurate)
- The number of processed units/items that are sitting or waiting in inventory or a queue between processes
- What function/department/group is responsible for completing the process block
- The number of operators/workers required for a process block to be completed (also indicates where a process block is not automated)

### Example: basic current state VSM

```
                        [Customer]
                             ↑
Information Flow ──► [IT-1]     [IT-2]
                       ↓           ↓
Value Flow ──► [Process 1]→[Process 2]→[Process 3]→[Process 4]→[Process 5]
               Function A   Function B  Function C   Function D  Function E
               5 operators  11 operators 3 operators  7 operators  4 operators
               1 item queue  → 45 items queue →  10 items queue →

Key Metrics:
  LT:   1 day     0.5 days    5 days      2 days      1 day
  PT:   10 mins   5 mins      120 mins    30 mins     15 mins
  %C&A: 50%       75%         85%         99%         95%

Total LT = 9.5 days  |  Total PT = 180 mins  |  Activity Ratio = 3.9%  |  Rolled %C&A = 30.0%
```

**Obvious waste signals in this example:**
1. 45 items are being queued between process blocks 2 and 3
2. LT is nearly 10 days while PT is only 3 hours
3. IT systems 1 and 2 within the information flow layer are not integrated throughout this value stream

### Example: basic target state VSM

```
                              [Customer]
                                   ↑
Information Flow ──► [IT-1]           [IT-2]
                        ↓               ↓
Value Flow ──► [Process 1] ──► [Process 2] ──► [Process 3]
               Function A      Function C       Function E
               5 operators     3 operators       4 operators
               1 item queue → 5 items → 10 items →

Improvements applied: Error-proofing, Standard work, IT interface, Modified approvals, Cross-training

Key Metrics:
  LT:   1 day     2 days      0.5 days
  PT:   10 mins   120 mins    30 mins
  %C&A: 99%       95%         95%

Total LT = 3.5 days  |  Total PT = 160 mins  |  Activity Ratio = 9.5%  |  Rolled %C&A = 89.3%
```

> "The goal isn't just the map — it's momentum. Use your VSM to drive the next best improvement toward better mission outcomes."

---

## Relevant resources

- **Value Stream Mapping Workshop Play** — Facilitation guide for running VSM workshops
- **Digital Operating Model 3: Alignment** — Video resource (158 views, ~43 min)
- **eBook:** 4 Easy Steps to Mastering Chaos with VSM — Useful to contextualize modern software VSM
- **Book:** Value Stream Mapping — Essential for understanding the lean and facilitation discipline behind VSM
- **eLearning:** Value Stream Transformation Part 1 of 2 / Part 2 of 2
- **Concept:** Improvement Kata — Learn to iterate toward outcomes (Toyota Kata)
- **Process Mapping Practice**
- **Karen Martin's Value Stream Transformation talk at Prodacity 2025**
- **Labs Practices Value Stream Mapping Workshop**
- **DORA Value Stream Map**
- **Theory of Constraints & Lean Manufacturing**
