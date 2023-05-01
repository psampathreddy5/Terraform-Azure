variable "resource_group_name" {
  type        = string
  description = "name of esource group whivh was exeisted already in resource group"
}

variable "location" {
  type = string
}

variable "Environment" {
  type        = string
  description = "creation of resources to which environment"
}
variable "Project" {
  type        = string
  description = "reation of resources to which Project"
}

variable "storage-account_config" {
  type = map(object({
    account_tier              = string
    account_kind              = string
    account_replication_type  = string
    access_tier               = string
    shared_access_key_enabled = bool
    min_tls_version           = string
  }))
  description = "storage-account_config"
}


variable "storage_container-config" {
  type = map(object({
    container_access_type = string
  }))
  description = "storage_container-config"
}

