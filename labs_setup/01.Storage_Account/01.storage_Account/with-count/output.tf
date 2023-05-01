
output "Storage-account-config" {
  value = local.Storage-account-config
}


output "storage-account-name0" {
  value = azurerm_storage_account.sampath-storage-accounts[0].name
}

output "storage-account-name1" {
  value = azurerm_storage_account.sampath-storage-accounts[1].name
}

output "storage-account-name2" {
  value = azurerm_storage_account.sampath-storage-accounts[2].name
}
