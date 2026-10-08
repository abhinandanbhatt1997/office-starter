# Model Usage Policy

This policy defines how AI reasoning models should be used inside the accelerator.

## Model Selection Principle

Use the strongest reasoning model for high-risk decisions.

Use faster models only for low-risk, repetitive tasks.

## High-Reasoning Required

Use high-reasoning models for:

- Architecture design.
- Security design.
- Identity and RBAC design.
- Networking design.
- Terraform changes.
- CI/CD changes.
- Production incident analysis.
- Evaluation design.
- Compliance-related decisions.
- Data flow analysis.
- Prompt governance changes.
- Model selection decisions.

## Medium/Fast Models Allowed

Use medium or fast models for:

- Boilerplate code.
- Simple refactors.
- Documentation drafting.
- README improvements.
- Test scaffolding.
- Simple config validation.
- Repetitive transformations.

## Human Review Required

Human review is required before:

- Production deployment.
- Terraform apply.
- RBAC changes.
- Network exposure changes.
- Secret access changes.
- Guardrail changes.
- Prompt promotion to production.
- Model deployment changes.
- Deleting infrastructure.
- Changing pipeline approvals.

## Autonomous Action Limits

AI agents must not autonomously:

- Deploy to production.
- Delete resources.
- Change security controls.
- Modify approvals.
- Bypass policies.
- Disable alerts.
- Alter audit logs.
- Share code outside approved repositories.

## Evidence Rule

Model selection and prompt selection must be based on evidence.

Do not say:

> This model is better.

Say:

> This model improved metric X by Y%, with tradeoff Z.

Evaluation evidence should include:

- Dataset version.
- Prompt version.
- Model/deployment version.
- Metrics.
- Thresholds.
- Known limitations.
