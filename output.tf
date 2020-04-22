output "media_service_id" {
  value = azurerm_media_services_account.media-service.*.id
}

output "media_service_name" {
  value = azurerm_media_services_account.media-service.*.name
}

output "media_service_rg" {
  value = azurerm_media_services_account.media-service.*.resource_group_name
}

output "media_service_sa_id" {
  value = azurerm_storage_account.sa.*.id
}

output "media_service_sa_name" {
  value = azurerm_storage_account.sa.*.name
}
