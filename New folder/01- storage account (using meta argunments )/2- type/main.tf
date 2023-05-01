# creation of storage accounts one for logs and another for custom scripts
# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  for_each                  = var.storage-accounts
  name                      = "sampath123${lower(var.Environment)}${each.value}"
  location                  = data.azurerm_resource_group.sam-rg.location
  resource_group_name       = data.azurerm_resource_group.sam-rg.name
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  shared_access_key_enabled = "true"
  min_tls_version           = "TLS1_2"
  tags                      = local.tags
}



# creation of container in storage account
resource "azurerm_storage_container" "sampath-container" {
  for_each              = azurerm_storage_account.sampath-storage-accounts
  name                  = "${each.value.name}-sampath"
  storage_account_name  = each.value.name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.sampath-storage-accounts
  ]
}

# creation of blob in container
resource "azurerm_storage_blob" "sampath-blob" {
  name                   = "sampath/Sampath reddy.jpg"
  storage_account_name   = azurerm_storage_account.sampath-storage-accounts[1].name
  storage_container_name = azurerm_storage_container.sampath-container[1].name
  type                   = "Block"
  source                 = "Sampath reddy.jpg"
  depends_on = [
    azurerm_storage_container.sampath-container
  ]
}
