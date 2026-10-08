#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib/common.sh"

require_cmd az
require_env AZURE_RESOURCE_GROUP

if az group show --name "$AZURE_RESOURCE_GROUP" >/dev/null 2>&1; then
  resource_count="$(
    az resource list \
      --resource-group "$AZURE_RESOURCE_GROUP" \
      --query "length(@)" \
      -o tsv 2>/dev/null || echo "0"
  )"

  check_pass "Resource group is accessible. Current resource count: $resource_count"
else
  check_fail "Cannot access resource group: $AZURE_RESOURCE_GROUP"
fi
