# Create list of names for storage and container .

variable "Storage_list" {
  type = list(any)
  default = [
    "sa1stor1",
    "sa1stor2",
    "sa1stor3"
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
