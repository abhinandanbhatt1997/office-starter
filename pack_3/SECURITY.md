# Security Baseline

**Document ID:** ACC-SEC-001  
**Owner:** Security / AI Engineering  
**Status:** ACTIVE  

## Core Security Rules

1. No secrets in code.
2. No secrets in pipelines.
3. No secrets in documentation.
4. No production PII in this repository.
5. Use Managed Identity where possible.
6. Use Azure Key Vault for secrets.
7. Use least-privilege RBAC.
8. Use private endpoints where required.
9. Use approved Azure regions only.
10. Use approved logging and monitoring channels.

## Secret Handling

| Secret Type | Storage |
|---|---|
| Application secrets | Azure Key Vault |
| Pipeline secrets | Azure DevOps variable groups linked to Key Vault |
| Terraform state access | Managed Identity or approved service connection |
| Local development secrets | Never committed; use local environment only |

## Data Handling

| Data Type | Allowed in Accelerator? |
|---|---:|
| Synthetic test data | Yes |
| Public data | Yes |
| Approved sanitized samples | Conditional |
| Production PII | No |
| Customer confidential data | No |
| Security credentials | No |

## Security Review Triggers

Security review is required when changing:

- Identity or RBAC.
- Network exposure.
- Secret handling.
- Data flows.
- AI guardrails.
- External integrations.
- Logging of sensitive data.
