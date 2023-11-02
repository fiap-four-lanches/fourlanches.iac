terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "${var.location}-${var.project_name}-rg"
  location = var.location
}

module "functions" {
  source         = "./modules/functions"
  resource_group = azurerm_resource_group.main
  project_name   = var.project_name
}

module "dbs" {
  source         = "./modules/dbs"
  project_name   = var.project_name
  resource_group = azurerm_resource_group.main
  db_login       = var.db_login
  db_password    = var.db_password
}