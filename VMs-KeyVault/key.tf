data "azurerm_client_config" "current" {

}


resource "azurerm_key_vault" "key01" {
  location                   = var.location
  name                       = "key01mello0301"
  resource_group_name        = var.rg-name
  sku_name                   = "standard"
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false
  enabled_for_deployment     = true
  access_policy {
    object_id = data.azurerm_client_config.current.object_id
    tenant_id = data.azurerm_client_config.current.tenant_id
    secret_permissions = [
      "Get", "List", "Set"
    ]
  }

}

resource "azurerm_key_vault_secret" "senhaVms" {
  key_vault_id = azurerm_key_vault.key01.id
  name         = "rafaeladmin"
  value        = "@#Rafa,321@#"

}



