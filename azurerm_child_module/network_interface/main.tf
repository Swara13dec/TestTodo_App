resource "azurerm_network_interface" "example" {
  name                = var.nic_name
  location            = var.nic_location
  resource_group_name = var.nic_rg_name

  ip_configuration {
    name                          = "test_nic_ip"
    subnet_id                     = data.azurerm_subnet.test_data_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.test_data_nic.id
  }
}

data "azurerm_public_ip" "test_data_nic" {
  name                = var.name_of_public_ip
  resource_group_name = var.nic_rg_name
}

data "azurerm_subnet" "test_data_subnet" {
  name                 = var.name_of_subnet_id
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.nic_rg_name
}
