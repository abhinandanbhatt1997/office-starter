
---

## `orchestration/patterns/RAG_PATTERN.md`

```markdown
# RAG (Retrieval-Augmented Generation) Pattern

**Pattern ID:** ORCH-PAT-003  
**Complexity:** L2  
**Use When:** Grounding LLM responses in your own data.

## Architecture

```text
User Query
    │
    ▼
┌─────────────────┐
│  Query Analysis  │ ← Optional: rewrite, expand, classify
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Embedding Gen   │ ← Azure OpenAI Embeddings
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Vector Search   │ ← Azure AI Search
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Reranking       │ ← Optional: semantic ranker
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Prompt Assembly │ ← Context + Query + Instructions
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  LLM Generation  │ ← Azure OpenAI / Model Catalog
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Citation Attach │ ← Source attribution
└────────┬────────┘
         │
         ▼
    User Response
