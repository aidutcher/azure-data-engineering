resource "azurerm_key_vault" "key_vault" {
  name                        = "${var.env}${var.general_key_vault_prefix}${random_string.random_suffix.result}"
  location                    = var.deployment_location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = var.azure_tenant_id
  rbac_authorization_enabled  = false
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
}  