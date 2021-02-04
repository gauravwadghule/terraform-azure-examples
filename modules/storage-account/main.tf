terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.42.0"
    }
  }
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "azure_storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.rg_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}