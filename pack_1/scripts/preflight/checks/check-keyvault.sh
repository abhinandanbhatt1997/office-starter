#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib/common.sh"

require_cmd az
require_env AZURE_KEYVAULT_NAME

if ! az keyvault show --name "$AZURE_KEYVAULT_NAME" >/dev/null 2>&1; then
  check_fail "Cannot read Key Vault: $AZURE_KEYVAULT_NAME"
fi

if az keyvault secret list \
  --vault-name "$AZURE_KEYVAULT_NAME" \
  --query "length(@)" >/dev/null 2>&1; then
  check_pass "Key Vault exists and secret list permission is available."
else
  check_warn "Key Vault exists, but secret list permission is not available. Verify secret get permission manually."
fi
