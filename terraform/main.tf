# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.deployment_location

  tags = {
    environment = "dev"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = var.deployment_location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    environment = "dev"
  }
}

# Generate random value for the storage account name
resource "random_string" "random_suffix" {
  length  = 8
  lower   = true
  numeric = false
  special = false
  upper   = false
}

# Create an ADLS Gen2 storage account
# Using cool access tier and locally redundant storage for cost control
resource "azurerm_storage_account" "adls" {
  name                     = "${var.general_storage_account_prefix}${random_string.random_suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.deployment_location
  account_tier             = "Standard"
  access_tier              = "Cool"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_container" "raw" {
  name                  = "raw"
  storage_account_name    = azurerm_storage_account.adls.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "transformed" {
  name                  = "transformed"
  storage_account_name    = azurerm_storage_account.adls.name
  container_access_type = "private"
}

resource "azurerm_data_factory" "adf" {
  name                = "${var.adf_prefix}${random_string.random_suffix.result}"
  location            = var.deployment_location
  resource_group_name = azurerm_resource_group.rg.name
}
