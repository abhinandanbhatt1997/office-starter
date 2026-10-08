# Forbidden Actions

The following actions are forbidden.

## Security Forbidden Actions

Do not:

- Add secrets to code.
- Add secrets to documentation.
- Add secrets to pipelines.
- Print secrets to logs.
- Disable security controls.
- Bypass guardrails.
- Expose private endpoints publicly.
- Grant excessive RBAC permissions.
- Use personal accounts for company work.
- Store credentials in plain text.

## Data Forbidden Actions

Do not:

- Commit production PII.
- Commit customer confidential data.
- Use real customer data in examples.
- Store sensitive audit data unprotected.
- Copy data to unapproved locations.
- Send data to external services without approval.

## Delivery Forbidden Actions

Do not:

- Deploy to production without approval.
- Run destructive commands without approval.
- Delete infrastructure without approval.
- Modify audit logs.
- Falsify evaluation results.
- Falsify test results.
- Skip required documentation.
- Create unsupported manual hotfixes.
- Bypass Azure DevOps branch policies.
- Force push to protected branches.

## Ownership Forbidden Actions

Do not:

- Hide company code.
- Keep company code only on personal machines.
- Move company code to personal repositories.
- Send code as untracked ZIP files.
- Remove authorship history.
- Create secret handover channels.
- Refuse traceable handover.

## AI Forbidden Actions

Do not:

- Edit approved prompts without versioning.
- Switch models without evaluation.
- Ignore prompt injection risks.
- Ignore PII leakage risks.
- Generate unsafe tool-call behavior.
- Allow agents to take irreversible actions autonomously.
