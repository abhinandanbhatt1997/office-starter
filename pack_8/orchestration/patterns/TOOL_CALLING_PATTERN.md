
---

## `orchestration/patterns/TOOL_CALLING_PATTERN.md`

```markdown
# Tool Calling Pattern

**Pattern ID:** ORCH-PAT-004  
**Complexity:** L2  
**Use When:** Agent needs to execute external actions (query DB, call API, run code).

## Architecture

```text
User Request
    │
    ▼
┌─────────────────┐
│   LLM Reasoning  │ ← Decides which tool to call
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Tool Selection  │ ← Based on JSON Schema definitions
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Tool Execution  │ ← Azure Function / Container App / API
│  (with timeout)  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Result to LLM    │ ← Agent processes tool output
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Final Response   │ ← Or another tool call (loop)
└─────────────────┘
