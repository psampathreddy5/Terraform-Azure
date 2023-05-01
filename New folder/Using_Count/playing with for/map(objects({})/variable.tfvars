# name of esource group whivh was exeisted already in resource group
resource_group_name = "sam-rg-env-dev"

# name of location
location = "eastus"

# creation of resources to which environment 
Environment = "Development"

# creation of resources to which Project
Project = "ABP-01"


# Storage-account-config
Storage-account-config = {
    "sampath" = {
        account_tier              = "Standard"
        account_kind              = "StorageV2"
        account_replication_type  = "LRS"
        access_tier               = "Hot"
        shared_access_key_enabled = true
        min_tls_version           = "TLS1_2"
    }
    "sandeep" = {
        account_tier              = "Premium"
        account_kind              = "StorageV2"
        account_replication_type  = "GRS"
        access_tier               = "Cool"
        shared_access_key_enabled = false
        min_tls_version           = "TLS1_2"
    }
    "sai" = {
        account_tier              = "Standard"
        account_kind              = "StorageV2"
        account_replication_type  = "ZRS"
        access_tier               = "Cool"
        shared_access_key_enabled = true
        min_tls_version           = "TLS1_2"
    }
}


