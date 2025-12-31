output "id" {
  description = "The ID of the created Linux VM."
  value       = azurerm_linux_virtual_machine.vm.id
}

output "private_ip_address" {
  description = "The private IP address of the VM."
  value       = azurerm_network_interface.nic.private_ip_address
}

output "public_ip_address" {
  description = "The public IP address of the VM (for SSH)."
  value       = azurerm_public_ip.pip.ip_address
}
