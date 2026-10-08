# Azure DevOps Pipeline Standard

**Document ID:** CICD-001  
**Owner:** DevOps / AI Engineering  
**Status:** ACTIVE  
**Version:** 1.0  

## Purpose

This directory defines the Azure DevOps pipeline standards for the Azure AI Enterprise Accelerator.

## Pipeline Types

| Pipeline | Purpose | Trigger |
|---|---|---|
| PR pipeline | Validates pull requests | Pull request to `main` |
| CI pipeline | Validates merged changes | Push to `main` |
| Dev deploy | Deploys to dev | Manual or controlled trigger |
| Stage deploy | Deploys to stage | Manual with approval |
| Prod deploy | Deploys to prod | Manual with approval |

## Required Pipeline Checks

Every PR pipeline should include:

1. Documentation check.
2. Secret scan.
3. Eval dataset validation.
4. Python syntax/check step.
5. Terraform plan where infrastructure changes exist.

Every deploy pipeline should include:

1. Terraform plan.
2. Terraform apply only with explicit approval.
3. Smoke test.
4. Evidence publication.
5. Rollback documentation reference.

## Pipeline Rules

1. No secrets in YAML.
2. No hardcoded subscription IDs where avoidable.
3. No production apply without environment approval.
4. No direct deployment from local machines.
5. No untracked manual portal changes.
6. All deployments must be traceable to a work item.
7. All pipeline failures must be investigated before retry.

## Required Azure DevOps Objects

Before running pipelines, create:

| Object | Example Name |
|---|---|
| Variable group | `vg-accelerator-common` |
| Key Vault variable group | `vg-accelerator-keyvault` |
| Service connection dev | `sc-azure-dev` |
| Service connection stage | `sc-azure-stage` |
| Service connection prod | `sc-azure-prod` |
| Environment dev | `dev` |
| Environment stage | `stage` |
| Environment prod | `prod` |
