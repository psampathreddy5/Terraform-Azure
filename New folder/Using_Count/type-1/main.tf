# creation of storage accounts one for logs and another for custom scripts
# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  count                     = var.repeat
  name                      = "${var.storage_account-name}${lower(var.Environment)}${count.index}"
  location                  = data.azurerm_resource_group.sam-rg.location
  resource_group_name       = data.azurerm_resource_group.sam-rg.name
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  shared_access_key_enabled = "true"
  min_tls_version           = "TLS1_2"
  tags                      = local.tags
}
