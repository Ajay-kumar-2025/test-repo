module "resource_group" {
  source                  = "../Modules/azurerm_resource_group"
  resource_group_name     = "rg_todo_app"
  resource_group_location = "canadacentral"
}

module "virtual_network" {
  depends_on           = [module.resource_group]
  source               = "../Modules/azurerm_virtual_network"
  virtual_network_name = "vnet_todo_app"
  location             = "canadacentral"
  resource_group_name  = "rg_todo_app"
  address_space        = ["10.0.0.0/16"]
}

module "frontend_subnet" {
  depends_on           = [module.virtual_network]
  source               = "../Modules/azurerm_subnet"
  subnet_name          = "frontend-subnet"
  resource_group_name  = "rg_todo_app"
  virtual_network_name = "vnet_todo_app"
  address_prefixes     = ["10.0.1.0/24"]
}

module "backend_subnet" {
  depends_on           = [module.virtual_network]
  source               = "../Modules/azurerm_subnet"
  subnet_name          = "backend-subnet"
  resource_group_name  = "rg_todo_app"
  virtual_network_name = "vnet_todo_app"
  address_prefixes     = ["10.0.2.0/24"]
}

module "frontend_pip" {
  depends_on          = [module.resource_group]
  source              = "../Modules/azurerm_public_ip"
  public_ip_name      = "pip_todoapp_frontend"
  resource_group_name = "rg_todo_app"
  location            = "canadacentral"
  allocation_method   = "Static"
}

# module "backend_pip" {
#   depends_on          = [module.resource_group]
#   source              = "../Modules/azurerm_public_ip"
#   public_ip_name      = "pip_todoapp_backend"
#   resource_group_name = "rg_todo_app"
#   location            = "canadacentral"
#   allocation_method   = "Static"
# }

module "linux_frontend_vm" {
  depends_on           = [module.frontend_subnet]
  source               = "../Modules/azurerm_linux_virtual_machine"
  resource_group_name  = "rg_todo_app"
  location             = "canadacentral"
  nic_todovm           = "nic_todo_vm"
  vm_name              = "vm-frontend"
  vm_size              = "Standard_D2s_v3"
  image_publisher      = "canonical"
  image_offer          = "0001-com-ubuntu-server-focal"
  image_sku            = "20_04-lts-gen2"
  image_version        = "latest"
  admin_username       = "devopsadmin"
  admin_password       = "admin@12345"
  subnet_name          = "frontend-subnet"
  virtual_network_name = "vnet_todo_app"
  pip_name             = "pip_todoapp_frontend"
}

# module "linux_backend_vm" {
#   depends_on          = [module.backend_subnet]
#   source              = "../Modules/azurerm_linux_virtual_machine"
#   resource_group_name = "rg_todo_app"
#   location            = "centralcanada"
#   nic_todovm          = "nic_todo_vm"
#   vm_name             = "vm-backend"
#   vm_size             = "Standard_D2s_v3"
#   image_publisher     = "canonical"
#   image_offer         = "0001-com-ubuntu-server-focal"
#   image_sku           = "20_04-lts-gen2"
#   image_version       = "latest"
#   admin_username      = "devopsadmin"
#   admin_password      = "admin@12345"
#   subnet_name          = "backend-subnet"
#   virtual_network_name = "vnet_todo_app"
#   pip_name =          "pip_todoapp_backend"
# }


# module "sql_server_todoapp" {

#   source                       = "../Modules/azurerm_sql_server"
#   sql_server_name              = "sqlservertodoapp"
#   resource_group_name          = "rg_todo_app"
#   location                     = "centralcanada"
#   administrator_login          = "devopsadmin"
#   administrator_login_password = "admin@12345"
# }

# module "sql_database" {
#   depends_on  = [module.sql_server_todoapp]
#   source      = "../Modules/azurerm_sql_database"
#   sql_db_name = "sqldb_todoapp"
#   server_id   = "" # yha par sql server ki id filhal k lie hardcode krenge from portal after creation of sql server
# }
