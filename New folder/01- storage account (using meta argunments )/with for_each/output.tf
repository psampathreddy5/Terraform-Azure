output "storage-account-name-1" {
  value = azurerm_storage_account.sampath-storage-accounts[0].name

}

output "storage-account-name-2" {
  value = azurerm_storage_account.sampath-storage-accounts[1].name
}

output "storage-account-name-3" {
  value = azurerm_storage_account.sampath-storage-accounts[2].name
}

output "blobid" {
  value = azurerm_storage_blob.sampath-blob.id

}
