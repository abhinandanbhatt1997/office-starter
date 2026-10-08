# Rollback Standard

**Document ID:** OPS-003 | **Status:** ACTIVE | **Owner:** AI Engineering

## Rollback Triggers
A rollback must be initiated if:
- Eval success rate drops below the r0 baseline threshold.
- Sev 1 or Sev 2 incidents occur within 2 hours of deployment.
- Unapproved PII is detected in production logs.

## Rollback Mechanisms
1. **Infrastructure (Terraform):** Re-run the pipeline with the previous commit SHA. Terraform will automatically revert Azure resources to the previous state.
2. **Prompts:** Revert the Prompt Registry pointer to the previous `APPROVED` version. Do not manually edit the prompt in the portal.
3. **Model Deployments:** Use Azure API Management (APIM) or Container Apps routing rules to shift 100% of traffic back to the previous model deployment endpoint.
