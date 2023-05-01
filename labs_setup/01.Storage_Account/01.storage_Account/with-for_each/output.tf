
output "Storage-account-config" {
  value = local.Storage-account-config
}


output "storage-account-name" {
  value = {
    for k, v in azurerm_storage_account.sampath-storage-accounts : k => v.name
  }
}

output "modified_string" {
  value = local.modified_string
}
