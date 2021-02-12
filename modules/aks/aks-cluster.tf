
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

resource "null_resource" "get_context" {
    provisioner "local-exec" {
        command = "az aks get-credentials --resource-group ${azurerm_kubernetes_cluster.default.resource_group_name} --name ${azurerm_kubernetes_cluster.default.name} --overwrite-existing"
    } 

    depends_on = [azurerm_kubernetes_cluster.default]
}

resource "null_resource" "install_nginx_ingress_controller" {
    provisioner "local-exec" {
        command = "kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.44.0/deploy/static/provider/cloud/deploy.yaml"
    } 

    depends_on = [null_resource.get_context]
}

// provider "kubernetes" {
//   host = azurerm_kubernetes_cluster.default.kube_config.0.host

//   username = azurerm_kubernetes_cluster.default.kube_config.0.username
//   password = azurerm_kubernetes_cluster.default.kube_config.0.password
// }


// provider "helm" {
//   debug = true
//   kubernetes {
//     host = azurerm_kubernetes_cluster.default.kube_config[0].host

//     client_key             = base64decode(azurerm_kubernetes_cluster.default.kube_config[0].client_key)
//     client_certificate     = base64decode(azurerm_kubernetes_cluster.default.kube_config[0].client_certificate)
//     cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.default.kube_config[0].cluster_ca_certificate)
  
//   }
// }


// resource "helm_release" "nginix_ingress" {
//     name      = "nginix_ingress"
//     repository = "https://kubernetes-charts.storage.googleapis.com"
//     chart     = "nginx-ingress"
//     namespace = "default"
// }

// resource helm_release nginx_ingress {
//   name       = "nginx-ingress-controller"

//   repository = "https://charts.bitnami.com/bitnami"
//   chart      = "nginx-ingress-controller"
//   verify     = false
//   namespace  = "kube-system"
  
// }