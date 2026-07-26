ruhana = {
  rg1 = {
    name     = "rg-humana-dev"
    location = "westus"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-humana-dev"
    resource_group_name = "rg-humana-dev"
    location            = "westus"
    address_space       = ["10.143.0.0/16"]
  }
}

snets = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-humana-dev"
    virtual_network_name = "vnet-humana-dev"
    address_prefixes     = ["10.143.1.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-humana-dev"
    virtual_network_name = "vnet-humana-dev"
    address_prefixes     = ["10.143.2.0/24"]
  }
  bastion_subnet = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-humana-dev"
    virtual_network_name = "vnet-humana-dev"
    address_prefixes     = ["10.143.3.0/28"]
  }
}


humana_pip = {
  pip1 = {
    name                = "humana-pip"
    location            = "westus"
    resource_group_name = "rg-humana-dev"
    public_ip = {
      allocation_method = "Static"
      sku               = "Standard"
    }
  }
   pip2 = {
    name                = "humana-pip-2"
    location            = "westus"
    resource_group_name = "rg-humana-dev"
    public_ip = {
      allocation_method = "Static"
      sku               = "Standard"
    }
  }
}
bastionset = {
  bastion1 = {
    name                = "bastion-humana-dev"
    location            = "westus"
    resource_group_name = "rg-humana-dev"
    ip_configuration = {
      name                 = "ipconfig1"
      subnet_id            = "/subscriptions/a7c52d88-02c2-4bbb-9c50-637fa4f2b52e/resourceGroups/rg-humana-dev/providers/Microsoft.Network/virtualNetworks/vnet-humana-dev/subnets/AzureBastionSubnet"
      public_ip_address_id = "/subscriptions/a7c52d88-02c2-4bbb-9c50-637fa4f2b52e/resourceGroups/rg-humana-dev/providers/Microsoft.Network/publicIPAddresses/humana-pip"
    }
  }
}
nicset = {
  nic1 = {
    name                = "nic-humana-dev-1"
    location            = "westus"
    resource_group_name = "rg-humana-dev"
    ip_configuration = {
      name                          = "ipconfig1"
      subnet_id                     = "/subscriptions/a7c52d88-02c2-4bbb-9c50-637fa4f2b52e/resourceGroups/rg-humana-dev/providers/Microsoft.Network/virtualNetworks/vnet-humana-dev/subnets/frontend-subnet"
      private_ip_address_allocation = "Dynamic"
      # public_ip_address_id          = "/subscriptions/a7c52d88-02c2-4bbb-9c50-637fa4f2b52e/resourceGroups/rg-humana-dev/providers/Microsoft.Network/publicIPAddresses/humana-pip2"
    }
  }
}
vmset = {
  vm1 = {
    name                  = "vm-humana-dev"
    resource_group_name   = "rg-humana-dev"
    location              = "westus"
    network_interface_ids = ["/subscriptions/a7c52d88-02c2-4bbb-9c50-637fa4f2b52e/resourceGroups/rg-humana-dev/providers/Microsoft.Network/networkInterfaces/nic-humana-dev-1"]
    size               = "Standard_D2s_v3"
    storage_image_reference = {
      publisher = "canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
    storage_os_disk = {
      name              = "vm-humana-dev-osdisk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile = {
      computer_name  = "vm-linux-humana-dev"
      admin_username = "devopsinsider"
      admin_password = "Krystal@8612"
    }
    os_profile_linux_config = {
      disable_password_authentication = false
    }
  }
}