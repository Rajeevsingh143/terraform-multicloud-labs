module "axion" {
  source = "../../child_module/azurerm_rg"
  axion  = var.axion
}

module "axion_storage_account" {
  depends_on            = [module.axion]
  source                = "../../child_module/azurerm_storage_account"
  axion_storage_account = var.axion_storage_account
}

module "axion_vnets" {
  depends_on  = [module.axion]
  source      = "../../child_module/azurerm_vnet"
  axion_vnets = var.axion_vnets
}

module "subnet_axion" {
  depends_on   = [module.axion_vnets]
  source       = "../../child_module/azurerm_subnet"
  subnet-axion = var.subnet-axion
}

module "axion_publicip" {
  depends_on = [module.axion]
  source     = "../../child_module/azurerm_pip"
  axion_pip  = var.axion_pip
}

module "axion_nic" {
  depends_on = [module.subnet_axion, module.axion_publicip]
  source     = "../../child_module/azurerm_nic"
  nic-sets   = var.nic-set
}

module "axion_key_vault" {
  depends_on = [module.axion]
  source     = "../../child_module/azurerm_key_vault"
  key_vaults = var.key_vaults
}

module "axion_key_vault_secret" {
  depends_on        = [module.axion_key_vault]
  source            = "../../child_module/azurerm_key_vault_secret"
  key_vault_secrets = var.key_vault_secrets
}

module "linux_vm" {
  depends_on = [
    module.axion_nic,
    module.axion_key_vault_secret
  ]
  source  = "../../child_module/azurerm_virtual_machine"
  linuxvm = var.linuxvm
}