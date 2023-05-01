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
  type        = set(string)
  description = "storage account name"
}


/*variable "storage-container" {
  type        = set(string)
  description = "storage-container"

}*/
