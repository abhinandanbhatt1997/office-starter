#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib/common.sh"

require_cmd az

providers=(
  "Microsoft.CognitiveServices"
  "Microsoft.KeyVault"
  "Microsoft.Storage"
  "Microsoft.Network"
  "Microsoft.OperationalInsights"
  "Microsoft.Insights"
)

failed_providers=()

for provider in "${providers[@]}"; do
  state="$(
    az provider show \
      --namespace "$provider" \
      --query registrationState \
      -o tsv 2>/dev/null || echo "Unknown"
  )"

  if [[ "$state" != "Registered" ]]; then
    failed_providers+=("$provider:$state")
  fi
done

if [[ "${#failed_providers[@]}" -eq 0 ]]; then
  check_pass "Required Azure resource providers are registered."
else
  check_warn "Some required providers are not registered or unreadable: ${failed_providers[*]}. Validate quotas manually in Azure Portal."
fi
