# name of resource group which was already existed in azureportal
resource_group_name = "sampath-rg"

# name of the virtual network that you want to create 
virtual_network_name = "sampath-vnet"

# name of DDoS protection plans
ddos_protection_plan_name = "sampath-ddos"

# specify the ipv4 ip address
virtual_network_ipaddress = ["10.0.0.0/16"]

# specify the name of subnet_01
subnet_01name = "subnet-a"

# specify the subnet_01 ip address
subnet_01_ipaddress = "10.0.1.0/24"

# specify the name of subnet_02
subnet_02name = "subnet-b"

# specify the subnet_02 ip address
subnet_02_ipaddress = "10.0.2.0/24"

# assign tags based up on your filters
tags = {
  Environment   =   "prod"
  Department    =   "sales"
  location      =   "eastus"
}
