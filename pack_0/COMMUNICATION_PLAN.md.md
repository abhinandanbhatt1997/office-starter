# Communication & Blocker Escalation Plan

> Starting point for agreeing on team communication. The cadence and escalation timings below are suggestions, not company policy; confirm expectations and channels with your manager and follow internal procedures.

**Document ID:** GOV-005
**Owner:** [Your Name]
**Status:** ACTIVE

## 1. Objective
To ensure total transparency regarding project velocity, technical blockers, and ecosystem dependencies. Silence is treated as a delivery risk.

## 2. Standard Cadence
- **Daily Standup:** 15 minutes. Focus strictly on: What was shipped, what is blocked, and what help is needed.
- **End-of-Week (EOW) Evidence Report:** Use the cadence and channel agreed with your manager. Consider including:
  - Links to merged PRs and ADRs.
  - Link to the latest pipeline run.
  - Summary of technical decisions made.
  - Updated Risk Register.

## 3. Escalating Blockers
For an external dependency (e.g., Azure RBAC permissions, VNet routing, Service Connection approvals, quota limits), agree with your manager on when and how to escalate. A 24-hour check-in may be a useful starting point when no team-specific expectation exists:
1. The blocker is logged in the `RISK_REGISTER`.
2. Raise it through the agreed channel with the responsible team and manager as appropriate.
3. The engineer pivots to documentation or local mock-development to maintain velocity while the blocker is resolved.
Document the impact and actions taken so the team can track dependencies and adjust plans.
