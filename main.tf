module "aks" {
    source = "./warehouses"
    appId     = var.appId
    password = var.password
}