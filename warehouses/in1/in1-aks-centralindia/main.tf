
module "aks" {
    source = "../../../modules/aks"
    name = "in1-aks-centralindia"
    location = "centralindia"
    resource_group_name = var.rg_name
    dns_prefix = "in1-aks-centralindia"
    appId = var.appId
    password = var.password
    default_node_pool_vm_size = "Standard_D2a_v4"
    default_node_pool_node_count = 1
}