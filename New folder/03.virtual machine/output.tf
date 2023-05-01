output "storage_account_name" {
  value = azurerm_storage_account.abp_storageaccount.name
}

output "storage_container_name" {
  value = azurerm_storage_container.abp_container.name
}

output "storage_blob_id" {
  value = azurerm_storage_blob.abp_blob.id
}

output "ddos_protection_plan_name" {
  value = azurerm_network_ddos_protection_plan.abp_ddos-plan.name
}

output "ddos_protection_plan_id" {
  value = azurerm_network_ddos_protection_plan.abp_ddos-plan.id
}

output "virtual_network_name" {
  value = azurerm_virtual_network.abp_virtual-network.name
}

output "virtual_network_ipaddress" {
  value = azurerm_virtual_network.abp_virtual-network.address_space
}

output "network_security_group_security-rule" {
  value = azurerm_network_security_group.abp_network-security-group.security_rule
}

output "azurerm_subnet-subnet01" {
  value = azurerm_subnet.sunet01.address_prefixes
}



output "windows_virtual_machine_name" {
  value = azurerm_windows_virtual_machine.abp_virtual-machine.computer_name
}

output "virtual_machine_extension" {
  value = azurerm_virtual_machine_extension.abp_custom-extension.name
}
