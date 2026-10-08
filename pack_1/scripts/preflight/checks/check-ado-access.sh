#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib/common.sh"

require_cmd az

if ! az extension show -n azure-devops >/dev/null 2>&1; then
  check_fail "Azure DevOps CLI extension is not installed. Run: az extension add -n azure-devops"
fi

require_env ADO_ORG
require_env ADO_PROJECT
require_env ADO_REPO

if ! az devops project show \
  --org "$ADO_ORG" \
  --project "$ADO_PROJECT" >/dev/null 2>&1; then
  check_fail "Cannot access Azure DevOps project. Check org, project, and authentication."
fi

repo_found="$(
  az repos list \
    --org "$ADO_ORG" \
    --project "$ADO_PROJECT" \
    --query "[?name=='$ADO_REPO'].name | [0]" \
    -o tsv 2>/dev/null || true
)"

if [[ "$repo_found" == "$ADO_REPO" ]]; then
  check_pass "Azure DevOps project and repository are accessible."
else
  check_fail "Azure DevOps repository not found or inaccessible: $ADO_REPO"
fi
