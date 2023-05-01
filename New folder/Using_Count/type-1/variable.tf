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

variable "repeat" {
  type        = number
  description = "no of iterations"
}

variable "storage_account-name" {
  type        = string
  description = "storage_account-name"
}
