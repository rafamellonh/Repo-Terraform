
resource "azurerm_resource_group" "rg10" {
    location = var.location
    name = var.rg
    
}

resource "azurerm_virtual_network" "vnet" {
  address_space       = ["10.10.0.0/16"]
  location            = var.location
  name                = var.vnetName
  resource_group_name = var.rg
}

resource "azurerm_subnet" "name" {
    address_prefixes = [ "10.10.0.0/24" ]
    name = var.nameSubnet
    resource_group_name = var.rg
    virtual_network_name = var.vnetName
    
}