# Evaluation Tools

These tools provide a lightweight, dependency-free evaluation harness.

They are suitable for local development and CI validation.

## Tools

| Tool | Purpose |
|---|---|
| `metrics.py` | Metric calculation functions |
| `run-eval.py` | Runs an evaluation from a JSON config |
| `dataset_validator.py` | Validates dataset JSONL structure |
| `prompt_registry.py` | Validates a prompt registry file |

## Usage

Validate dataset:

```bash
python3 tools/eval/dataset_validator.py \
  --dataset eval/datasets/sample/basic_cases.jsonl
