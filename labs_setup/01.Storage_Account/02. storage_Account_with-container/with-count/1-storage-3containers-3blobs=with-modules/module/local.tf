locals {
  tags = {
    "Environment" = var.Environment
    "Project"     = var.Project
    "Team"        = "Compliance"
    "Location"    = "eastus"
  }
}

locals {
  preffix = replace("ABP-01", "-", "")
}

locals {
  flat_list = setproduct(range(length(var.containers_list)), var.blob_list)
}

