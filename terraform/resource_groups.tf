# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.deployment_location

  tags = {
    environment = "dev"
  }
}