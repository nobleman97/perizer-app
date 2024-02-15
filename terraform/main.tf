resource "azurerm_resource_group" "main" {
  name     = var.rg_name
  location = var.rg_location
}


module "aks" {
  source = "./modules/aks"

  aks-name = var.aks-name

  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  dns-prefix = var.dns-prefix
  http_application_routing_enabled = var.http_application_routing_enabled

  ssh_public_key = var.ssh-public_key
}


resource "azurerm_role_assignment" "aks_acrpull" {

  scope = data.azurerm_container_registry.main.id

  role_definition_name = "AcrPull" 
  principal_id = module.aks.aks_identity
  
}

resource "azurerm_role_assignment" "vmss_acrpull" {

  scope = data.azurerm_container_registry.main.id

  role_definition_name = "AcrPull" 
  principal_id = module.aks.vmss
  
}



resource "azurerm_dns_zone" "com" {
  for_each = var.dns-names
  name                = each.value.name
  resource_group_name = azurerm_resource_group.main.name
}

# # # Role assignments
resource "azurerm_role_assignment" "aks_dns_contributor" {
  for_each = var.dns-names

  scope                = azurerm_dns_zone.com[each.key].id
  principal_id         = module.aks.vmss
  role_definition_name = "DNS Zone Contributor"
}




