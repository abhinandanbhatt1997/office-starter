# Data Protection Impact Assessment (DPIA) Checklist

**Document ID:** COMP-001 | **Status:** ACTIVE | **Context:** EU GDPR / AI Act Alignment

- [ ] **Data Residency:** All Azure resources (OpenAI, AI Search, Storage) are deployed in EU regions (e.g., West Europe, Sweden Central).
- [ ] **PII Minimization:** Prompts are designed to avoid requesting PII.
- [ ] **PII Masking:** Azure AI Content Safety or custom regex masks PII before it hits the LLM context window.
- [ ] **Right to Explanation:** The system provides citations/sources for generated answers (RAG grounding).
- [ ] **Human in the Loop (HITL):** High-impact agent actions (e.g., database writes) require human approval via the UI.
- [ ] **Data Retention:** Audit logs and conversation histories have an automated lifecycle policy (e.g., delete after 30 days) in Azure Storage.
