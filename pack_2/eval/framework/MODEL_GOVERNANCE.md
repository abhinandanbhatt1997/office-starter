# Model Governance

**Document ID:** EVAL-006  
**Owner:** AI/ML Engineering  
**Status:** ACTIVE  

## Model Principles

1. Model selection is a governance decision.
2. Model deployments must be identifiable.
3. Model changes require evaluation.
4. Model cost and quota impact must be reviewed.

## Required Model Metadata

For every model/deployment used:

- Model name.
- Deployment name.
- Model version.
- Azure region.
- Quota/TPM limit.
- Cost estimate.
- Data residency status.
- Content filter configuration.
- Fallback model, if applicable.

## Model Selection Criteria

Model selection should consider:

1. Task accuracy.
2. Latency.
3. Cost.
4. Quota availability.
5. Safety behavior.
6. Compliance requirements.
7. Tool-calling support.
8. Structured output support.

## Model Change Process

1. Record reason for model change.
2. Run baseline evaluation with current model.
3. Run same evaluation with candidate model.
4. Compare metrics.
5. Document tradeoffs.
6. Obtain approval.
7. Update eval report and ADR.

## Prohibited Actions

- Switching models in production without evaluation.
- Using unnamed or untracked deployments.
- Ignoring quota limits.
- Using models in regions that violate data residency requirements.
