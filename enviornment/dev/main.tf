
module "honey" {
  source = "../modules/azurerm_resource_group"
  ruhana = var.ruhana
}
module "vnet" {
  source     = "../modules/azurerm_virtual_network"
  depends_on = [module.honey.rg-humana-dev]
  vnets      = var.vnets
}
module "subnet" {
  source     = "../modules/azurerm_subnet"
  depends_on = [module.honey.rg-humana-dev, module.vnet.vnet-humana-dev]
  snets      = var.snets
}
module "pip" {
  depends_on = [module.honey.rg-humana-dev]
  source     = "../modules/azurerm_pip"
  humana_pip = var.humana_pip
}
module "bastion" {
  depends_on = [module.honey.rg-humana-dev, module.vnet.vnet-humana-dev, module.subnet.subnet1, module.pip.humana_pip]
  source     = "../modules/azurerm_bastion"
  bastionset = var.bastionset
}
module "nic" {
  depends_on = [module.honey.rg-humana-dev, module.vnet.vnet-humana-dev, module.subnet.subnet1, module.subnet.subnet2, module.pip.humana_pip, module.bastion.bastion]
  source     = "../modules/azurerm_nic"
  nicset     = var.nicset
}
module "virtual_machine" {
  depends_on = [module.honey.rg-humana-dev, module.vnet.vnet-humana-dev, module.subnet.subnet1, module.subnet.subnet2, module.bastion.bastion, module.nic.nic1]
  source     = "../modules/azurerm_virtual_machine"
  vmset      = var.vmset
}