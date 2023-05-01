# name of resource group 
output "resource_group_name" {
  value = data.azurerm_resource_group.sam-rg.name
}

# ID of resource group 
output "resource_group_id" {
  value = data.azurerm_resource_group.sam-rg.id
}
