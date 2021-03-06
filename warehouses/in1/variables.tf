variable "rg_location" {
    description = "Loaction for resource group"
}

variable "rg_name" {
    description = "Name for resource group"
}
variable "default_node_pool_vm_size" {
    description = "Node size of vm"
}
variable "aks_name" {
    description = "AKS name"
}
variable "aks_location" {
    description = "AKS location"
}
variable "aks_name_eastus2" {
    description = "AKS name"
}
variable "aks_location_eastus2" {
    description = "AKS location"
}

variable "storage_account_name" {
    description = "AKS location"
}

variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}




