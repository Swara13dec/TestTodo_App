

resource "azurerm_linux_virtual_machine" "vmtest" {
  name                = var.vm_name
  resource_group_name = var.nic_rgname
  location            = var.vm_location
  size                = "Standard_F2"

  
  admin_username      = "admin-user"
  admin_password      = "admin@0p9090890oijkhj"
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.testvmdata1.id
  ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  custom_data = base64encode(<<-EOF
  #!/bin/bash
  apt-get update
  apt-get install -y nginx
  systemctl enable nginx
  systemctl start nginx
EOF
)
}


data "azurerm_network_interface" "testvmdata1" {
  name                = var.nic_name
  resource_group_name = var.nic_rgname
}


