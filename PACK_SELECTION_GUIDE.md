# Pack Selection Guide

**Document ID:** ACC-GUIDE  
**Owner:** AI/ML Engineering  
**Status:** ACTIVE  
**Version:** 1.0  

## Purpose

This is your definitive reference for **which pack to open, when, and why**.

When you are unsure what to do next, open this file. Find your situation. Follow the guidance.

---

## 1. Master Reference Table

| I need to... | Use Pack | Key File(s) |
|---|---|---|
| Align with my manager on scope | `pack_0` | `governance/MANAGER_ALIGNMENT.md` |
| Define decision authority | `pack_0` | `governance/DECISION_AUTHORITY.md` |
| Establish code ownership rules | `pack_0` | `governance/CODE_OWNERSHIP.md` |
| Define handover standards | `pack_0` | `governance/HANDOVER_STANDARD.md` |
| Set up communication cadence | `pack_0` | `governance/COMMUNICATION_PLAN.md` |
| Track risks | `pack_0` | `governance/RISK_REGISTER_TEMPLATE.md` |
| Track assumptions | `pack_0` | `governance/ASSUMPTIONS_REGISTER_TEMPLATE.md` |
| Check my Azure access | `pack_1` | `scripts/preflight/run-preflight.sh` |
| Check my Azure DevOps access | `pack_1` | `scripts/preflight/checks/check-ado-access.sh` |
| Check my RBAC permissions | `pack_1` | `scripts/preflight/checks/check-rbac.sh` |
| Check network connectivity | `pack_1` | `scripts/preflight/checks/check-private-connectivity.sh` |
| Check Terraform state access | `pack_1` | `scripts/preflight/checks/check-terraform-state.sh` |
| Check Key Vault access | `pack_1` | `scripts/preflight/checks/check-keyvault.sh` |
| Check AI quota | `pack_1` | `scripts/preflight/checks/check-quotas.sh` |
| Generate a pre-flight report | `pack_1` | `scripts/preflight/generate-preflight-report.sh` |
| Design an evaluation plan | `pack_2` | `eval/templates/EVAL_PLAN_TEMPLATE.md` |
| Create an evaluation dataset | `pack_2` | `eval/datasets/sample/` |
| Run an evaluation | `pack_2` | `tools/eval/run-eval.py` |
| Validate a dataset | `pack_2` | `tools/eval/dataset_validator.py` |
| Write an evaluation report | `pack_2` | `eval/templates/EVAL_REPORT_TEMPLATE.md` |
| Track experiments | `pack_2` | `eval/templates/EXPERIMENT_LEDGER_TEMPLATE.md` |
| Manage prompt versions | `pack_2` | `eval/templates/PROMPT_REGISTRY_TEMPLATE.md` |
| Create a dataset card | `pack_2` | `eval/templates/DATASET_CARD_TEMPLATE.md` |
| Instantiate a new project | `pack_3` | `scripts/project/instantiate-project.sh` |
| Configure project settings | `pack_3` | `templates/project-instance/project.yaml` |
| Set up project documentation | `pack_3` | `templates/project-instance/docs/` |
| Control my AI coding agent | `pack_4` | `agents/generated/CLAUDE.md` or `AGENTS.md` |
| Define Azure coding patterns | `pack_4` | `agents/source/AZURE_PATTERNS.md` |
| Set model usage policy | `pack_4` | `agents/source/MODEL_USAGE_POLICY.md` |
| Define forbidden actions | `pack_4` | `agents/source/FORBIDDEN_ACTIONS.md` |
| Set code review standards | `pack_4` | `agents/source/CODE_REVIEW_CHECKLIST.md` |
| Regenerate agent context files | `pack_4` | `agents/scripts/generate-agent-files.sh` |
| Set up Azure DevOps pipelines | `pack_5` | `pipelines/azure-devops/` |
| Configure service connections | `pack_5` | `pipelines/azure-devops/SERVICE_CONNECTION_STANDARD.md` |
| Configure variable groups | `pack_5` | `pipelines/azure-devops/VARIABLE_GROUP_STANDARD.md` |
| Configure environments | `pack_5` | `pipelines/azure-devops/ENVIRONMENT_STANDARD.md` |
| Set up Terraform modules | `pack_5` | `infra/modules/` |
| Manage Terraform state | `pack_5` | `infra/STATE_MANAGEMENT.md` |
| Follow naming conventions | `pack_5` | `infra/NAMING_STANDARD.md` |
| Write enterprise documentation | `pack_6` | `docs/templates/` |
| Define AI delivery standards | `pack_6` | `docs/enterprise/AI_DELIVERY_STANDARD.md` |
| Define identity standards | `pack_6` | `docs/enterprise/IDENTITY_STANDARD.md` |
| Define networking standards | `pack_6` | `docs/enterprise/NETWORKING_STANDARD.md` |
| Define AI governance | `pack_6` | `docs/enterprise/AI_GOVERNANCE.md` |
| Document architecture | `pack_6` | `docs/templates/ARCHITECTURE_TEMPLATE.md` |
| Write a runbook | `pack_6` | `docs/templates/RUNBOOK_TEMPLATE.md` |
| Document known limitations | `pack_6` | `docs/templates/KNOWN_LIMITATIONS_TEMPLATE.md` |
| Write release notes | `pack_6` | `docs/templates/RELEASE_NOTE_TEMPLATE.md` |
| Handle a production incident | `pack_7` | `docs/operations/INCIDENT_RESPONSE.md` |
| Set up alerting | `pack_7` | `docs/operations/ALERTING_STANDARD.md` |
| Execute a rollback | `pack_7` | `docs/operations/ROLLBACK_STANDARD.md` |
| Perform threat modeling | `pack_7` | `docs/security/THREAT_MODEL_TEMPLATE.md` |
| Complete a DPIA checklist | `pack_7` | `docs/compliance/DPIA_CHECKLIST.md` |
| Execute a formal handover | `pack_7` | `docs/handover/HANDOVER_PACK_TEMPLATE.md` |
| Create release evidence | `pack_7` | `reports/R0_RELEASE_EVIDENCE_TEMPLATE.md` |
| Send weekly status report | `pack_7` | `reports/WEEKLY_EVIDENCE_REPORT_TEMPLATE.md` |
| Design an AI agent | `pack_8` | `orchestration/templates/AGENT_DESIGN_TEMPLATE.md` |
| Register agent tools | `pack_8` | `orchestration/templates/TOOL_REGISTRY_TEMPLATE.md` |
| Design a prompt chain | `pack_8` | `orchestration/templates/PROMPT_CHAIN_TEMPLATE.md` |
| Write an orchestration runbook | `pack_8` | `orchestration/templates/ORCHESTRATION_RUNBOOK_TEMPLATE.md` |
| Build a single agent | `pack_8` | `orchestration/code-scaffolds/single_agent_scaffold.py.example` |
| Build a multi-agent pipeline | `pack_8` | `orchestration/code-scaffolds/multi_agent_pipeline_scaffold.py.example` |
| Implement tool calling | `pack_8` | `orchestration/code-scaffolds/tool_calling_scaffold.py.example` |
| Implement RAG | `pack_8` | `orchestration/code-scaffolds/rag_retrieval_scaffold.py.example` |
| Manage session state | `pack_8` | `orchestration/code-scaffolds/session_state_scaffold.py.example` |
| Handle burst workloads | `pack_8` | `orchestration/code-scaffolds/service_bus_burst_scaffold.py.example` |
| Integrate guardrails | `pack_8` | `orchestration/code-scaffolds/guardrail_integration_scaffold.py.example` |
| Set up observability | `pack_8` | `orchestration/code-scaffolds/observability_scaffold.py.example` |
| Map AWS to Azure | `pack_8` | `orchestration/reference/AWS_TO_AZURE_ORCHESTRATION_MAPPING.md` |

---

## 2. Lifecycle Phase Guide

### Phase 1: Day 1 — Arrival & Alignment

**Goal:** Establish trust, detect blockers, align on scope.

| Hour | Action | Pack |
|---|---|---|
| 09:00 | Set up local environment. Clone repos. | `pack_3` |
| 09:30 | Run pre-flight checks against company Azure/ADO. | `pack_1` |
| 10:00 | Log any blockers found. Raise IT tickets. | `pack_1` + `pack_7` |
| 11:00 | Schedule alignment meeting with manager. | `pack_0` |
| 14:00 | Fill out `MANAGER_ALIGNMENT.md` together. | `pack_0` |
| 15:00 | Send alignment summary email. | `pack_0` |
| 16:00 | Set up local AI coding agent context. | `pack_4` |
| 17:00 | Draft initial risk register. | `pack_0` |

**Key Files:**
- `governance/MANAGER_ALIGNMENT.md`
- `scripts/preflight/run-preflight.sh`
- `governance/RISK_REGISTER_TEMPLATE.md`
- `agents/generated/CLAUDE.md`

---

### Phase 2: Week 1 — Environment & Setup

**Goal:** Resolve blockers, set up project structure, understand the codebase.

| Day | Action | Pack |
|---|---|---|
| Day 2 | Follow up on pre-flight blockers. | `pack_1` |
| Day 2 | Review existing company repo structure. | `pack_3` |
| Day 3 | Create `docs/` folder in company repo. | `pack_6` |
| Day 3 | Draft initial `ARCHITECTURE.md`. | `pack_6` |
| Day 4 | Set up Azure DevOps variable groups. | `pack_5` |
| Day 4 | Verify service connections exist. | `pack_5` |
| Day 5 | Send first `WEEKLY_EVIDENCE_REPORT`. | `pack_7` |

**Key Files:**
- `docs/templates/ARCHITECTURE_TEMPLATE.md`
- `pipelines/azure-devops/VARIABLE_GROUP_STANDARD.md`
- `reports/WEEKLY_EVIDENCE_REPORT_TEMPLATE.md`

---

### Phase 3: Week 2 — Design & Planning

**Goal:** Design the agent, plan the evaluation, get approvals.

| Day | Action | Pack |
|---|---|---|
| Day 6 | Select orchestration pattern. | `pack_8` |
| Day 6 | Fill out `AGENT_DESIGN_TEMPLATE.md`. | `pack_8` |
| Day 7 | Fill out `EVAL_PLAN_TEMPLATE.md`. | `pack_2` |
| Day 7 | Create evaluation dataset (synthetic). | `pack_2` |
| Day 8 | Fill out `TOOL_REGISTRY_TEMPLATE.md` (if tools used). | `pack_8` |
| Day 8 | Fill out `PROMPT_CHAIN_TEMPLATE.md`. | `pack_8` |
| Day 9 | Get architecture reviewed. | `pack_6` |
| Day 10 | Send weekly report. | `pack_7` |

**Key Files:**
- `orchestration/templates/AGENT_DESIGN_TEMPLATE.md`
- `eval/templates/EVAL_PLAN_TEMPLATE.md`
- `orchestration/templates/TOOL_REGISTRY_TEMPLATE.md`
- `orchestration/templates/PROMPT_CHAIN_TEMPLATE.md`

---

### Phase 4: Weeks 3–6 — Development

**Goal:** Build the agent, run evaluations, iterate.

| Activity | Pack |
|---|---|
| Copy code scaffold for your pattern. | `pack_8` |
| Use AI coding agent with `pack_4` rules. | `pack_4` |
| Write code in PRs with docs updates. | `pack_5` + `pack_6` |
| Run evaluations after each prompt/model change. | `pack_2` |
| Track experiments in ledger. | `pack_2` |
| Update `KNOWN_LIMITATIONS.md` as you discover them. | `pack_6` |
| Implement observability from Day 1. | `pack_8` |
| Set up Terraform for infrastructure. | `pack_5` |
| Send weekly reports. | `pack_7` |

**Key Files:**
- `orchestration/code-scaffolds/*.py.example`
- `tools/eval/run-eval.py`
- `eval/templates/EXPERIMENT_LEDGER_TEMPLATE.md`
- `infra/modules/`
- `pipelines/azure-devops/`

---

### Phase 5: Weeks 7–8 — Release & Handover

**Goal:** Deploy r0, document everything, hand over professionally.

| Day | Action | Pack |
|---|---|---|
| Release-7 | Finalize `KNOWN_LIMITATIONS.md`. Get Product sign-off. | `pack_6` |
| Release-6 | Run full evaluation suite. Generate reports. | `pack_2` |
| Release-5 | Execute deployment pipeline (dev → stage → prod). | `pack_5` |
| Release-4 | Run smoke tests. Verify observability. | `pack_5` + `pack_8` |
| Release-3 | Write `RELEASE_NOTE.md`. | `pack_6` |
| Release-2 | Create `R0_RELEASE_EVIDENCE` bundle. | `pack_7` |
| Release-1 | Fill out `ORCHESTRATION_RUNBOOK_TEMPLATE.md`. | `pack_8` |
| Release Day | Execute deployment. Monitor. | `pack_5` + `pack_7` |
| Release+1 | Execute `HANDOVER_PACK` ceremony. | `pack_7` |
| Release+5 | Send final weekly report with release evidence. | `pack_7` |

**Key Files:**
- `docs/templates/KNOWN_LIMITATIONS_TEMPLATE.md`
- `docs/templates/RELEASE_NOTE_TEMPLATE.md`
- `reports/R0_RELEASE_EVIDENCE_TEMPLATE.md`
- `orchestration/templates/ORCHESTRATION_RUNBOOK_TEMPLATE.md`
- `docs/handover/HANDOVER_PACK_TEMPLATE.md`

---

## 3. Situation-Based Quick Reference

### "I'm blocked"

| Blocker Type | Pack | Action |
|---|---|---|
| Azure access / RBAC | `pack_1` | Run pre-flight. Send report to Platform team. |
| Azure DevOps access | `pack_1` | Run `check-ado-access.sh`. Contact DevOps admin. |
| Network / Private Endpoint | `pack_1` | Run `check-private-connectivity.sh`. Contact Network team. |
| Terraform state | `pack_1` | Run `check-terraform-state.sh`. Contact DevOps admin. |
| Key Vault secrets | `pack_1` | Run `check-keyvault.sh`. Contact Security team. |
| AI quota / limits | `pack_1` | Run `check-quotas.sh`. Submit quota increase request. |
| Unclear requirements | `pack_0` | Update `ASSUMPTIONS_REGISTER`. Ask manager. |
| Scope creep | `pack_0` | Reference `MANAGER_ALIGNMENT.md`. Push back politely. |

### "I'm building"

| Building What | Pack | Action |
|---|---|---|
| New project from scratch | `pack_3` | Run `instantiate-project.sh`. |
| AI agent design | `pack_8` | Fill out `AGENT_DESIGN_TEMPLATE.md`. |
| Agent code | `pack_8` | Copy appropriate code scaffold. |
| Tool definitions | `pack_8` | Fill out `TOOL_REGISTRY_TEMPLATE.md`. |
| Prompt chain | `pack_8` | Fill out `PROMPT_CHAIN_TEMPLATE.md`. |
| Evaluation plan | `pack_2` | Fill out `EVAL_PLAN_TEMPLATE.md`. |
| Evaluation dataset | `pack_2` | Use `eval/datasets/sample/` as template. |
| Infrastructure | `pack_5` | Use `infra/modules/` structure. |
| Pipelines | `pack_5` | Use `pipelines/azure-devops/` templates. |
| Documentation | `pack_6` | Use `docs/templates/` templates. |

### "I'm testing"

| Testing What | Pack | Action |
|---|---|---|
| Agent output quality | `pack_2` | Run `run-eval.py` with your dataset. |
| Guardrail effectiveness | `pack_2` + `pack_8` | Run security eval cases. |
| Prompt changes | `pack_2` | Run eval before and after. Compare. |
| Model changes | `pack_2` | Run eval with new model. Compare. |
| Tool functionality | `pack_8` | Test tool in isolation first. |
| Session state | `pack_8` | Test multi-turn conversations. |
| Burst handling | `pack_8` | Send multiple messages to Service Bus. |
| Fallback behavior | `pack_8` | Simulate 429 errors. Verify fallback. |

### "I'm deploying"

| Deploying What | Pack | Action |
|---|---|---|
| Infrastructure | `pack_5` | Run pipeline with Terraform plan first. |
| Application code | `pack_5` | Use CI/CD pipeline. Never manual. |
| Prompt changes | `pack_2` + `pack_5` | Run eval first. Deploy via pipeline. |
| Model changes | `pack_2` + `pack_5` | Run eval first. Deploy via pipeline. |
| Configuration changes | `pack_5` | Update variable groups. Deploy via pipeline. |

### "Something broke"

| What Broke | Pack | Action |
|---|---|---|
| Production agent down | `pack_7` | Follow `INCIDENT_RESPONSE.md`. Sev 1. |
| High latency | `pack_7` | Check `ALERTING_STANDARD.md`. Investigate. |
| LLM throttling (429) | `pack_8` | Check fallback model. Request quota increase. |
| Tool failures | `pack_8` | Check tool endpoint. Verify Managed Identity. |
| Session state loss | `pack_8` | Check Cosmos DB. Verify TTL settings. |
| Guardrail over-blocking | `pack_8` | Review Content Safety logs. Adjust thresholds. |
| Pipeline failure | `pack_5` | Check pipeline logs. Verify service connections. |
| Terraform drift | `pack_5` | Run `terraform plan`. Identify manual changes. |
| Documentation gap | `pack_6` | Update docs immediately. Log the gap. |

### "I need to communicate"

| Communicating What | Pack | Action |
|---|---|---|
| Weekly status | `pack_7` | Send `WEEKLY_EVIDENCE_REPORT`. |
| Blocker escalation | `pack_7` | Add to blocker table. Send to manager. |
| Release approval request | `pack_7` | Create `R0_RELEASE_EVIDENCE` bundle. |
| Handover notification | `pack_7` | Execute `HANDOVER_PACK` ceremony. |
| Architecture review request | `pack_6` | Share `ARCHITECTURE.md`. Request review. |
| Risk notification | `pack_0` | Update `RISK_REGISTER`. Notify stakeholders. |
| Scope change request | `pack_0` | Reference `MANAGER_ALIGNMENT.md`. Discuss. |

---

## 4. Emergency Protocols

### Emergency: "I think I'm going to be terminated"

**Immediate Actions:**

1. **Open `pack_7`** → Send a `WEEKLY_EVIDENCE_REPORT` immediately, even if it's not Friday. Document everything you've done.

2. **Open `pack_0`** → Review `MANAGER_ALIGNMENT.md`. Verify you are delivering what was agreed. If scope has shifted, document the shift.

3. **Open `pack_1`** → Run pre-flight checks. If you are blocked, document the blockers and escalate in writing.

4. **Open `pack_6`** → Ensure all documentation is current. If there are gaps, fill them immediately.

5. **Open `pack_7`** → Prepare a `HANDOVER_PACK` in case you need to demonstrate what you've built.

**Key Principle:** Do not go silent. Over-communicate. Send evidence. Ask for help explicitly.

---

### Emergency: "My manager asked for code outside the repository"

**Response:**

1. **Open `pack_0`** → Reference `CODE_OWNERSHIP.md`.

2. **Say this:**
   > "For security and auditability, I'm keeping all work in the approved Azure DevOps repository. Here is the branch, PR, release tag, and documentation."

3. **If they insist:** Ask them to confirm the request in writing (email/Teams). Then comply through the official channel only.

4. **Never:** Send ZIP files. Email code. Use personal repositories.

---

### Emergency: "The AI coding agent is producing bad code"

**Immediate Actions:**

1. **Open `pack_4`** → Review `FORBIDDEN_ACTIONS.md`.

2. **Check:** Is the agent violating a rule? Is it using AWS patterns? Is it hardcoding secrets?

3. **Action:** Stop the agent. Remind it of the rules. If it continues, switch to a higher-reasoning model per `MODEL_USAGE_POLICY.md`.

4. **If the agent keeps failing:** Write the code manually. Do not ship bad code to meet a deadline.

---

### Emergency: "Production incident"

**Immediate Actions:**

1. **Open `pack_7`** → Follow `INCIDENT_RESPONSE.md`.

2. **Determine severity:** Sev 1, Sev 2, or Sev 3.

3. **Execute mitigation:** Kill switch, fallback, or quarantine.

4. **Communicate:** Notify stakeholders per the escalation matrix.

5. **Document:** Log the incident in the risk register.

6. **Follow up:** Conduct post-incident review. Update runbook.

---

### Emergency: "I don't understand the Azure service"

**Immediate Actions:**

1. **Open `pack_8`** → Check `AWS_TO_AZURE_ORCHESTRATION_MAPPING.md`. Find the equivalent.

2. **Open `pack_4`** → Ask your AI coding agent to explain the Azure service. Use the agent rules to ensure Azure-native patterns.

3. **Open `pack_1`** → Verify you have access to the service.

4. **If still stuck:** Ask a colleague. Document the question and answer in `docs/adr/`.

---

## 5. Pack Dependencies

Some packs depend on others. Use this diagram to understand the order.

text
pack_0 (Governance)
│
├──► pack_1 (Pre-Flight) ──► pack_7 (Blocker Escalation)
│
├──► pack_3 (Repo Skeleton)
│ │
│ ├──► pack_4 (AI Agent Context)
│ │
│ ├──► pack_6 (Documentation)
│ │
│ └──► pack_5 (CI/CD & IaC)
│
├──► pack_8 (Orchestration)
│ │
│ ├──► pack_2 (Evaluation)
│ │
│ └──► pack_6 (Documentation)
│
└──► pack_7 (Operations & Handover)
│
└──► pack_6 (Documentation)



**Reading this diagram:**

- `pack_0` is the foundation. Always start here.
- `pack_1` depends on `pack_0` (you need alignment before checking access).
- `pack_3` depends on `pack_0` (you need scope before creating a project).
- `pack_4`, `pack_5`, `pack_6` depend on `pack_3` (you need a repo structure).
- `pack_8` depends on `pack_3` and `pack_4` (you need a repo and agent rules).
- `pack_2` depends on `pack_8` (you evaluate the agent you built).
- `pack_7` depends on everything (you operate and hand over what you built).

---

## 6. Pack Integration Points

Packs are not isolated. They connect at specific points.

| From Pack | To Pack | Integration Point |
|---|---|---|
| `pack_0` | `pack_7` | Risk register feeds into weekly reports |
| `pack_1` | `pack_7` | Pre-flight failures become blocker escalations |
| `pack_2` | `pack_6` | Evaluation reports link to release notes |
| `pack_2` | `pack_7` | Evaluation evidence feeds into release evidence bundle |
| `pack_3` | `pack_4` | Repo skeleton contains agent context files |
| `pack_3` | `pack_5` | Repo skeleton contains pipeline and infra folders |
| `pack_3` | `pack_6` | Repo skeleton contains docs folder |
| `pack_4` | `pack_8` | Agent rules enforce orchestration patterns |
| `pack_5` | `pack_7` | Pipeline evidence feeds into release evidence bundle |
| `pack_6` | `pack_7` | Documentation feeds into handover pack |
| `pack_8` | `pack_2` | Agent design defines evaluation criteria |
| `pack_8` | `pack_6` | Orchestration runbook is part of documentation |
| `pack_8` | `pack_7` | Orchestration runbook feeds into incident response |

---

## 7. Role-Based Guidance

### When you are acting as...

#### **Engineer (writing code)**

| Priority | Pack | Focus |
|---|---|---|
| 1 | `pack_4` | Ensure AI agent follows Azure patterns |
| 2 | `pack_8` | Use correct orchestration pattern and scaffold |
| 3 | `pack_2` | Write evaluation cases as you build |
| 4 | `pack_6` | Update docs as behavior changes |
| 5 | `pack_5` | Commit via PR. Pipeline must pass |

#### **Architect (designing systems)**

| Priority | Pack | Focus |
|---|---|---|
| 1 | `pack_8` | Select orchestration pattern. Fill design template |
| 2 | `pack_6` | Document architecture. Get review |
| 3 | `pack_2` | Define evaluation criteria |
| 4 | `pack_5` | Plan infrastructure and pipelines |
| 5 | `pack_7` | Plan for operations and handover |

#### **Operator (running production)**

| Priority | Pack | Focus |
|---|---|---|
| 1 | `pack_7` | Follow incident response. Monitor alerts |
| 2 | `pack_8` | Reference orchestration runbook |
| 3 | `pack_5` | Use pipelines for any changes |
| 4 | `pack_6` | Update runbook with new learnings |
| 5 | `pack_0` | Escalate risks |

#### **Researcher (evaluating AI)**

| Priority | Pack | Focus |
|---|---|---|
| 1 | `pack_2` | Design and run evaluations |
| 2 | `pack_8` | Understand the agent being evaluated |
| 3 | `pack_6` | Document findings |
| 4 | `pack_0` | Record decisions in ADRs |
| 5 | `pack_7` | Include eval evidence in release bundle |

---

## 8. First 30 Days Survival Calendar

| Day | Focus | Primary Packs | Key Deliverable |
|---|---|---|---|
| 1 | Arrival & Alignment | `pack_0`, `pack_1`, `pack_7` | Alignment doc signed. Pre-flight run. First report sent. |
| 2 | Environment Setup | `pack_1`, `pack_5` | Blockers logged. Variable groups verified. |
| 3 | Documentation Start | `pack_6`, `pack_3` | `docs/` folder created. Architecture draft started. |
| 4 | Agent Context Setup | `pack_4` | AI coding agent configured with Azure rules. |
| 5 | First Weekly Report | `pack_7` | Evidence report sent. |
| 6 | Design Start | `pack_8` | Agent design template started. |
| 7 | Evaluation Planning | `pack_2` | Eval plan drafted. Dataset created. |
| 8 | Design Review | `pack_6`, `pack_8` | Architecture reviewed. Design approved. |
| 9 | Development Start | `pack_8`, `pack_4` | Code scaffold copied. First PR opened. |
| 10 | Second Weekly Report | `pack_7` | Evidence report sent. |
| 11–15 | Development Sprint | `pack_8`, `pack_2`, `pack_5` | Agent built. Evals run. Pipeline passing. |
| 16–20 | Iteration & Testing | `pack_2`, `pack_8` | Evals improved. Tools tested. |
| 21 | Mid-Point Review | `pack_0`, `pack_7` | Progress reviewed. Risks updated. |
| 22–25 | Pre-Release Prep | `pack_6`, `pack_7` | Known limitations documented. Runbook written. |
| 26 | Release Readiness | `pack_5`, `pack_7` | Release evidence bundle prepared. |
| 27 | Release Approval | `pack_7` | Approvals collected. |
| 28 | Release Execution | `pack_5`, `pack_8` | r0 deployed. Smoke tests passed. |
| 29 | Handover Prep | `pack_7` | Handover pack prepared. |
| 30 | Handover Execution | `pack_7`, `pack_6` | Handover ceremony completed. Sign-off received. |

---

## 9. The Golden Rules (Always Remember)

1. **Traceability creates protection.** Every action leaves a trail.

2. **Never go silent.** If you are blocked, say so in writing within 24 hours.

3. **Never hide code.** Use the repository. Use PRs. Use documentation.

4. **Never release without evidence.** Evaluation reports. Release notes. Runbooks.

5. **Never skip documentation.** It is not optional. It is your protection.

6. **Never guess.** If you don't know, ask. If you can't access, escalate.

7. **Always use the packs.** They exist to protect you. Use them.

---

## 10. File Location Quick Reference

| I need to find... | Look in... |
|---|---|
| Governance templates | `governance/` |
| Pre-flight scripts | `scripts/preflight/` |
| Evaluation framework | `eval/` |
| Evaluation tools | `tools/eval/` |
| Project templates | `templates/project-instance/` |
| Agent context files | `agents/` |
| Pipeline definitions | `pipelines/azure-devops/` |
| Infrastructure standards | `infra/` |
| Documentation templates | `docs/templates/` |
| Enterprise standards | `docs/enterprise/` |
| Operations standards | `docs/operations/` |
| Security standards | `docs/security/` |
| Compliance checklists | `docs/compliance/` |
| Handover templates | `docs/handover/` |
| Report templates | `reports/` |
| Orchestration patterns | `orchestration/patterns/` |
| Orchestration SDK guides | `orchestration/sdk/` |
| Orchestration templates | `orchestration/templates/` |
| Code scaffolds | `orchestration/code-scaffolds/` |
| AWS-to-Azure mapping | `orchestration/reference/` |

---

## 11. When in Doubt

If you are ever unsure which pack to use:

1. **Open `ACCELERATOR_PLAYBOOK.md`** — It has the lifecycle timeline.
2. **Open this file** — Find your situation in the tables above.
3. **Ask yourself:** "Am I building, testing, deploying, or communicating?"
   - Building → `pack_4`, `pack_8`
   - Testing → `pack_2`
   - Deploying → `pack_5`
   - Communicating → `pack_7`
4. **If still unsure:** Start with `pack_0`. Alignment first. Always.

---

*This guide is your compass. When you feel lost, open it. Find your situation. Follow the pack. You are protected.*
