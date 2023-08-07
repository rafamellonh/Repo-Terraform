resource "azurerm_windows_virtual_machine" "vm" {
  admin_password        = var.pass-admin
  admin_username        = var.user-admin
  location              = "eastus"
  name                  = var.name-vm
  network_interface_ids = [azurerm_network_interface.nic.id]
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
  location            = "eastus"
  name                = "${var.name-vm}-nic"
  resource_group_name = azurerm_resource_group.rg01.name

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.sub01.id
    public_ip_address_id          = azurerm_public_ip.pip-vm.id
  }

}

resource "azurerm_public_ip" "pip-vm" {
  allocation_method   = "Dynamic"
  location            = "eastus"
  name                = "pip-${var.name-vm}"
  resource_group_name = azurerm_resource_group.rg01.name

}

resource "null_resource" "install-iis" {

  provisioner "remote-exec" {
    inline = ["add-windowsfeature -name web-server "
    ]

  }

  connection {
    type     = "winrm"
    port = "5985"
    https = false
    host     = azurerm_public_ip.pip-vm.ip_address
    user     = azurerm_windows_virtual_machine.vm.admin_username
    password = azurerm_windows_virtual_machine.vm.admin_password
    timeout  = "2m"
  }

}