# creation of storage accounts one for logs and another for custom scripts
# creation of resource group
resource "azurerm_resource_group" "sam-rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}


# using count feature to create 2 storage accounts
resource "azurerm_storage_account" "sampath-storage-accounts" {
  for_each                  = var.storage_config
  name                      = "${each.key}${lower(var.Environment)}${lower(local.preffix)}"
  location                  = azurerm_resource_group.sam-rg.location
  resource_group_name       = azurerm_resource_group.sam-rg.name
  account_tier              = each.value["account_tier"]
  account_kind              = each.value["account_kind"]
  account_replication_type  = each.value["account_replication_type"]
  access_tier               = each.value["access_tier"]
  shared_access_key_enabled = each.value["shared_access_key_enabled"]
  min_tls_version           = each.value["min_tls_version"]
  tags                      = local.tags
  depends_on = [
    azurerm_resource_group.sam-rg
  ]
}


#Create container for each value of storage account according to the requirement.
resource "azurerm_storage_container" "sampath-storage-container" {
  for_each              = var.containers_config
  name                  = each.key
  container_access_type = each.value["container_access_type"]
  storage_account_name  = azurerm_storage_account.sampath-storage-accounts["sampath"].name
  depends_on = [
    azurerm_storage_account.sampath-storage-accounts
  ]
}


# create 3 blobs in each container 
resource "azurerm_storage_blob" "sampath-storage-blob" {
  name                   = "sampath/${var.blob_name}"
  storage_account_name   = azurerm_storage_account.sampath-storage-accounts["sampath"].name
  storage_container_name = azurerm_storage_container.sampath-storage-container["sampath-container1"].name
  type                   = "Block"
  source                 = "New-Text-Document.txt"
  depends_on = [
    azurerm_storage_account.sampath-storage-accounts,
    azurerm_storage_container.sampath-storage-container
  ]
}


# virtal network
resource "azurerm_virtual_network" "sam-vnet" {
  name                = "${var.virtualnetwork_name}-${lower(var.Environment)}-${lower(local.preffix)}"
  location            = azurerm_resource_group.sam-rg.location
  resource_group_name = azurerm_resource_group.sam-rg.name
  address_space       = var.network_address_space
  tags                = local.tags
  depends_on = [
    azurerm_resource_group.sam-rg
  ]
}

# 3 subnets creation with rules 
resource "azurerm_subnet" "sam-subnet" {
  for_each             = var.subnet-config
  name                 = each.key
  resource_group_name  = azurerm_resource_group.sam-rg.name
  virtual_network_name = azurerm_virtual_network.sam-vnet.name
  address_prefixes     = each.value["address_prefixes"]
  depends_on = [
    azurerm_resource_group.sam-rg,
    azurerm_virtual_network.sam-vnet
  ]
}

# 3 network security groups 
resource "azurerm_network_security_group" "sam-nsg" {
  for_each            = var.nsg_config
  name                = "${each.key}-${lower(local.preffix)}"
  location            = azurerm_resource_group.sam-rg.location
  resource_group_name = azurerm_resource_group.sam-rg.name
  tags                = local.tags
}

# network_security_group_association
resource "azurerm_subnet_network_security_group_association" "sam-nsg_association" {
  for_each                  = var.nsg_config
  subnet_id                 = azurerm_subnet.sam-subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.sam-nsg[each.key].id
}

# security_rules
resource "azurerm_network_security_rule" "sam-security_rules" {
  for_each                    = var.security_rules
  name                        = each.key
  description                 = each.value["description"]
  priority                    = each.value["priority"]
  direction                   = each.value["direction"]
  access                      = each.value["access"]
  protocol                    = each.value["protocol"]
  source_port_range           = each.value["source_port_range"]
  destination_port_range      = each.value["destination_port_range"]
  destination_address_prefix  = each.value["destination_address_prefix"]
  source_address_prefix       = each.value["source_address_prefix"]
  resource_group_name         = azurerm_resource_group.sam-rg.name
  network_security_group_name = azurerm_network_security_group.sam-nsg[each.value["network_security_group_name"]].name
}

# creaion of 2 public ip adress
resource "azurerm_public_ip" "sam_public-ip" {
  for_each            = var.public_ip_config
  name                = "${each.key}-pip"
  location            = azurerm_resource_group.sam-rg.location
  resource_group_name = azurerm_resource_group.sam-rg.name
  allocation_method   = "Dynamic"
  tags                = local.tags
}


# network_interface
resource "azurerm_network_interface" "sam_nics" {
  for_each            = var.nic-config
  name                = "${each.key}-nic"
  location            = azurerm_resource_group.sam-rg.location
  resource_group_name = azurerm_resource_group.sam-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sam-subnet[each.value["subnet_id"]].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.sam_public-ip[each.value["public_ip_address_id"]].id
  }
  tags = local.tags
}

# linux_virtual_machine
resource "azurerm_linux_virtual_machine" "sam_machine" {
  for_each            = var.virtual_machine-config
  name                = "${each.key}-vm"
  resource_group_name = azurerm_resource_group.sam-rg.name
  location            = azurerm_resource_group.sam-rg.location
  size                = each.value["size"]
  admin_username      = each.value["admin_username"]
  network_interface_ids = [
    azurerm_network_interface.sam_nics["web"].id,
    azurerm_network_interface.sam_nics["database"].id,
    azurerm_network_interface.sam_nics["management"].id
  ]

  admin_ssh_key {
    username   = each.value["admin_ssh_key_name"]
    public_key = file("~/.ssh/sai123.pub")
  }

  os_disk {
    caching              = each.value["caching"]
    storage_account_type = each.value["storage_account_type"]
  }

  source_image_reference {
    publisher = each.value["publisher"]
    offer     = each.value["offer"]
    sku       = each.value["sku"]
    version   = each.value["version"]
  }
  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.sampath-storage-accounts["sandeep"].primary_blob_endpoint
  }
}
