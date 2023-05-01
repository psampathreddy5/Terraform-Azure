# data files
data "archive_file" "compressed_folder" {
  type        = "zip"
  source_dir  = "${path.module}/Compressed"
  output_path = "${path.module}/College-Management-System-Project-in-ASP.net-Source-Code.zip"
}


# creation of  resource group 
resource "azurerm_resource_group" "abp_resource_group" {
  name     = "sampath-rg"
  location = "eastus"
  tags = {
    location    = "eastus"
    environmnet = "dev"
  }
}
# Creation of storage account 
resource "azurerm_storage_account" "abp_storage_account" {
  name                      = "sampath918eastus"
  location                  = azurerm_resource_group.abp_resource_group.location
  resource_group_name       = azurerm_resource_group.abp_resource_group.name
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  shared_access_key_enabled = "true"
  min_tls_version           = "TLS1_2"
  tags = {
    location    = "eastus"
    environmnet = "dev"
  }
  depends_on = [
    azurerm_resource_group.abp_resource_group
  ]
}
# creation of container in storage account
resource "azurerm_storage_container" "abp_container" {
  name                  = "${azurerm_storage_account.abp_storage_account.name}-sampath"
  storage_account_name  = azurerm_storage_account.abp_storage_account.name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.abp_storage_account
  ]
}
# creation of blob in container
resource "azurerm_storage_blob" "abp_blob" {
  name                   = "sampath/College-Management-System-Project-in-ASP.net-Source-Code.zip"
  storage_account_name   = azurerm_storage_account.abp_storage_account.name
  storage_container_name = azurerm_storage_container.abp_container.name
  type                   = "Block"
  source                 = data.archive_file.compressed_folder.output_path
  depends_on = [
    azurerm_storage_container.abp_container
  ]
}
