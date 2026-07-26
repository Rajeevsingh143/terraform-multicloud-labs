variable "ruhana" {}

resource "azurerm_resource_group" "rg-honey" {
  for_each = var.ruhana
  name     = each.value.name
  location = each.value.location
  
}