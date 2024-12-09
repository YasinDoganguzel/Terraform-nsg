variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_location" {
  description = "The location of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "subnets" {
  description = "The subnets in the virtual network"
  type        = map(string)
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}

variable "nsg_location" {
  description = "The location of the network security group"
  type        = string
}

variable "security_rules" {
  description = "The security rules for the network security group"
  type        = list(object({
    name                        = string
    priority                    = number
    direction                   = string
    access                      = string
    protocol                    = string
    source_port_range           = string
    destination_port_range      = string
    source_address_prefix       = string
    destination_address_prefix  = string
  }))
}
