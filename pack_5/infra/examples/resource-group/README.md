# Minimal Azure resource group example

This example demonstrates a small Terraform configuration using the AzureRM provider. It creates one resource group and is intended to show the shape of an environment configuration; it is not a complete AI workload or a production baseline.

## Prerequisites

- Terraform CLI installed (use an organization-approved version).
- An Azure subscription and permission to create resource groups.
- Azure CLI authentication (`az login`) or another supported AzureRM authentication method.

## Review before use

Choose the subscription, region, resource group name, tags, and state backend according to your organization's standards. Local state is used by default here for demonstration; do not use local state for shared or production environments. No resources are created until you explicitly run `terraform apply`.

From this directory:

```bash
az account set --subscription "<subscription-id>"
terraform init
terraform fmt -check
terraform validate
terraform plan -var='subscription_id=<subscription-id>' -var='location=<approved-region>' -var='resource_group_name=<unique-resource-group-name>'
```

Review the plan and obtain required approval before applying it. To apply, provide the same variables to `terraform apply`. To remove the example resource group later, use `terraform destroy` only after confirming that it contains no needed resources or data.

For real project environments, configure remote state as described in [state management](../../STATE_MANAGEMENT.md) and add required policy, identity, networking, monitoring, and cost controls before deploying workload resources.
