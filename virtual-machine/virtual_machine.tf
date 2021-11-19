resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.VirtualMachineName
  resource_group_name =azurerm_resource_group.MyTerraformGroup.name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.MyTerraformNIC.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = tls_private_key.ssh-key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  computer_name=var.VirtualMachineName
  disable_password_authentication=true
}

resource "tls_private_key" "ssh-key"{
  algorithm   = "RSA"
  rsa_bits =4096
}

output "tls_private_key"{
 value=tls_private_key.ssh-key.private_key_pem
  sensitive=true
}
