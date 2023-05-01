locals {
  tags = {
    "Environment" = "var.Environment"
    "Project"     = "var.Project"
    "Team"        = "Compliance"
    "Location"    = "data.azurerm_resource_group.sam-rg.location"
  }
}

locals {
  storage_account-configuration = [for key, value in var.storage_account-configuration : "${key.value}"]
}

