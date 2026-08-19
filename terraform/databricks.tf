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
    type         = "SystemAssigned, UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.databricks_service_principal.id]
  }

  tags = {
    Environment = var.env
  }
}
