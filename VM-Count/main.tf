provider "azurerm" {
  features {
  }

}

resource "azurerm_resource_group" "rg01" {
  location = "eastus"
  name     = "rg01"



}
