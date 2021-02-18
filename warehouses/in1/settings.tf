terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.42.0"
    }
  }
  required_version = ">= 0.13"

    backend "azurerm" {
    storage_account_name = "yourstorage"
    container_name       = "containername"
    key                  = "statefilename"
    access_key           = "accesskeyforstorage"
  }
}

provider "azurerm" {
  features {}
}
