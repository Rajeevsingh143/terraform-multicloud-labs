terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.74.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformstate1"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }
}
provider "azurerm" {
  features {}
}