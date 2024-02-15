output "client_certificate" {
  value     = azurerm_kubernetes_cluster.main.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.main.kube_config_raw

  sensitive = true
}

output "aks_identity" {
  value =  azurerm_kubernetes_cluster.main.identity[0].principal_id
}

output "vmss" {
  value = azurerm_kubernetes_cluster.main.kubelet_identity[0].object_id
}

output "vmss_user_identity" {
  value = azurerm_kubernetes_cluster.main.kubelet_identity[0].user_assigned_identity_id
}