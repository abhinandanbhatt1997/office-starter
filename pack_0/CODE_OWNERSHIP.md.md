# Code Ownership & Traceability Standard

**Document ID:** GOV-003
**Owner:** [Your Name]
**Status:** ACTIVE

## 1. Core Principle
Code ownership in an enterprise environment is not established by hiding code or keeping it on local machines. It is established through **cryptographic traceability, explicit authorship, and architectural governance**. 

To protect the integrity of the codebase and ensure proper attribution of engineering effort, the following rules apply:

## 2. Rules of Engagement
1. **Single Source of Truth:** All project code, infrastructure, and documentation must reside exclusively in the approved Azure DevOps repository. Local copies or "shadow" repositories are strictly prohibited.
2. **Authorship Traceability:** All commits must be made using the engineer's official corporate identity. Squashing commits to hide authorship or using generic bot accounts for core logic is prohibited.
3. **Pull Request (PR) Governance:** 
   - No code is merged to `main` without a formal PR.
   - The PR description must explicitly link to the business requirement and architectural decision record (ADR).
   - The creator of the PR retains "Authorship Ownership" of that logical unit of work.
4. **Prohibition of Untracked Handovers:** Code will never be handed over via ZIP files, email attachments, or unversioned scripts. Handover occurs exclusively via repository branch links, release tags, and formal documentation.

## 3. Protection of Pre-Existing IP
If the AI/ML Engineer utilizes pre-existing, personally-owned frameworks or accelerators developed prior to employment, these must be:
- Declared in writing to management prior to use.
- Stripped of proprietary business logic before integration.
- Clearly attributed in the repository's `THIRD_PARTY_NOTICES.md`.