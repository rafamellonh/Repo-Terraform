resource "azurerm_windows_virtual_machine" "vm" {
  count                 = var.count-add
  admin_password        = "@#Rafa,321@#"
  admin_username        = "rafael.admin"
  location              = "eastus"
  name                  = "${var.name-vm}-${count.index}"
  network_interface_ids = [azurerm_network_interface.nic[count.index].id ]
  resource_group_name   = azurerm_resource_group.rg01.name
  size                  = var.sku-vm
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

resource "azurerm_network_interface" "nic" {
  count               = var.count-add
  location            = "eastus"
  name                = "${var.name-vm}-nic-${count.index}"
  resource_group_name = azurerm_resource_group.rg01.name
  
  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id = azurerm_subnet.sub01.id
  }

}