#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib/common.sh"

require_cmd curl
require_env AZURE_OPENAI_ENDPOINT

http_code="$(
  curl \
    --silent \
    --output /dev/null \
    --write-out "%{http_code}" \
    --max-time 10 \
    "$AZURE_OPENAI_ENDPOINT/openai/models?api-version=2024-02-01" || echo "000"
)"

if [[ "$http_code" == "000" ]]; then
  check_fail "No HTTP response from Azure AI endpoint. Check DNS, VPN, firewall, and private endpoint configuration."
elif [[ "$http_code" =~ ^(200|401|403)$ ]]; then
  check_pass "Azure AI endpoint is reachable. HTTP status: $http_code. Authentication may still require Managed Identity or key."
else
  check_warn "Azure AI endpoint returned unexpected HTTP status: $http_code"
fi
