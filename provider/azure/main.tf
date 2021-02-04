provider "azurerm" {
    version = "2.6.0"
    client_id = "${var.client_id}"
    client_secret = "${var.client_secret}"
    tenant_id = "${var.tenant_id}"
    subscription_id = "${var.subscription_id}"
    features {}
}

output "client_id" {
  value = "${var.client_id}"
}
output "client_secret" {
  value = "${var.client_secret}"
}
output "tenant_id" {
  value = "${var.tenant_id}"
}