
---

## `orchestration/sdk/AUTHENTICATION_GUIDE.md`

```markdown
# Authentication Guide

**Document ID:** ORCH-SDK-002  
**Owner:** AI/ML Engineering / Security  
**Status:** ACTIVE  

## The Golden Rule

**NEVER hardcode credentials. ALWAYS use `DefaultAzureCredential`.**

## DefaultAzureCredential Chain

`DefaultAzureCredential` tries authentication methods in this order:

```text
1. Environment variables (AZURE_CLIENT_ID, etc.)
2. Managed Identity (if running in Azure)
3. Azure CLI (az login)
4. Azure PowerShell (Connect-AzAccount)
5. Interactive browser (last resort)
