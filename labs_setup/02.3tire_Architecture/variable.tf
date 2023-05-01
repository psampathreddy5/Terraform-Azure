variable "resource_group_name" {
  type        = string
  description = "name of esource group whivh was exeisted already in resource group"
}

variable "location" {
  type        = string
  description = "location"

}

variable "Environment" {
  type        = string
  description = "creation of resources to which environment"
}
variable "Project" {
  type        = string
  description = "reation of resources to which Project"
}

variable "storage_config" {
  type = map(object({
    account_tier              = string
    account_kind              = string
    account_replication_type  = string
    access_tier               = string
    shared_access_key_enabled = bool
    min_tls_version           = string
  }))
}

variable "containers_config" {
  type = map(object({
    container_access_type = string
  }))
  description = "list of containers"
}

variable "blob_name" {
  type        = string
  description = "list of blobs"

}

variable "virtualnetwork_name" {
  type        = string
  description = "virtualnetwork_name"
}

variable "network_address_space" {
  type        = list(string)
  description = "network_address_space"
}

variable "subnet-config" {
  type        = map(any)
  description = "subnet-config"
}

variable "nsg_config" {
  type        = map(any)
  description = "nsg_config"
}

variable "security_rules" {
  type        = map(any)
  description = "security_rules"
}

variable "public_ip_config" {
  type        = map(any)
  description = "public_ip_config"
}

variable "nic-config" {
  type        = map(any)
  description = "network_interface"
}

variable "virtual_machine-config" {
  type        = map(any)
  description = "virtual_machine-config"
}
