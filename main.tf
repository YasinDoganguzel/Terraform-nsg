provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "yasin-resource-group"
  location = "East US"
}

module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = "Yasin-vnet"
  vnet_location       = "East US"
  resource_group_name = azurerm_resource_group.rg.name
  vnet_address_space  = ["10.0.0.0/16"]
  subnets = {
    "yasin-subnet1" = "10.0.1.0/24"
    "yasin-subnet2" = "10.0.2.0/24"
  }
}
module "nsg" {
  source              = "./modules/nsg"
  nsg_name            = "example-nsg"                    
  location            = azurerm_resource_group.rg.location 
  resource_group_name = azurerm_resource_group.rg.name    

  security_rules = [
    {
      name                        = "Allow-HTTP"
      priority                    = 100
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_range           = "*"
      destination_port_range      = "80"
      source_address_prefix       = "*"
      destination_address_prefix  = "*"
    }
  ]
}