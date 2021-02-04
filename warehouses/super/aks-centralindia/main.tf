
module "rg" {
    source = "../../../modules/rg"
    rg_location = "centralindia"
    rg_name = "super-aks"
}

module "aks" {
    source = "../../../modules/aks"
    name = "super-aks-centralindia"
    location = "centralindia"
    resource_group_name = "super-aks"
    dns_prefix = "super-aks-centralindia"
    appId = var.appId
    password = var.password
    default_node_pool_vm_size = "Standard_D2a_v4"
    default_node_pool_node_count = 1
}