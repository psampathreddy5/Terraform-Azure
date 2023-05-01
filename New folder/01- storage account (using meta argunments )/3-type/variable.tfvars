/*
# name of esource group whivh was exeisted already in resource group
resource_group_name = "abp-rg-env_dev"

# creation of resources to which environment 
Environment = "DEV"

# creation of resources to which Project
Project = "ABP-01"

# storage account count
storage-accounts = {
  sampath = {
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    account_replication_type  = "LRS"
    access_tier               = "Hot"
    shared_access_key_enabled = true
    min_tls_version           = "TLS1_2"
  }
  sai = {
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    account_replication_type  = "ZRS"
    access_tier               = "Cool"
    shared_access_key_enabled = true
    min_tls_version           = "TLS1_2"
  }
}

# contianer count 
storage-containers = {
    sampath01 = {
        container_access_type = "private"
    }
    sai01 = {
        container_access_type = "Blob"
    }
}
*/