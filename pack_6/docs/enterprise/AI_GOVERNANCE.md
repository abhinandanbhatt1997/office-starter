# AI Governance Standard

**Document ID:** ENT-004 | **Status:** ACTIVE | **Owner:** AI Governance Board

## 1. Prompt Governance
- Prompts must be stored in version control (Git) or a managed Prompt Registry.
- "Prompt Drift" (changing prompts in production without testing) is a Sev-2 incident.

## 2. Data Privacy & PII
- Azure AI Content Safety (or equivalent guardrails) **MUST** be placed in front of all LLM inputs/outputs.
- PII masking must be applied before data is sent to foundational models, unless the model is explicitly approved for PII processing in a private boundary.

## 3. Hallucination & Grounding
- Generative outputs presented to users must be grounded in retrieved data (RAG).
- Citations/sources must be returned in the payload and displayed in the UI.
