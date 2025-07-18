module "rgmodule_11" {
    source = "../azurerm_child_module/resource_group"
    rg_name11 = "rugui"
    rg_location11 = "australia east"
  
}
module "rgmodule_11" {
    source = "../azurerm_child_module/resource_group"
    rg_name11 = "18julyfortesting"
    rg_location11 = "australia east"
 
}


module "azurerm_virtual_network" {
source = "../azurerm_child_module/Virtual_network_group"
depends_on = [ module.rgmodule_11 ]
vnet_name11 = "ruggu"
vnetrg = "rugui"
vnetlocation = "australia east"
address_space11 = ["10.0.0.0/16"]
  
}

module "frpontend_subnet1" {
    source = "../azurerm_child_module/subnet"
    depends_on = [ module.rgmodule_11,module.azurerm_virtual_network ]
    subnetname = "subnet_frontend1"
    resource_group_name = "rugui"
    subnet_virtaulnetwork11 = "ruggu"
    address_prefixes11 = ["10.0.1.0/24"]
  
}

module "backend_subnet2" {
    source = "../azurerm_child_module/subnet"
    depends_on = [ module.rgmodule_11,module.azurerm_virtual_network ]
    subnetname = "subnet_backend2"
    resource_group_name = "rugui"
    subnet_virtaulnetwork11 = "ruggu"
    address_prefixes11 = ["10.0.2.0/24"]
  
}


module "public_ip_frontend" {
    source = "../azurerm_child_module/Public_ip_address"
  depends_on = [ module.frpontend_subnet1]
    pip_name = "test_frontend"
    pip_location = "australia east"
    pip_rg_name = "rugui"
  
}

module "public_ip_backend" {
    source = "../azurerm_child_module/Public_ip_address"
   depends_on = [ module.backend_subnet2]
    pip_name = "test_backend"
    pip_location = "australia east"
    pip_rg_name = "rugui"
  
}


module "nic_md1"{
    source = "../azurerm_child_module/network_interface"
    depends_on = [ module.public_ip_frontend, module.rgmodule_11]
    nic_name = "test_frontend_nic"
    nic_rg_name = "rugui"
    nic_location = "australia east"
  name_of_public_ip = "test_frontend"
  name_of_subnet_id = "subnet_frontend1"
  virtual_network_name = "ruggu"
}

module "nic_md2"{
    source = "../azurerm_child_module/network_interface"
    depends_on = [ module.public_ip_backend,module.rgmodule_11]
    nic_name = "test_backend_name"
    nic_rg_name = "rugui"
    nic_location = "australia east"
  name_of_public_ip = "test_backend"
  name_of_subnet_id = "subnet_backend2"
  virtual_network_name = "ruggu"
}

module "vm_frontend"{
    source = "../azurerm_child_module/virtual_machine"
    depends_on = [ module.rgmodule_11, module.nic_md1, module.frpontend_subnet1]
    vm_name = "vm-frontend1"
    vm_location = "australia east"
  nic_rgname ="rugui"
    nic_name= "test_frontend_nic"


}


module "vm_backend"{
    source = "../azurerm_child_module/virtual_machine"
    depends_on = [ module.rgmodule_11, module.nic_md2, module.backend_subnet2 ]
    vm_name = "vm-backend2"
    vm_location = "australia east"
    nic_rgname ="rugui"
    nic_name= "test_backend_name"



}

