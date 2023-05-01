locals {
  tags = {
    "Environment" = "var.Environment"
    "Project"     = "var.Project"
    "Team"        = "Compliance"
    "Location"    = "data.azurerm_resource_group.sam-rg.location"
  }
}

locals {
  container = {
    container1 = {}
    container2 = {}
    container3 = {}
  }
}
