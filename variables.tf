variable "location" {
  description = "Name of the location where the resources will be provisioned"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "FourLanches-RG"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "fourlanches"
}