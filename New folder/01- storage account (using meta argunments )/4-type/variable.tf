variable "resource_group_name" {
  type        = string
  description = "name of esource group whivh was exeisted already in resource group"
}

variable "Environment" {
  type        = string
  description = "creation of resources to which environment"
}
variable "Project" {
  type        = string
  description = "reation of resources to which Project"
}


variable "storage-accounts-details" {
  type = map(object({
    account_tier              = string
    account_kind              = string
    account_replication_type  = string
    access_tier               = string
    shared_access_key_enabled = string
    min_tls_version           = string
  }))
}

variable "storage-container-details" {
  type = map(object({
    container_access_type = string
    storage_account_name  = string
  }))
}
