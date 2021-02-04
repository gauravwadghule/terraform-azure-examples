
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


resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}

module "in1-aks-centralindia" {
    source = "./in1-aks-centralindia"
    appId = var.appId
    password = var.password
    rg_name = azurerm_resource_group.rg.name
}

module "in1-storage-centralindia" {
    source = "./in1-storage-centralindia"
    rg_name = azurerm_resource_group.rg.name
}
