resource "azurerm_user_assigned_identity" "primary-service-principal" {
  location            = var.deployment_location
  name                = "primary-service-principal"
  resource_group_name = azurerm_resource_group.rg.name
}