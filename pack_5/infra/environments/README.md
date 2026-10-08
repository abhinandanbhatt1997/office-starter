
---

## `infra/environments/README.md`

```markdown
# Terraform Environments

This folder contains environment-specific Terraform compositions.

Expected environments:

```text
dev/
stage/
prod/

Each environment should contain:

main.tf
variables.tf
outputs.tf
terraform.tfvars.example
backend.tf.example
README.md	
