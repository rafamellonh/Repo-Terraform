resource "azurerm_windows_virtual_machine" "vm-front" {
  admin_password        = azurerm_key_vault_secret.rafaeladmin.value
  admin_username        = azurerm_key_vault_secret.rafaeladmin.name
  location              = var.location-prd
  name                  = var.vm-front
  network_interface_ids = [azurerm_network_interface.nic-front.id]
  resource_group_name   = azurerm_resource_group.RG-PRD.name
  size                  = "Standard_DS1_v2"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "nic-front" {
  location            = var.location-prd
  name                = "${var.vm-front}-NIC"
  resource_group_name = azurerm_resource_group.RG-PRD.name
  ip_configuration {
    name                          = "Internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.sub-front.id
  }

}

provisioner "remote-exec" {

inline = [
#Script VM-WEB
# Instalar IIS com Management Tools
"Add-WindowsFeature Web-Server -IncludeManagementTools",

# Remover a pagina iisstart 
"remove-item C:\\inetpub\\wwwroot\\iisstart.htm",

# Configurar as paginas Default
"Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value \"SITE -- $($env:computername)\""

]

}