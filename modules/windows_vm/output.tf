output "id" {
  description = "The ID of the created VM."
  value       = azurerm_windows_virtual_machine.vm.id
}

output "private_ip_address" {
  description = "The private IP address of the VM."
  value       = azurerm_network_interface.nic.private_ip_address
}

output "public_ip_address" {
  description = "The public IP address of the VM, for RDP access."
  value       = azurerm_public_ip.pip.ip_address
}
