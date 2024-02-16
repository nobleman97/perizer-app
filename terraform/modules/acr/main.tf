
resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
#   georeplications {
#     location                = "East US"
#     zone_redundancy_enabled = true
#     tags                    = {}
#   }

}