resource "azurerm_databricks_workspace" "databricks_workspace" {
  name                = "${var.env}-workspace"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.deployment_location
  sku                 = "premium"

  tags = {
    Environment = var.env
  }
}


resource "azurerm_databricks_access_connector" "databricks_connector" {
  name                = "${var.env}-databricks-connector-${random_string.random_suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.deployment_location

  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.primary_service_principal.id]
  }

  tags = {
    Environment = var.env
  }
}

# Metastore can't be created because personal account can't authenticate to it
# resource "databricks_metastore" "metastore" {
#   name = "metastore"
#   storage_root = format("abfss://%s@%s.dfs.core.windows.net/",
#     azurerm_storage_container.uc_metastore.name,
#   azurerm_storage_account.uc_storage.name)
#   region        = var.deployment_location
#   force_destroy = true
# }

# resource "databricks_metastore_data_access" "metastore_access" {
#   metastore_id = databricks_metastore.metastore.id
#   name         = "metastore_access"
#   azure_managed_identity {
#     access_connector_id = azurerm_databricks_access_connector.databricks_connector.id
#   }
#   is_default = true
# }