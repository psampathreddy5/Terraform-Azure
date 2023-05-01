# data about the resource group which was already exeisted in azure portal
data "azurerm_resource_group" "abp_resource-group" {
  name = local.resource_group_name
}
