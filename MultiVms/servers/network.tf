resource "azurerm_virtual_network" "vnet01" {
  name = "vnet01"
  resource_group_name = azurerm_resource_group.rg01.name
  location = azurerm_resource_group.rg01.location
  address_space = [ "10.10.0.0/16" ]

}

resource "azurerm_subnet" "sub01" {
  name = "sub01"
  resource_group_name = azurerm_resource_group.rg01.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes = [ "10.10.1.0/24" ]
}


resource "azurerm_network_interface" "nic01" {
  count = var.servers
  name = "nic01-${count.index}"
  location = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name

  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.sub01.id
    private_ip_address_allocation = "Dynamic"
  }


}