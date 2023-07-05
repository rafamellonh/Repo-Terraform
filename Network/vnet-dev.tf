resource "azurerm_virtual_network" "vnet-dev" {
  name = "vnet-dev"
  resource_group_name = azurerm_resource_group.RG01.name
  location = azurerm_resource_group.RG01.location
  address_space = [ "192.168.100.0/24" ]
}

resource "azurerm_subnet" "sub-dev01" {
  name = "sub-dev01"
  resource_group_name = azurerm_resource_group.RG01.location
  virtual_network_name = azurerm_virtual_network.vnet-dev.name
  address_prefixes = [ "192.168.100.0/27" ]
}