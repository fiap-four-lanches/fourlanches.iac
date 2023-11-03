resource "azurerm_postgresql_server" "main_psqlserver" {
  name                = "${var.project_name}-psqlserver"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  administrator_login          = var.db_login
  administrator_login_password = var.db_password
  sku_name   = "B_Gen5_1"
  version    = "11"
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_postgresql_database" "main_db" {
  name                = "${var.project_name}db"
  resource_group_name = var.resource_group.name
  server_name         = azurerm_postgresql_server.main_psqlserver.name
  charset             = "UTF8"
  collation           = "pt_BR.utf8"
}