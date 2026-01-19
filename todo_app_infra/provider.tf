terraform {
    required_providers {
      azurerm = {
       source = "hashicorp/azurerm"
       version = "4.57.0"
      }
    }
# backened block
#   backend "azurerm" {
#     resource_group_name = "chiku_rg"
#     storage_account_name = "pikustorage"                              
#     container_name       = "tfcontainer"                               
#     key                  = "pinku.tfstate"          
#   }
}
provider "azurerm" {
  features {}
  subscription_id = "310dec27-9d1f-4f6d-8cc0-356278cce859"
}