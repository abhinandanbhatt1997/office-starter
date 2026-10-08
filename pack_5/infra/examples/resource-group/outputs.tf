output "resource_group_id" {
  description = "ID of the example resource group."
  value       = azurerm_resource_group.example.id
}

output "resource_group_name" {
  description = "Name of the example resource group."
  value       = azurerm_resource_group.example.name
}
