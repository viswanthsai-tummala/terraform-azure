resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = var.isfree == true ? "Standard_B1s" : "Standard_F2"
  #Conditional statement used here for testing. (If statement)
  admin_username = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file(".ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "${var.ubuntu_version}-LTS"
    #Substituion is used here. In this case variable is substituted. Attributes etc can also be substituted
    version = "latest"
  }

  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
    connection {
      type        = "ssh"
      host        = self.public_ip_address
      user        = "adminuser"
      private_key = file(".ssh/id_rsa")
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo ufw allow 'Nginx HTTP'",
      "sudo systemctl start nginx",
      "sudo cp /tmp/index.html /var/www/html/index.html",
      "sudo systemctl reload nginx"
    ]
    connection {
      type        = "ssh"
      host        = self.public_ip_address
      user        = "adminuser"
      private_key = file(".ssh/id_rsa")
    }
  }
}