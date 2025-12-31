resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  tags                     = var.tags

  account_tier             = "Standard"
  account_replication_type = var.replication_type
}
