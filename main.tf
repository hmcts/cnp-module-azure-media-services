provider "azurerm" {
  features {}
}

locals {
  rg_name      = "${var.product}-media-service-${var.env}"
  sa_name      = "${var.product}mediaservice${var.env}"
  service_name = "${var.product}mediaservice${var.env}"
}

resource "azurerm_resource_group" "rg" {
  count    = var.enabled ? 1 : 0
  name     = local.rg_name
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_storage_account" "sa" {
  count                    = var.enabled ? 1 : 0
  name                     = local.sa_name
  resource_group_name      = azurerm_resource_group.rg.0.name
  location                 = azurerm_resource_group.rg.0.location
  tags                     = var.common_tags
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_media_services_account" "media-service" {
  count               = var.enabled ? 1 : 0
  name                = local.service_name
  resource_group_name = azurerm_resource_group.rg.0.name
  location            = azurerm_resource_group.rg.0.location

  storage_account {
    id         = azurerm_storage_account.sa.0.id
    is_primary = true
  }
}
