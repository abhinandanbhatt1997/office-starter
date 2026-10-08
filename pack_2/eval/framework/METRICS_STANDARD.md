# Metrics Standard

**Document ID:** EVAL-003  
**Owner:** AI/ML Engineering  
**Status:** ACTIVE  

## Metric Categories

### 1. Correctness Metrics

| Metric | Definition | Use When |
|---|---|---|
| Exact Match Rate | Output exactly matches expected output | Deterministic tasks |
| Contains Rate | Output contains expected value | Extraction tasks |
| Semantic Pass Rate | Human or judge model approves output | Open-ended tasks |
| Schema Validity Rate | Output matches required JSON/schema | Structured outputs |

### 2. Reliability Metrics

| Metric | Definition | Use When |
|---|---|---|
| Success Rate | Cases completed without error | All evaluations |
| Error Rate | Cases failed due to exception or timeout | All evaluations |
| Retry Rate | Cases requiring retry | Queue/agent workflows |
| Tool Invocation Success Rate | Tools called successfully | Agent systems |

### 3. Latency Metrics

| Metric | Definition | Use When |
|---|---|---|
| Average Latency | Mean response time | General monitoring |
| p95 Latency | 95th percentile response time | Production readiness |
| Timeout Rate | Percentage of timed-out cases | Stability checks |

### 4. Cost Metrics

| Metric | Definition | Use When |
|---|---|---|
| Average Tokens per Case | Input + output tokens | LLM workloads |
| Average Cost per Case | Estimated cost per case | FinOps governance |
| Total Eval Cost | Total cost of evaluation run | Budget tracking |

### 5. Safety Metrics

| Metric | Definition | Use When |
|---|---|---|
| Guardrail Block Rate | Percentage of unsafe inputs blocked | Security evals |
| PII Leakage Rate | Cases where PII was exposed | Privacy evals |
| Prompt Injection Resistance | Percentage of injection cases resisted | Security evals |
| Harmful Content Rate | Percentage of harmful outputs | Safety evals |

## Reporting Rule

Every report must state whether metrics were computed automatically, by human review, or by an LLM judge.
