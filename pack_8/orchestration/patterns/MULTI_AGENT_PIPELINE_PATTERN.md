
---

## `orchestration/patterns/MULTI_AGENT_PIPELINE_PATTERN.md`

```markdown
# Multi-Agent Pipeline Pattern

**Pattern ID:** ORCH-PAT-002  
**Complexity:** L3  
**Use When:** Sequential processing where each agent handles a specific subtask.

## Architecture

This is the direct Azure equivalent of your AWS three-agent Bedrock pipeline.

```text
User Request
    │
    ▼
┌──────────────────────────────────────────────────┐
│                 Orchestrator                      │
│           (Container App / Function)              │
└──────┬───────────┬───────────┬───────────────────┘
       │           │           │
       ▼           ▼           ▼
┌──────────┐ ┌──────────┐ ┌──────────┐
│ Agent 1  │ │ Agent 2  │ │ Agent 3  │
│ Planning │ │Execution │ │Response  │
│(Sonnet)  │ │(Tools)   │ │(Haiku)   │
└────┬─────┘ └────┬─────┘ └────┬─────┘
     │            │            │
     ▼            ▼            ▼
┌──────────────────────────────────────────────────┐
│              Session State (Cosmos DB)            │
└──────────────────────────────────────────────────┘
     │            │            │
     ▼            ▼            ▼
┌──────────────────────────────────────────────────┐
│         Observability (Application Insights)      │
└──────────────────────────────────────────────────┘
