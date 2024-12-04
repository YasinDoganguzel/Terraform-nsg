resource "azurerm_network_security_group" "nsg" {
  name                = "example-nsg"
  location            = "East US"
  resource_group_name = "example-rg"
}

resource "azurerm_network_security_rule" "allow_http" {
  for_each                    = { for rule in var.security_rules : rule.name => rule }

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = "example-rg"
  network_security_group_name = azurerm_network_security_group.nsg.name
}
