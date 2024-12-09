provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Virtual Network Module
module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet_name
  vnet_location       = var.vnet_location
  resource_group_name = var.resource_group_name
  vnet_address_space  = var.vnet_address_space
  subnets             = var.subnets
}

# Network Security Group Module
module "nsg" {
  source              = "./modules/nsg"
  nsg_name            = var.nsg_name
  location            = var.nsg_location
  resource_group_name = var.resource_group_name
  security_rules      = var.security_rules
}
