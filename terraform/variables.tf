variable "deployment_location" {
  description = "Region in which to deploy resources"
  default = "westus2"
}

variable "resource_group_name" {
  description = "Name of resource group containing project resources"
  default = "dev-rg"
}

variable "virtual_network_name" {
  description = "Name of virtual network"
  default = "dev-vnet"
}

variable "general_storage_account_prefix" {
  description = "Prefix for ADLS storage account for general object storage"
  default = "devadls"
}
