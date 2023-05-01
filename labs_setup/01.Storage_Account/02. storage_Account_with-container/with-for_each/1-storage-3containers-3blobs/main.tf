# creation of storage accounts one for logs and another for custom scripts
# creation of resource group
resource "azurerm_resource_group" "sam-rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}


# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  name                      = "sampath${lower(var.Environment)}${lower(local.preffix)}"
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

#Create container for each value of storage account according to the requirement.
resource "azurerm_storage_container" "sampath-storage-container" {
  for_each              = toset(var.containers_list)
  name                  = each.value
  container_access_type = "private"
  storage_account_name  = azurerm_storage_account.sampath-storage-accounts.name
  depends_on = [
    azurerm_storage_account.sampath-storage-accounts
  ]
}


# create 3 blobs in each container 
resource "azurerm_storage_blob" "sampath-storage-blob" {
  for_each               = { for idx, val in local.flat_list : idx => val }
  name                   = each.value[1].name
  storage_account_name   = azurerm_storage_account.sampath-storage-accounts.name
  storage_container_name = azurerm_storage_container.sampath-storage-container[each.value[0]].name
  type                   = each.value[1].type
  source                 = "New-Text-Document.txt"
  depends_on = [
    azurerm_storage_account.sampath-storage-accounts,
    azurerm_storage_container.sampath-storage-container
  ]
}
