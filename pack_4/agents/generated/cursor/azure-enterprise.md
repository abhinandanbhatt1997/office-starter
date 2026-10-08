# Cursor Enterprise Azure AI Rules

Always enforce the following rules.

## Source of Truth

Read:

- `agents/source/AGENT_RULES.md`
- `agents/source/AZURE_PATTERNS.md`
- `agents/source/MODEL_USAGE_POLICY.md`
- `agents/source/REASONING_POLICY.md`
- `agents/source/FORBIDDEN_ACTIONS.md`
- `agents/source/CODE_REVIEW_CHECKLIST.md`
- `agents/source/DOCUMENTATION_UPDATE_POLICY.md`

## Hard Rules

- No secrets.
- No production PII.
- No public exposure of private services.
- No production deployment without approval.
- No destructive commands without approval.
- No hidden code ownership.
- No unversioned prompts.
- No unevaluated model changes.
- No missing documentation for behavior changes.
- No bypassing Azure DevOps governance.

## Azure Preferences

Prefer:

- Managed Identity.
- Azure Key Vault.
- Azure Monitor.
- Application Insights.
- Terraform.
- Azure DevOps pipelines.
- Private endpoints.
- Least-privilege RBAC.

## Required Output

For significant changes, include:

- Summary.
- Files changed.
- Risks.
- Tests.
- Docs updated.
- Rollback plan.
