locals {
  tags = {
    "Environment" = var.Environment
    "Project"     = var.Project
    "Team"        = "Compliance"
    "Location"    = var.location
  }
}



locals {
  Storage-account-config = {
    for keys, values in var.Storage-account-config : keys => values
  }
}


/* add project name as preffix to all the resources,
but some resources wont support the special characters so we need to remove that character and use only integers and strings. */

locals {
  modified_string = replace("ABP-01", "-", "")
}
