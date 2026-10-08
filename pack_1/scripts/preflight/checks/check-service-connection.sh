#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib/common.sh"

require_cmd az

if ! az extension show -n azure-devops >/dev/null 2>&1; then
  check_fail "Azure DevOps CLI extension is not installed. Run: az extension add -n azure-devops"
fi

require_env ADO_ORG
require_env ADO_PROJECT
require_env ADO_SERVICE_CONNECTION_NAME

service_connection_name="$(
  az devops service-endpoint list \
    --org "$ADO_ORG" \
    --project "$ADO_PROJECT" \
    --query "[?name=='$ADO_SERVICE_CONNECTION_NAME'].name | [0]" \
    -o tsv 2>/dev/null || true
)"

if [[ "$service_connection_name" == "$ADO_SERVICE_CONNECTION_NAME" ]]; then
  check_pass "Azure DevOps service connection is visible: $ADO_SERVICE_CONNECTION_NAME"
else
  check_fail "Cannot find Azure DevOps service connection: $ADO_SERVICE_CONNECTION_NAME"
fi
