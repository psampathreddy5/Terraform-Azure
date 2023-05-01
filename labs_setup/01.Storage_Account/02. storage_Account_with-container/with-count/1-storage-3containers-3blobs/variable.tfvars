# name of esource group whivh was exeisted already in resource group
resource_group_name = "sam-rg-env-dev"

# name of location
location = "eastus"

# creation of resources to which environment 
Environment = "Development"

# creation of resources to which Project
Project = "ABP-01"

# storage_account_name
storage_account_name = "sampath"

# containers_list
containers_list = [
  {
    name                  = "container01",
    container_access_type = "private"
  },
  {
    name                  = "container02",
    container_access_type = "blob"
  },
  {
    name                  = "container03",
    container_access_type = "private"
  }
]

# blob_list
blob_list = [
  {
    name = "sampath/New-Text-Document.txt",
    type = "Block"
  },
  {
    name = "sandeep/New-Text-Document.txt",
    type = "Block"
  },
  {
    name = "sai/New-Text-Document.txt",
    type = "Block"
  }
]

