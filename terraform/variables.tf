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

variable "adf_prefix" {
  description = "Prefix for the ADF instance name"
  default = "dev-adf-"
}

variable "adf_github_account_name" {
  description = "Name of the GitHub account associated with the ADF instance"
}

variable "adf_github_url" {
  description = "URL for GitHub account associated with ADF instance"
}

variable "adf_github_repo_name" {
  description = "Repository name associated with ADF instance"
}