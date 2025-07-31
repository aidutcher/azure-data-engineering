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
