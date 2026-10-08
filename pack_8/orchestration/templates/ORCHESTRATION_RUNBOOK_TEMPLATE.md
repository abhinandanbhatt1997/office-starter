
---

## `orchestration/templates/ORCHESTRATION_RUNBOOK_TEMPLATE.md`

```markdown
# Orchestration Runbook

**Document ID:** [ORCH-RUN-XXX]  
**Agent Name:** [Name]  
**Status:** ACTIVE  
**Owner:** [Name]  

## 1. System Overview

Brief description of the agent and its components.

## 2. Health Checks

| Check | Command / Location | Expected | Frequency |
|---|---|---|---|
| API health | `curl /health` | HTTP 200 | Every 5 min |
| Cosmos DB | Azure Portal → Cosmos DB | 200 RU/s available | Every 15 min |
| Service Bus | Azure Portal → Service Bus | Queue depth < 100 | Every 5 min |
| OpenAI quota | Azure Portal → OpenAI | TPM < 80% | Every 15 min |

## 3. Common Incidents

### 3.1 LLM Throttling (429)

**Symptom:** Users see "System busy" errors. App Insights shows 429 responses.

**Diagnosis:**
1. Check Azure OpenAI quota blade
2. Check Application Insights for 429 count
3. Verify if fallback model is being used

**Resolution:**
1. If transient: Wait for backoff to complete
2. If sustained: Request quota increase
3. If critical: Enable fallback model via feature flag

### 3.2 Session State Failures

**Symptom:** Users lose conversation context.

**Diagnosis:**
1. Check Cosmos DB availability
2. Check partition key distribution
3. Verify TTL is not too aggressive

**Resolution:**
1. Verify Cosmos DB connection string (Key Vault)
2. Check for hot partitions
3. Extend TTL if sessions expiring prematurely

### 3.3 Tool Execution Failures

**Symptom:** Agent responds but tool results missing.

**Diagnosis:**
1. Check tool endpoint health
2. Check Managed Identity permissions
3. Check Application Insights for tool errors

**Resolution:**
1. Restart tool service if needed
2. Verify RBAC assignments
3. Check for timeout configuration issues

### 3.4 Guardrail Over-Blocking

**Symptom:** Legitimate requests being blocked.

**Diagnosis:**
1. Review Content Safety logs
2. Check blocked request samples
3. Verify threshold configuration

**Resolution:**
1. Adjust threshold if false positives confirmed
2. Add allowlist for known safe patterns
3. Escalate to Security if unsure

## 4. Scaling Procedures

### Scale Up (High Load)

1. Increase Container App replica count
2. Increase Cosmos DB RU/s
3. Request Azure OpenAI quota increase

### Scale Down (Low Load)

1. Reduce Container App replica count
2. Reduce Cosmos DB RU/s (autoscale handles this)
3. No action needed for OpenAI (pay-per-use)

## 5. Deployment & Rollback

### Deploy

1. Merge PR to `main`
2. Pipeline runs automatically
3. Smoke test must pass
4. Monitor Application Insights for 30 minutes

### Rollback

1. Identify last known good pipeline run
2. Re-run pipeline with previous commit
3. Verify smoke test passes
4. Monitor for stability

## 6. Escalation

| Severity | Contact | SLA |
|---|---|---|
| Sev 1 (Down) | [On-call phone] | 15 min |
| Sev 2 (Degraded) | [Teams channel] | 1 hour |
| Sev 3 (Minor) | [Email] | 4 hours |
