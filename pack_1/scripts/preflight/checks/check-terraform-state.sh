#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib/common.sh"

require_cmd az
require_env AZURE_STORAGE_ACCOUNT
require_env AZURE_STORAGE_CONTAINER

if ! az storage account show \
  --name "$AZURE_STORAGE_ACCOUNT" >/dev/null 2>&1; then
  check_fail "Cannot read storage account: $AZURE_STORAGE_ACCOUNT"
fi

if az storage container show \
  --name "$AZURE_STORAGE_CONTAINER" \
  --account-name "$AZURE_STORAGE_ACCOUNT" \
  --auth-mode login >/dev/null 2>&1; then
  check_pass "Terraform state storage account and container are accessible."
else
  check_fail "Cannot access Terraform state container. Check container name and Storage Blob Data permissions."
fi
