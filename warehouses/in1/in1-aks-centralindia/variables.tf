variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}


variable "rg_location" {
    description = "Loaction for resource group"
    default = "centralindia"
}

variable "rg_name" {
    description = "Name for the resource group"
  
}