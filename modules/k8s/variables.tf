variable "project_name" {
  description = "Name of the project"
  type = string
}

variable "resource_group" {
  description = "The name of the Azure Resource Group"
}

variable "agent_count" {
  default = 2
}

variable "cluster_name" {
  default = "fourlanchesk8s"
}

variable "dns_prefix" {
  default = "fourlanchesk8s"
}
