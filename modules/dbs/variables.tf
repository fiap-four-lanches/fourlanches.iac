variable "resource_group" {
  description = "The name of the Azure Resource Group"
}

variable "project_name" {
  description = "Name of the project"
  type = string
}

variable "db_login" {
  description = "Database login"
  type = string
}

variable "db_password" {
  description = "Database password"
  type = string
}