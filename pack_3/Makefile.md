.PHONY: help preflight docs-check validate-sample-datasets eval-sample new-project

help:
	@echo "Azure AI Enterprise Accelerator commands"
	@echo ""
	@echo "make preflight                  Run pre-flight checks"
	@echo "make docs-check                 Check required root documents exist"
	@echo "make validate-sample-datasets   Validate sample eval datasets"
	@echo "make eval-sample                Run sample evaluation"
	@echo "make new-project NAME=name      Instantiate a new project instance"

preflight:
	./scripts/preflight/run-preflight.sh

docs-check:
	./scripts/checks/docs-check.sh

validate-sample-datasets:
	python3 tools/eval/dataset_validator.py --dataset eval/datasets/sample/basic_cases.jsonl
	python3 tools/eval/dataset_validator.py --dataset eval/datasets/sample/edge_cases.jsonl
	python3 tools/eval/dataset_validator.py --dataset eval/datasets/sample/security_cases.jsonl

eval-sample:
	python3 tools/eval/run-eval.py --config eval/config/example.eval.json

new-project:
	@if [ -z "$(NAME)" ]; then \
		echo "Usage: make new-project NAME=my-project"; \
		exit 1; \
	fi
	./scripts/project/instantiate-project.sh "$(NAME)"
