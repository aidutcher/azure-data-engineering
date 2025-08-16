output "resource_name_random_string" {
  value = random_string.random_suffix.id
}

output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "general_adls_account_name" {
  value = azurerm_storage_account.adls.name
}

output "unity_catalog_adls_account_name" {
  value = azurerm_storage_account.uc_storage.name
}

output "adf_instance_name" {
  value = azurerm_data_factory.adf.name
}

