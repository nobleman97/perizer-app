
# Storage group for the AKS cluster and its resources
resource "azurerm_resource_group" "main" {
  name     = var.rg_name
  location = var.rg_location
}



# Create the AKS by calling the module
module "aks" {
  source = "./modules/aks"

  aks-name = var.aks-name

  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  vm_size = var.vm_size
  dns-prefix = var.dns-prefix
  http_application_routing_enabled = var.http_application_routing_enabled

  ssh_public_key = var.ssh-public_key
}


# create the ACR by callin the module
module "main_acr" {
  source = "./modules/acr"
  for_each = var.acrs

  name =  each.value.name
  location = azurerm_resource_group.main.location
  rg_name = azurerm_resource_group.main.name
  sku = each.value.sku
  admin_enabled = each.value.admin_enabled
}

# Give AKS access to pull from ACR
resource "azurerm_role_assignment" "aks_acrpull" {

  scope = module.main_acr["main"].acr_id
  role_definition_name = "AcrPull" 
  principal_id = module.aks.aks_identity
  
}

# Give the worker nodes permission to pull from ACR
resource "azurerm_role_assignment" "vmss_acrpull" {

  scope = module.main_acr["main"].acr_id

  role_definition_name = "AcrPull" 
  principal_id = module.aks.vmss
  
}




# resource "azurerm_dns_zone" "com" {
#   for_each = var.dns-names
#   name                = each.value.name
#   resource_group_name = azurerm_resource_group.main.name
# }

# # # Role assignments
# resource "azurerm_role_assignment" "aks_dns_contributor" {
#   for_each = var.dns-names

#   scope                = azurerm_dns_zone.com[each.key].id
#   principal_id         = module.aks.vmss
#   role_definition_name = "DNS Zone Contributor"
# }




