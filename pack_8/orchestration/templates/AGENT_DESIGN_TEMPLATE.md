
---

# 5. Templates

## `orchestration/templates/AGENT_DESIGN_TEMPLATE.md`

```markdown
# Agent Design Document

**Document ID:** [AGENT-DESIGN-XXX]  
**Agent Name:** [Name]  
**Complexity Level:** [L1 / L2 / L3 / L4]  
**Status:** DRAFT / IN REVIEW / APPROVED  
**Owner:** [Name]  
**Date:** [YYYY-MM-DD]  

## 1. Purpose

What does this agent do? What business problem does it solve?

## 2. Agent Architecture

### 2.1 High-Level Flow

```text
[Describe the flow: input → processing → output]


2.2 Components

Component
Type
Azure Service
Notes
Orchestrator
Container App
Azure Container Apps
LLM
Model
Azure OpenAI / Model Catalog
Vector Store
Search
Azure AI Search
Session State
Database
Cosmos DB
Queue
Messaging
Service Bus
Guardrails
Safety
Azure AI Content Safety



3. Model Configuration
Setting
Value
Justification
Primary model
Fallback model
Temperature
Max tokens
Top P
Stop sequences



4. Prompt Chain
Step
Prompt ID
Version
Purpose
System
PROMPT-SYS-001
v1.0
Base instructions
Planning
PROMPT-PLAN-001
v1.0
Task decomposition
Execution
PROMPT-EXEC-001
v1.0
Tool calling
Response
PROMPT-RESP-001
v1.0
User formatting



5.. Tools
Reference: TOOL_REGISTRY_TEMPLATE.md

Tool Name
Type
Permissions
Timeout



6. Guardrails
Guardrail
Direction
Action on Detection
PII detection
Input
Mask
Prompt injection
Input
Block
Content safety
Output
Replace
Citation check
Output
Add disclaimer

7. Session State
Setting
Value
Storage
Cosmos DB
Partition key
session_id
TTL
24 hours
Context window strategy
Sliding window (last 10 turns)

8. Observability
Metric
Target
Alert Threshold
Latency (p95)
< 3000ms
> 5000ms
Error rate
< 1%
> 5%
Token usage
< 100k/day
> 200k/day
Guardrail blocks
< 2%
> 10%

9. Cost Estimate
Component
Estimated Monthly Cost
Azure OpenAI tokens
$
Cosmos DB RU/s
$
Service Bus
$
Container Apps
$
AI Search
$
Total
$

10. Risk Assessment
Risk
Impact
Mitigation
Model hallucination
Medium
RAG grounding + citation check
Prompt injection
High
Azure AI Content Safety
Quota exhaustion
Medium
Fallback model + backoff
PII leakage
High
Input/output masking


11. Approval

Role
Name
Date
Decision
AI Engineer
Engineering Lead
Security Reviewer
Product Owner

