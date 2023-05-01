# name of esource group whivh was exeisted already in resource group
resource_group_name = "abp-rg-env_dev"

# creation of resources to which environment 
Environment = "Development"

# creation of resources to which Project
Project = "ABP-01"

# storage-accounts-details
storage-accounts-details = {
    sampathdev012 = {
        account_tier              = "Standard"
        account_kind              = "StorageV2"
        account_replication_type  = "LRS"
        access_tier               = "Hot"
        shared_access_key_enabled = "true"
        min_tls_version           = "TLS1_2"
        storage_containers = {
          sampath-01 = "",
          sampath-02 = "",
          sampath-03 = "",
          sampath-04 = "",
          sampath-05 = "",
          sampath-06 = "",
          sampath-07 = "",
          sampath-08 = "",
          sampath-09 = "",
          sampath-10 = "",
        }
    }
    saienvdev0123 = {
        account_tier              = "Premium"
        account_kind              = "StorageV2"
        account_replication_type  = "ZRS"
        access_tier               = "Cool"
        shared_access_key_enabled = "false"
        min_tls_version           = "TLS1_2"
        storage_containers = {
          sampath-01 = "",
          sampath-02 = "",
          sampath-03 = "",
          sampath-04 = "",
          sampath-05 = "",
          sampath-06 = "",
          sampath-07 = "",
          sampath-08 = "",
          sampath-09 = "",
          sampath-10 = "",
        }
    }
}