resource "azurerm_data_factory" "adf" {
  name                = "${var.adf_prefix}${random_string.random_suffix.result}"
  location            = var.deployment_location
  resource_group_name = azurerm_resource_group.rg.name
  github_configuration {
    account_name    = var.adf_github_account_name
    branch_name     = "main"
    git_url         = var.adf_github_url
    repository_name = var.adf_github_repo_name
    root_folder     = "adf"
  }
}

resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "adls-linked-service" {
  name                = "LS_ADLS"
  data_factory_id     = azurerm_data_factory.adf.id
  storage_account_key = azurerm_storage_account.adls.primary_access_key
  url                 = azurerm_storage_account.adls.primary_dfs_endpoint
}
