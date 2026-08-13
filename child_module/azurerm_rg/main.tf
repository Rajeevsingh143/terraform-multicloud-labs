variable "axion" {
  type        = any
  description = "Map of Resource Group configurations"
}

resource "azurerm_resource_group" "axion-rg" {
  for_each = var.axion
  name     = each.value.name
  location = each.value.location
}