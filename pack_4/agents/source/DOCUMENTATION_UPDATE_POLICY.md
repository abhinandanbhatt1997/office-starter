# Documentation Update Policy

Documentation is not optional.

Documentation is release evidence.

## Documentation Must Be Updated When

Update documentation when any of the following change:

- Architecture.
- Infrastructure.
- Pipelines.
- Secrets handling.
- Identity model.
- Network exposure.
- AI model.
- Prompt version.
- Evaluation thresholds.
- Data flows.
- Operational procedure.
- Incident response.
- Known limitations.
- Release process.
- Handover process.

## Minimum Documentation for r0

Every r0 release must have:

1. README.
2. Architecture summary.
3. Runbook.
4. Known limitations.
5. Release note.
6. Evaluation report.
7. Risk register update.
8. Assumptions register update.

## ADR Required When

Create an Architecture Decision Record when:

- Choosing a service.
- Choosing a model.
- Choosing a prompt strategy.
- Choosing an identity pattern.
- Choosing a network pattern.
- Choosing a deployment strategy.
- Accepting a significant risk.
- Rejecting a viable alternative.

## Documentation Quality Rules

Documentation must:

- Have an owner.
- Have a status.
- Have a version.
- Be written in clear language.
- Avoid secrets.
- Avoid PII.
- State limitations.
- Be linked from the relevant work item or PR.

## Prohibited Documentation Behavior

Do not:

- Document after the fact as an excuse.
- Create vague handover notes.
- Hide limitations.
- Overstate test coverage.
- Falsify approval status.
- Leave runbooks untested.
