variable "humana_pip" {}
resource "azurerm_public_ip" "humana_pip" {
  for_each            = var.humana_pip
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.public_ip.allocation_method
  sku                 = each.value.public_ip.sku
}
