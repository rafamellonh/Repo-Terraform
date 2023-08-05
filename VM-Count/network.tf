resource "azurerm_virtual_network" "vnet01" {
  address_space       = ["10.10.0.0/16"]
  location            = "eastus"
  name                = "vnet01"
  resource_group_name = azurerm_resource_group.rg01.name

}

resource "azurerm_subnet" "sub01" {
  address_prefixes     = ["10.10.1.0/24"]
  name                 = "sub01"
  resource_group_name  = azurerm_resource_group.rg01.name
  virtual_network_name = azurerm_virtual_network.vnet01.name

}