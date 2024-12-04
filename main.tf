provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "yasin-resource-group"
  location = "East US"
}


module "vnet" {
  source = "./modules/vnet"
}

module "nsg" {
  source = "./modules/nsg"

}
