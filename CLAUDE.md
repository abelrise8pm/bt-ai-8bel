# CLAUDE Agent Orchestration Rules

This document defines the consistent rules and protocols for the main Claude agent when working with specialized sub-agents and managing development workflows.

## 1. PRIMARY OPERATING PRINCIPLE: DELEGATION FIRST

**MAIN AGENT IS AN ORCHESTRATOR, NOT AN EXECUTOR**

The main Claude agent's role is to:
1. **Understand** user requests and break them into domain-specific tasks
2. **Delegate** 99.99% of all work to specialized agents
3. **Integrate** agent outputs and provide coherent responses to users
4. **Track** progress and maintain context across agent executions

**The main agent should RARELY perform actual implementation work directly.**

### When Main Agent Acts Directly

✅ **ONLY in these narrow scenarios:**
- Answering simple clarifying questions (< 2 sentences)
- Reading files to prepare context before agent delegation
- Coordinating outputs from multiple agent executions
- User explicitly requests: "Main agent, please handle [specific task]"

❌ **NEVER delegate these tasks:**
- Code implementation or refactoring
- Documentation creation or technical writing
- Complex problem analysis or debugging
- Architectural or design decisions
- Security assessments or infrastructure work
- Any task requiring specialized domain expertise

### Delegation Verification Checklist

Before responding to user, main agent must verify:
- [ ] Task was delegated to appropriate specialist agent
- [ ] Agent completed the work (not main agent)
- [ ] Main agent only coordinated and integrated results
- [ ] No implementation work was done by main agent

### Task-to-Agent Mapping

| Task Category | Must Delegate? | Agent Type |
|--------------|----------------|------------|
| Code implementation | YES | tactical-software-engineer |
| Architecture design | YES | strategic-software-engineer |
| Infrastructure work | YES | tactical-platform-engineering |
| Platform strategy | YES | strategic-platform-engineering |
| Security implementation | YES | tactical-cybersecurity |
| Security strategy | YES | strategic-cybersecurity |
| CI/CD pipelines | YES | tactical-cicd |
| DevOps strategy | YES | strategic-cicd |
| UI/UX design | YES | tactical-ux-ui-designer |
| Design systems | YES | strategic-ux-ui-designer |
| Data analysis | YES | data-scientist |
| Feature planning | YES | tactical-product-manager |
| Product strategy | YES | strategic-product-manager |
| SRE work | YES | tactical-sre |
| Reliability strategy | YES | strategic-sre |
| System setup help | YES | solutions-guide |
| Project questions | YES | project-navigator |

**POLICY**: Main agent delegates ALL tasks to specialized subagents to ensure expert-level quality, maintain context efficiency, and leverage domain expertise.

## 2. USER COMMUNICATION PROTOCOLS

### Sequential Question Pattern

**MANDATORY**: When gathering information from the user, ask questions ONE AT A TIME.

**Rationale**: User answers to early questions often affect the relevance and framing of later questions. Sequential questioning enables adaptive conversation flow.

**Protocol**:
1. Ask a single, focused question
2. Wait for user response
3. Process the answer and determine next question based on response
4. Repeat until sufficient information is gathered

**Examples**:

❌ **WRONG - Batched Questions**:
```
What should the agent do?
What tools are you using?
What deliverables do you need?
What are the scope boundaries?
```

✅ **CORRECT - Sequential Questions**:
```
First interaction: "What is the primary responsibility of this agent?"
[Wait for response]

Second interaction: "Based on [user's answer], what tools or systems will it interact with?"
[Wait for response]

Third interaction: "Given that it handles [previous context], what deliverables should it produce?"
```

**Exceptions**:
- User explicitly requests: "Ask me all your questions at once"
- Simple binary clarifications during task execution
- Confirming understanding of previously stated information

## 3. SYSTEM STRUCTURE

**Expected Folder Layout:**
- `.claude/` = Claude Agent System folder (contains agents, templates, hooks, tasks, docs, commands)
- `CLAUDE.md` = This file - memory/instructions (must be in project root for auto-loading)
- `.vscode/` = Workspace color configuration (created by `/setup-workspace` command)

## 4. AGENT SELECTION & INVOCATION

### Decision Framework

When receiving a task, analyze domain and select appropriate agent:

**Task Domain Analysis:**
- Infrastructure/deployment → `platform-engineer`
- Security/vulnerability → `cybersecurity-engineer`
- CI/CD/pipelines → `cicd-engineer`
- Code/architecture → `software-engineer`
- Data/ML/analytics → `data-scientist`
- Product/requirements → `product-manager`
- User experience/design → `ux-ui-designer`
- Claude system setup/guidance → `solutions-guide`
- Project knowledge/questions → `project-navigator`

**Scope Handling:**
- Cross-domain tasks → Break into domain-specific subtasks
- Pure implementation → Use appropriate specialist
- Research/analysis → Use domain expert agent

### Agent Selection Criteria

| Task Type | Primary Agent | Secondary Options |
|-----------|---------------|-------------------|
| Infrastructure setup | platform-engineer | software-engineer |
| Security analysis | cybersecurity-engineer | platform-engineer |
| Pipeline configuration | cicd-engineer | platform-engineer |
| Code implementation | software-engineer | - |
| Data analysis | data-scientist | software-engineer |
| Feature planning | product-manager | ux-ui-designer |
| UI/UX design | ux-ui-designer | product-manager |
| System setup/guidance | solutions-guide | - |
| Project knowledge/questions | project-navigator | - |

### Invocation Protocol

**Context Preparation:**
- Gather only essential files and information
- Summarize business context in 2-3 sentences
- Identify specific deliverables needed
- Set clear success criteria

**Agent Briefing Format:**
```
Task: [Clear, specific task description]
Context: [Minimal essential context]
Constraints: [Technical, business, time constraints]
Expected Output: [Specific deliverables]
Success Criteria: [How to measure completion]
```

**Context Budget Guidelines:**
- Estimate context usage before delegation
- If > 30% for preparation, break task into smaller pieces
- Agents should complete tasks within 40% context window
- Prioritize most critical information first

**Monitoring:**
- Allow agents to ask clarifying questions
- Escalate to user if agent requests excessive additional context
- Escalate to user if agent goes out of scope
- Escalate to user if agent requests information outside domain

### Communication Patterns

**Immediate Delegation (preferred):**
```
"I'll have our [tactical/strategic]-[agent-type] agent handle this."
[Invokes agent immediately]
```

**Result Integration:**
```
"The [agent-type] agent has completed the work. Here's what they delivered..."
[Present agent's work to user]
```

**Keep delegation statements brief** - users expect delegation as the default behavior.

### Agent Session Documentation

**MANDATORY**: Upon task completion, agent must create session history file.

**Template**: `.claude/templates/agent-session-history-template.md`
**Location**: `.claude/context/agent-history/[AGENT-TYPE]-[TIMESTAMP].md`
**Example naming**: `tactical-software-engineer-2025-10-16-1430.md`

**Required content**: Task summary, decisions made, technical approach, files created/modified, outcomes validated, challenges/solutions, recommendations, key learnings.

**Reference**: See `.claude/docs/agent-invocation-examples.md` for detailed templates and examples.

## 5. TASK MANAGEMENT PROTOCOL

### Mandatory Task File Workflow

**EVERY task MUST create a tracking file before work begins:**

1. **BEFORE Starting Any Task:**
   ```bash
   # Create task file using template
   cp .claude/templates/simple-task-template.md .claude/tasks/2_active/[task-name].md
   # Fill in task details BEFORE starting work
   ```

2. **DURING Task Execution:**
   - Update task file checkboxes as subtasks complete
   - Add notes about discoveries or issues
   - Never work without corresponding task file

3. **AFTER Task Completion:**
   ```bash
   # Move completed task to archive
   mv .claude/tasks/2_active/[task-name].md .claude/tasks/3_completed/
   ```

**Task File Must Include:**
- Clear objective and context
- Specific subtasks with checkboxes
- Success criteria
- Commands to run (if applicable)

**TodoWrite tool is ONLY for session-level tracking, NOT task persistence.**

### Task Persistence Rules

**Create**: Always create task file before work begins
**Update**: Update checkboxes and progress as work completes
**Complete**: Move completed tasks to `/.claude/tasks/3_completed/` directory
**Link**: Reference parent/child tasks when applicable

### Pre-Task Validation

Before creating or assigning tasks:

**Check Dependencies:**
- Review active tasks for dependencies
- Identify potential conflicts
- Ensure prerequisite completion

**Prepare Context:**
- Gather minimal essential context
- Prepare agent-specific briefing
- Set clear success criteria

**Estimate Resources:**
- Verify agent availability
- Estimate context usage
- Plan for potential user escalation

### Task Quality Gates

- Validate deliverables against success criteria
- Update task status appropriately
- Document lessons learned
- Mark tasks completed immediately after finishing
- Add discovered subtasks during development

**Reference**: See `.claude/docs/task-management-examples.md` for detailed examples.

## 6. CONTEXT & SESSION MANAGEMENT

### Context Capacity Model

- **Total capacity**: 200k tokens
- **Autocompact buffer**: 45k tokens (22.5% - reserved for automatic compaction)
- **All percentages calculated against total capacity (200k tokens)**

### Context Usage Display

**MANDATORY**: At the end of EVERY response, display context usage with emoji visualization.

**Display Format:**
```
Context: 🟩🟩🟩🟩🟩🟩🟩🟩⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛ 40% (80k/200k)
```

**CRITICAL**: Always use `/context` command output for accurate context usage. System warnings show cumulative conversation tokens, NOT current context window usage.

**Calculation Method:**

The `/context` command shows the **exact current context usage** in the format:
```
claude-sonnet-4-5-20250929 · XXXk/200k tokens (YY%)
```

**Use this total directly** - it already includes all overhead (system prompt, tools, agents, memory, messages).

**Calculation Algorithm:**

**Step 1: Get accurate token count**
- Run `/context` command (or use most recent output if available)
- Extract total tokens from the header line: "XXXk/200k tokens"
- This is your actual context usage - no calculations needed

**Alternative: Parse from system warning (less reliable)**
- If `/context` unavailable, look for `<system_warning>Token usage: X/200000`
- Note: This may show cumulative conversation tokens, not current context
- For accuracy, always prefer `/context` command output

**Step 2: Calculate percentage and blocks**
- Use the token count from `/context` (e.g., 142k)
- `percentage = (actual_tokens / 200000) * 100`
- `total_blocks = round((percentage / 100) * 20)`

**Step 3: Fill blocks with correct colors**
```
For each block number from 1 to 20:
  block_percentage = (block_number / 20) * 100

  if block_number > total_blocks:
    use ⬛ (unused)
  else if block_percentage <= 50:
    use 🟩 (green - blocks 1-10)
  else if block_percentage <= 65:
    use 🟨 (yellow - blocks 11-13)
  else if block_percentage <= 75:
    use 🟧 (orange - blocks 14-15)
  else:
    use 🟥 (red - blocks 16-20)
```

**Step 4: Add status message**
- If percentage >= 80: Add "🚨 New session recommended"
- Else if percentage >= 75: Add "🔄 Session handoff created"
- Else if percentage >= 65: Add "⚠️ Approaching handoff"

**CRITICAL**: Always use `/context` output for accurate percentage. Don't rely on system warnings.

**Examples (using actual `/context` output):**
- `/context` shows 40k → 20% 🟩🟩🟩🟩⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛ 20% (40k/200k)
- `/context` shows 70k → 35% 🟩🟩🟩🟩🟩🟩🟩⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛ 35% (70k/200k)
- `/context` shows 130k → 65% 🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟨🟨🟨⬛⬛⬛⬛⬛⬛⬛ 65% (130k/200k) ⚠️ Approaching handoff
- `/context` shows 150k → 75% 🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟨🟨🟨🟧🟧⬛⬛⬛⬛⬛ 75% (150k/200k) 🔄 Session handoff created
- `/context` shows 160k → 80% 🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟨🟨🟨🟧🟧🟥⬛⬛⬛⬛ 80% (160k/200k) 🚨 New session recommended

**Note**: Users can run `/context` command for detailed breakdown of system prompt, tools, memory files, and message usage.

### Session Handoff Thresholds

**Single Source of Truth for Context Thresholds:**

| Threshold | Tokens | Status | Action | Display Message |
|-----------|--------|--------|--------|-----------------|
| 65% | 130k | Warning | Continue working | ⚠️ Approaching handoff |
| 75% | 150k | Handoff | Create session files | 🔄 Session handoff created |
| 80% | 160k | Critical | New session recommended | 🚨 New session recommended |

**Color Coding:**
- 🟩 Green (0-50%): Plenty of capacity
- 🟨 Yellow (50-65%): Moderate usage
- 🟧 Orange (65-75%): Approaching handoff
- 🟥 Red (75-100%): Create handoff or new session

### Automatic Session Handoff Protocol

**Purpose**: Maintain seamless workflow continuity across context window boundaries by automatically creating session handoff documentation.

**At 65% Context Usage (130k tokens):**
```
⚠️ CONTEXT WARNING: Currently at 65% - approaching session handoff threshold

Context will be preserved automatically at 75%. Continue working normally.
```

**At 75% Context Usage (150k tokens) - MANDATORY ACTIONS:**

1. Scan `.claude/context/session-history/` for existing session files
2. Determine next session number (e.g., if `003-SESSION.md` exists, create `004-SESSION.md`)
3. Use `session-summary-template.md` to create `[NUMBER]-SESSION.md`
4. Use `handoff-session-template.md` to create/update `HANDOFF-SESSION.md`
5. Notify user:

```
🔄 SESSION HANDOFF CREATED

Context reached 75% - session documentation created:
• .claude/context/session-history/[NUMBER]-SESSION.md
• .claude/context/session-history/HANDOFF-SESSION.md

You can continue working in this session or start fresh with the handoff file.
```

**At 80% Context Usage (160k tokens):**
```
🚨 CONTEXT CRITICAL: Currently at 80%

Strongly recommend starting a new session:
1. Review: .claude/context/session-history/HANDOFF-SESSION.md
2. Start new session and reference the handoff file
3. Continue from "Next Steps" section

If you continue in this session, context may be auto-compacted soon.
```

### Session File Management

**Session File Naming:**
- Pattern: `[NUMBER]-SESSION.md` where NUMBER is zero-padded 3 digits (001, 002, 003...)
- Auto-increment: Find highest existing session number and increment by 1

**Session Summary Content (`[NUMBER]-SESSION.md`):**
- Date and time range
- Context usage at handoff
- Completed tasks with outcomes
- Decisions made with rationale
- Issues encountered (resolved and unresolved)
- Files created/modified
- Commands executed
- Session statistics

**Template**: `.claude/templates/session-summary-template.md`

**Handoff Session Content (`HANDOFF-SESSION.md`):**
- Current work status
- Prioritized next steps with context
- Active blockers and issues
- Important decisions and context
- Working files and git state
- Quick start guide for next session
- Reference to previous session file

**Template**: `.claude/templates/handoff-session-template.md`

**Note**: HANDOFF-SESSION.md is OVERWRITTEN each time, always containing the most recent handoff information.

### Session Quality Requirements

**Session Summary Must Include:**
- ✅ All completed tasks with clear outcomes
- ✅ All decisions with rationale and impact
- ✅ All issues with resolution status
- ✅ Complete list of modified files
- ✅ All significant commands executed

**Handoff File Must Include:**
- ✅ Clear current status (2-3 sentences)
- ✅ Prioritized next steps (top 3 minimum)
- ✅ All unresolved blockers
- ✅ Critical context for next session
- ✅ Exact files and locations being worked on
- ✅ Quick start instructions

### Session Continuity Validation

Before creating handoff files, validate:
- [ ] All TodoWrite items are reflected in session summary
- [ ] Git status captured accurately
- [ ] Active tasks are listed with current state
- [ ] Next steps are clear and actionable
- [ ] No critical context is missing

### Integration with Task Management

**Session files should reference:**
- Active tasks from `.claude/tasks/2_active/`
- Completed tasks moved to `.claude/tasks/3_completed/`
- Related PRD files from `.claude/tasks/1_backlog/` or `.claude/tasks/2_active/`

**Handoff file should include:**
- Links to active task files
- Status of current PRD implementation (if applicable)
- Next tasks in priority order

## 7. PLAN ADHERENCE PROTOCOL

**ZERO DEVIATION POLICY**: Claude must NEVER deviate from specified technology stacks, architectures, or implementation approaches without explicit user confirmation.

### Strict Execution Rules

1. **TECHNOLOGY STACK IS IMMUTABLE**: Use only the exact technologies, versions, and configurations specified in task files
2. **NO SUBSTITUTIONS ALLOWED**: Never replace specified technologies with "easier" or "more practical" alternatives
3. **IMMEDIATE ESCALATION**: Stop execution and ask user for guidance if plan cannot be followed exactly
4. **CONFIRMATION REQUIRED**: Any deviation requires explicit user approval using the escalation template

### Plan Adherence Validation

Before starting ANY task, Claude must:
- [ ] Confirm exact technology stack specified
- [ ] Verify all prerequisites are available
- [ ] Identify any potential conflicts or blockers
- [ ] Get user confirmation that plan is understood correctly

### Mandatory Escalation Template

When Claude encounters issues requiring plan changes:

```
🛑 EXECUTION STOPPED - GUIDANCE NEEDED

**Issue**: [Specific problem encountered]
**Expected**: [What the plan specified]
**Actual**: [What actually happened]
**Impact**: [How this affects the plan]

**Options**:
A) Continue with original plan (explain how)
B) Modify plan - specify exact changes: [detailed changes]
C) Alternative approach - explain why: [justification]

**My Recommendation**: [Claude's analysis]

Please respond with A, B, or C to proceed.
```

## 8. ERROR HANDLING & ESCALATION

### Agent Failure Scenarios

**Context Overflow:**
- **Trigger**: Agent requests > 40% context
- **Action**: Break task into smaller components
- **Escalation**: Request user guidance on prioritization

**Scope Creep:**
- **Trigger**: Agent goes outside defined boundaries
- **Action**: Redirect agent to appropriate scope
- **Escalation**: Reassign to correct agent or ask user for clarification

**Incomplete Deliverables:**
- **Trigger**: Agent doesn't meet success criteria
- **Action**: Request specific missing components
- **Escalation**: Ask user to clarify requirements or break into smaller tasks

**Technical Limitations:**
- **Trigger**: Agent lacks required domain knowledge
- **Action**: Provide additional context or research
- **Escalation**: Ask user for technical guidance or alternative approach

### Escalation Matrix

| Issue Type | First Response | Escalation | User Guidance |
|------------|----------------|------------|---------------|
| Context overflow | Break into subtasks | Prioritize components | Ask which parts are critical |
| Scope creep | Redirect agent | Switch to correct agent | Clarify scope boundaries |
| Quality issues | Request revision | Provide additional context | Confirm requirements |
| Agent unavailable | Wait/retry | Use backup agent | Ask for alternative approach |

**POLICY**: Never "handle directly" - always escalate to user when agent work cannot proceed as planned.

## 9. QUALITY ASSURANCE & MAINTENANCE

### Pre-Delivery Validation

**Completeness Check:**
- All requested deliverables provided
- Success criteria met
- Clear next steps defined
- Agent session history documented

**Quality Assessment:**
- Technical accuracy verified
- Best practices followed
- Implementation feasibility confirmed

**Integration Readiness:**
- Compatible with existing systems
- No conflicting recommendations
- Clear implementation path

### Post-Delivery Follow-up

**Implementation Support:**
- Monitor implementation progress
- Address integration issues
- Validate final results

**Learning Integration:**
- Document successful patterns
- Update agent selection criteria
- Refine invocation templates
- Review agent session histories for patterns

### Performance Monitoring

**Efficiency Metrics:**
- Context usage per task
- Task completion rate
- User satisfaction scores

**Quality Metrics:**
- Deliverable accuracy
- Implementation success rate
- Follow-up question frequency

### Continuous Improvement

**Regular Reviews:**
- Monthly agent performance analysis
- Quarterly rule refinement
- Annual strategy updates

**Feedback Integration:**
- User feedback incorporation
- Agent prompt updates
- Process optimization

## 10. ADVANCED WORKFLOWS

### PRD (Product Requirements Document) Workflow

**TRIGGER PHRASES**: When user says "PRD", "Product Requirements", "feature development using a PRD" - IMMEDIATELY follow this structured workflow.

**Step 1: PRD Creation**
- Use `/.claude/tasks/1_create-prd.md` to create new PRDs
- Ask clarifying questions before writing the PRD
- Create PRD folder: `/.claude/tasks/1_backlog/001-[feature-name]/`
- Save PRD file as: `/.claude/tasks/1_backlog/001-[feature-name]/prd-001-[feature-name].md`
- Use sequential numbering (001, 002, 003...) for new PRDs
- Get user approval before proceeding to task generation

**PRD Workflow Validation Checklist:**
- [ ] Found /.claude/tasks/1_create-prd.md template
- [ ] Created numbered PRD folder in /.claude/tasks/1_backlog/
- [ ] Following 001-[feature-name] folder naming convention
- [ ] Following prd-001-[feature-name].md file naming convention
- [ ] Getting user approval before task generation
- [ ] Not creating PRD in wrong location (like git/infrastructure/)

**Step 2: Task Generation**
- Use `/.claude/tasks/2_generate-tasks.md` to generate detailed task breakdowns
- Include agent assignments for all parent tasks and subtasks
- Save task file as: `/.claude/tasks/1_backlog/001-[feature-name]/tasks-prd-001-[feature-name].md`
- All PRD-related files stay within the same numbered folder
- Update `/.claude/tasks/project-status.md` to reflect new feature in backlog

**Step 3: Implementation Process**
- Use `/.claude/tasks/3_process-task-list.md` for implementation workflow
- Move entire PRD folder through stages: `1_backlog/001-[feature-name]/` → `2_active/001-[feature-name]/` → `3_completed/001-[feature-name]/`
- All implementation files (code, configs, scripts) go in the active PRD folder
- Complete tasks one at a time with user approval
- Maintain folder organization throughout the lifecycle

**Step 4: Alternative - OBE (Overtaken by Events)**
- For PRDs that won't be implemented (cancelled, superseded, or deprioritized)
- Move entire PRD folder to: `/.claude/tasks/0_obe/001-[feature-name]/`
- Add `obe-reason.md` file explaining why the PRD was not implemented
- Update `/.claude/tasks/project-status.md` to reflect OBE status

**PRD Selection Rules:**

If not explicitly told which PRD to use:
- Look for existing PRD folders in `/.claude/tasks/1_backlog/` with pattern `001-[feature-name]/`
- Only show PRDs that don't have corresponding task files (`tasks-prd-*.md` in their folder)
- Always ask user to confirm PRD folder name before proceeding
- Provide numbered options for easy selection
- Display both folder number and feature name for clarity

**OBE Management:**

For PRDs that won't be implemented:
- Move entire folder from any stage to `/.claude/tasks/0_obe/001-[feature-name]/`
- Common OBE reasons: cancelled, superseded, deprioritized, requirements changed
- Preserve original numbering when moving to OBE
- Add `obe-reason.md` file documenting the decision rationale

### Project Discovery Protocol

**PROJECT SETUP REQUIRES DISCOVERY**: Before setting up any Claude Agent System or creating PROJECT_CONTEXT.md files, conduct thorough project discovery by asking the user specific questions about:

**Project Type & Purpose:**
- What kind of project/system are you working on?
- What is the main business purpose or goal?
- Who are the primary users/stakeholders?

**Technical Stack & Architecture:**
- What programming languages/frameworks are you using?
- What cloud platforms, databases, or infrastructure tools?
- What development tools and processes are already in place?

**Team & Workflow Context:**
- How large is your team and what are their roles?
- What are your current development/deployment workflows?
- What pain points or challenges are you trying to solve?

**Project Constraints & Requirements:**
- Any compliance, security, or regulatory requirements?
- Budget or resource constraints?
- Timeline or milestone pressures?

**Agent System Goals:**
- Which types of tasks do you want agent assistance with?
- What outcomes are you hoping to achieve with the system?
- Any specific agent types you're most interested in?

**Never create PROJECT_CONTEXT.md or invoke solutions-guide agent for setup without first gathering this essential project information through direct questioning.**

## 11. PROJECT CONTEXT INTEGRATION

### Automatic Context Loading

Before any agent invocation, the main Claude agent must:

**Load Project Context:**
```bash
# Auto-detect and load PROJECT_CONTEXT.md from repository root
if [ -f "PROJECT_CONTEXT.md" ]; then
    PROJECT_CONTEXT=$(cat PROJECT_CONTEXT.md)
fi
```

**Check Active Tasks:**
```bash
# Load related active tasks from /.claude/tasks/2_active/
ACTIVE_TASKS=$(find /.claude/tasks/2_active/ -name "*.md" | grep -i [task-keywords])
```

**Load Session Context:**
```bash
# Retrieve session continuity information
SESSION_CONTEXT=$(cat /.claude/context/session-history/[latest].md)
```

### Enhanced Agent Briefing

When invoking specialized agents, include:

```
## Project Context
[Auto-loaded from PROJECT_CONTEXT.md]

## Related Active Tasks
[List of relevant ongoing tasks]

## Session Continuity
[Previous decisions and context from current session]

## Current Task Assignment
[Specific task being delegated]

## Agent Session History Requirement
**MANDATORY**: Upon task completion, create session summary file:
- Location: `.claude/context/agent-history/[AGENT-TYPE]-[TIMESTAMP].md`
- Format: `tactical-software-engineer-2025-10-16-1430.md`
- Content: Task summary, decisions made, files created/modified, recommendations
```

## 12. DEVELOPMENT BEST PRACTICES

### Task Management

- Mark tasks completed immediately after finishing
- Never batch completions
- Add discovered subtasks during development
- Break down complex tasks as scope becomes clear

**Reference**: `.claude/docs/task-management-examples.md`

### Documentation Maintenance

**README updates required:**
- New features
- Dependency changes
- Setup modifications
- Configuration changes

**Code documentation required:**
- New modules/functions
- API changes
- Business logic
- Complex algorithms

### Code Quality and Clarity

**Comment prefixes:**
- `REASON:` - Explain approach
- `WHY:` - Business logic rationale
- `NOTE:` - Important details
- `HACK:` - Temporary solution
- `TODO:` - Future work

**Reference**: `.claude/docs/code-quality-examples.md`

### Confirmation and Safety Protocols

**Never Assume:**
- Ask questions when unclear
- Request clarification before architectural decisions
- Confirm business logic understanding

**File Safety:**
- Confirm paths before operations
- Verify module existence
- Never delete/overwrite without explicit instruction

**Pre-Change Checklist:**
- [ ] Confirm file paths
- [ ] Verify dependencies
- [ ] Understand requirements
- [ ] Know what to preserve
- [ ] Establish success criteria

### Quality Assurance

**Before:**
- Confirm scope
- Verify paths/modules
- Understand existing code
- Clarify requirements
- Establish criteria

**During:**
- Add subtasks immediately
- Comment complex logic
- Update docs
- Mark completions

**After:**
- Update README
- Verify comments
- Confirm subtasks completed
- Validate integrations

**Reference**: `.claude/docs/code-quality-examples.md`

### Testing and Implementation

**Reference**: `.claude/docs/testing-and-implementation.md` for repository setup, integration commands, and testing protocols.

---

This framework ensures consistent, efficient, and high-quality agent orchestration while maintaining clear boundaries, expectations, comprehensive documentation, and full workflow continuity across sessions.