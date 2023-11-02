resource "azurerm_storage_account" "main_sa" {
  name                     =  "${var.resource_group.location}${var.project_name}sa"
  resource_group_name        = var.resource_group.name
  location                   = var.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "main_app_service" {
  name                     = "${var.resource_group.location}-${var.project_name}-app-service"
  resource_group_name        = var.resource_group.name
  location                   = var.resource_group.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "auth_function" {
  name                     = "${var.resource_group.location}-${var.project_name}-auth-function"
  resource_group_name        = var.resource_group.name
  location                   = var.resource_group.location
  storage_account_name       = azurerm_storage_account.main_sa.name
  storage_account_access_key = azurerm_storage_account.main_sa.primary_access_key
  service_plan_id            = azurerm_service_plan.main_app_service.id
  site_config {}
}