#!/usr/bin/env python3
"""
Validate an evaluation dataset JSONL file.
"""

import argparse
import json
import pathlib
import sys


def main():
    parser = argparse.ArgumentParser(description="Validate eval dataset JSONL.")
    parser.add_argument("--dataset", required=True, help="Path to dataset JSONL file.")
    args = parser.parse_args()

    dataset_path = pathlib.Path(args.dataset)

    if not dataset_path.exists():
        print(f"Dataset file not found: {dataset_path}", file=sys.stderr)
        sys.exit(1)

    required_fields = ["case_id", "input"]
    seen_case_ids = set()
    errors = []
    warnings = []
    line_count = 0

    with dataset_path.open("r", encoding="utf-8") as handle:
        for line_number, line in enumerate(handle, start=1):
            line = line.strip()

            if not line:
                continue

            line_count += 1

            try:
                item = json.loads(line)
            except json.JSONDecodeError as error:
                errors.append(f"Line {line_number}: Invalid JSON: {error}")
                continue

            for field in required_fields:
                if field not in item:
                    errors.append(f"Line {line_number}: Missing required field '{field}'.")

            case_id = item.get("case_id")

            if case_id:
                if case_id in seen_case_ids:
                    errors.append(f"Line {line_number}: Duplicate case_id '{case_id}'.")
                seen_case_ids.add(case_id)

            if "expected_output" not in item:
                warnings.append(f"Line {line_number}: No expected_output provided.")

            if "tags" not in item:
                warnings.append(f"Line {line_number}: No tags provided.")

    if errors:
        print("Dataset validation FAILED.", file=sys.stderr)

        for error in errors:
            print(error, file=sys.stderr)

        sys.exit(1)

    print("Dataset validation PASSED.")
    print(f"Total cases: {line_count}")

    if warnings:
        print("Warnings:")

        for warning in warnings:
            print(warning)


if __name__ == "__main__":
    main()
