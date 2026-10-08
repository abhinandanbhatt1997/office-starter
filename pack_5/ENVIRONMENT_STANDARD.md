
---

## `pipelines/azure-devops/ENVIRONMENT_STANDARD.md`

```markdown
# Environment Standard

**Document ID:** CICD-004  
**Owner:** DevOps / Engineering Management  
**Status:** ACTIVE  

## Environments

| Environment | Purpose | Approval Required |
|---|---|---:|
| `dev` | Engineering validation | Optional |
| `stage` | Pre-production validation | Yes |
| `prod` | Production release | Yes |

## Environment Rules

1. Production deployments must require approval.
2. Approvals must be recorded in Azure DevOps.
3. Environments must be linked to service connections.
4. Environments must be linked to variable groups.
5. Environment checks must include required reviewers.
6. Deployment history must be retained.

## Required Approvers

| Environment | Minimum Approvers |
|---|---|
| Dev | Engineering owner |
| Stage | Engineering owner + product/QA owner |
| Prod | Engineering manager + product owner + security where required |

## Deployment Evidence

Every environment deployment should retain:

- Pipeline run ID.
- Commit SHA.
- Work item link.
- Terraform plan.
- Smoke test result.
- Release note link.
