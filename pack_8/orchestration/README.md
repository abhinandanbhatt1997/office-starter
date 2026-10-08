# AI Agent Orchestration

**Document ID:** ORCH-001  
**Owner:** AI/ML Engineering  
**Status:** ACTIVE  
**Version:** 1.0  

## Purpose

This directory defines how production AI/LLM agents are designed, built, deployed, and operated on Azure.

This is the application layer. This is where the actual AI workloads live.

## What This Is NOT

This is NOT about AI coding assistants (Claude Code, Codex, Cursor). Those are governed by `pack_4`.

This IS about the production AI agents that your company deploys to serve end users.

## Core Principle

Every production AI agent must have:

1. A documented design (`AGENT_DESIGN_TEMPLATE.md`)
2. A versioned prompt chain (`PROMPT_CHAIN_TEMPLATE.md`)
3. A registered tool set (`TOOL_REGISTRY_TEMPLATE.md`)
4. An evaluation plan (linked to `pack_2`)
5. An orchestration runbook (`ORCHESTRATION_RUNBOOK_TEMPLATE.md`)
6. Observability from Day 1 (OpenTelemetry + Application Insights)
7. Guardrails enforced at input AND output boundaries
8. A fallback/retry strategy
9. Session state management
10. Cost and quota awareness

## Directory Layout

| Path | Purpose |
|---|---|
| `ORCHESTRATION_STANDARD.md` | The mandatory standard for all agents |
| `patterns/` | Reusable orchestration patterns |
| `sdk/` | SDK selection and authentication guidance |
| `templates/` | Design and registry templates |
| `reference/` | AWS-to-Azure translation mapping |
| `code-scaffolds/` | Safe Python starting points |

## Integration with Other Packs

| Pack | Integration Point |
|---|---|
| `pack_2` | Every agent must have an evaluation plan and dataset |
| `pack_4` | Coding agents must enforce these orchestration patterns |
| `pack_5` | Agents deploy via Azure DevOps pipelines |
| `pack_6` | Agent architecture and runbooks are documented |
| `pack_7` | Agent incidents follow the incident response standard |
