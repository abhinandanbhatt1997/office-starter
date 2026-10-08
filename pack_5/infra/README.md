# Infrastructure

**Document ID:** IAC-001  
**Owner:** Platform / AI Engineering  
**Status:** ACTIVE  
**Version:** 1.0  

## Purpose

This directory contains infrastructure standards and Terraform examples for Azure AI/ML delivery. The minimal example under `examples/resource-group/` is a learning scaffold, not a production landing zone or a complete AI workload.

## Core Rules

1. Infrastructure must be code-managed.
2. Terraform state must be remote and protected.
3. Production changes must go through pipeline.
4. Manual portal changes are prohibited unless emergency-approved.
5. Identity must use Managed Identity where possible.
6. Secrets must be stored in Azure Key Vault.
7. Networking must assume private endpoints where required.
8. Observability must be included by default.
9. Naming must follow the naming standard.
10. Every environment must be reproducible.

## Example and planned module structure

Start with [`examples/resource-group/`](examples/resource-group/README.md) to see a small Terraform configuration. It uses local state for demonstration and requires you to provide the subscription, location, and resource group name. Configure approved remote state and organization controls before using Terraform for shared or production environments.

```text
infra/
  examples/
    resource-group/
  modules/
    networking/
    identity/
    storage/
    keyvault/
    ai/
    monitoring/
    queue/
    security/
  environments/
    dev/
    stage/
    prod/
  policies/
