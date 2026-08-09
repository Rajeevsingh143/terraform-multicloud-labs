variable "axion_vnets"{}

resource "azurerm_virtual_network" "axion_vnet"{
    for_each = var.axion_vnets
  name                = each.value.name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}