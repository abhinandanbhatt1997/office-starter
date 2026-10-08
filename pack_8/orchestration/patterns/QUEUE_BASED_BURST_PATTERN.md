
---

## `orchestration/patterns/QUEUE_BASED_BURST_PATTERN.md`

```markdown
# Queue-Based Burst Absorption Pattern

**Pattern ID:** ORCH-PAT-005  
**Complexity:** L2  
**Use When:** High-volume or bursty workloads that need throttling and retry.

This is the Azure equivalent of your AWS SQS burst absorption pattern.

## Architecture

```text
Producer (API / Event)
    │
    ▼
┌─────────────────────────┐
│   Azure Service Bus      │
│   Queue                  │
│   (with DLQ)             │
└────────┬────────────────┘
         │
         ▼
┌─────────────────────────┐
│   Consumer Worker        │ ← Container App / Function
│   (auto-scaling)         │
└────────┬────────────────┘
         │
         ├── Success → Complete message
         │
         ├── Transient failure → Retry (backoff)
         │
         └── Permanent failure → Dead Letter Queue
                                      │
                                      ▼
                              ┌──────────────┐
                              │  DLQ Monitor  │
                              │  (Alerting)   │
                              └──────────────┘
