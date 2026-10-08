#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENTS_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
SOURCE_DIR="$AGENTS_DIR/source"
GENERATED_DIR="$AGENTS_DIR/generated"

SOURCE_FILES=(
  "AGENT_RULES.md"
  "AZURE_PATTERNS.md"
  "MODEL_USAGE_POLICY.md"
  "REASONING_POLICY.md"
  "FORBIDDEN_ACTIONS.md"
  "CODE_REVIEW_CHECKLIST.md"
  "DOCUMENTATION_UPDATE_POLICY.md"
)

echo "Checking source files..."

for file in "${SOURCE_FILES[@]}"; do
  if [[ ! -f "$SOURCE_DIR/$file" ]]; then
    echo "Missing required source file: $SOURCE_DIR/$file"
    exit 1
  fi
done

mkdir -p "$GENERATED_DIR/cursor"

generate_full_context() {
  local output_file="$1"
  local tool_name="$2"

  {
    echo "<!-- GENERATED FILE. DO NOT EDIT BY HAND. -->"
    echo "<!-- Regenerate with agents/scripts/generate-agent-files.sh -->"
    echo ""
    echo "# $tool_name Enterprise Azure AI Rules"
    echo ""
    echo "This file was generated from \`agents/source/\`."
    echo ""

    for file in "${SOURCE_FILES[@]}"; do
      echo ""
      echo "---"
      echo ""
      cat "$SOURCE_DIR/$file"
      echo ""
    done
  } > "$output_file"

  echo "Generated: $output_file"
}

generate_full_context "$GENERATED_DIR/AGENTS.md" "Codex / Generic Agent"
generate_full_context "$GENERATED_DIR/CLAUDE.md" "Claude Code"

{
  echo "# Cursor Enterprise Azure AI Rules"
  echo ""
  echo "This file was generated from \`agents/source/\`."
  echo ""
  echo "Always enforce the following source files:"
  echo ""

  for file in "${SOURCE_FILES[@]}"; do
    echo "- \`agents/source/$file\`"
  done

  echo ""
  echo "---"
  echo ""

  for file in "${SOURCE_FILES[@]}"; do
    echo ""
    cat "$SOURCE_DIR/$file"
    echo ""
    echo "---"
    echo ""
  done
} > "$GENERATED_DIR/cursor/azure-enterprise.md"

echo "Generated: $GENERATED_DIR/cursor/azure-enterprise.md"
echo "Agent context generation complete."
