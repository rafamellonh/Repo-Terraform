resource "azurerm_resource_group" "RG-PRD" {
  location = var.location-prd
  name     = var.rg-name

}