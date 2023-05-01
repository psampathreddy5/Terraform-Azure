# name of esource group whivh was exeisted already in resource group
resource_group_name = "sam-rg-env-dev"

# name of location
location = "eastus"

# creation of resources to which environment 
Environment = "Development"

# creation of resources to which Project
Project = "ABP-01"

storage_config = {
  sampath = {
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    account_replication_type  = "LRS"
    access_tier               = "Hot"
    shared_access_key_enabled = "true"
    min_tls_version           = "TLS1_2"
  }
  sandeep = {
    account_tier              = "Standard"
    account_kind              = "StorageV2"
    account_replication_type  = "LRS"
    access_tier               = "Hot"
    shared_access_key_enabled = "true"
    min_tls_version           = "TLS1_2"
  }
}


# containers_list
containers_config = {
  sampath-container1 = {
    container_access_type = "private"
  }
  sandeep-container2 = {
    container_access_type = "private"
  }
}

#list of blobs
blob_name = "New-Text-Document.txt"
