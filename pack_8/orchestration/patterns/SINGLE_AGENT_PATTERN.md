
---

# 3. Orchestration Patterns

## `orchestration/patterns/SINGLE_AGENT_PATTERN.md`

```markdown
# Single Agent Pattern

**Pattern ID:** ORCH-PAT-001  
**Complexity:** L1  
**Use When:** Simple conversational AI, single-turn or basic multi-turn without tool calling.

## Architecture

```text
User Request
    │
    ▼
┌─────────────────┐
│  Input Guardrail │ ← Azure AI Content Safety
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Azure AI Agent │ ← azure-ai-inference / azure-ai-projects
│   (Single LLM)   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Output Guardrail │ ← Azure AI Content Safety
└────────┬────────┘
         │
         ▼
    User Response
