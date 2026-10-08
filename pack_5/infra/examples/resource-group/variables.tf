variable "subscription_id" {
  description = "Azure subscription ID in which to create the example resource group."
  type        = string

  validation {
    condition     = can(regex("^[0-9a-fA-F-]{36}$", var.subscription_id))
    error_message = "Provide a valid Azure subscription ID."
  }
}

variable "location" {
  description = "Organization-approved Azure region for the example resource group."
  type        = string
}

variable "resource_group_name" {
  description = "Unique name for the example resource group."
  type        = string
}

variable "tags" {
  description = "Tags required by your organization's Azure policy."
  type        = map(string)
  default     = {}
}
