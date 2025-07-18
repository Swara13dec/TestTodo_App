resource "azurerm_public_ip" "example" {
  name                = var.pip_name
  resource_group_name = var.pip_rg_name
  location            = var.pip_location
  allocation_method   = "Static"
  sku = "Basic"
}