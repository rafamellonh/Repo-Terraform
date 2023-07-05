## VM WEB01
resource "azurerm_network_interface" "nic-VmWeb01" {
  name                = "nic-VmWeb01"
  resource_group_name = azurerm_resource_group.RG01.name
  location            = azurerm_resource_group.RG01.location

  ip_configuration {
    name                          = "Internal"
    subnet_id                     = azurerm_subnet.sub-web01.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_windows_virtual_machine" "VmWeb01" {
  name                = "VmWev01"
  resource_group_name = azurerm_resource_group.RG01.name
  location            = azurerm_resource_group.RG01.location
  admin_username      = "rafael.admin"
  admin_password      = "@#Rafa,321@#"
  size                = "Standard_B1s"

  network_interface_ids = [azurerm_network_interface.nic-VmWeb01.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

}


## VM SRV01

resource "azurerm_network_interface" "nic-WebSrv01" {
  name                = "nic-WebSrv01"
  resource_group_name = azurerm_resource_group.RG01.name
  location            = azurerm_resource_group.RG01.location

  ip_configuration {
    name                          = "Internal"
    subnet_id                     = azurerm_subnet.sub-srv01.id
    private_ip_address_allocation = "Dynamic"
  }

}


resource "azurerm_windows_virtual_machine" "VmSrv01" {
  name                = "VmSrv01"
  resource_group_name = azurerm_resource_group.RG01.name
  location            = azurerm_resource_group.RG01.location
  size                = "Standard_B1s"
  admin_username      = "rafael.admin"
  admin_password      = "@#Rafa,321@#"

  network_interface_ids = [azurerm_network_interface.nic-WebSrv01.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

## VM SQL

resource "azurerm_network_interface" "nic-VmSql" {
  name                = "nic-VmSql"
  resource_group_name = azurerm_resource_group.RG01.name
  location            = azurerm_resource_group.RG01.location

  ip_configuration {
    name                          = "Internal"
    subnet_id                     = azurerm_subnet.sub-db01.id
    private_ip_address_allocation = "Dynamic"
  }

}


resource "azurerm_windows_virtual_machine" "VmSql" {
  name = "VmSql"
  resource_group_name = azurerm_resource_group.RG01.name
  location = azurerm_resource_group.RG01.location
  size = "Standard_B1s"
  admin_username = "rafael.admin"
  admin_password = "@#Rafa,321@#"

  network_interface_ids = [ azurerm_network_interface.nic-VmSql.id ]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Premium"
  }

  source_image_reference {
    
  }

}