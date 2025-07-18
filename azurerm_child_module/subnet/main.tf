resource "azurerm_subnet" "example" {
  name                 = var.subnetname
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.subnet_virtaulnetwork11
  address_prefixes     = var.address_prefixes11
#   ["10.0.1.0/24"]


}