resource "azurerm_virtual_network" "vnet11june" {
    name = var.vnet_name11
    resource_group_name = var.vnetrg
    location = var.vnetlocation
    address_space = var.address_space11
# ["10.0.0.0/16"]
  
}
