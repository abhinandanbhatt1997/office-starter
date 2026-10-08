# AI Delivery Standard

**Document ID:** ENT-001 | **Status:** ACTIVE | **Owner:** AI Engineering Lead

## 1. Core Delivery Principles
1. **No Black Boxes:** Every AI workflow must have observable inputs, outputs, and token usage.
2. **No Unmanaged Prompts:** Prompts are code. They must be versioned, tested, and deployed via pipelines.
3. **No Silent Failures:** Fallback mechanisms must exist for model throttling, timeouts, and guardrail blocks.
4. **Eval Before Release:** No AI feature reaches Production (r0 or beyond) without a passing Evaluation Report.

## 2. The r0 Release Gate
To declare an AI feature "r0 Complete", the following must be true:
- [ ] Infrastructure is deployed via Terraform.
- [ ] Identity uses Managed Identities (no hardcoded keys).
- [ ] Application Insights is capturing traces and token metrics.
- [ ] `EVAL_REPORT` shows >90% pass rate on the baseline synthetic dataset.
- [ ] `KNOWN_LIMITATIONS` document is published and acknowledged by Product.
- [ ] `RUNBOOK` is written and tested by the operations receiver.

## 3. Prohibited Patterns
- **Direct Portal Edits:** Never tweak AI deployments or prompt filters in the Azure Portal.
- **Synchronous Agent Loops:** Do not use Azure Functions for agent loops that may exceed 5 minutes. Use Container Apps.
- **Public Endpoints:** AI services (OpenAI, AI Search, CosmosDB) must not have public network access enabled in Stage/Prod.
