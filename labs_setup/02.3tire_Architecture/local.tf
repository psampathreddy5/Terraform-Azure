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
  define_storage_account_name = [for keys, values in var.storage_config : keys]
}

locals {
  storage_config_keys = keys(var.storage_config)
}


