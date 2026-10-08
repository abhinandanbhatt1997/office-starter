#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

TEMPLATE_DIR="$REPO_ROOT/templates/project-instance"

if [[ $# -lt 1 ]]; then
  echo "Usage: ./scripts/project/instantiate-project.sh <project-name> [target-directory]"
  exit 1
fi

RAW_PROJECT_NAME="$1"
TARGET_DIR="${2:-$REPO_ROOT/projects/$RAW_PROJECT_NAME}"

SAFE_PROJECT_NAME="$(echo "$RAW_PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | tr -cd 'a-z0-9-')"

if [[ -z "$SAFE_PROJECT_NAME" ]]; then
  echo "Project name is invalid after sanitization."
  exit 1
fi

if [[ -e "$TARGET_DIR" ]]; then
  echo "Target directory already exists: $TARGET_DIR"
  exit 1
fi

if [[ ! -d "$TEMPLATE_DIR" ]]; then
  echo "Template directory not found: $TEMPLATE_DIR"
  exit 1
fi

echo "Instantiating project: $SAFE_PROJECT_NAME"
echo "Target directory: $TARGET_DIR"

mkdir -p "$(dirname "$TARGET_DIR")"
cp -R "$TEMPLATE_DIR" "$TARGET_DIR"

find "$TARGET_DIR" -type f | while read -r file; do
  if grep -q "{{PROJECT_NAME}}" "$file"; then
    sed "s/{{PROJECT_NAME}}/$SAFE_PROJECT_NAME/g" "$file" > "$file.tmp"
    mv "$file.tmp" "$file"
  fi
done

echo "Project instantiated successfully."
echo ""
echo "Next steps:"
echo "1. Review $TARGET_DIR/project.yaml"
echo "2. Fill owner, sponsor, description, and environment values"
echo "3. Add project-specific docs"
echo "4. Wire Azure DevOps pipeline"
echo "5. Run pre-flight checks"
