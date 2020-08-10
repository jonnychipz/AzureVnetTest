provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "jonnychips-rg"
  location = "uk west"
}

module "vnet" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["172.16.0.0/16"]
  subnet_prefixes     = ["172.16.0.0/24", "172.16.1.0/24", "172.16.2.0/24"]
  subnet_names        = ["default", "servers", "clients"]

  tags = {
    Creator= "Jonnychipz"
    Purpose  = "VNET Test"

    Department = "IT"
    Cost Centre = "12345"
  }
}