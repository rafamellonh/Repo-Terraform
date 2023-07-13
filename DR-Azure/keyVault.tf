data "azurerm_client_config" "current" {

}

resource "azurerm_key_vault" "keyvaultpasswordmello0112" {
  location                   = var.location-prd
  name                       = "keyvaultpasswordmello0112"
  resource_group_name        = azurerm_resource_group.RG-PRD.name
  sku_name                   = "standard"
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  enabled_for_deployment     = true
  soft_delete_retention_days = 7
  purge_protection_enabled   = false
  access_policy {
    object_id          = data.azurerm_client_config.current.object_id
    secret_permissions = ["Get", "List", "Set"]
    tenant_id          = data.azurerm_client_config.current.tenant_id
  }

}

resource "azurerm_key_vault_secret" "rafaeladmin" {
  key_vault_id = azurerm_key_vault.keyvaultpasswordmello0112.id
  name         = "rafaeladmin"
  value        = "@#Rafa,321@#"

}

