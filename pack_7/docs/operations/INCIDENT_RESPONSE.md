# AI Incident Response Standard

**Document ID:** OPS-001 | **Status:** ACTIVE | **Owner:** AI Engineering / SRE

## 1. Severity Definitions for AI Workloads

| Severity | Definition | Example | Response SLA |
|---|---|---|---|
| **Sev 1** | Complete system failure, data leak, or severe safety guardrail bypass. | PII leaked to public logs; Prompt injection bypasses all filters. | 15 Minutes |
| **Sev 2** | Core AI degradation, high latency, or quota exhaustion. | Azure OpenAI returning 429 (Throttling); RAG retrieval failing. | 1 Hour |
| **Sev 3** | Minor feature degradation, non-critical tool failure. | Formatting agent fails, fallback to raw text used. | 4 Hours |

## 2. The "AI Blast Radius" Check
When an AI incident occurs, immediately answer:
1. **Data:** Was unauthorized data accessed or generated?
2. **Cost:** Is a runaway loop consuming token quotas/budget?
3. **Reputation:** Is the model outputting harmful/biased content to end-users?

## 3. Immediate Mitigation Steps
1. **Kill Switch:** Disable the specific Azure OpenAI deployment or APIM route.
2. **Fallback:** Route traffic to the deterministic/fallback logic (bypass the LLM).
3. **Quarantine:** If data was poisoned, isolate the Azure AI Search index or CosmosDB container.
