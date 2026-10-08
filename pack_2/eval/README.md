# Evaluation Framework

**Document ID:** EVAL-001  
**Owner:** AI/ML Engineering  
**Status:** ACTIVE  
**Version:** 1.0  

## Purpose

This directory contains the reusable evaluation framework for Azure AI/ML delivery.

It is used to validate:

- Prompt quality.
- Model behavior.
- Output correctness.
- Safety and guardrails.
- Latency.
- Cost.
- Regression behavior.
- Release readiness.

## Core Principle

No AI feature should be released to r0 without:

1. A documented evaluation plan.
2. A versioned dataset.
3. A reproducible evaluation run.
4. A written evaluation report.
5. A decision record if a model, prompt, or threshold was selected.

## Directory Layout

| Path | Purpose |
|---|---|
| `EVAL_STANDARD.md` | Mandatory evaluation standard |
| `framework/` | Governance standards for metrics, datasets, prompts, models, guardrails |
| `templates/` | Reusable evaluation document templates |
| `config/` | Evaluation configuration schema and examples |
| `datasets/sample/` | Synthetic sample datasets only |
| `reports/` | Generated evaluation reports |

## Rules

1. Do not commit production PII.
2. Do not commit real customer data unless explicitly approved.
3. Prefer synthetic datasets for early r0 delivery.
4. Every dataset must have a data card.
5. Every prompt must have a version.
6. Every eval report must state limitations.
7. Every release must link to the eval report.

## Basic Local Usage

Validate a dataset:

```bash
python3 tools/eval/dataset_validator.py \
  --dataset eval/datasets/sample/basic_cases.jsonl
