variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_location" {
  description = "The location of the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
}

variable "subnets" {
  description = "A map of subnets with their address prefixes"
  type        = map(string)
}
