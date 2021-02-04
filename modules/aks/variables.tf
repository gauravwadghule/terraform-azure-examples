variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "name" {
  description = "Name for the cluster"
}

variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Location of the AKS"
}

variable "dns_prefix" {
  description = "DNS prefix for AKS"
}

variable "default_node_pool_name" {
  description = "Name for nodepool"
  default = "default"
}

variable "default_node_pool_node_count" {
  description = "Name for nodepool"
  default = 1
}

variable "default_node_pool_vm_size" {
  description = "Name for nodepool"
  default = "Standard_D2a_v4"
}

