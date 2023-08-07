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

resource "azurerm_network_security_group" "nsg01" {
  location            = "eastus"
  name                = "nsg01"
  resource_group_name = azurerm_resource_group.rg01.name

}

resource "azurerm_network_security_rule" "rule-80" {
  access                      = "Allow"
  direction                   = "Inbound"
  name                        = "rule-80"
  network_security_group_name = azurerm_network_security_group.nsg01.name
  priority                    = 300
  protocol                    = "Tcp"
  resource_group_name         = azurerm_resource_group.rg01.name
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_subnet_network_security_group_association" "association-nsg-sub" {
  network_security_group_id = azurerm_network_security_group.nsg01.id
  subnet_id                 = azurerm_subnet.sub01.id

}