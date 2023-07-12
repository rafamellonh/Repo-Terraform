resource "azurerm_network_security_group" "nsg-key" {
    location = var.location
    name = var.nsg-name
    resource_group_name = var.rg-name
    
}

resource "azurerm_network_security_rule" "rule-3389" {
    access = "Allow"
    direction = "Inbount"
    name = "${var.vm-2019}-3389"
    network_security_group_name = azurerm_network_security_group.nsg-key.name
    priority = 0399
    protocol = "TCP"
    resource_group_name = var.rg-name
    source_port_range = "*"
    destination_port_range = "3389"

    
}

resource "azurerm_subnet_network_security_group_association" "as-ngs-sub" {
    network_security_group_id = azurerm_network_security_group.nsg-key.id
    subnet_id = azurerm_subnet.subnet.id
    
}