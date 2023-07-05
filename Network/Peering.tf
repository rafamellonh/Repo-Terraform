resource "azurerm_virtual_network_peering" "peer-vnet01TOvnet-hub" {
  name = "peer-vnet01TOvnet-hub"
  resource_group_name = azurerm_resource_group.RG01.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  remote_virtual_network_id = azurerm_virtual_network.vnet-hub.id
}

resource "azurerm_virtual_network_peering" "peer-vnet-hubTOvnet01" {
  name = "peer-vnet-hubTOvnet01"
  resource_group_name = azurerm_resource_group.RG01.name
  virtual_network_name = azurerm_virtual_network.vnet-hub.name
  remote_virtual_network_id = azurerm_virtual_network.vnet01.id
}