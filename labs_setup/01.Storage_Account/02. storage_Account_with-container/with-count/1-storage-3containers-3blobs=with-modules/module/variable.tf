
/*
variable "resource_group_name" {
  type        = string
  description = "name of esource group whivh was exeisted already in resource group"
  default     = "sam-rg-env-dev"
}

variable "location" {
  type        = string
  description = "location"
  default     = "eastus"

}
*/
variable "Environment" {
  type        = string
  description = "creation of resources to which environment"
  default     = "Development"
}
variable "Project" {
  type        = string
  description = "reation of resources to which Project"
  default     = "ABP-01"
}

variable "storage_account_name" {
  type        = string
  description = "storage_account_name"
}


variable "containers_list" {
  type        = list(any)
  description = "containers_list"
}

variable "blob_list" {
  type        = list(any)
  description = "blob_list"

}

