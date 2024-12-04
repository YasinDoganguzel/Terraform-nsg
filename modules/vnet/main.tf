resource "azurerm_virtual_network" "vnet" {
  name                = "yasin-vnet"
  location            = "East US"
  resource_group_name = "example-rg"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "yasin-subnet1"
  resource_group_name  = "yasin-rg"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "yasin-subnet2"
  resource_group_name  = "yasin-rg"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
