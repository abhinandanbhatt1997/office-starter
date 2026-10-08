
---

## `orchestration/templates/TOOL_REGISTRY_TEMPLATE.md`

```markdown
# Tool Registry

**Document ID:** [TOOL-REG-XXX]  
**Agent Name:** [Name]  
**Status:** ACTIVE  
**Owner:** [Name]  

## Registered Tools

### Tool 1: [tool_name]

| Field | Value |
|---|---|
| **Tool ID** | TOOL-001 |
| **Name** | query_database |
| **Description** | Executes a read-only SQL query against the analytics database |
| **Type** | Azure Function / Container App / API |
| **Endpoint** | https://func-query.azurewebsites.net/api/query |
| **Timeout** | 30 seconds |
| **Retry Policy** | 2 retries, 1s backoff |
| **Idempotent** | Yes (read-only) |
| **Permissions** | Read-only, internal data |
| **Data Classification** | Internal |
| **Status** | ACTIVE / DEPRECATED |
| **Owner** | [Name] |

#### Input Schema

```json
{
  "type": "object",
  "properties": {
    "sql_query": {
      "type": "string",
      "description": "The SQL query to execute"
    }
  },
  "required": ["sql_query"]
}



##### Output Schema

{
  "type": "object",
  "properties": {
    "results": {
      "type": "array",
      "items": { "type": "object" }
    },
    "row_count": { "type": "integer" }
  }
}


Error Handling


400
Invalid SQL
Retry with corrected query
403
Permission denied
Inform user, do not retry
500
Database error
Retry with backoff
504
Timeout
Inform user, suggest simplifying query


Tool 2: [tool_name]
[Repeat structure]

Tool Governance Rules
All tools MUST be registered before use
Tool changes MUST go through PR review
Tool deprecation MUST have 30-day notice
Tool failures MUST be logged and alerted
Tools MUST NOT access data beyond their declared classification





