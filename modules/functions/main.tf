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
  storage_account_name       = var.storage_account.name
  storage_account_access_key = var.storage_account.primary_access_key
  service_plan_id            = azurerm_service_plan.main_app_service.id
  site_config {}
}