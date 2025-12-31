variable "storage_account_name" {
  description = "The name of the storage account (must be globally unique)."
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

variable "replication_type" {
  description = "The replication type (e.g., LRS, GRS)."
  type        = string
  default     = "LRS"
}

variable "tags" {
  description = "A map of tags to apply."
  type        = map(string)
  default     = {}
}
