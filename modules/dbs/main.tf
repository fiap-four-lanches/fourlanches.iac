resource "azurerm_postgresql_flexible_server" "main_psqlserver" {
  name                   = "${var.resource_group.location}-${var.project_name}-psqlserver"
  location               = var.resource_group.location
  resource_group_name    = var.resource_group.name
  administrator_login    = var.db_login
  administrator_password = var.db_password
  version                = "13"
  sku_name               = "B_Standard_B1ms"
  storage_mb             = 32768
  zone                   = "1"
}

resource "azurerm_postgresql_flexible_server_database" "main_db" {
  name      = "${var.project_name}-db"
  server_id = azurerm_postgresql_flexible_server.main_psqlserver.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}

resource "azurerm_mysql_flexible_server" "main_mysql_db" {
  name                = "${var.resource_group.location}-${var.project_name}-mysqlserver"
  location               = var.resource_group.location
  resource_group_name    = var.resource_group.name
  sku_name               = "B_Standard_B1ms"
  administrator_login    = var.db_login
  administrator_password = var.db_password
  zone                   = "1"
}
resource "azurerm_mysql_flexible_database" "main_mysql_db" {
  name                = "${var.project_name}-db"
  resource_group_name    = var.resource_group.name
  server_name         = azurerm_mysql_flexible_server.main_mysql_db.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "azurerm_cosmosdb_account" "main_cosmos_account" {
  name                = "${var.project_name}-cosmosdb-account"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  offer_type          = "Standard"
  kind                = "MongoDB"
  enable_free_tier    = true

  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100
  }

  enable_multiple_write_locations = false

  geo_location {
    location          = var.resource_group.location
    failover_priority = 0
  }

}

resource "azurerm_cosmosdb_mongo_database" "payment_app_cosmos_database" {
  name                = "payment-db"
  resource_group_name = var.resource_group.name
  account_name        = azurerm_cosmosdb_account.main_cosmos_account.name
}

resource "azurerm_cosmosdb_mongo_collection" "payments_cosmos_collection" {
  name                = "payments"
  resource_group_name = var.resource_group.name
  account_name        = azurerm_cosmosdb_account.main_cosmos_account.name
  database_name       = azurerm_cosmosdb_mongo_database.payment_app_cosmos_database.name

  index {
    keys   = ["_id"]
    unique = true
  }
}
