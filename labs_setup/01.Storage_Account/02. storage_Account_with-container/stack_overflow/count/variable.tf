variable "Storage_list" {
  type = list(any)
  default = [
    "kavvst1",
    "kavvst2",
    "kavvst3"
  ]
}

variable "containers_list" {
  type = list(any)
  default = [
    {
      name        = "sa1container1",
      access_type = "private"
    },
    {
      name        = "sa1container2",
      access_type = "private"
    },
    {
      name        = "sa1container3",
      access_type = "private"

    }
  ]
}

variable "blob_list" {
  type = list(any)
  default = [
    {
      name = "sampath/New-Text-Document.txt",
      type = "Block"
    },
    {
      name = "sampath/New-Text-Document.txt",
      type = "Block"
    },
    {
      name = "sampath/New-Text-Document.txt",
      type = "Block"
    }
  ]
}
