output "id" {
  description = "The ID of the created AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.id
}

output "kube_config_raw" {
  description = "The raw kubeconfig for the cluster."
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}
