variable "resource_group" {
  description = "The name of the Azure Resource Group"
}

variable "storage_account" {
  description = "The name of the main Storage Account"
}

variable "service_plan" {
  description = "The name of the main Service Plan"
}

variable "project_name" {
  description = "Name of the project"
  type = string
}

variable "db_login" {
  description = "Database login"
  sensitive = true
  type = string
}

variable "db_password" {
  description = "Database password"
  sensitive = true
  type = string
}

variable "db_host" {
  description = "Database host"
  type = string
}