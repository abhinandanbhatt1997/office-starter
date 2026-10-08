#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib/common.sh"

require_env AZURE_OPENAI_ENDPOINT
require_cmd getent

hostname="$(echo "$AZURE_OPENAI_ENDPOINT" | sed -E 's#^https?://##; s#/.*$##')"

if [[ -z "$hostname" ]]; then
  check_fail "Could not extract hostname from AZURE_OPENAI_ENDPOINT."
fi

resolved_ip="$(getent hosts "$hostname" 2>/dev/null | awk '{print $1; exit}' || true)"

if [[ -z "$resolved_ip" ]]; then
  check_warn "Could not resolve hostname: $hostname"
fi

if [[ "$resolved_ip" =~ (^10\.)|(^192\.168\.)|(^172\.(1[6-9]|2[0-9]|3[01])\.) ]]; then
  check_pass "$hostname resolves to private IP address: $resolved_ip"
else
  check_warn "$hostname resolves to $resolved_ip, which appears public. Verify whether private endpoint is required."
fi
