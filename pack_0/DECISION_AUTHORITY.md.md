# Decision Authority Matrix (RACI)

**Document ID:** GOV-002
**Owner:** [Your Name]
**Status:** ACTIVE

## 1. Purpose
To eliminate ambiguity regarding who has the authority to make, approve, and veto technical and delivery decisions during the project lifecycle.

## 2. Decision Domains

| Domain | Decision Maker (Accountable) | Approver (Consulted/Informed) | Veto Power |
|---|---|---|---|
| **Azure Architecture & IaC** | AI/ML Engineer (You) | Cloud/Platform Team | Security/Cloud Team |
| **AI Model & Prompt Selection** | AI/ML Engineer (You) | Product Owner / SME | AI Governance Board |
| **CI/CD & Pipeline Security** | AI/ML Engineer (You) | DevOps/Security Team | Security Team |
| **Data Privacy & PII Handling** | Security/Compliance Team | AI/ML Engineer (You) | Legal/Compliance |
| **r0 Scope & Backlog Priority** | Product Manager | AI/ML Engineer (You) | Engineering Director |
| **Production Release Go/No-Go** | Engineering Manager | AI/ML Engineer (You) | SRE/Ops Team |

## 3. Escalation Path
If a decision is blocked for more than 48 hours due to conflicting stakeholder inputs, the AI/ML Engineer will escalate the blocker via the formal `RISK_REGISTER` and notify the Hiring Manager directly to unblock delivery.