# data about the resource group which was already exeisted in azure portal
resource_group_name = "sampath-rg"

# name of ddos_protection_plan
ddos_protection_plan_name = "sampathddosplan"

# required tags to filter the resources
tags = {
    location    = "eastus"
    environment = "dev"
    departnment = "testing"
}

# name of network-security-group with location as suffuix to it.
network-security-group-name = "sampath-nsg"

# virtual_network_name location as suffuix to it.
virtual_network_name = "sampath-vnet"

# Ip Address of network
virtual_network_address_space = ["10.0.0.0/16"]

# name of subnet01
sunet01_name = "subnet-a"

# subnet01 address prefix
subnet01_address-prefix = ["10.0.1.0/24"]



# public_ip_name
public_ip_name = "sampathpip"

# network_interface_name
network_interface_name = "sampathnic"

# name of proximity_placement_group_name
proximity_placement_group_name = "sampathppg"

# storage_account name
storage_account_name = "patlolla3918"

# storage_container_name
storage_container_name = "saampth"

# windows_virtual_machine_name
windows_virtual_machine_name = "sampath-vm01"

# vm size
vmsize = "Standard_B1s"

# admin user name for windows machine
admin_username = "sampathreddy"

# admin passward fro windows machine
admin_password = "Sai@123456789"

# custom-extension_name
custom-extension_name = "iiswebserver"
