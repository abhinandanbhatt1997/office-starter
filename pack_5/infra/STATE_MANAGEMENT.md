Terraform State Management
Document ID: IAC-003
Owner: Platform / AI Engineering
Status: ACTIVE
State Backend
Use Azure Storage Account as the Terraform backend.
Required objects:
Object
Purpose
Resource group
Holds state storage account
Storage account
Stores state blobs
Blob container
Contains tfstate files
State blob key
One key per environment
State Keys
Use one state file per environment:

dev.terraform.tfstate
stage.terraform.tfstate
prod.terraform.tfstate

State Access
Prefer:
Managed Identity.
Azure DevOps service connection.
RBAC-based storage access.
Avoid:
Storage account keys in plain text.
Local state storage.
Shared state files across unrelated projects.
Committing state files.
Backend Example
Example Terraform backend configuration:

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstate001"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}


Do not commit real storage account names unless they are non-sensitive and approved.


State Protection Rules
Enable blob versioning where possible.
Enable soft delete where possible.
Restrict storage account network access.
Do not manually edit tfstate files.
Do not delete state without change control.
State access must be logged.



---


