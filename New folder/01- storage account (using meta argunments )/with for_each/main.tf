# creation of storage accounts one for logs and another for custom scripts
# creation of resource group
resource "azurerm_resource_group" "sam_rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}

# using count feature to create 3 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  count                     = length(var.storage-account_config)
  name                      = "${count.index}${keys(var.storage-account_config)[count.index]}${lower(var.Environment)}"
  location                  = azurerm_resource_group.sam_rg.location
  resource_group_name       = azurerm_resource_group.sam_rg.name
  account_tier              = var.storage-account_config[keys(var.storage-account_config)[count.index]].account_tier
  account_kind              = var.storage-account_config[keys(var.storage-account_config)[count.index]].account_kind
  account_replication_type  = var.storage-account_config[keys(var.storage-account_config)[count.index]].account_replication_type
  access_tier               = var.storage-account_config[keys(var.storage-account_config)[count.index]].access_tier
  shared_access_key_enabled = var.storage-account_config[keys(var.storage-account_config)[count.index]].shared_access_key_enabled
  min_tls_version           = var.storage-account_config[keys(var.storage-account_config)[count.index]].min_tls_version
  depends_on = [
    azurerm_resource_group.sam_rg
  ]
  tags = local.tags
}
#using count feature to create 3 containers in each storage accounts
resource "azurerm_storage_container" "sampath-containers" {
  count                 = length(var.storage_container-config)
  name                  = keys(var.storage_container-config)[count.index]
  storage_account_name  = azurerm_storage_account.sampath-storage-accounts[count.index].name
  container_access_type = var.storage_container-config[keys(var.storage_container-config)[count.index]].container_access_type
}

# creation of 1 blobcontainer in 1 container 
resource "azurerm_storage_blob" "sampath-blob" {
  name                   = "sampath/sampath.txt"
  storage_account_name   = azurerm_storage_account.sampath-storage-accounts[0].name
  storage_container_name = azurerm_storage_container.sampath-containers[0].name
  type                   = "Block"
  source                 = "sampath.txt"
}
