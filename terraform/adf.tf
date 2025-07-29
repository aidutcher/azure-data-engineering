resource "azurerm_data_factory" "adf" {
  name                = "${var.adf_prefix}${random_string.random_suffix.result}"
  location            = var.deployment_location
  resource_group_name = azurerm_resource_group.rg.name
}
