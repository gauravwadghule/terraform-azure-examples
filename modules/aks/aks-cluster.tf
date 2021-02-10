
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.42.0"
    }
  }

  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name            = var.default_node_pool_name
    node_count      = var.default_node_pool_node_count
    vm_size         = var.default_node_pool_vm_size
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control {
    enabled = true
  }

  addon_profile {
    kube_dashboard {
      enabled = true
    }
  }
}

provider "helm" {
  version = "~> 1.0"
  kubernetes {
    host = azurerm_kubernetes_cluster.default.kube_config[0].host

    client_key             = base64decode(azurerm_kubernetes_cluster.default.kube_config[0].client_key)
    client_certificate     = base64decode(azurerm_kubernetes_cluster.default.kube_config[0].client_certificate)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.default.kube_config[0].cluster_ca_certificate)
  
  }
}


resource "helm_release" "nginix_ingress" {
    name      = "nginix_ingress"
    repository = "https://kubernetes-charts.storage.googleapis.com"
    chart     = "nginx-ingress"
    namespace = "default"
}