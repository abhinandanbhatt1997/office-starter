# Azure AI Enterprise Accelerator: Operating Playbook

**Document ID:** ACC-PLAYBOOK  
**Owner:** AI/ML Engineering  
**Status:** ACTIVE  
**Version:** 1.0  

## 1. The Golden Rule

**Traceability creates protection.**

Do not hide code. Do not struggle silently. Do not release without evidence. 
Every action you take must leave a professional, auditable trail in Azure DevOps, the repository, or the documentation.

---

## 2. The Project Lifecycle: When to Use Which Pack

Follow this timeline for every new project or major feature release.

### Phase 1: Onboarding & Alignment (Days 1–7)
**Goal:** Prove you understand the ecosystem and detect blockers before they become failures.

| Step | Action | Pack Used |
|---|---|---|
| **1** | Run the pre-flight scripts to verify Azure, Azure DevOps, Network, and Terraform access. | **pack_1** |
| **2** | Schedule a 30-minute meeting with your manager. Fill out the `MANAGER_ALIGNMENT.md` document together. Define exactly what "r0" means. | **pack_0** |
| **3** | Start your weekly reporting habit. Send your first `WEEKLY_EVIDENCE_REPORT` on Friday. | **pack_7** |
| **4** | If you are blocked by IT/Security, log it in the `RISK_REGISTER` and escalate using the 24-hour rule. | **pack_0 / pack_7** |

### Phase 2: Project Setup & Governance (Week 2)
**Goal:** Create a safe, controlled environment for development.

| Step | Action | Pack Used |
|---|---|---|
| **1** | Instantiate your new project using the accelerator template. | **pack_3** |
| **2** | Generate the AI agent context files and load them into Claude/Codex/Cursor. | **pack_4** |
| **3** | Fill out the `ARCHITECTURE_TEMPLATE` and `ASSUMPTIONS_TEMPLATE`. Get them reviewed. | **pack_6** |
| **4** | Set up the Azure DevOps variable groups, service connections, and environments. | **pack_5** |
| **5** | Review orchestration patterns. Select the pattern that matches your use case. | **pack_8**|
| **6** | Fill out AGENT_DESIGN_TEMPLATE.md before writing any agent code. | **pack_8**|

### Phase 3: Development & Iteration (Weeks 3–6)
**Goal:** Build the r0 system using evidence and controlled AI assistance.

| Step | Action | Pack Used |
|---|---|---|
| **1** | Before writing application logic, fill out the `EVAL_PLAN_TEMPLATE`. Define what "good" looks like. | **pack_2** |
| **2** | Use your AI coding agents to build the app. Enforce the `AGENT_RULES` strictly. | **pack_4** |
| **3** | Run your evaluation scripts after every major prompt or model change. Save the reports. | **pack_2** |
| **4** | Commit code via Pull Requests. Ensure the PR pipeline runs docs checks and secret scans. | **pack_5** |
| **5** |Copy the appropriate code scaffold from orchestration/code-scaffolds/.| **pack_8** |
| **6** |Fill out TOOL_REGISTRY_TEMPLATE.md if your agent uses tools.| **pack_8** |
| **7** |Fill out PROMPT_CHAIN_TEMPLATE.md with your prompt versions.| **pack_8** |
| **8** |Implement observability using observability_scaffold.py.example.| **pack_8** |
### Phase 4: Release & Handover (Weeks 7–8)
**Goal:** Ship r0 safely and transfer ownership professionally.

| Step | Action | Pack Used |
|---|---|---|
| **1** | Finalize the `KNOWN_LIMITATIONS` document. Get Product sign-off. | **pack_6** |
| **2** | Execute the deployment pipeline. Run the smoke tests. | **pack_5** |
| **3** | Publish the `R0_RELEASE_EVIDENCE` bundle. Link it to the release work item. | **pack_7** |
| **4** | Execute the `HANDOVER_PACK` ceremony with the Ops/Support team. Get sign-off. | **pack_7** |

| **5** |Fill out ORCHESTRATION_RUNBOOK_TEMPLATE.md for ops handover.| **pack_8** |
| **6** |Verify all orchestration observability is working in Application Insights.| **pack_8** |
---

## 3. Pack Quick-Reference Guide

### pack_0: Governance & Survival Contract
- **When to use:** Day 1 of a new job, or Day 1 of a new project.
- **How to use:** Open `pack_0/MANAGER_ALIGNMENT.md.md` and use it to prepare an alignment discussion with your manager. Record agreed outcomes according to your organization's process.
- **Key File:** `pack_0/MANAGER_ALIGNMENT.md.md`

### pack_1: Pre-Flight Checklist
- **When to use:** The very first hour of a new environment, and whenever you suspect a network/access issue.
- **How to use:** From the repository root, review `pack_1/docs/checklists/PREFLIGHT_MASTER_CHECKLIST.md`, copy `pack_1/config/preflight.env.example` to `pack_1/config/preflight.env` and fill in approved values, then run `bash pack_1/scripts/preflight/run-preflight.sh` if authorized. If it fails, review the generated report and ask the Platform/DevOps team for help.
- **Key File:** `pack_1/scripts/preflight/run-preflight.sh`

### pack_2: Eval / Research Pack
- **When to use:** Before you write any AI logic, and after every prompt/model change.
- **How to use:** Define evaluation criteria using the Pack 2 guidance and templates, then follow `pack_2/eval/README.md` for tool paths and usage.
- **Key File:** `pack_3/eval/templates/EVAL_PLAN_TEMPLATE.md`

### pack_3: Full Repo Skeleton
- **When to use:** When starting a brand new project instance.
- **How to use:** From the repository root, run `bash pack_3/scripts/project/instantiate-project.sh <project-name>`. This creates a project scaffold under `pack_3/projects/` by default.
- **Key File:** `pack_3/scripts/project/instantiate-project.sh`

### pack_4: AI Agent Context Pack
- **When to use:** Every time you open your AI coding agent (Claude/Codex/Cursor).
- **How to use:** From the repository root, run `bash pack_4/agents/scripts/generate-agent-files.sh`. Ensure your coding tool is reading `pack_4/agents/generated/AGENTS.md`.
- **Key File:** `pack_4/agents/source/AGENT_RULES.md`

### pack_5: CI/CD / IaC Pack
- **When to use:** When deploying infrastructure or releasing code.
- **How to use:** Configure Azure DevOps to use the examples in `pack_5/pipelines/azure-devops/` after adapting them to your organization. Follow your required approval process for deployments.
- **Key File:** `pack_5/pipelines/azure-devops/README.md`

### pack_6: Enterprise Documentation Pack
- **When to use:** Continuously. Do not wait until the end of the project.
- **How to use:** Copy templates from `pack_6/docs/templates/` into your project's `docs/` folder. Fill them out as you build.
- **Key File:** `pack_6/docs/templates/KNOWN_LIMITATIONS_TEMPLATE.md`

### pack_7: Operations, Security & Handover Protection
- **When to use:** On the reporting cadence agreed with your manager, during incidents (Incident Response), and at the end of a project (Handover).
- **How to use:** Use the weekly evidence report template on the cadence and through the channel your manager expects. Follow your organization's incident process, and use the handover template to plan a formal transfer.
- **Key File:** `pack_7/reports/WEEKLY_EVIDENCE_REPORT_TEMPLATE.md`

---

## 4. Emergency Protocols

### Scenario A: You are blocked by Azure Access or Networking
1. **Do not** sit silently and wait.
2. Run **pack_1** pre-flight scripts.
3. Copy the failure message into the **pack_7** `WEEKLY_EVIDENCE_REPORT` blocker table.
4. Send a message to the Platform team: *"Pre-flight check failed for [Resource]. Here is the report. Can you advise on the expected timeline?"*

### Scenario B: Your Manager asks for code outside the repository
1. **Do not** send a ZIP file or a personal email attachment.
2. **Do not** hide the code.
3. Respond with **pack_0** Code Ownership language: *"For security and auditability, I'm keeping all work in the approved Azure DevOps repository. Here is the branch, PR, release tag, and documentation."*

### Scenario C: The AI Agent writes insecure or AWS-style code
1. Stop the agent.
2. Open **pack_4** `pack_4/agents/source/FORBIDDEN_ACTIONS.md`.
3. Remind the agent of the rules. If it continues to fail, switch to a higher-reasoning model as defined in **pack_4** `MODEL_USAGE_POLICY.md`.

### Scenario D: A production incident occurs
1. Open **pack_7** `pack_7/docs/operations/INCIDENT_RESPONSE.md`.
2. Determine the Severity (Sev 1, 2, or 3).
3. Execute the immediate mitigation steps (Kill Switch, Fallback, Quarantine).
4. Record the incident in the **pack_7** weekly evidence report or your organization's incident system, following local policy.

---

## 5. The Final Check

Before you log off on any given day, ask yourself:

1. Did I push my code to the approved repository?
2. Did I update the documentation if I changed behavior?
3. Did I log any blockers I am facing?
4. Is my work traceable to a work item or decision record?

If the answer is **Yes**, you are safe. You are operating as a senior, enterprise-grade engineer.
