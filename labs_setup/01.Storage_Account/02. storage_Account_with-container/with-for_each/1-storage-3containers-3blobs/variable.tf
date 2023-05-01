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

variable "storage_account-name" {
  type        = string
  description = "storage_account-name"
}

variable "containers_list" {
  type        = list(any)
  description = "list of containers"

}

variable "blob_list" {
  type        = list(any)
  description = "list of blobs"

}
