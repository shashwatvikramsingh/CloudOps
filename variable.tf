# This file defines the *data structures* for our orchestrator.

variable "main_resource_group_name" {
  description = "The name of the main resource group for the project."
  type        = string
}

variable "location" {
  description = "The primary Azure region for deployments."
  type        = string
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
  default     = {}
}

variable "vm_admin_username" {
  description = "Administrator username for all VMs."
  type        = string
  default     = "cloudadmin"
}

variable "vm_admin_password" {
  description = "Administrator password for all VMs."
  type        = string
  sensitive   = true
}

# This variable defines the data structure for our storage account loop
variable "storage_accounts_to_create" {
  description = "A map of storage accounts to create."
  type = map(object({
    name_prefix = string      # Changed 'name' to 'name_prefix'
    replication = string
  }))
  default = {}
}

# This variable defines the data structure for our VM loop
variable "vms_to_create" {
  description = "A map of virtual machines to create."
  type = map(object({
    name    = string
    os_type = string # "linux" or "windows"
    size    = string
  }))
  default = {}
}

# Variables for the AKS cluster
variable "aks_cluster_name" {
  description = "Name for the AKS cluster."
  type        = string
  default     = "aura-aks-cluster"
}

variable "aks_dns_prefix" {
  description = "Unique DNS prefix for the AKS cluster."
  type        = string
  default     = "aura-aks"
}