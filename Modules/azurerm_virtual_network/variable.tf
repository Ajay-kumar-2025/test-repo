variable "virtual_network_name" {
    type = string
    description = "name of virtual network"
}

variable "location" {
    type = string
    description = "name of virtual network"
}

variable "resource_group_name" {
     type = string
    description = "name of resource group"
}

variable "address_space"{
    type = list(string)
    description = "address space for the virtual network"
}