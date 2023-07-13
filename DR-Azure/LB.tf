# LB FRONT

resource "azurerm_lb" "lb-front" {
  location            = var.location-prd
  name                = "lb-front"
  resource_group_name = azurerm_resource_group.RG-PRD.name

  frontend_ip_configuration {
    public_ip_address_id = azurerm_public_ip.pip-lb-front.id
    name                 = "Front-ip-lb"
  }
}

resource "azurerm_public_ip" "pip-lb-front" {
  allocation_method   = "Static"
  location            = var.location-prd
  name                = "pip-lb-front"
  resource_group_name = azurerm_resource_group.RG-PRD.name

}