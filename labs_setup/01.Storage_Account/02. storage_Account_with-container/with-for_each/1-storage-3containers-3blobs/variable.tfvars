# name of esource group whivh was exeisted already in resource group
resource_group_name = "sam-rg-env-dev"

# name of location
location = "eastus"

# creation of resources to which environment 
Environment = "Development"

# creation of resources to which Project
Project = "ABP-01"

# storage_account-name
storage_account-name = "sampath"

# containers_list
containers_list = [
  "sampath-container1",
  "sandeep-container2",
  "sai-container3",
]



#list of blobs
blob_list = [
  {
    name = "sampath/New-Text-Document.txt"
    type = "Block"
  },
  {
    name = "sandeep/New-Text-Document.txt"
    type = "Block"
  },
  {
    name = "sai/New-Text-Document.txt"
    type = "Block"
  }
]
