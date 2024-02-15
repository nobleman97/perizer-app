
output "kube_config" {
  value = module.aks.kube_config
  sensitive = true
}

output "kubelet_identity" {
  value = module.aks.vmss_user_identity
}