
module "in1-aks-centralindia" {
    source = "./in1-aks-centralindia"
    appId = var.appId
    password = var.password
}

module "in1-storage-centralindia" {
    source = "./in1-storage-centralindia"
}
