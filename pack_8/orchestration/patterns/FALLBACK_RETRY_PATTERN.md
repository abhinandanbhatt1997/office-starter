
---

## `orchestration/patterns/FALLBACK_RETRY_PATTERN.md`

```markdown
# Fallback & Retry Pattern

**Pattern ID:** ORCH-PAT-006  
**Complexity:** L1  
**Use When:** Every production agent. This is mandatory, not optional.

## Retry Strategy

```text
Request
    │
    ▼
┌─────────────────┐
│  Attempt 1       │
└────────┬────────┘
         │ 429 / 500 / 503
         ▼
┌─────────────────┐
│  Wait (backoff)  │ ← Exponential: 1s, 2s, 4s
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Attempt 2       │
└────────┬────────┘
         │ 429 / 500 / 503
         ▼
┌─────────────────┐
│  Wait (backoff)  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Attempt 3       │
└────────┬────────┘
         │ Still failing
         ▼
┌─────────────────┐
│  Fallback Model  │ ← Switch to cheaper/faster model
└────────┬────────┘
         │ Still failing
         ▼
┌─────────────────┐
│  Graceful Error  │ ← Return user-friendly error
└─────────────────┘
