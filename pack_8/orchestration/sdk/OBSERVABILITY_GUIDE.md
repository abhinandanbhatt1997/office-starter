
---

## `orchestration/sdk/OBSERVABILITY_GUIDE.md`

```markdown
# Observability Guide

**Document ID:** ORCH-SDK-003  
**Owner:** AI/ML Engineering  
**Status:** ACTIVE  

## Mandatory Observability Stack

| Component | Azure Service | Purpose |
|---|---|---|
| Traces | Application Insights (OpenTelemetry) | Distributed request tracing |
| Metrics | Azure Monitor | Token usage, latency, errors |
| Logs | Log Analytics Workspace | Structured JSON logs |
| Alerts | Azure Monitor Alerts | Notification on anomalies |
| Dashboards | Azure Monitor Workbooks | Visual monitoring |

## OpenTelemetry Setup

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.resources import Resource

# Configure once at application startup
resource = Resource.create({
    "service.name": "ai-agent-service",
    "service.version": "1.0.0",
    "deployment.environment": "production"
})

configure_azure_monitor(
    connection_string="<from-app-insights>",  # Use Key Vault reference
    resource=resource
)

tracer = trace.get_tracer(__name__)
