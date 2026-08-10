variable "axion_pip" {}
resource "azurerm_public_ip" "axion_pip" {
  for_each            = var.axion_pip
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method

}