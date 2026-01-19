variable "public_ip_name" {
  type        = string
  description = "the name of public ip"
}
variable "resource_group_name" {
  type        = string
  description = "name of resource group"
}
variable "location" {
  type        = string
  description = "location of  resource group"
}
variable "allocation_method" {
  type        = string
  description = "allocation method type"
}