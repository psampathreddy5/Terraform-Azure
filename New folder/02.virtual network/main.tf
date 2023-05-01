# information about resource group which was alreday exeisted in azure portal.
data "azurerm_resource_group" "abp_rg" {
  name = var.resource_group_name
}

# Creation of DDoS protection plans
resource "azurerm_network_ddos_protection_plan" "abp_ddos-plans" {
  name                = var.ddos_protection_plan_name
  location            = data.azurerm_resource_group.abp_rg.location
  resource_group_name = var.resource_group_name
  depends_on = [
    data.azurerm_resource_group.abp_rg
  ]
}

# Creation of azure virtual network 
resource "azurerm_virtual_network" "abp_virtual-network" {
  name                = var.virtual_network_name
  location            = data.azurerm_resource_group.abp_rg.location
  resource_group_name = var.resource_group_name
  address_space       = var.virtual_network_ipaddress
  ddos_protection_plan {
    enable = true
    id     = azurerm_network_ddos_protection_plan.abp_ddos-plans.id
  }
  subnet {
    name           = var.subnet_01name
    address_prefix = var.subnet_01_ipaddress
  }
  subnet {
    name           = var.subnet_02name
    address_prefix = var.subnet_02_ipaddress
  }
  tags = var.tags
}
