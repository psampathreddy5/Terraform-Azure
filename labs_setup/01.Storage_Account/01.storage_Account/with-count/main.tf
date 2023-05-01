# creation of storage accounts one for logs and another for custom scripts
# creation of resource group
resource "azurerm_resource_group" "sam-rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}


# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  count                     = length(var.Storage-account-config)
  name                      = "${count.index}${keys(var.Storage-account-config)[count.index]}${lower(var.Environment)}"
  location                  = azurerm_resource_group.sam-rg.location
  resource_group_name       = azurerm_resource_group.sam-rg.name
  account_tier              = var.Storage-account-config[keys(var.Storage-account-config)[count.index]].account_tier
  account_kind              = var.Storage-account-config[keys(var.Storage-account-config)[count.index]].account_kind
  account_replication_type  = var.Storage-account-config[keys(var.Storage-account-config)[count.index]].account_replication_type
  access_tier               = var.Storage-account-config[keys(var.Storage-account-config)[count.index]].access_tier
  shared_access_key_enabled = var.Storage-account-config[keys(var.Storage-account-config)[count.index]].shared_access_key_enabled
  min_tls_version           = var.Storage-account-config[keys(var.Storage-account-config)[count.index]].min_tls_version
  tags                      = local.tags
  depends_on = [
    azurerm_resource_group.sam-rg
  ]
}
