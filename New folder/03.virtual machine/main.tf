# This file concerns the creation of the virtual Windows virtual machine with the infrastructure necessary to create this machine.

# creation of storage account
resource "azurerm_storage_account" "abp_storageaccount" {
  name                      = local.storage_account_name
  location                  = local.location
  resource_group_name       = local.resource_group_name
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  shared_access_key_enabled = "true"
  min_tls_version           = "TLS1_2"
  depends_on = [
    data.azurerm_resource_group.abp_resource-group
  ]
  tags = var.tags
}

# creation of container in storage account
resource "azurerm_storage_container" "abp_container" {
  name                  = local.storage_container_name
  storage_account_name  = azurerm_storage_account.abp_storageaccount.name
  container_access_type = "blob"
  depends_on = [
    azurerm_storage_account.abp_storageaccount
  ]
}

# creation of blob in container
resource "azurerm_storage_blob" "abp_blob" {
  name                   = "sampath/iisconfig.ps1"
  storage_account_name   = azurerm_storage_account.abp_storageaccount.name
  storage_container_name = azurerm_storage_container.abp_container.name
  type                   = "Block"
  source                 = "iisconfig.ps1"
  depends_on = [
    azurerm_storage_container.abp_container
  ]
}

# creation of ddos_protection_plan
resource "azurerm_network_ddos_protection_plan" "abp_ddos-plan" {
  name                = var.ddos_protection_plan_name
  location            = local.location
  resource_group_name = local.resource_group_name
  depends_on = [
    data.azurerm_resource_group.abp_resource-group
  ]
  tags = var.tags
}

# creation of network security group and rules
resource "azurerm_network_security_group" "abp_network-security-group" {
  name                = local.network-security-group-name
  location            = local.location
  resource_group_name = local.resource_group_name
  security_rule = [
    {
      name                                       = "RDP_allow"
      description                                = "allow rdp-3389 port connnection to connect to windows machines"
      priority                                   = 100
      direction                                  = "Inbound"
      access                                     = "Allow"
      protocol                                   = "Tcp"
      source_port_range                          = "*"
      destination_port_range                     = "3389"
      source_address_prefix                      = "*"
      destination_address_prefix                 = "*"
      destination_application_security_group_ids = []
      source_application_security_group_ids      = []
      source_port_ranges                         = []
      destination_port_ranges                    = []
      source_address_prefixes                    = []
      destination_address_prefixes               = []

    },
    {
      name                                       = "allow_ssh"
      description                                = "allow ssh-22 port connnection to connect to linux machines"
      priority                                   = 101
      direction                                  = "Inbound"
      access                                     = "Allow"
      protocol                                   = "Tcp"
      source_port_range                          = "*"
      destination_port_range                     = "22"
      source_address_prefix                      = "*"
      destination_address_prefix                 = "*"
      destination_application_security_group_ids = []
      source_application_security_group_ids      = []
      destination_application_security_group_ids = []
      source_application_security_group_ids      = []
      source_port_ranges                         = []
      destination_port_ranges                    = []
      source_address_prefixes                    = []
      destination_address_prefixes               = []

    }
  ]
  depends_on = [
    data.azurerm_resource_group.abp_resource-group
  ]
  tags = var.tags
}

# creation of virtual network with 2 subnets 
resource "azurerm_virtual_network" "abp_virtual-network" {
  name                = local.virtual_network_name
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = var.virtual_network_address_space
  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.abp_ddos-plan.id
    enable = true
  }
  depends_on = [
    azurerm_network_security_group.abp_network-security-group,
    data.azurerm_resource_group.abp_resource-group,
    azurerm_network_ddos_protection_plan.abp_ddos-plan
  ]
  tags = var.tags
}

# creation of subnets 
resource "azurerm_subnet" "sunet01" {
  address_prefixes     = var.subnet01_address-prefix
  name                 = var.sunet01_name
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.abp_virtual-network.name
  depends_on = [
    azurerm_network_security_group.abp_network-security-group,
    data.azurerm_resource_group.abp_resource-group,
    azurerm_virtual_network.abp_virtual-network
  ]
}


# creaion of public ip adress
resource "azurerm_public_ip" "abp_public-ip" {
  name                = var.public_ip_name
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = "Dynamic"
  depends_on = [
    data.azurerm_resource_group.abp_resource-group
  ]
  tags = var.tags
}

# creation of network interferance card 
resource "azurerm_network_interface" "sampath-nic" {
  name                = var.network_interface_name
  location            = local.location
  resource_group_name = local.resource_group_name

  ip_configuration {
    name                          = azurerm_subnet.sunet01.name
    subnet_id                     = azurerm_subnet.sunet01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.abp_public-ip.id
  }
  depends_on = [
    azurerm_virtual_network.abp_virtual-network
  ]
  tags = var.tags
}

# creation of Proximity placement group
resource "azurerm_proximity_placement_group" "abp_ppg" {
  name                = var.proximity_placement_group_name
  location            = local.location
  resource_group_name = local.resource_group_name
  depends_on = [
    data.azurerm_resource_group.abp_resource-group
  ]
  tags = var.tags
}

# creation of Avaliablity set with Proximity placement group
resource "azurerm_availability_set" "example" {
  name                         = "example-aset"
  location                     = local.location
  resource_group_name          = local.resource_group_name
  platform_fault_domain_count  = 3
  platform_update_domain_count = 5
  depends_on = [
    data.azurerm_resource_group.abp_resource-group
  ]
  tags = var.tags
}

# creation of windows virtual machine 
resource "azurerm_windows_virtual_machine" "abp_virtual-machine" {
  name                = var.windows_virtual_machine_name
  resource_group_name = local.resource_group_name
  location            = local.location
  size                = var.vmsize
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.sampath-nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
  depends_on = [
    data.azurerm_resource_group.abp_resource-group,
    azurerm_network_interface.sampath-nic
  ]
  tags = var.tags
}

# install custom script extention 
resource "azurerm_virtual_machine_extension" "abp_custom-extension" {
  name                 = "hostname"
  virtual_machine_id   = azurerm_windows_virtual_machine.abp_virtual-machine.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"
  depends_on = [
    azurerm_storage_account.abp_storageaccount,
    azurerm_storage_container.abp_container,
    azurerm_storage_blob.abp_blob
  ]
  settings = <<SETTINGS
    {        
        "fileUris": ["https://${azurerm_storage_account.abp_storageaccount.name}.blob.core.windows.net/${azurerm_storage_container.abp_container.name}/sampath/iisconfig.ps1"],
        "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -file iisconfig.ps1"        
    }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
      "storageAccountName" : "${azurerm_storage_account.abp_storageaccount.name}",
      "storageAccountKey" : "${azurerm_storage_account.abp_storageaccount.primary_access_key}"     
    }
  PROTECTED_SETTINGS

  tags = var.tags

}
