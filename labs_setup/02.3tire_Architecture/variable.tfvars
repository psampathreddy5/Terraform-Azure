# name of esource group whivh was exeisted already in resource group
resource_group_name = "sam-rg-env-dev"

# name of location
location = "eastus"

# creation of resources to which environment 
Environment = "Development"

# creation of resources to which Project
Project = "ABP-01"

storage_config = {
  sampath = {
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    account_replication_type  = "LRS"
    access_tier               = "Hot"
    shared_access_key_enabled = "true"
    min_tls_version           = "TLS1_2"
  }
  sandeep = {
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    account_replication_type  = "LRS"
    access_tier               = "Hot"
    shared_access_key_enabled = "true"
    min_tls_version           = "TLS1_2"
  }
}


# containers_list
containers_config = {
  sampath-container1 = {
    container_access_type = "private"
  }
  sandeep-container2 = {
    container_access_type = "private"
  }
}

#list of blobs
blob_name = "New-Text-Document.txt"


# virtualnetwork_name
virtualnetwork_name = "sampath"

#network_address_space
network_address_space = ["10.0.0.0/16"]

# subnet-config
subnet-config = {
  web = {
    address_prefixes = ["10.0.1.0/24"]
  }
  database = {
    address_prefixes = ["10.0.2.0/24"]
  }
  management = {
    address_prefixes = ["10.0.3.0/24"]
  }
}

# nsg_config
nsg_config = {
  web        = {}
  database   = {}
  management = {}
}


# security_rules
security_rules = {
  RDP_allow_web = {
    description                 = "allow rdp-3389 port connnection to connect to windows machines"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "3389"
    destination_address_prefix  = "*"
    source_address_prefix       = "*"
    network_security_group_name = "web"
  }
  ssh_allow_web = {
    description                 = "allow ssh-22 port connnection to connect to linux machines"
    priority                    = 101
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    destination_address_prefix  = "*"
    source_address_prefix       = "*"
    network_security_group_name = "web"
  }
  RDP_allow_management = {
    description                 = "allow rdp-3389 port connnection to connect to windows machines"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "3389"
    destination_address_prefix  = "*"
    source_address_prefix       = "*"
    network_security_group_name = "management"
  }
  ssh_allow_management = {
    description                 = "allow ssh-22 port connnection to connect to linux machines"
    priority                    = 101
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    destination_address_prefix  = "*"
    source_address_prefix       = "*"
    network_security_group_name = "management"
  }
  RDP_allow_database = {
    description                 = "allow rdp-3389 port connnection to connect to windows machines"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "3389"
    destination_address_prefix  = "*"
    source_address_prefix       = "*"
    network_security_group_name = "database"
  }
  ssh_allow_database = {
    description                 = "allow ssh-22 port connnection to connect to linux machines"
    priority                    = 101
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    destination_address_prefix  = "*"
    source_address_prefix       = "*"
    network_security_group_name = "database"
  }
}

# public_ip_config
public_ip_config = {
  web        = {}
  database   = {}
  management = {}
}

# nic-config
nic-config = {
  web = {
    subnet_id            = "web"
    public_ip_address_id = "web"
  }
  database = {
    subnet_id            = "database"
    public_ip_address_id = "database"
  }
  management = {
    subnet_id            = "management"
    public_ip_address_id = "management"
  }
}

# virtual_machine-config
virtual_machine-config = {
  web = {
    size                 = "Standard_F2"
    admin_username       = "samapth918"    
    admin_ssh_key_name   = "sampathpub"    
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "UbuntuServer"
    sku                  = "16.04-LTS"
    version              = "latest"
  }
  database = {
    size                 = "Standard_F2"
    admin_username       = "samapth918"    
    admin_ssh_key_name   = "sampathpub"    
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "UbuntuServer"
    sku                  = "16.04-LTS"
    version              = "latest"
  }
  management = {
    size                 = "Standard_F2"
    admin_username       = "samapth918"    
    admin_ssh_key_name   = "sampathpub"    
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "UbuntuServer"
    sku                  = "16.04-LTS"
    version              = "latest"
  }
}
