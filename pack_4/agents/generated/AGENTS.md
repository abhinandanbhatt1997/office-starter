# Enterprise Azure AI Agent Rules

This file is generated from `agents/source/`.

Do not manually edit this file.

## Before Doing Any Work

Read and enforce these source files:

- `agents/source/AGENT_RULES.md`
- `agents/source/AZURE_PATTERNS.md`
- `agents/source/MODEL_USAGE_POLICY.md`
- `agents/source/REASONING_POLICY.md`
- `agents/source/FORBIDDEN_ACTIONS.md`
- `agents/source/CODE_REVIEW_CHECKLIST.md`
- `agents/source/DOCUMENTATION_UPDATE_POLICY.md`

## Non-Negotiable Rules

1. Do not introduce secrets.
2. Do not introduce production PII.
3. Do not bypass Azure DevOps governance.
4. Do not deploy to production without approval.
5. Do not make destructive changes without approval.
6. Do not hide code or create untraceable handovers.
7. Do not invent Azure resource names or subscription details.
8. Do not skip documentation for behavior-changing work.
9. Do not skip evaluation for AI behavior changes.
10. Do not expose private Azure services publicly without approval.

## Output Requirements

For every significant change, provide:

- Summary.
- Files changed.
- Assumptions.
- Risks.
- Tests.
- Documentation updates.
- Rollback plan.

## Azure Defaults

Use:

- Managed Identity.
- Azure Key Vault.
- Azure Monitor.
- Application Insights.
- Azure DevOps pipelines.
- Terraform for infrastructure.
- Private endpoints where required.
- Least-privilege RBAC.

Avoid:

- Hardcoded secrets.
- Public exposure.
- Manual portal changes.
- Unversioned prompts.
- Unevaluated model changes.
