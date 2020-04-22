locals {
  rg_name      = "${var.product}-media-service-${var.env}"
  sa_name      = "${var.product}mediaservice${var.env}"
  service_name = "${var.product}-media-service-${var.env}"
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.rg_name}"
  location = "${var.location}"
  tags     = "${var.tags}"
}

resource "azurerm_storage_account" "sa" {
  name                     = "${local.sa_name}"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${azurerm_resource_group.rg.location}"
  tags                     = "${var.tags}"
  account_tier             = "${var.account_tier}"
  account_replication_type = "${var.account_replication_type}"
}

resource "azurerm_media_services_account" "media-service" {
  name                = "${local.service_name}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  location            = "${azurerm_resource_group.rg.location}"
  tags                = "${var.tags}"

  storage_account {
    id         = "${azurerm_storage_account.sa.id}"
    is_primary = true
  }
}
