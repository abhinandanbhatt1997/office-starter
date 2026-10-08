# Release Note: [Project Name] [Version/r0]

> Template only. The feature and rollback entries below are illustrative examples. Replace or remove them to match the actual release and its reviewed rollback procedure.

*(Paste the Enterprise Header Here)*

## 1. Release Summary
**Release Date:** [YYYY-MM-DD]
**Release Type:** [r0 / Feature / Hotfix]
**Downtime Required:** [Yes / No]

## 2. What's Included
- [Feature 1]: Implemented RAG pipeline using Azure AI Search.
- [Infra]: Deployed Private Endpoints for all PaaS services.
- [Security]: Integrated Azure Content Safety guardrails.

## 3. Evidence & Traceability
| Artifact | Link / Reference |
|---|---|
| **Pull Request(s)** | [Link to ADO PRs] |
| **Pipeline Run ID** | [Link to ADO Pipeline Run] |
| **Eval Report** | [Link to eval/reports/xxx.md] |
| **Terraform Plan** | [Link to pipeline artifact] |

## 4. Rollback Plan
1. Revert Azure DevOps Pipeline to previous successful run.
2. Execute `terraform apply` using the previous state commit.
3. Restart Container Apps to clear in-memory cache.
