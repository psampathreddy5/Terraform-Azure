output "storage_account_name" {
  value = azurerm_storage_account.abp_storage_account.name
}

output "storage_container_name" {
  value = azurerm_storage_container.abp_container.name
}

output "connection_string" {
  value     = azurerm_storage_account.abp_storage_account.primary_connection_string
  sensitive = true
}

