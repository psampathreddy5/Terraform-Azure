module "module_uat" {
  source = "./module"
  # storage_account_name
  storage_account_name = "sandeep"

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
}
