resource "azurerm_resource_group" "sam_rg" {
  name     = "sampath-rg-group"
  location = "eastus"
}


# Create 3 storage accounts
resource "azurerm_storage_account" "storage_accounts" {
  count                    = 3
  name                     = "sampathstorage${count.index + 1}"
  resource_group_name      = "my-resource-group"
  location                 = "eastus2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [
    azurerm_resource_group.sam_rg
  ]

}

# Create 3 containers in each storage account
resource "azurerm_storage_container" "containers" {
  count                = 9
  name                 = "container-${count.index + 1}"
  storage_account_name = azurerm_storage_account.storage_accounts[count.index / 3].name
  depends_on = [
    azurerm_storage_account.storage_accounts
  ]
}

# Create 3 blobs in each container
resource "azurerm_storage_blob" "blobs" {
  count                  = 27
  name                   = "sampath/sampath.txt-${count.index + 1}"
  type                   = "Block"
  source                 = "sampath.txt"
  storage_container_name = azurerm_storage_container.containers[count.index / 3].name
  storage_account_name   = azurerm_storage_account.storage_accounts[count.index / 9].name
  depends_on = [
    azurerm_resource_group.sam_rg,
    azurerm_storage_account.storage_accounts,
    azurerm_storage_container.containers
  ]
}
