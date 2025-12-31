output "id" {
  description = "The ID of the created storage account."
  value       = azurerm_storage_account.sa.id
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint of the storage account."
  value       = azurerm_storage_account.sa.primary_blob_endpoint
}
