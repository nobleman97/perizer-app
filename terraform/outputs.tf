# output "aks_login_server" {
#   value = data.azurerm_container_registry.main.login_server
#   sensitive = true
# }

# output "aks_admin_username" {
#   value = data.azurerm_container_registry.main.admin_username
#   sensitive = true
# }

# output "aks_admin_password" {
#   value = data.azurerm_container_registry.main.admin_password
#   sensitive = true
# }

# output "sp_client_id" {
#   value = module.service_principal.client_id
# }

# output "sp_client_secret" {
#   value = module.service_principal.client_secret
#   sensitive = true
# }

output "kube_config" {
  value = module.aks.kube_config
  sensitive = true
}

output "kubelet_identity" {
  value = module.aks.vmss_user_identity
}