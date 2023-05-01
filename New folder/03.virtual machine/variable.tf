variable "resource_group_name" {
  description = "data about the resource group which was already exeisted in azure portal"
  type        = string
}

variable "ddos_protection_plan_name" {
  description = "name of ddos_protection_plan"
  type        = string
}

variable "tags" {
  description = "required tags to filter the resources"
  type        = map(string)
}

variable "network-security-group-name" {
  description = "name of network-security-group"
  type        = string
}

variable "virtual_network_name" {
  description = "name of virtual_network"
  type        = string

}

variable "virtual_network_address_space" {
  description = "address_space"
  type        = list(string)
}

variable "sunet01_name" {
  description = "name of subnet01"
  type        = string
}
variable "subnet01_address-prefix" {
  description = "address prefix"
  type        = list(string)
}



variable "public_ip_name" {
  description = "name of public_ip"
  type        = string
}

variable "network_interface_name" {
  description = "network_interface_name"
  type        = string
}

variable "proximity_placement_group_name" {
  description = "proximity_placement_group_name"
  type        = string
}

variable "storage_account_name" {
  description = "storage_account name"
  type        = string

}

variable "storage_container_name" {
  description = "storage_container_name"
  type        = string

}

variable "windows_virtual_machine_name" {
  description = "windows_virtual_machine_name"
  type        = string
}

variable "vmsize" {
  description = "vm size"
  type        = string

}

variable "admin_username" {
  description = "admin_username for windows machine"
  type        = string
}

variable "admin_password" {
  description = "admin_password for windows machine"
  type        = string
}

variable "custom-extension_name" {
  description = "custom-extension_name"
  type        = string
}
