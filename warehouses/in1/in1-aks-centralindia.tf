


module "aks" {
    source = "../../modules/aks"
    name = var.aks_name
    location = var.aks_location
    resource_group_name = azurerm_resource_group.rg.name
    dns_prefix = "in1-aks-centralindia"
    default_node_pool_vm_size = var.default_node_pool_vm_size
    default_node_pool_node_count = 1
    appId = var.appId
    password = var.password
}