# Agent Pool Standard

**Document ID:** CICD-005  
**Owner:** DevOps / Platform  
**Status:** ACTIVE  

## Agent Types

### Microsoft-Hosted Agents

Use when:

- Resources are publicly reachable.
- No private endpoint access is required.
- Build does not need corporate network access.

Example:

```yaml
pool:
  vmImage: ubuntu-latest
