output "ddos_protection_plan_name" {
  value = azurerm_network_ddos_protection_plan.abp_ddos-plans.name
}

output "ddos_protection_plan_id" {
  value = azurerm_network_ddos_protection_plan.abp_ddos-plans.id
}

output "virtual_network_name" {
  value = azurerm_virtual_network.abp_virtual-network.name
}

output "virtual_network_ipaddress" {
  value = azurerm_virtual_network.abp_virtual-network.address_space
}

output "azurerm_virtual_network" {
  value = azurerm_virtual_network.abp_virtual-network.id
}

output "subnet_names" {
  value = [for s in azurerm_virtual_network.abp_virtual-network.subnet : s.name]
}

output "subnet_address_prefixes" {
  value = [for s in azurerm_virtual_network.abp_virtual-network.subnet : s.address_prefix]
}
