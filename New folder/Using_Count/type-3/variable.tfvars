# name of esource group whivh was exeisted already in resource group
resource_group_name = "abp-rg-env_dev"

# creation of resources to which environment 
Environment = "Development"

# creation of resources to which Project
Project = "ABP-01"

# storage_account-configuration
storage_account-configuration = {
    sampathdevelopment0123 = {
        account_tier              = "Standard"
        account_kind              = "StorageV2"
        account_replication_type  = "LRS"
        access_tier               = "Hot"
        shared_access_key_enabled = true
        min_tls_version           = "TLS1_2"
    }
    sandeepdevelopment0123 = {
        account_tier              = "Premium"
        account_kind              = "StorageV2"
        account_replication_type  = "ZRS"
        access_tier               = "Cool"
        shared_access_key_enabled = true
        min_tls_version           = "TLS1_2"
    }
}