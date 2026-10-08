# Project Assumptions Register

**Document ID:** GOV-007
**Owner:** [Your Name]
**Last Updated:** [Date]

| ID | Assumption | Dependency / Owner | Validation Date | Impact if False |
|---|---|---|---|---|
| A-001 | An Azure DevOps project and repository already exist with appropriate branch policies. | DevOps Team | Day 1 | Cannot begin CI/CD setup; triggers 24-hr blocker escalation. |
| A-002 | The target Azure Subscription has sufficient quota for Azure Container Apps and AI Search. | Cloud FinOps | Day 2 | Terraform apply will fail; requires manual quota request. |
| A-003 | Enterprise allows GitHub/Azure DevOps to authenticate via Entra ID OIDC. | Security Team | Day 3 | Must fall back to Service Principals (requires security exemption). |
| A-004 | Synthetic test data will be provided by the Product team for r0 evaluation. | Product Team | Day 5 | Engineering will use purely mock/synthetic data, delaying real-world eval. |