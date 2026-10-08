#!/usr/bin/env python3
"""
Run an evaluation using dataset and prediction JSONL files.

This is a lightweight evaluation harness for r0 delivery.
It does not call models directly. Your application should produce
the predictions file.
"""

import argparse
import datetime
import json
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))

import metrics


def load_jsonl(path: pathlib.Path):
    items = []

    if not path.exists():
        raise FileNotFoundError(f"File not found: {path}")

    with path.open("r", encoding="utf-8") as handle:
        for line_number, line in enumerate(handle, start=1):
            line = line.strip()

            if not line:
                continue

            try:
                items.append(json.loads(line))
            except json.JSONDecodeError as error:
                raise ValueError(f"Invalid JSON on line {line_number} in {path}: {error}")

    return items


def write_report(config, metric_values, threshold_passed, threshold_details, results, report_path):
    report_path.parent.mkdir(parents=True, exist_ok=True)

    timestamp = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%d %H:%M:%S UTC")

    lines = []
    lines.append("# Evaluation Report")
    lines.append("")
    lines.append(f"**Eval Name:** {config.get('eval_name')}")
    lines.append(f"**Generated:** {timestamp}")
    lines.append(f"**Owner:** {config.get('owner', 'unknown')}")
    lines.append(f"**Dataset:** {config.get('dataset_path')}")
    lines.append(f"**Predictions:** {config.get('predictions_path')}")
    lines.append(f"**Overall Result:** {'PASS' if threshold_passed else 'FAIL'}")
    lines.append("")
    lines.append("## Metrics")
    lines.append("")
    lines.append("| Metric | Value |")
    lines.append("|---|---:|")

    for key, value in metric_values.items():
        if isinstance(value, float):
            lines.append(f"| {key} | {value:.4f} |")
        else:
            lines.append(f"| {key} | {value} |")

    lines.append("")
    lines.append("## Thresholds")
    lines.append("")
    lines.append("| Metric | Value | Threshold | Result |")
    lines.append("|---|---:|---|---|")

    for detail in threshold_details:
        threshold_text = json.dumps(detail["threshold"])
        value_text = detail["value"]

        if isinstance(value_text, float):
            value_text = f"{value_text:.4f}"

        lines.append(
            f"| {detail['metric']} | {value_text} | {threshold_text} | {detail['result']} |"
        )

    lines.append("")
    lines.append("## Case Results")
    lines.append("")
    lines.append("| Case ID | Exact Match | Contains | Error | Latency ms |")
    lines.append("|---|---|---|---|---:|")

    for result in results:
        lines.append(
            f"| {result.get('case_id')} "
            f"| {result.get('exact_match')} "
            f"| {result.get('contains')} "
            f"| {result.get('error') or ''} "
            f"| {result.get('latency_ms') or ''} |"
        )

    lines.append("")
    lines.append("## Notes")
    lines.append("")
    lines.append("- This report was generated automatically.")
    lines.append("- Review failed cases before release.")
    lines.append("- Do not use this report as the only release gate if security cases failed.")
    lines.append("")

    report_path.write_text("\n".join(lines), encoding="utf-8")


def main():
    parser = argparse.ArgumentParser(description="Run evaluation from config.")
    parser.add_argument("--config", required=True, help="Path to eval config JSON.")
    args = parser.parse_args()

    config_path = pathlib.Path(args.config)

    if not config_path.exists():
        print(f"Config file not found: {config_path}", file=sys.stderr)
        sys.exit(1)

    config = json.loads(config_path.read_text(encoding="utf-8"))

    required_fields = [
        "eval_name",
        "dataset_path",
        "predictions_path",
        "report_path"
    ]

    missing = [field for field in required_fields if field not in config]

    if missing:
        print(f"Missing required config fields: {', '.join(missing)}", file=sys.stderr)
        sys.exit(1)

    dataset_path = pathlib.Path(config["dataset_path"])
    predictions_path = pathlib.Path(config["predictions_path"])
    report_path = pathlib.Path(config["report_path"])

    dataset_items = load_jsonl(dataset_path)
    prediction_items = load_jsonl(predictions_path)

    dataset_by_id = {}

    for item in dataset_items:
        if "case_id" not in item:
            print("Dataset item missing case_id.", file=sys.stderr)
            sys.exit(1)

        dataset_by_id[item["case_id"]] = item

    results = []

    for prediction in prediction_items:
        case_id = prediction.get("case_id")

        if not case_id:
            continue

        dataset_item = dataset_by_id.get(case_id)

        if not dataset_item:
            continue

        expected = dataset_item.get("expected_output")
        actual = prediction.get("actual_output")

        result = {
            "case_id": case_id,
            "expected_output": expected,
            "actual_output": actual,
            "exact_match": metrics.exact_match(expected, actual),
            "contains": metrics.contains(expected, actual),
            "latency_ms": prediction.get("latency_ms"),
            "cost_usd": prediction.get("cost_usd"),
            "error": prediction.get("error")
        }

        results.append(result)

    metric_names = config.get("metrics", [])
    thresholds = config.get("thresholds", {})

    metric_values = metrics.calculate_metrics(results, metric_names)
    threshold_passed, threshold_details = metrics.evaluate_thresholds(metric_values, thresholds)

    write_report(
        config=config,
        metric_values=metric_values,
        threshold_passed=threshold_passed,
        threshold_details=threshold_details,
        results=results,
        report_path=report_path
    )

    print(f"Evaluation report written to: {report_path}")

    if not threshold_passed:
        print("Evaluation failed thresholds.", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
