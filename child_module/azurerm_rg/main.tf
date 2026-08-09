variable "axion" {}

resource "azurerm_resource_group" "axion-rg" {
  for_each = var.axion
  name     = each.value.name
  location = each.value.location
}