axion = {
  rg1 = {
    name     = "rajeev_axion"
    location = "westus"
  }
}

axion_storage_account = {
  sa1 = {
    name                     = "rajeevaxionsa1"
    resource_group_name      = "rajeev_axion"
    location                 = "westus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

axion_vnets = {
  vnet1 = {
    name                = "rajeev_axion_vnet"
    address_space       = ["10.198.0.0/20"]
    location            = "westus"
    resource_group_name = "rajeev_axion"
  }
}

subnet-axion = {
  subnet1 = {
    name                 = "rajeev_axion_subnet"
    resource_group_name  = "rajeev_axion"
    virtual_network_name = "rajeev_axion_vnet"
    address_prefixes     = ["10.198.1.0/25"]
  }
}

axion_pip = {
  pip1 = {
    name                = "rajeev_axion_pip"
    location            = "westus"
    resource_group_name = "rajeev_axion"
    allocation_method   = "Static"
  }
}

nic-set = {
  nic1 = {
    nic_name                 = "rajeev_axion_nic"
    nic_location             = "westus"
    nic_resource_group_name  = "rajeev_axion"
    nic_vnet_name            = "rajeev_axion_vnet"
    nic_subnet_name          = "rajeev_axion_subnet"
    nic_public_ip_address_id = "rajeev_axion_pip"
  }
}

key_vaults = {
  kv1 = {
    name                = "rajeev-axion-kv-01"
    location            = "westus"
    resource_group_name = "rajeev_axion"
  }
}

key_vault_secrets = {
  secret1 = {
    name              = "vm-admin-username-v1"
    value             = "devopsindsider"
    key_vault_name    = "rajeev-axion-kv-01"
    key_vault_rg_name = "rajeev_axion"
  }
  secret2 = {
    name              = "vm-admin-password-v1"
    value             = "ChangeMeInCISecrets!123" # Pass securely or via TF_VAR_key_vault_secrets / CI secrets
    key_vault_name    = "rajeev-axion-kv-01"
    key_vault_rg_name = "rajeev_axion"
  }
}

linuxvm = {
  vm1 = {
    vm_name                 = "rajeevvm1"
    vm_resource_group_name  = "rajeev_axion"
    vm_location             = "westus"
    vm_size                 = "Standard_D2s_v3"
    image_publisher         = "Canonical"
    image_offer             = "0001-com-ubuntu-server-jammy"
    image_sku               = "22_04-lts"
    image_version           = "latest"
    nic_name                = "rajeev_axion_nic"
    nic_resource_group_name = "rajeev_axion"
    kv_name                 = "rajeev-axion-kv-01"
    kv_resource_group_name  = "rajeev_axion"
    secret_username_name    = "vm-admin-username-v1"
    secret_password_name    = "vm-admin-password-v1"
  }
}
