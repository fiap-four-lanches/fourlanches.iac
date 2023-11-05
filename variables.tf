variable "location" {
  description = "Name of the location where the resources will be provisioned"
  type        = string
  default     = "eastus"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "fourlanches"
}

variable "db_login" {
  description = "Database login"
  sensitive   = true
  type        = string
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
  type        = string
}