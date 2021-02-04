
  provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "in1-storage"
  location = "centralindia"
}

module "in1-storage-centralindia" {
    source = "../../../modules/storage-account"
    storage_account_name = "abxin1"
    rg_name = azurerm_resource_group.rg.name
    rg_location = "centralindia"
}