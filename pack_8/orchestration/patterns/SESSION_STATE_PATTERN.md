
---

## `orchestration/patterns/SESSION_STATE_PATTERN.md`

```markdown
# Session State Pattern

**Pattern ID:** ORCH-PAT-008  
**Complexity:** L1  
**Use When:** Multi-turn conversations requiring context persistence.

This is the Azure equivalent of your AWS DynamoDB session state pattern.

## Architecture

```text
User Message (turn N)
    │
    ▼
┌─────────────────────────┐
│  Load Session State      │ ← Cosmos DB (NoSQL API)
│  (conversation history,  │
│   user context, prefs)   │
└────────┬────────────────┘
         │
         ▼
┌─────────────────────────┐
│  Build Context Window    │ ← Truncate to model limit
│  (system + history +     │
│   current message)       │
└────────┬────────────────┘
         │
         ▼
┌─────────────────────────┐
│  LLM Processing          │
└────────┬────────────────┘
         │
         ▼
┌─────────────────────────┐
│  Save Updated State      │ ← Cosmos DB
│  (new turn, metadata,    │
│   token counts)          │
└────────┬────────────────┘
         │
         ▼
    User Response
