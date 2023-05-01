# creation of storage accounts one for logs and another for custom scripts
# creation of resource group
resource "azurerm_resource_group" "sam-rg" {
  name     = "sampath-rg"
  location = "eastus"
}


# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  name                      = "sampath012dev"
  location                  = azurerm_resource_group.sam-rg.location
  resource_group_name       = azurerm_resource_group.sam-rg.name
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  shared_access_key_enabled = "true"
  min_tls_version           = "TLS1_2"
  depends_on = [
    azurerm_resource_group.sam-rg
  ]
}

#Create container for each value of storage account according to the requirement.
resource "azurerm_storage_container" "sampath-storage-container" {
  for_each              = var.containers_list
  name                  = each.value["name"]
  container_access_type = each.value["container_access_type"]
  storage_account_name  = azurerm_storage_account.sampath-storage-accounts.name
  depends_on = [
    azurerm_storage_account.sampath-storage-accounts
  ]
}

/*
# create 3 blobs in each container 
resource "azurerm_storage_blob" "sampath-storage-blob" {
  for_each               = local.flat_list
  name                   = each.value[1].name
  storage_account_name   = azurerm_storage_account.sampath-storage-accounts.name
  storage_container_name = azurerm_storage_account.sampath-storage-container[each.value[0]].name
  type                   = each.value[1].type
  source                 = "New-Text-Document.txt"
  depends_on = [
    azurerm_storage_account.sampath-storage-accounts,
    azurerm_storage_container.sampath-storage-container
  ]
}
*/
