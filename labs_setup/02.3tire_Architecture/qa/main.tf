# creation of storage accounts one for logs and another for custom scripts
# creation of resource group
resource "azurerm_resource_group" "sam-rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}


# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  count                     = length(var.storage_config)
  name                      = "${count.index}${keys(var.storage_config)[count.index]}${lower(var.Environment)}"
  location                  = azurerm_resource_group.sam-rg.location
  resource_group_name       = azurerm_resource_group.sam-rg.name
  account_tier              = var.storage_config[keys(var.storage_config)[count.index]].account_tier
  account_kind              = var.storage_config[keys(var.storage_config)[count.index]].account_kind
  account_replication_type  = var.storage_config[keys(var.storage_config)[count.index]].account_replication_type
  access_tier               = var.storage_config[keys(var.storage_config)[count.index]].access_tier
  shared_access_key_enabled = var.storage_config[keys(var.storage_config)[count.index]].shared_access_key_enabled
  min_tls_version           = var.storage_config[keys(var.storage_config)[count.index]].min_tls_version
  depends_on = [
    azurerm_resource_group.sam-rg
  ]
  tags = local.tags
}

#using count feature to create 2 containers in storage accounts
resource "azurerm_storage_container" "sampath-containers" {
  count                 = length(var.containers_config)
  name                  = keys(var.containers_config)[count.index]
  storage_account_name  = azurerm_storage_account.sampath-storage-accounts[count.index].name
  container_access_type = var.containers_config[keys(var.containers_config)[count.index]].container_access_type
}



# create 1 blobs in each container 
resource "azurerm_storage_blob" "sampath-storage-blob" {
  name                   = "sampath/${var.blob_name}"
  storage_account_name   = azurerm_storage_account.sampath-storage-accounts[0].name
  storage_container_name = azurerm_storage_container.sampath-containers[0].name
  type                   = "Block"
  source                 = "New-Text-Document.txt"
  depends_on = [
    azurerm_storage_account.sampath-storage-accounts,
    azurerm_storage_container.sampath-containers
  ]
}

