# Code Scaffolds

These are safe, production-ready starting points for common Azure AI patterns.

## Rules

1. All scaffolds use `DefaultAzureCredential` — never hardcode keys
2. All scaffolds include observability hooks
3. All scaffolds include error handling and retry logic
4. All scaffolds are EXAMPLES — adapt to your specific use case
5. Remove `.example` extension and customize before use

## Files

| File | Pattern | Complexity |
|---|---|---|
| `single_agent_scaffold.py.example` | Single agent with retry | L1 |
| `multi_agent_pipeline_scaffold.py.example` | Multi-agent sequential pipeline | L3 |
| `tool_calling_scaffold.py.example` | Tool registration and execution | L2 |
| `rag_retrieval_scaffold.py.example` | RAG with Azure AI Search | L2 |
| `session_state_scaffold.py.example` | Cosmos DB session management | L1 |
| `service_bus_burst_scaffold.py.example` | Queue-based burst absorption | L2 |
| `guardrail_integration_scaffold.py.example` | Content Safety integration | L1 |
| `observability_scaffold.py.example` | OpenTelemetry setup | L1 |

## Usage

```bash
# Copy the scaffold
cp single_agent_scaffold.py.example my_agent.py

# Customize for your use case
# Replace placeholders with your actual values
# Add your business logic
# Test thoroughly before deploying
