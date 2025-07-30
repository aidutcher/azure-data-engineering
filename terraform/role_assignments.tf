data "azurerm_subscription" "primary" {
}

data "azurerm_client_config" "client_config" {
}


resource "azurerm_role_definition" "primary_sp_role" {
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

resource "azurerm_role_assignment" "sp_subscription_contributor" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.primary_service_principal.principal_id
}

resource "azurerm_role_assignment" "sp_storage_blob_contributor" {
  scope                = azurerm_storage_account.adls.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.primary_service_principal.principal_id
}s

resource "azurerm_role_assignment" "sp_storage_queue_contributor" {
  scope                = azurerm_storage_account.adls.id
  role_definition_name = "Storage Queue Data Contributor"
  principal_id         = azurerm_user_assigned_identity.primary_service_principal.principal_id
}

resource "azurerm_role_assignment" "sp_storage_eventgrid_event_contributor" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "EventGrid EventSubscription Contributor"
  principal_id         = azurerm_user_assigned_identity.primary_service_principal.principal_id
}