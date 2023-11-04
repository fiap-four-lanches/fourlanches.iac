terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  backend "azurerm" {
    resource_group_name  = "eastus-fourlanches-rg"
    storage_account_name = "eastusfourlanchessa"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
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

resource "azurerm_storage_account" "main_sa" {
  name                     = "${var.location}${var.project_name}sa"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "main_app_service" {
  name                = "${var.location}-${var.project_name}-app-service"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  os_type             = "Linux"
  sku_name            = "Y1"
}
module "dbs" {
  source         = "./modules/dbs"
  project_name   = var.project_name
  resource_group = azurerm_resource_group.main
  db_login    = var.db_login
  db_password = var.db_password
}

module "functions" {
  source          = "./modules/functions"
  resource_group  = azurerm_resource_group.main
  project_name    = var.project_name
  storage_account = azurerm_storage_account.main_sa
  service_plan    = azurerm_service_plan.main_app_service
  db_login        = var.db_login
  db_password     = var.db_password
  db_host         = module.dbs.host
}


# module "k8s" {
#   source         = "./modules/k8s"
#   project_name   = var.project_name
#   resource_group = azurerm_resource_group.main

# }