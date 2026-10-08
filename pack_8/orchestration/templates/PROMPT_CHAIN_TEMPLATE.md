
---

## `orchestration/templates/PROMPT_CHAIN_TEMPLATE.md`

```markdown
# Prompt Chain

**Document ID:** [PROMPT-CHAIN-XXX]  
**Agent Name:** [Name]  
**Status:** ACTIVE  
**Owner:** [Name]  

## Prompt Chain Overview

| Step | Prompt ID | Version | Model | Purpose |
|---|---|---|---|---|
| 1 | PROMPT-SYS-001 | v1.0 | All | System instructions |
| 2 | PROMPT-PLAN-001 | v1.0 | Sonnet | Planning / analysis |
| 3 | PROMPT-EXEC-001 | v1.0 | Sonnet | Tool calling |
| 4 | PROMPT-RESP-001 | v1.0 | Haiku | Response formatting |

## Prompt Details

### PROMPT-SYS-001 (System)

**Version:** v1.0  
**Status:** APPROVED  
**Last Updated:** [Date]  
**Change Reason:** Initial version  

```text
[Full system prompt text here]


Variables:
Variable
Source
Description
{{user_name}}
Session state
User's display name
{{current_date}}
Runtime
Current date
{{context}}
RAG retrieval
Retrieved context

PROMPT-PLAN-001 (Planning)
Version: v1.0
Status: APPROVED


[Full planning prompt text here]



Prompt Change Process
Create new version in source control
Update this registry
Run evaluation (pack_2)
Compare against baseline
Get approval
Deploy via pipeline
Monitor for 24 hours


Prompt Version History
Version
Date
Author
Change
Eval Result
v1.0
[Date]
[Name]
Initial
92% pass
v1.1
[Date]
[Name]
Improved SQL generation
95% pass






