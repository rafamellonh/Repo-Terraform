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

resource "azurerm_lb_backend_address_pool" "back-pool-web" {
  loadbalancer_id = azurerm_lb.lb-front.id
  name = "back-pool-web"
 
}

resource "azurerm_network_interface_backend_address_pool_association" "ass-nic-backendWeb" {
  backend_address_pool_id = azurerm_lb_backend_address_pool.back-pool-web.id
  ip_configuration_name = "Internal"
  network_interface_id = azurerm_network_interface.nic-front.id
  
}

resource "azurerm_lb_rule" "name" {
  backend_port = 80
  backend_address_pool_ids = [ azurerm_lb_backend_address_pool.back-pool-web.id ]
  frontend_ip_configuration_name = "Front-ip-lb"
  frontend_port = 80
  loadbalancer_id = azurerm_lb.lb-front.id
  name = "Rule-80"
  protocol = "Tcp"
  probe_id = azurerm_lb_probe.probe-80.id
}

resource "azurerm_lb_probe" "probe-80" {
  loadbalancer_id = azurerm_lb.lb-front.id
  name = "probe-80"
  port = 80
  
}