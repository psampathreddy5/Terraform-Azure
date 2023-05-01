# name of esource group whivh was exeisted already in resource group
resource_group_name = "abp-rg-env_dev"

# location
location = "eastus"

# creation of resources to which environment 
Environment = "Development"

# creation of resources to which Project
Project = "ABP-01"

# storage-account_config
storage-account_config = {
    sampath = {        
        account_tier              = "Standard"
        account_kind              = "StorageV2"
        account_replication_type  = "LRS"
        access_tier               = "Hot"
        shared_access_key_enabled = "true"
        min_tls_version           = "TLS1_2"
    }
    sandeep = {
        account_tier              = "Premium"
        account_kind              = "StorageV2"
        account_replication_type  = "GRS"
        access_tier               = "Cool"
        shared_access_key_enabled = false
        min_tls_version           = "TLS1_2"
    }
    aravind = {
        account_tier              = "Standard"
        account_kind              = "StorageV2"
        account_replication_type  = "ZRS"
        access_tier               = "Cool"
        shared_access_key_enabled = false
        min_tls_version           = "TLS1_2"
    }
}

storage_container-config = {
    container01 = {       
        container_access_type = "private"
    }
    container02 = {        
        container_access_type = "blob"
    }
    container03 = {        
        container_access_type = "private"
    }
}
