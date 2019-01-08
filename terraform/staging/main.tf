variable "staging_admin_username" {}
variable "staging_ssh_key" {}
variable "staging_subscription_id" {}

provider "azurerm" {
  version = "~> 1.17"
  subscription_id = "${var.staging_subscription_id}"
}

module "azure_vm_staging" {
  source = "../modules/azure_vm"

  admin_username = "${var.staging_admin_username}"
  computer_name = "dokku"
  domain_name_label_prefix = "kabisa-dokku-demo"
  env = "staging"
  http-whitelist-port-ranges = ["80", "8000"]
  resource_group_name = "eu-staging"
  ssh_key_data = "${file(var.staging_ssh_key)}"
}
