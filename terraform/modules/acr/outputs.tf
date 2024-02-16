output "acr_id" {
  value = azurerm_container_registry.acr.id
}

output "username" {
 value = azurerm_container_registry.acr.admin_username
}

output "password" {
 value = azurerm_container_registry.acr.admin_password
 sensitive = true
}

output "login_server" {
 value = azurerm_container_registry.acr.login_server
}