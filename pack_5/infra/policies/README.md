
---

## `infra/policies/README.md`

```markdown
# Azure Policy Notes

This folder will contain policy guidance and policy-as-code artifacts.

Possible future contents:

- Azure Policy assignments.
- Allowed region policies.
- Allowed resource type policies.
- Tag enforcement policies.
- Private endpoint enforcement guidance.
- Key Vault security guidance.
- Storage account security guidance.

## Rules

1. Policies should be tested in dev before prod.
2. Policy changes must be documented.
3. Policy exemptions must be time-bound and approved.
4. Policy failures must block unsafe deployments where possible.
