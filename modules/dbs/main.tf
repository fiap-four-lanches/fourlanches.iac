resource "azurerm_postgresql_flexible_server" "main_psqlserver" {
  name                   = "${var.resource_group.location}-${var.project_name}-psqlserver"
  location               = var.resource_group.location
  resource_group_name    = var.resource_group.name
  administrator_login    = var.db_login
  administrator_password = var.db_password
  version = "13"
  sku_name   = "B_Standard_B1ms"
  storage_mb = 32768
  zone = "1"
}
resource "azurerm_postgresql_flexible_server_database" "main_db" {
  name                = "${var.project_name}db"
  server_id =         azurerm_postgresql_flexible_server.main_psqlserver.id
  charset             = "UTF8"
  collation           = "pt_BR.utf8"
}