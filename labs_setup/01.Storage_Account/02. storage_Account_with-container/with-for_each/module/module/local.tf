locals {
  tags = {
    "Environment" = var.Environment
    "Project"     = var.Project
    "Team"        = "Compliance"
    "Location"    = var.location
  }
}

locals {
  preffix = replace("${var.Project}", "-", "")
}


locals {
  flat_list = setproduct(var.containers_list, var.blob_list)
}
