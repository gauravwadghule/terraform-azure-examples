terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.42.0"
    }
  }
  required_version = ">= 0.13"

    backend "azurerm" {
    storage_account_name = "abxterraform"
    container_name       = "terraformstate"
    key                  = "in1.tfstate"
    access_key           = "iQz2E74NPAfNjCfYC7AQW3Gwy9X8ZnjfAtAuVrrvz04deLTVLNvhjlu9ZJKhGKj7kJeIdDD4RHzvKDw5REXX6w=="
  }
}

provider "azurerm" {
  features {}
}
