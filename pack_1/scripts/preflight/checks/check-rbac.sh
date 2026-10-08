#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib/common.sh"

require_cmd az

if ! az account show >/dev/null 2>&1; then
  check_fail "Azure CLI is not logged in. Run: az login"
fi

user_id="$(az ad signed-in-user show --query id -o tsv 2>/dev/null || true)"

if [[ -z "$user_id" ]]; then
  check_warn "Could not determine signed-in user object ID. RBAC validation requires manual review."
fi

if [[ -n "${AZURE_RESOURCE_GROUP:-}" ]]; then
  if ! az group show --name "$AZURE_RESOURCE_GROUP" >/dev/null 2>&1; then
    check_fail "Cannot read resource group: $AZURE_RESOURCE_GROUP"
  fi

  assignment_count="$(
    az role assignment list \
      --assignee "$user_id" \
      --resource-group "$AZURE_RESOURCE_GROUP" \
      --query "length(@)" \
      -o tsv 2>/dev/null || echo "0"
  )"

  if [[ "$assignment_count" -gt 0 ]]; then
    check_pass "Found $assignment_count direct role assignment(s) in resource group: $AZURE_RESOURCE_GROUP"
  else
    check_warn "No direct role assignments found in resource group. Access may be inherited via group or PIM."
  fi
else
  assignment_count="$(
    az role assignment list \
      --assignee "$user_id" \
      --query "length(@)" \
      -o tsv 2>/dev/null || echo "0"
  )"

  if [[ "$assignment_count" -gt 0 ]]; then
    check_pass "Found $assignment_count role assignment(s) for current user."
  else
    check_warn "No role assignments found for current user. Access may be inherited via group or PIM."
  fi
fi
