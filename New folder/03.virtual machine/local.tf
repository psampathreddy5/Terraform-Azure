# Lcoal variables ( combination of strings and local values . concats)
locals {
  network-security-group-name = "${var.network-security-group-name}-${data.azurerm_resource_group.abp_resource-group.location}"
  virtual_network_name        = "${var.virtual_network_name}-${data.azurerm_resource_group.abp_resource-group.location}"
  location                    = data.azurerm_resource_group.abp_resource-group.location
  resource_group_name         = var.resource_group_name
  storage_account_name        = "${var.storage_account_name}${data.azurerm_resource_group.abp_resource-group.location}"
  storage_container_name      = "${azurerm_storage_account.abp_storageaccount.name}-${var.storage_container_name}"
}
