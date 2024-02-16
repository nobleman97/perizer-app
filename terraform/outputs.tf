
output "kube_config" {
  value = module.aks.kube_config
  sensitive = true
}

output "kubelet_identity" {
  value = module.aks.vmss_user_identity
}

output "main_acr_username" {
  value = module.main_acr["main"].username
}

output "main_acr_password" {
  value = module.main_acr["main"].password
  sensitive = true
}

output "main_acr_login_server" {
  value = module.main_acr["main"].login_server

}
