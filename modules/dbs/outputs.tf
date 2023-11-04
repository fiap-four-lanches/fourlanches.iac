output "host" {
  value     = azurerm_postgresql_flexible_server.main_psqlserver.fqdn
  sensitive = true
}
