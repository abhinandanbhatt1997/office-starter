"""
Evaluation metric helpers for the enterprise AI accelerator.

This module intentionally avoids external dependencies so it can run
in local development and CI pipelines.
"""

from typing import Any, Dict, List


def exact_match(expected: Any, actual: Any) -> bool:
    if expected is None or actual is None:
        return False

    return str(expected).strip().lower() == str(actual).strip().lower()


def contains(expected: Any, actual: Any) -> bool:
    if expected is None or actual is None:
        return False

    return str(expected).strip().lower() in str(actual).strip().lower()


def calculate_metrics(results: List[Dict[str, Any]], metric_names: List[str]) -> Dict[str, float]:
    metrics: Dict[str, float] = {
        "total_cases": len(results)
    }

    if not results:
        return metrics

    if "exact_match_rate" in metric_names:
        matched = sum(1 for result in results if result.get("exact_match"))
        metrics["exact_match_rate"] = matched / len(results)

    if "contains_rate" in metric_names:
        contained = sum(1 for result in results if result.get("contains"))
        metrics["contains_rate"] = contained / len(results)

    if "success_rate" in metric_names:
        successful = sum(1 for result in results if not result.get("error"))
        metrics["success_rate"] = successful / len(results)

    if "error_rate" in metric_names:
        errors = sum(1 for result in results if result.get("error"))
        metrics["error_rate"] = errors / len(results)

    latencies = [
        float(result["latency_ms"])
        for result in results
        if result.get("latency_ms") is not None
    ]

    if "average_latency_ms" in metric_names and latencies:
        metrics["average_latency_ms"] = sum(latencies) / len(latencies)

    if "p95_latency_ms" in metric_names and latencies:
        latencies.sort()
        index = min(len(latencies) - 1, int(0.95 * (len(latencies) - 1)))
        metrics["p95_latency_ms"] = latencies[index]

    costs = [
        float(result["cost_usd"])
        for result in results
        if result.get("cost_usd") is not None
    ]

    if "average_cost_usd" in metric_names and costs:
        metrics["average_cost_usd"] = sum(costs) / len(costs)

    return metrics


def evaluate_thresholds(metrics: Dict[str, float], thresholds: Dict[str, Dict[str, float]]):
    passed = True
    details = []

    for metric_name, rule in thresholds.items():
        value = metrics.get(metric_name)

        if value is None:
            passed = False
            details.append({
                "metric": metric_name,
                "value": None,
                "threshold": rule,
                "result": "MISSING"
            })
            continue

        min_value = rule.get("min")
        max_value = rule.get("max")

        result = "PASS"

        if min_value is not None and value < min_value:
            result = "FAIL"
            passed = False

        if max_value is not None and value > max_value:
            result = "FAIL"
            passed = False

        details.append({
            "metric": metric_name,
            "value": value,
            "threshold": rule,
            "result": result
        })

    return passed, details
