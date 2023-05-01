/*
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

variable "storage-accounts" {
  type        = map(any)
  description = "storage account name"
}

variable "storage-containers" {
  type        = map(any)
  description = "container"

}
*/


variable "storage_account_names" {
  type    = list(string)
  default = ["storage123account1", "storage123account2"]
}

variable "resource_group_name" {
  type    = string
  default = "abp-rg-env_dev"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "container_names" {
  type    = list(string)
  default = ["private-container", "blob-container"]
}

variable "container_access_types" {
  type = map(string)
  default = {
    "private-container" = "private"
    "blob-container"    = "blob"
  }
}

variable "blob_source" {
  type    = string
  default = "https://example.com/examplefile.txt"
}
