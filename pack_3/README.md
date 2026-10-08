# Azure AI Enterprise Accelerator

**Version:** 0.1.0  
**Owner:** AI/ML Engineering  
**CI/CD Platform:** Azure DevOps  
**Documentation Style:** Enterprise  
**Status:** ACTIVE  

## Purpose

This repository is a reusable accelerator for delivering secure, observable, and production-ready Azure AI/ML projects.

It is not a single business project. It is a standardized delivery framework.

## Core Principles

1. Ship r0 quickly, but never skip governance.
2. All infrastructure must be repeatable and code-managed.
3. All AI changes must be evaluated.
4. All secrets must stay in Azure Key Vault.
5. All decisions must be documented.
6. All releases must produce evidence.
7. All handovers must be controlled and traceable.

## Pack Structure

| Pack | Purpose | Status |
|---|---|---|
| Pack 0 | Governance and manager alignment | Included |
| Pack 1 | Azure and Azure DevOps pre-flight checks | Included |
| Pack 2 | Evaluation and research framework | Included |
| Pack 3 | Repository skeleton and project template | Included |
| Pack 4 | AI agent context | Included |
| Pack 5 | CI/CD and IaC guidance/examples | Included |
| Pack 6 | Enterprise documentation | Included |
| Pack 7 | Operations, security, and handover | Included |

“Included” means starter content is present; it does not mean every pack is a complete or production-ready implementation. Adapt and review infrastructure and pipeline examples against your organization's Azure policies before use.

## Quick Start

From the repository root, copy and fill the pre-flight environment file:

```bash
cp pack_1/config/preflight.env.example pack_1/config/preflight.env
