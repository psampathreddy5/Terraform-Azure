# creation of storage accounts one for logs and another for custom scripts
# using count feature to create 2 storage accounts
/*
resource "azurerm_storage_account" "sampath-storage-accounts" {
  for_each                  = var.storage-accounts
  name                      = "sampath123${lower(var.Environment)}${each.key}"
  location                  = data.azurerm_resource_group.sam-rg.location
  resource_group_name       = data.azurerm_resource_group.sam-rg.name
  account_tier              = each.value["account_tier"]
  account_kind              = each.value["account_kind"]
  account_replication_type  = each.value["account_replication_type"]
  access_tier               = each.value["access_tier"]
  shared_access_key_enabled = each.value["shared_access_key_enabled"]
  min_tls_version           = each.value["min_tls_version"]
  tags                      = local.tags
}



# creation of container in storage account
resource "azurerm_storage_container" "sampath-container" {
  for_each = {
    storage_account = "azurerm_storage_account.sampath-storage-accounts[each.key]"
    container       = var.storage-containers
  }
  name                  = "${each.value.name}-sampath"
  storage_account_name  = lookup(each.value.storage_account, each.key).name
  container_access_type = each.value["container_access_type"]
  depends_on = [
    azurerm_storage_account.sampath-storage-accounts
  ]
}

#creation of blob in container
resource "azurerm_storage_blob" "sampath_blob" {
  name                   = "sampath/Sampath reddy.jpg"
  storage_account_name   = azurerm_storage_account.sampath-storage-accounts["sampath"].name
  storage_container_name = azurerm_storage_container.sampath-container["sampath01"].name
  type                   = "Block"
  source                 = "Sampath reddy.jpg"
  depends_on = [
    azurerm_storage_container.sampath-container
  ]
}
*/


resource "azurerm_storage_account" "example" {
  for_each = { for name in var.storage_account_names : name => name }

  name                     = each.value
  resource_group_name      = data.azurerm_resource_group.sam-rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "example" {
  for_each = { for idx, name in var.container_names : name => {
    storage_account_name  = azurerm_storage_account.example[var.storage_account_names[idx]].name
    container_access_type = var.container_access_types[name]
  } }

  name                  = each.key
  storage_account_name  = each.value.storage_account_name
  container_access_type = each.value.container_access_type
}

resource "azurerm_storage_blob" "example" {
  for_each = { for name in var.storage_account_names : name => name }

  name                   = "example-blob"
  storage_account_name   = azurerm_storage_account.example[each.value].name
  storage_container_name = azurerm_storage_container.example["blob-container"].name

  type   = "Block"
  source = var.blob_source
}
