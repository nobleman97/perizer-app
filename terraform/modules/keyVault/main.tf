data "azurerm_client_config" "current" {}



resource "azurerm_key_vault" "main" {
  name                        = var.kv_name
  location                    = var.kv_location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  enable_rbac_authorization = false

  sku_name = "standard"

}

resource "azurerm_key_vault_access_policy" "spn" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = var.service_principal_object_id

  key_permissions = [
    "Get", "List", "Create",
  ]

  secret_permissions = ["Get", "List", "Set", "Delete", "Backup", "Restore"]

  storage_permissions = [
    "Get",
  ]
}

resource "azurerm_key_vault_access_policy" "myuser" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = var.my_object_id

  key_permissions = [
    "Get", "List", "Create",
  ]

  secret_permissions = [
    "Get", "Set", "List",
  ]

  storage_permissions = [
    "Get",
  ]
}

