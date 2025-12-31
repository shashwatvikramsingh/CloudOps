# This module creates a basic AKS cluster with a system-managed identity.
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  tags                = var.tags

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = "Standard_B1s"
  }

  identity {
    type = "SystemAssigned"
  }
}
