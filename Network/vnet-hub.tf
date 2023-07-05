resource "azurerm_virtual_network" "vnet-hub" {
  name                = "vnet-hub"
  resource_group_name = azurerm_resource_group.RG01.name
  location            = azurerm_resource_group.RG01.location
  address_space       = ["10.40.0.0/16"]
}

resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.RG01.name
  virtual_network_name = azurerm_virtual_network.vnet-hub.name
  address_prefixes     = ["10.40.250.0/26"]
}