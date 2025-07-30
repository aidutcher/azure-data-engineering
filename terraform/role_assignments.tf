data "azurerm_subscription" "primary" {
}

resource "azurerm_role_definition" "primary-sp-role" {
  name        = "primary-sp-role"
  scope       = data.azurerm_subscription.primary.id
  description = "This is a custom role created via Terraform"

  permissions {
    actions     = ["*"]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id
  ]
}

resource "azurerm_role_assignment" "primary-sp-role-assign" {
  scope              = data.azurerm_subscription.primary.id
  role_definition_id = azurerm_role_definition.primary-sp-role.role_definition_resource_id
  principal_id       = azurerm_user_assigned_identity.primary-service-principal.id
}