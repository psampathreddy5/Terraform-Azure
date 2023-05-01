# creation of storage accounts one for logs and another for custom scripts
# creation of resource group
resource "azurerm_resource_group" "sam-rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}


# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  for_each                  = var.Storage-account-config
  name                      = "${each.key}${lower(var.Environment)}${lower(local.modified_string)}"
  location                  = azurerm_resource_group.sam-rg.location
  resource_group_name       = azurerm_resource_group.sam-rg.name
  account_tier              = (each.value).account_tier
  account_kind              = (each.value).account_kind
  account_replication_type  = (each.value).account_replication_type
  access_tier               = (each.value).access_tier
  shared_access_key_enabled = (each.value).shared_access_key_enabled
  min_tls_version           = (each.value).min_tls_version
  tags                      = local.tags
  depends_on = [
    azurerm_resource_group.sam-rg
  ]
}
