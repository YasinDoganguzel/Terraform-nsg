resource "azurerm_network_security_group" "nsg" {
  name                = "yasin-nsg"
  location            = "East US"
  resource_group_name = "yasin-rg"
}

resource "azurerm_network_security_rule" "allow_http" {
  for_each                    = {
    "Allow-HTTP" = {
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
  }

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = "yasin-rg"
  network_security_group_name = azurerm_network_security_group.nsg.name
}
