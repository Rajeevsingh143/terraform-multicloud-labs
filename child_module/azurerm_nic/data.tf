
data "azurerm_subnet" "subnet-axion" {
  for_each             = var.nic-sets
  name                 = each.value.nic_subnet_name
  virtual_network_name = each.value.nic_vnet_name
  resource_group_name  = each.value.nic_resource_group_name
}

data "azurerm_public_ip" "axion_pip" {
  for_each            = var.nic-sets
  name                = each.value.nic_public_ip_address_id
  resource_group_name = each.value.nic_resource_group_name
}