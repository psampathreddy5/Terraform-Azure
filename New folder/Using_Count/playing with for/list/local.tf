locals {
  tags = {
    "Environment" = var.Environment
    "Project"     = var.Project
    "Team"        = "Compliance"
    "Location"    = var.location
  }
}

locals {
  Storage-account-config = [for i, value in var.Storage-account-config : format("%d%v", i, value)]
}

/*

this is for LIST

[for key in var.Storage-account-config : key]
    Outputs:
    + Storage-account-config = [
        + "sampath012345",
        + "sandeep012345",
        + "sai012345",
    ]
[for value in var.Storage-account-config : value]
    Outputs:
    + Storage-account-config = [
        + "sampath012345",
        + "sandeep012345",
        + "sai012345",
    ]

[for i, key in var.Storage-account-config : format("%d%s", i, key)]
    Outputs:
    Storage-account-config = [
        + "0sampath012345",
        + "1sandeep012345",
        + "2sai012345",
    ]
    =>  The resulting formatted_string will be "0sampath012345", with the index and key.
    =>  In the example I provided earlier, format("%d %s", i, key) is used to create a formatted stringthat includes the index i and the 
        storage account name key with a space in between. The %d formatting code is used for the index, which is a decimal number, and 
        the %s formatting code is used for the storage account name, which is a string.
    =>  I only used %s and %d in this example because those are the two types of values we need to include in the formatted string. 
        There are other formatting codes available in Terraform that you can use for other types of values, such as {"%f for floating-point 
        numbers, %t for booleans, and %v for any value."}
[for i, value in var.Storage-account-config : format("%d%v", i, value)]
    Outputs:
    Storage-account-config = [
        + "0sampath012345",
        + "1sandeep012345",
        + "2sai012345",

*/
