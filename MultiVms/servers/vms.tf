resource "azurerm_resource_group" "rg01" {
  name = "rg01"
  location = "eastus"
}

resource "azurerm_windows_virtual_machine" "vm01" {
    count = var.servers
    name = "vm01-${count.index}"
    resource_group_name = azurerm_resource_group.rg01.name
    location = azurerm_resource_group.rg01.location
    admin_username = "rafael.admin"
    admin_password = "@#Rafa,321@#"
    size = "Standard_DS1_v2"

    network_interface_ids = [ azurerm_network_interface.nic01[count.index].id ]

    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"

    }

    source_image_reference {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2019-Datacenter"
      version = "latest"
    }
}