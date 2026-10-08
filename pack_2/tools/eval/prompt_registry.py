#!/usr/bin/env python3
"""
Validate a prompt registry JSON file.

Expected registry format:

{
  "prompts": [
    {
      "prompt_id": "PROMPT-001",
      "version": "v1.0",
      "path": "prompts/v1/system_prompt.md",
      "owner": "ai-engineering",
      "status": "APPROVED",
      "change_reason": "Initial version"
    }
  ]
}
"""

import argparse
import hashlib
import json
import pathlib
import sys


REQUIRED_FIELDS = [
    "prompt_id",
    "version",
    "path",
    "owner",
    "status"
]

ALLOWED_STATUS = {
    "DRAFT",
    "TESTING",
    "APPROVED",
    "DEPRECATED",
    "BLOCKED"
}


def sha256_file(path: pathlib.Path):
    hasher = hashlib.sha256()

    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(8192), b""):
            hasher.update(chunk)

    return hasher.hexdigest()


def main():
    parser = argparse.ArgumentParser(description="Validate prompt registry.")
    parser.add_argument(
        "--registry",
        default="prompts/registry.json",
        help="Path to prompt registry JSON."
    )
    args = parser.parse_args()

    registry_path = pathlib.Path(args.registry)

    if not registry_path.exists():
        print(f"Prompt registry not found: {registry_path}", file=sys.stderr)
        print("Create a prompt registry before releasing prompts.", file=sys.stderr)
        sys.exit(1)

    registry = json.loads(registry_path.read_text(encoding="utf-8"))

    if "prompts" not in registry:
        print("Registry must contain a 'prompts' array.", file=sys.stderr)
        sys.exit(1)

    errors = []

    for index, prompt in enumerate(registry["prompts"], start=1):
        for field in REQUIRED_FIELDS:
            if field not in prompt:
                errors.append(f"Prompt entry {index}: Missing field '{field}'.")

        status = prompt.get("status")

        if status and status not in ALLOWED_STATUS:
            errors.append(
                f"Prompt entry {index}: Invalid status '{status}'. "
                f"Allowed: {', '.join(sorted(ALLOWED_STATUS))}"
            )

        path_value = prompt.get("path")

        if path_value:
            prompt_path = pathlib.Path(path_value)

            if not prompt_path.exists():
                errors.append(f"Prompt entry {index}: File not found: {path_value}")
            else:
                sha = sha256_file(prompt_path)
                print(f"{prompt.get('prompt_id')} {prompt.get('version')} sha256={sha}")

    if errors:
        print("Prompt registry validation FAILED.", file=sys.stderr)

        for error in errors:
            print(error, file=sys.stderr)

        sys.exit(1)

    print("Prompt registry validation PASSED.")


if __name__ == "__main__":
    main()
