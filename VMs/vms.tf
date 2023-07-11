
## VM 2016
resource "azurerm_windows_virtual_machine" "vm2016" {
  admin_password        = "@#Rafa,321@#"
  admin_username        = "rafael.admin"
  location              = var.location
  name                  = var.vm-2016
  network_interface_ids = [azurerm_network_interface.nic2016.id]
  resource_group_name   = var.rg-name
  size                  = "Standard_DS1_v2"
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


resource "azurerm_network_interface" "nic2016" {
  location            = var.location
  name                = "${var.vm-2016}-NIC"
  resource_group_name = var.rg-name
  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnet.id
  }

}

## VM 2019
resource "azurerm_windows_virtual_machine" "vm2019" {
  admin_password        = "@#Rafa,321@#"
  admin_username        = "rafael.admin"
  location              = var.location
  name                  = var.vm-2019
  network_interface_ids = [azurerm_network_interface.nic2019.id]
  resource_group_name   = var.rg-name
  size                  = "Standard_DS1_v2"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

}

resource "azurerm_network_interface" "nic2019" {
  location            = var.location
  name                = "${var.vm-2019}-NIC"
  resource_group_name = var.rg-name
  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnet.id
  }

}

## VM 2022

resource "azurerm_windows_virtual_machine" "vm2022" {
  admin_password        = "@#Rafa,321@#"
  admin_username        = "rafael.admin"
  location              = var.location
  name                  = var.vm-2022
  network_interface_ids = [azurerm_network_interface.nic2022.id]
  resource_group_name   = var.rg-name
  size                  = "Standard_DS1_v2"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }

}

resource "azurerm_network_interface" "nic2022" {
  location            = var.location
  name                = "${var.vm-2022}-NIC"
  resource_group_name = var.rg-name
  ip_configuration {
    name                          = "Internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnet.id
  }

}

## VM LINUX

resource "azurerm_linux_virtual_machine" "vmlinux" {
  admin_username                  = "rafaeladmin"
  admin_password                  = "@#Rafa,321@#"
  disable_password_authentication = false
  location                        = var.location
  name                            = var.vm-ubuntu
  network_interface_ids           = [azurerm_network_interface.nicLinux.id]
  resource_group_name             = var.rg-name
  size                            = "Standard_DS1_v2"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-LTS"
    version   = "latest"
  }


}

resource "azurerm_network_interface" "nicLinux" {
  location            = var.location
  name                = var.vm-ubuntu
  resource_group_name = var.rg-name
  ip_configuration {
    name                          = "Internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnet.id
  }

}
