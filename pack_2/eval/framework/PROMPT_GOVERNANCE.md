# Prompt Governance

**Document ID:** EVAL-005  
**Owner:** AI/ML Engineering  
**Status:** ACTIVE  

## Prompt Principles

1. Prompts are production artifacts.
2. Prompts must be versioned.
3. Prompts must be reviewed.
4. Prompt changes must be evaluated.
5. Prompt rollback must be possible.

## Prompt Registry Requirements

Each prompt must have:

- Prompt ID.
- Version.
- Owner.
- Status.
- File path or storage reference.
- SHA256 hash, if file-based.
- Change reason.
- Approval status.

## Prompt States

| State | Meaning |
|---|---|
| Draft | Under development |
| Testing | Being evaluated |
| Approved | Approved for release |
| Deprecated | No longer used |
| Blocked | Blocked due to risk |

## Prompt Change Process

1. Create new prompt version.
2. Update prompt registry.
3. Run evaluation.
4. Compare against baseline.
5. Record decision in ADR or experiment ledger.
6. Approve or reject.
7. Deploy through pipeline only.

## Prohibited Actions

- Editing production prompts directly in the portal.
- Storing unversioned prompts only in application code strings.
- Changing prompts without evaluation.
- Removing prompt history.
