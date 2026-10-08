# AI Agent Orchestration Standard

**Document ID:** ORCH-002  
**Owner:** AI/ML Engineering  
**Status:** ACTIVE  
**Version:** 1.0  

## 1. Scope

This standard applies to all production AI agents deployed on Azure, including:

- Single-agent conversational systems
- Multi-agent pipelines (sequential, parallel, hierarchical)
- RAG (Retrieval-Augmented Generation) systems
- Tool-calling agents with function execution
- Queue-based asynchronous agent workflows
- Scheduled/batch agent processes

## 2. Mandatory Requirements

### 2.1 Identity & Authentication

| Requirement | Details |
|---|---|
| Authentication | MUST use `DefaultAzureCredential` from `azure-identity` |
| Managed Identity | MUST be assigned to all compute hosting agents |
| No hardcoded keys | NEVER use API keys or connection strings in code |
| Key Vault | Secrets accessed via Key Vault references only |

### 2.2 Model Access

| Requirement | Details |
|---|---|
| SDK | Use `azure-ai-inference` for chat completions |
| Agent framework | Use `azure-ai-projects` or `azure-ai-agents` for orchestration |
| Endpoint | MUST use private endpoint in production |
| Version pinning | Model deployment version MUST be pinned |
| Fallback model | MUST define a fallback model for quota exhaustion |

### 2.3 Prompt Management

| Requirement | Details |
|---|---|
| Versioning | All prompts MUST be versioned in source control |
| Registry | Prompts MUST be registered in the Prompt Registry |
| Separation | System prompts MUST be separated from user prompts |
| Templating | Use a template engine (Jinja2 or equivalent) |
| No inline prompts | NEVER hardcode prompts in application logic |

### 2.4 Tool Calling

| Requirement | Details |
|---|---|
| Registry | All tools MUST be registered in `TOOL_REGISTRY_TEMPLATE.md` |
| Schema | Tool schemas MUST use JSON Schema format |
| Permissions | Tools MUST have least-privilege access |
| Timeout | Tool calls MUST have explicit timeouts |
| Error handling | Tool failures MUST be caught and reported to the agent |
| Idempotency | Tools that mutate state MUST be idempotent |

### 2.5 Session State

| Requirement | Details |
|---|---|
| Storage | Use Azure Cosmos DB (NoSQL API) for session state |
| Partition key | Use `session_id` as partition key |
| TTL | Sessions MUST have a time-to-live policy |
| Encryption | Sessions MUST be encrypted at rest |
| PII | Sessions MUST NOT store unmasked PII |

### 2.6 Guardrails

| Requirement | Details |
|---|---|
| Input filtering | MUST filter user input before LLM processing |
| Output filtering | MUST filter LLM output before returning to user |
| Content Safety | Use Azure AI Content Safety service |
| PII detection | MUST detect and mask PII in both directions |
| Prompt injection | MUST detect and block prompt injection attempts |
| Logging | All guardrail actions MUST be logged |

### 2.7 Observability

| Requirement | Details |
|---|---|
| Tracing | MUST use OpenTelemetry for distributed tracing |
| Metrics | MUST track token usage, latency, error rates |
| Logging | MUST use structured JSON logging |
| Correlation | MUST propagate correlation IDs across agent steps |
| Application Insights | MUST export to Application Insights |

### 2.8 Cost & Quota

| Requirement | Details |
|---|---|
| Token tracking | MUST track input/output tokens per request |
| Budget alerts | MUST have Azure budget alerts configured |
| Quota monitoring | MUST monitor Azure OpenAI TPM/RPM quotas |
| Backoff | MUST implement exponential backoff on 429 responses |
| Circuit breaker | MUST implement circuit breaker for sustained failures |

## 3. Prohibited Patterns

| Pattern | Reason |
|---|---|
| Synchronous LLM calls in web requests without timeout | Causes cascading failures |
| Unbounded agent loops | Causes runaway token costs |
| Direct model endpoint calls without retry | Fails on transient errors |
| Storing full conversation history in memory | Memory exhaustion |
| Passing raw user input directly to tools | Security vulnerability |
| Logging full prompts/responses without PII masking | Compliance violation |
| Using Azure Functions for agent loops > 5 minutes | Timeout failures |

## 4. Agent Complexity Levels

| Level | Description | Approval Required |
|---|---|---|
| L1 | Single agent, no tools, simple prompt | Engineering Lead |
| L2 | Single agent with tools, RAG | Engineering Lead + Security |
| L3 | Multi-agent pipeline, async processing | Engineering Lead + Security + Architecture |
| L4 | Autonomous agents with external side effects | Full Architecture Review Board |

## 5. Release Gates for Agents

No agent reaches production without:

- [ ] `AGENT_DESIGN_TEMPLATE.md` approved
- [ ] `TOOL_REGISTRY_TEMPLATE.md` approved (if tools used)
- [ ] `pack_2` evaluation plan executed and passing
- [ ] Guardrail evaluation passing (100% on security cases)
- [ ] Observability verified in Application Insights
- [ ] Runbook written and reviewed
- [ ] Known limitations documented
