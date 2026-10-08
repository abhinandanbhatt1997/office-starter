# Operational Runbook: [Project Name]

*(Paste the Enterprise Header Here)*

## 1. System Health Checks
| Check | Command / Location | Expected Result |
|---|---|---|
| API Health | `curl https://<api-url>/health` | HTTP 200 |
| AI Quota | Azure Portal -> OpenAI -> Quotas | Usage < 80% |
| Pipeline Status | Azure DevOps -> Pipelines | Last run Succeeded |

## 2. Common Incidents & Resolutions

### Incident: LLM Throttling (HTTP 429)
- **Symptom:** Users report slow responses or "System Busy" errors. App Insights shows 429 dependency failures.
- **Cause:** TPM (Tokens Per Minute) quota exceeded.
- **Resolution:** 
  1. Check Azure OpenAI quota blade.
  2. Implement exponential backoff in code.
  3. Request quota increase via Azure Portal if sustained.

### Incident: Private Endpoint DNS Failure
- **Symptom:** Container App logs show "Name or service not known" for `.openai.azure.com`.
- **Cause:** Private DNS zone disconnected from VNet.
- **Resolution:** Verify VNet links on the `privatelink.openai.azure.com` DNS zone.

## 3. Escalation Matrix
| Severity | Condition | Contact | SLA |
|---|---|---|---|
| Sev 1 | Complete system down / Data leak | [On-Call Phone] | 15 mins |
| Sev 2 | AI degraded / High latency | [Teams Channel] | 1 hour |
