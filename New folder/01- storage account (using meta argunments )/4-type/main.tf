# creation of storage accounts one for logs and another for custom scripts
# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  for_each                  = var.storage-accounts-details
  name                      = each.key
  location                  = data.azurerm_resource_group.sam-rg.location
  resource_group_name       = data.azurerm_resource_group.sam-rg.name
  account_tier              = each.value.account_tier
  account_kind              = each.value.account_kind
  account_replication_type  = each.value.account_replication_type
  access_tier               = each.value.access_tier
  shared_access_key_enabled = each.value.shared_access_key_enabled
  min_tls_version           = each.value.min_tls_version
  tags                      = local.tags
}

resource "azurerm_storage_container" "sampath-storage-container" {
  for_each              = var.storage-container-details
  name                  = each.key
  storage_account_name  = each.value.storage_account_name
  container_access_type = each.value.container_access_type
}


# creation of blob in container
resource "azurerm_storage_blob" "abp_blob" {
  name                   = "sampath/New Text Document.txt"
  storage_account_name   = azurerm_storage_account.sampath-storage-accounts["sampathdev012"].name
  storage_container_name = azurerm_storage_container.sampath-storage-container["sampathdev012-container"].name
  type                   = "Block"
  source                 = "New Text Document.txt"
}

