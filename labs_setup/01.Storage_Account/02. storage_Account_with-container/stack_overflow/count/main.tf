
#Define locals which is the product of storage accounts list  and containers list number.

locals {
  flat_list = setproduct(range(length(var.Storage_list)), var.containers_list)
}
/*
locals {
  flat_list1 = setproduct(range(length(local.flat_list)), var.blob_list)
}
*/

resource "azurerm_resource_group" "sam-rg" {
  name     = "sampath-rg"
  location = "eastus"
}

resource "azurerm_storage_account" "storage_account" {
  count                    = length(var.Storage_list)
  name                     = var.Storage_list[count.index]
  resource_group_name      = azurerm_resource_group.sam-rg.name
  location                 = azurerm_resource_group.sam-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


#Create containers according to container list for each of the storage account
resource "azurerm_storage_container" "container" {
  count                 = length(local.flat_list)
  name                  = local.flat_list[count.index][1].name
  container_access_type = local.flat_list[count.index][1].access_type
  storage_account_name  = azurerm_storage_account.storage_account[local.flat_list[count.index][0]].name
}


# create blob according to container list for each of the storage account
resource "azurerm_storage_blob" "sam-blob" {
  count                  = length(var.blob_list)
  name                   = var.blob_list[count.index].name
  storage_account_name   = azurerm_storage_account.storage_account[local.flat_list[count.index][0]].name
  storage_container_name = azurerm_storage_container.container[local.flat_list[count.index][0]].name
  type                   = var.blob_list[count.index].type
  source                 = "New-Text-Document.txt"
}


/*
# Create blobs for each container
resource "azurerm_storage_blob" "blob" {
  count                  = length(local.flat_list) * 3
  name                   = "blob${count.index % 3 + 1}"
  type                   = "Block"
  source                 = "stack_overflow"
  storage_account_name   = azurerm_storage_account.storage_account[local.flat_list[count.index / 3][0]].name
  storage_container_name = azurerm_storage_container.container[local.flat_list[count.index / 3][0] * length(var.containers_list) + local.flat_list[count.index / 3][1]].name
}
*/
