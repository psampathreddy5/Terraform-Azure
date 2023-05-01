# creation of storage accounts one for logs and another for custom scripts
# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  count                     = 2
  name                      = "sampath${lower(var.Environment)}${count.index}"
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

resource "azurerm_storage_container" "sampath-storage-container" {
  count                 = 2
  name                  = "sampath-${lower(var.Environment)}${count.index}"
  storage_account_name  = azurerm_storage_account.sampath-storage-accounts[count.index].name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.sampath-storage-accounts
  ]
}
