# VNET-FRONT

resource "azurerm_virtual_network" "vnet-front" {
  address_space       = ["10.0.0.0/16"]
  location            = var.location-prd
  name                = var.vnet-front
  resource_group_name = azurerm_resource_group.RG-PRD.name

}

resource "azurerm_subnet" "sub-front" {
  address_prefixes     = ["10.0.1.0/24"]
  name                 = var.sub-front
  resource_group_name  = azurerm_resource_group.RG-PRD.name
  virtual_network_name = var.vnet-front
}

resource "azurerm_network_security_group" "nsg-front" {
  location            = var.location-prd
  name                = var.nsg-front
  resource_group_name = azurerm_resource_group.RG-PRD.name

}

#############################
#VNET-SQL