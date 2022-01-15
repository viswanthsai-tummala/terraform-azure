/*
provisioner "remote-exec" {
    inline = [
        "sudo apt update",
        "sudo apt install nginx",
        "sudo ufw allow 'Nginx HTTP'",
        "sudo systemctl start nginx"
    ]

    connection {
        type = "ssh"
        host = azurerm_linux_virtual_machine.example.public_ip_address
        user = "adminuser"
        private_key = file(".ssh/id_rsa")
    }

}
*/