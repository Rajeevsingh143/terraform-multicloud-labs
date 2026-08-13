variable "axion" {
  type        = any
  description = "Resource Group configuration map"
}

variable "axion_vnets" {
  type        = any
  description = "Virtual Network configuration map"
}

variable "subnet-axion" {
  type        = any
  description = "Subnet configuration map"
}

variable "axion_storage_account" {
  type        = any
  description = "Storage Account configuration map"
}

variable "axion_pip" {
  type        = any
  description = "Public IP configuration map"
}

variable "nic-set" {
  type        = any
  description = "Network Interface configuration map"
}

variable "key_vaults" {
  type        = any
  description = "Key Vault configuration map"
}

variable "key_vault_secrets" {
  type        = any
  description = "Key Vault Secret configuration map"
}

variable "linuxvm" {
  type        = any
  description = "Linux Virtual Machine configuration map"
}