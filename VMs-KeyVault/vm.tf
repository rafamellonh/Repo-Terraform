resource "azurerm_windows_virtual_machine" "vm2019" {
  depends_on            = [azurerm_key_vault.key01]
  admin_password        = azurerm_key_vault_secret.senhaVms.value
  admin_username        = azurerm_key_vault_secret.senhaVms.name
  location              = var.location
  name                  = var.vm-2019
  network_interface_ids = [azurerm_network_interface.nic2010.id]
  resource_group_name   = "value"
  size                  = "value"
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

resource "azurerm_network_interface" "nic2010" {
  location            = var.location
  name                = "vm-2019"
  resource_group_name = var.rg-name
  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnet.id
    public_ip_address_id          = azurerm_public_ip.pip2010.id
  }

}

resource "azurerm_public_ip" "pip2010" {
  allocation_method   = "Dynamic"
  location            = var.location
  name                = "pip2019"
  resource_group_name = var.rg-name

}