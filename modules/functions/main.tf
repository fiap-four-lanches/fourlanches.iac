resource "azurerm_linux_function_app" "auth_function" {
  name                     = "${var.resource_group.location}-${var.project_name}-auth-function"
  resource_group_name        = var.resource_group.name
  location                   = var.resource_group.location
  storage_account_name       = var.storage_account.name
  storage_account_access_key = var.storage_account.primary_access_key
  service_plan_id            = var.service_plan.id
  site_config {}
  app_settings = {
    "DB_LOGIN": var.db_login
    "DB_PASSWORD": var.db_password
    "DB_HOST": var.db_host
  }
}