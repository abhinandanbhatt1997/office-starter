# Identity & Access Standard

**Document ID:** ENT-002 | **Status:** ACTIVE | **Owner:** Security / AI Engineering

## 1. Managed Identity First
- All Azure compute (Container Apps, Functions, AKS, VMs) **MUST** use System-Assigned or User-Assigned Managed Identities to access Azure resources.
- Service Principals with Client Secrets are **FORBIDDEN** unless a formal security exemption is granted.

## 2. RBAC Least Privilege
- Do not use `Owner` or `Contributor` at the Subscription level.
- Use built-in data-plane roles where possible (e.g., `Cognitive Services OpenAI User`, `Storage Blob Data Contributor`).
- Custom roles must be documented in an ADR.

## 3. Key Vault Access
- Applications must access Key Vault using the `DefaultAzureCredential` SDK pattern.
- Access Policies are deprecated; use Azure RBAC for Key Vault data plane access.
