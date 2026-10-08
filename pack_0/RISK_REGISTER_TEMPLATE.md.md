# Project Risk Register

> Template with illustrative sample risks. Validate each risk, score, owner, mitigation, and status with your project team; remove rows that do not apply and add risks you identify.

**Document ID:** GOV-006
**Owner:** [Your Name]
**Last Updated:** [Date]

| Risk ID | Category | Risk Description | Impact (1-5) | Probability (1-5) | Mitigation Strategy | Owner | Status |
|---|---|---|---|---|---|---|---|
| R-001 | Network | Cloud Shell cannot reach Private Endpoints due to lack of VNet injection. | 5 | 4 | Request VNet-injected Cloud Shell or provision Azure Bastion/Jumpbox by Day 3. | [Your Name] | OPEN |
| R-002 | Security | Service Connection uses hardcoded secrets instead of OIDC. | 4 | 3 | Enforce Workload Identity Federation in ADO pipeline templates. | [Your Name] | OPEN |
| R-003 | Quota | Azure OpenAI TPM (Tokens Per Minute) quota is too low for r0 load testing. | 3 | 4 | Submit quota increase request via Azure Portal on Day 1. | [Your Name] | OPEN |
| R-004 | Scope | Stakeholders request complex UI for r0, delaying backend pipeline. | 4 | 4 | Enforce strict adherence to `MANAGER_ALIGNMENT.md` r0 scope. | Manager | MITIGATED |
