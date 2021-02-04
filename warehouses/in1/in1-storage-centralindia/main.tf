module "in1-storage-centralindia" {
    source = "../../../modules/storage-account"
    storage_account_name = "abxin1"
    rg_name = var.rg_name
    rg_location = "centralindia"
}