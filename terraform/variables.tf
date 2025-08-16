variable "env" {
  description = "Environment in which to deploy resources (dev, test, or prod)"
  default = "dev"
}

variable "deployment_location" {
  description = "Region in which to deploy resources"
  default = "westus2"
}

variable "resource_group_name" {
  description = "Name of resource group containing project resources"
  default = "-rg"
}

variable "virtual_network_name" {
  description = "Name of virtual network"
  default = "-vnet"
}

variable "general_storage_account_prefix" {
  description = "Prefix for ADLS storage account for general object storage"
  default = "adls"
}

variable "uc_storage_account_prefix" {
  description = "Prefix for ADLS storage account for Unity Catalog"
  default = "uc"
}


variable "adf_prefix" {
  description = "Prefix for the ADF instance name"
  default = "-adf-"
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