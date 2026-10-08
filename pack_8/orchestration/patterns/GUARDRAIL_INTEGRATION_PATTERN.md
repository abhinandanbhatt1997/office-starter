
---

## `orchestration/patterns/GUARDRAIL_INTEGRATION_PATTERN.md`

```markdown
# Guardrail Integration Pattern

**Pattern ID:** ORCH-PAT-007  
**Complexity:** L1  
**Use When:** Every production agent. Mandatory for L2+ agents.

## Architecture

```text
User Input
    │
    ▼
┌─────────────────────────┐
│  INPUT GUARDRAILS        │
│  ┌─────────────────────┐ │
│  │ PII Detection       │ │
│  │ Prompt Injection    │ │
│  │ Topic Validation    │ │
│  │ Content Safety      │ │
│  └─────────────────────┘ │
└────────┬────────────────┘
         │ PASS
         ▼
┌─────────────────────────┐
│     LLM Processing       │
└────────┬────────────────┘
         │
         ▼
┌─────────────────────────┐
│  OUTPUT GUARDRAILS       │
│  ┌─────────────────────┐ │
│  │ PII Masking         │ │
│  │ Factuality Check    │ │
│  │ Tone Validation     │ │
│  │ Content Safety      │ │
│  │ Citation Verify     │ │
│  └─────────────────────┘ │
└────────┬────────────────┘
         │ PASS
         ▼
    User Response
