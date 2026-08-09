data "azurerm_network_interface" "nic" {
  for_each            = var.linuxvm
  name                = each.value.nic_name
  resource_group_name = each.value.nic_resource_group_name
}

data "azurerm_key_vault" "kv" {
  for_each            = var.linuxvm
  name                = each.value.kv_name
  resource_group_name = each.value.kv_resource_group_name
}

data "azurerm_key_vault_secret" "admin_username" {
  for_each     = var.linuxvm
  name         = each.value.secret_username_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "admin_password" {
  for_each     = var.linuxvm
  name         = each.value.secret_password_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}