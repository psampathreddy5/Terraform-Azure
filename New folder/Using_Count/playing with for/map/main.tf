# creation of storage accounts one for logs and another for custom scripts
# creation of resource group
resource "azurerm_resource_group" "sam-rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}

# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  count                     = length(local.Storage-account-config)
  name                      = local.Storage-account-config[count.index]
  location                  = azurerm_resource_group.sam-rg.location
  resource_group_name       = azurerm_resource_group.sam-rg.name
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  shared_access_key_enabled = "true"
  min_tls_version           = "TLS1_2"
  tags                      = local.tags
  depends_on = [
    azurerm_resource_group.sam-rg
  ]
}







/*
# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  count                     = length(var.Storage-account-config)
  name                      = values(var.Storage-account-config)[count.index]
  location                  = azurerm_resource_group.sam-rg.location
  resource_group_name       = azurerm_resource_group.sam-rg.name
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  shared_access_key_enabled = "true"
  min_tls_version           = "TLS1_2"
  tags                      = local.tags
  depends_on = [
    azurerm_resource_group.sam-rg
  ]
}



















# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  count                     = length(local.Storage-account-config)
  name                      = local.Storage-account-config[count.index]
  location                  = azurerm_resource_group.sam-rg.location
  resource_group_name       = azurerm_resource_group.sam-rg.name
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  shared_access_key_enabled = "true"
  min_tls_version           = "TLS1_2"
  tags                      = local.tags
  depends_on = [
    azurerm_resource_group.sam-rg
  ]
}
*/
