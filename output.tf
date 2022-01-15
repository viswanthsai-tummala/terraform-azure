output "linux_macine_private_ip" {
  value = azurerm_linux_virtual_machine.example.private_ip_address
}

output "linux_macine_public_ip" {
  value = azurerm_linux_virtual_machine.example.public_ip_address
}

output "Time_at_completion" {
  value = local.time
}
