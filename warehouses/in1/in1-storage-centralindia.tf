module "in1-storage-centralindia" {
    source = "../../modules/storage-account"
    storage_account_name = var.storage_account_name
    rg_name = azurerm_resource_group.rg.name
    rg_location = var.rg_location
}