# creation of storage accounts one for logs and another for custom scripts
# creation of resource group
resource "azurerm_resource_group" "sam-rg" {
  name     = "sam-rg-env-dev"
  location = "eastus"
  tags     = local.tags
}


# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  name                      = "${lower(local.preffix)}${var.storage_account_name}${lower(var.Environment)}"
  location                  = azurerm_resource_group.sam-rg.location
  resource_group_name       = azurerm_resource_group.sam-rg.name
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  shared_access_key_enabled = true
  min_tls_version           = "TLS1_2"
  tags                      = local.tags
  depends_on = [
    azurerm_resource_group.sam-rg
  ]
}


# using count to create 3 containners 
resource "azurerm_storage_container" "sam-container" {
  count                 = length(var.containers_list)
  name                  = var.containers_list[count.index].name
  storage_account_name  = azurerm_storage_account.sampath-storage-accounts.name
  container_access_type = var.containers_list[count.index].container_access_type
  depends_on = [
    azurerm_storage_account.sampath-storage-accounts
  ]
}

resource "azurerm_storage_blob" "sam-blob" {
  count                  = length(local.flat_list)
  name                   = local.flat_list[count.index][1].name
  storage_account_name   = azurerm_storage_account.sampath-storage-accounts.name
  storage_container_name = azurerm_storage_container.sam-container[local.flat_list[count.index][0]].name
  type                   = local.flat_list[count.index][1].type
  source                 = "New-Text-Document.txt"
  depends_on = [
    azurerm_storage_account.sampath-storage-accounts,
    azurerm_storage_container.sam-container
  ]
}
