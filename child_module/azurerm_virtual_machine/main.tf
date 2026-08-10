variable "linuxvm" {}

resource "azurerm_linux_virtual_machine" "linuxvm" {
  for_each                        = var.linuxvm
  name                            = each.value.vm_name
  resource_group_name             = each.value.vm_resource_group_name
  location                        = each.value.vm_location
  size                            = each.value.vm_size
  admin_username                  = data.azurerm_key_vault_secret.admin_username[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.admin_password[each.key].value
  disable_password_authentication = false
  network_interface_ids           = [data.azurerm_network_interface.nic[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }
  custom_data = base64encode(file("${path.root}/cloud-init.yaml"))

}
