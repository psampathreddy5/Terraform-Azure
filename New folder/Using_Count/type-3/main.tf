# creation of storage accounts one for logs and another for custom scripts
# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  count                     = length(local.storage_account-configuration)
  name                      = local.storage_account-configuration[count.index]
  location                  = data.azurerm_resource_group.sam-rg.location
  resource_group_name       = data.azurerm_resource_group.sam-rg.name
  account_tier              = lookup(var.storage_account-configuration, local.storage_account-configuration[count.index]).account_tier
  account_kind              = lookup(var.storage_account-configuration, local.storage_account-configuration[count.index]).account_kind
  account_replication_type  = lookup(var.storage_account-configuration, local.storage_account-configuration[count.index]).account_replication_type
  access_tier               = lookup(var.storage_account-configuration, local.storage_account-configuration[count.index]).access_tier
  shared_access_key_enabled = lookup(var.storage_account-configuration, local.storage_account-configuration[count.index]).shared_access_key_enabled
  min_tls_version           = lookup(var.storage_account-configuration, local.storage_account-configuration[count.index]).min_tls_version
  tags                      = local.tags
}

