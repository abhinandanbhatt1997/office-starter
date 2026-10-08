# r0 Release Evidence Bundle Template

> Template only: replace every bracketed or illustrative value with verified evidence. Remove this note when preparing a real release record. Leave approval items unchecked until approval is recorded.

**Release Tag:** [e.g., v1.0.0-r0]
**Release Date:** [YYYY-MM-DD]
**Release Manager:** [Your Name]

## 1. Traceability
| Artifact | Link / Evidence |
|---|---|
| **Azure DevOps PR** | [Link to PR #42] |
| **Pipeline Run ID** | [Link to Build #105] |
| **Terraform Plan** | [Link to Pipeline Artifact] |
| **Commit SHA** | [Full commit SHA] |

## 2. Quality & Safety Gates
| Gate | Result | Evidence |
|---|---|---|
| Secret Scan | [PASS / FAIL / NOT RUN] | [Link to pipeline evidence] |
| Eval Dataset Validation | [PASS / FAIL / NOT RUN] | [Link to pipeline evidence] |
| AI Eval (Smoke) | [Result] | [Link to evaluation report] |
| Security Eval | [Result] | [Link to evaluation report] |

## 3. Approvals
- [ ] Engineering Manager Approval (link the recorded approval)
- [ ] Security Review Approval (link the recorded approval)
