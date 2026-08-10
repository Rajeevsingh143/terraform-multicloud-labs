resource "azurerm_network_interface" "axion_nic-sets" {
  for_each            = var.nic-sets
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.nic_resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet-axion[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.axion_pip[each.key].id
  }
}