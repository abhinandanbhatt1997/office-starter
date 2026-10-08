#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/common.sh"

RESULTS_CSV="${1:?Usage: generate-preflight-report.sh /path/to/preflight-results.csv}"

if [[ ! -f "$RESULTS_CSV" ]]; then
  check_fail "Results file not found: $RESULTS_CSV"
fi

PREFLIGHT_OUTPUT_DIR="${PREFLIGHT_OUTPUT_DIR:-reports/preflight}"
mkdir -p "$PREFLIGHT_OUTPUT_DIR"

OUTPUT_MD="$PREFLIGHT_OUTPUT_DIR/preflight-report.md"

total_checks=$(( $(wc -l < "$RESULTS_CSV") - 1 ))
pass_count="$(awk -F',' 'NR > 1 && $2 == "PASS"' "$RESULTS_CSV" | wc -l)"
warn_count="$(awk -F',' 'NR > 1 && $2 == "WARN"' "$RESULTS_CSV" | wc -l)"
fail_count="$(awk -F',' 'NR > 1 && $2 == "FAIL"' "$RESULTS_CSV" | wc -l)"

cat > "$OUTPUT_MD" <<EOF
# Pre-Flight Report

**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")  
**Report Owner:** AI/ML Engineering  
**Status:** GENERATED AUTOMATICALLY  

## Summary

| Metric | Count |
|---|---:|
| Total Checks | $total_checks |
| Passed | $pass_count |
| Warnings | $warn_count |
| Failures | $fail_count |

## Detailed Results

| Check | Status | Message |
|---|---|---|
EOF

awk -F',' 'NR > 1 {print "| " $1 " | " $2 " | " $3 " |"}' "$RESULTS_CSV" >> "$OUTPUT_MD"

cat >> "$OUTPUT_MD" <<EOF

## Required Follow-Up

- All FAIL items must be converted into blocker work items.
- All WARN items must have an owner and mitigation.
- The final report must be attached or linked to the project onboarding work item.
EOF

log_info "Pre-flight report written to: $OUTPUT_MD"
