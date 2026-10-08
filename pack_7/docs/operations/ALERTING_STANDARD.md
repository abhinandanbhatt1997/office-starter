# Alerting Standard

**Document ID:** OPS-002 | **Status:** ACTIVE | **Owner:** AI Engineering

## Mandatory r0 Alerts
No AI system goes to production without these baseline Azure Monitor alerts:

| Metric / Signal | Threshold | Severity | Action |
|---|---|---|---|
| **HTTP 429 (Too Many Requests)** | > 5 occurrences in 5 mins | Sev 2 | Check Azure OpenAI Quota blade; trigger backoff. |
| **P95 Latency** | > 5000ms for 10 mins | Sev 2 | Investigate network/Private Endpoint routing or model load. |
| **Dead Letter Queue (DLQ) Depth** | > 0 messages | Sev 3 | Investigate failed agent tool calls or malformed payloads. |
| **Content Safety Blocks** | > 10% of total traffic | Sev 2 | Review prompt injection attempts or overly aggressive filters. |
| **Token Spend / Cost** | > 80% of daily budget | Sev 3 | FinOps review; check for infinite agent loops. |

## Alert Routing
- **Sev 1:** Pages the On-Call Engineer and Security Team.
- **Sev 2:** Tickets the AI Engineering team via Azure Boards.
- **Sev 3:** Logged in daily operational review dashboard.
