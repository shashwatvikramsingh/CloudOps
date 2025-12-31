variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to deploy into."
  type        = string
}

variable "location" {
  description = "The Azure region."
  type        = string
}

variable "dns_prefix" {
  description = "A unique DNS prefix for the cluster."
  type        = string
}

variable "node_count" {
  description = "The initial number of nodes in the default pool."
  type        = number
  default     = 1
}

variable "tags" {
  description = "A map of tags to apply."
  type        = map(string)
  default     = {}
}
