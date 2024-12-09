resource_group_name      = "yasin-resource-group"
resource_group_location  = "East US"

vnet_name           = "Yasin1-vnet"
vnet_location       = "East US"
vnet_address_space  = ["10.0.0.0/16"]
subnets = {
  "yasin-subnet1" = "10.0.1.0/24"
  "yasin-subnet2" = "10.0.2.0/24"
}

nsg_name       = "example-nsg"
nsg_location   = "East US"
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
