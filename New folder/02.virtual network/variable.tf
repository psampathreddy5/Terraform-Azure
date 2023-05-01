variable "resource_group_name" {
  type        = string
  description = "name of resource group which was already existed in azureportal"
}

variable "virtual_network_name" {
  description = "name of the virtual network"
  type        = string
}

variable "ddos_protection_plan_name" {
  description = "name of DDoS protection plan"
  type        = string
}

variable "virtual_network_ipaddress" {
  description = "specify the ipv4 ip address"
  type        = list(string)
}

variable "subnet_01name" {
  description = "name of the subnet_01"
  type        = string
}
variable "subnet_01_ipaddress" {
  description = "specify the subnet_01 ip address"
  type        = string

}

variable "subnet_02name" {
  description = "name of the subnet_01"
  type        = string
}
variable "subnet_02_ipaddress" {
  description = "specify the subnet_01 ip address"
  type        = string

}

variable "tags" {
  description = "assign tags based up on your filters"
  type        = map(string)
}
