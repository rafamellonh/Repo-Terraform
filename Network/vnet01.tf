resource "azurerm_resource_group" "RG01" {
  name     = "RG01"
  location = "eastus"
}

resource "azurerm_virtual_network" "vnet01" {
  name          = "vnet01"
  resource_group_name = azurerm_resource_group.RG01.name
  location      = azurerm_resource_group.RG01.location
  address_space = ["10.50.0.0/16"]
  dns_servers   = ["8.8.8.8", "1.1.1.1"]
}

resource "azurerm_subnet" "sub-web01" {
  name                 = "sub-web01"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = azurerm_resource_group.RG01.name
  address_prefixes     = ["10.50.1.0/24"]

}

resource "azurerm_subnet" "sub-srv01" {
  name                 = "sub-srv01"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = azurerm_resource_group.RG01.name
  address_prefixes     = ["10.50.2.0/24"]
}

resource "azurerm_subnet" "sub-db01" {
  name                 = "sub-db01"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = azurerm_resource_group.RG01.name
  address_prefixes     = ["10.50.3.0/24"]
}

resource "azurerm_subnet" "subappgw01" {
  name                 = "subappgw01"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = azurerm_resource_group.RG01.name
  address_prefixes     = ["10.50.250.0/24"]
}


resource "azurerm_network_security_group" "nsg01" {
  name                = "nsg01"
  resource_group_name = azurerm_resource_group.RG01.name
  location            = azurerm_resource_group.RG01.location

}


resource "azurerm_network_security_rule" "rule-80" {
  name                       = "rule-80"
  priority                   = "200"
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  resource_group_name        = azurerm_resource_group.RG01.name
  network_security_group_name = azurerm_network_security_group.nsg01.name
}


resource "azurerm_subnet_network_security_group_association" "asso-db01" {
  network_security_group_id = azurerm_network_security_group.nsg01.id
  subnet_id                 = azurerm_subnet.sub-db01.id
}

resource "azurerm_subnet_network_security_group_association" "asso-web01" {
  subnet_id                 = azurerm_subnet.sub-web01.id
  network_security_group_id = azurerm_network_security_group.nsg01.id
}

resource "azurerm_subnet_network_security_group_association" "asso-srv01" {
  subnet_id                 = azurerm_subnet.sub-srv01.id
  network_security_group_id = azurerm_network_security_group.nsg01.id
}

  

  