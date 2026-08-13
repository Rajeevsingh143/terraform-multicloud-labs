variable "key_vault_secrets" {
  type        = any
  description = "Map of Key Vault Secret configurations"
}

data "azurerm_key_vault" "kv" {
  for_each            = var.key_vault_secrets
  name                = each.value.key_vault_name
  resource_group_name = each.value.key_vault_rg_name
}

resource "azurerm_key_vault_secret" "kvs" {
  for_each     = var.key_vault_secrets
  name         = each.value.name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
