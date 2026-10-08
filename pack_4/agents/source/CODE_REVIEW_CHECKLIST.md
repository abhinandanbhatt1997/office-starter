# Code Review Checklist

Before submitting or approving code, verify the following.

## Correctness

- [ ] The change does what was requested.
- [ ] Edge cases are considered.
- [ ] Error handling is present.
- [ ] Failure modes are documented.

## Azure Safety

- [ ] Managed Identity is used where possible.
- [ ] No hardcoded secrets.
- [ ] No hardcoded connection strings.
- [ ] Key Vault references are used.
- [ ] Private endpoint assumptions are documented.
- [ ] Region and data residency are valid.

## AI Safety

- [ ] Prompts are versioned.
- [ ] Model/deployment is explicit.
- [ ] Content filtering is considered.
- [ ] Prompt injection cases are considered.
- [ ] PII exposure is considered.
- [ ] Tool misuse is considered.

## Observability

- [ ] Structured logs are present.
- [ ] Errors are logged safely.
- [ ] Latency can be measured.
- [ ] Token usage can be measured.
- [ ] Alerts are considered.

## Testing and Evaluation

- [ ] Unit tests exist where appropriate.
- [ ] Smoke tests exist where appropriate.
- [ ] Evaluation dataset is identified.
- [ ] Evaluation thresholds are defined.
- [ ] Security cases are included for AI changes.

## Documentation

- [ ] README updated if behavior changed.
- [ ] Architecture updated if structure changed.
- [ ] Runbook updated if operations changed.
- [ ] CHANGELOG updated if release-relevant.
- [ ] Known limitations updated if needed.

## Rollback

- [ ] Rollback path exists.
- [ ] Rollback steps are documented.
- [ ] Data migration risks are identified.
- [ ] Infrastructure state risks are identified.
