# Generate random value for the storage account name
resource "random_string" "random_suffix" {
  length  = 8
  lower   = true
  numeric = false
  special = false
  upper   = false
}

# Create an ADLS Gen2 storage account with raw and transformed containers
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
