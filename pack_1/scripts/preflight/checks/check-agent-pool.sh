#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib/common.sh"

require_cmd az

if ! az extension show -n azure-devops >/dev/null 2>&1; then
  check_fail "Azure DevOps CLI extension is not installed. Run: az extension add -n azure-devops"
fi

require_env ADO_ORG
require_env ADO_AGENT_POOL_NAME

pool_count="$(
  az pipelines pool list \
    --org "$ADO_ORG" \
    --pool-name "$ADO_AGENT_POOL_NAME" \
    --query "length(@)" \
    -o tsv 2>/dev/null || echo "0"
)"

if [[ "$pool_count" -gt 0 ]]; then
  check_pass "Azure DevOps agent pool is accessible: $ADO_AGENT_POOL_NAME"
else
  check_fail "Cannot access Azure DevOps agent pool: $ADO_AGENT_POOL_NAME"
fi
