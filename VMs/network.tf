resource "azurerm_resource_group" "RG" {
  location = var.location
  name     = var.rg-name
}

resource "azurerm_virtual_network" "VNET" {
  address_space       = ["10.10.0.0/16"]
  location            = var.location
  name                = var.vnet-name
  resource_group_name = azurerm_resource_group.RG.name

}

resource "azurerm_subnet" "subnet" {
  address_prefixes     = ["10.10.1.0/24"]
  name                 = var.sub-name
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.VNET.name

}