#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

source "$SCRIPT_DIR/lib/common.sh"

if [[ -f "$REPO_ROOT/config/preflight.env" ]]; then
  log_info "Loading environment configuration from config/preflight.env"
  set -a
  source "$REPO_ROOT/config/preflight.env"
  set +a
else
  log_info "config/preflight.env not found. Using current shell environment variables."
fi

PREFLIGHT_OUTPUT_DIR="${PREFLIGHT_OUTPUT_DIR:-$REPO_ROOT/reports/preflight}"

if [[ "$PREFLIGHT_OUTPUT_DIR" != /* ]]; then
  PREFLIGHT_OUTPUT_DIR="$REPO_ROOT/$PREFLIGHT_OUTPUT_DIR"
fi

export PREFLIGHT_OUTPUT_DIR

mkdir -p "$PREFLIGHT_OUTPUT_DIR"

RESULTS_CSV="$PREFLIGHT_OUTPUT_DIR/preflight-results.csv"

echo "Check,Status,Message" > "$RESULTS_CSV"

CHECKS=(
  "check-azure-login.sh"
  "check-ado-access.sh"
  "check-rbac.sh"
  "check-resource-group.sh"
  "check-keyvault.sh"
  "check-ai-endpoint.sh"
  "check-private-connectivity.sh"
  "check-terraform-state.sh"
  "check-agent-pool.sh"
  "check-service-connection.sh"
  "check-quotas.sh"
)

overall_result=0

for check_name in "${CHECKS[@]}"; do
  check_path="$SCRIPT_DIR/checks/$check_name"

  set +e
  raw_output="$("$check_path" 2>&1)"
  exit_code=$?
  set -e

  if [[ "$exit_code" -eq 0 ]]; then
    status="PASS"
  elif [[ "$exit_code" -eq 2 ]]; then
    status="WARN"
  else
    status="FAIL"
    overall_result=1
  fi

  message="$(echo "$raw_output" | tail -n 1 | sed -E 's/^\[(PASS|WARN|FAIL)\] //')"
  message="${message//,/;}"
  message="${message//|/ }"

  echo "$check_name,$status,$message" >> "$RESULTS_CSV"

  echo "----------------------------------------"
  echo "$raw_output"
done

"$SCRIPT_DIR/generate-preflight-report.sh" "$RESULTS_CSV"

if [[ "$overall_result" -ne 0 ]]; then
  log_info "Pre-flight completed with failures. Review: $PREFLIGHT_OUTPUT_DIR/preflight-report.md"
  exit 1
fi

log_info "Pre-flight completed successfully. Review: $PREFLIGHT_OUTPUT_DIR/preflight-report.md"
