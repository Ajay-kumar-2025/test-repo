variable "subnet_name" {
    type = string
    description = "The name of subnet"
}

variable "resource_group_name" {
    type = string
    description = "The name of resource group"
}

variable "virtual_network_name" {
    type = string
    description = "The name of virtual network"
}

variable "address_prefixes" {
    type = list (string)
    description = "The address prefix of subnet "
}