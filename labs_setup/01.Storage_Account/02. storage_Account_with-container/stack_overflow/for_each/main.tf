#Create locals to setproduct for double loop

locals {
  flat_list = setproduct(var.Storage_list, var.containers_list)
}

# create resource group

resource "azurerm_resource_group" "sampath-rg" {
  name     = "sampath-rg"
  location = "eastus"
}

#Create storage account with each name listed in variable

resource "azurerm_storage_account" "storage_account" {
  for_each                 = toset(var.Storage_list)
  name                     = each.value
  resource_group_name      = azurerm_resource_group.sampath-rg.name
  location                 = azurerm_resource_group.sampath-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [
    azurerm_resource_group.sampath-rg
  ]
}


#Create container for each value of storage account according to the requirement.

resource "azurerm_storage_container" "container" {
  for_each              = { for idx, val in local.flat_list : idx => val }
  name                  = each.value[1].name
  container_access_type = each.value[1].access_type
  storage_account_name  = azurerm_storage_account.storage_account[each.value[0]].name
  depends_on = [
    azurerm_storage_account.storage_account
  ]
}
