variable "nic_todovm"{
    type= string
    description = "Name of frontend vm -Nic"
}
variable "location"{
    type= string
    description = "location of frontend vm"
}
variable "resource_group_name" {
    type= string
    description = "Name of resource group"
}
variable "vm_name" {
    type=string                   #type amd description are optional
    description = "name of vm"
}
#variable "subnet_id" {}
variable "admin_username"{}
variable "admin_password"{}
variable "vm_size" {}
variable "image_publisher"{}
variable "image_offer"{}
variable "image_sku"{}
variable "image_version"{}
#variable "pip_id" {}
variable "subnet_name"{}
variable "virtual_network_name"{}
variable "pip_name"{}