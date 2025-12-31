  variable "vm_name" {
  description = "Name of the virtual machine."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
}

variable "vm_size" {
  description = "Size (SKU) of the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "Administrator username for the VM."
  type        = string
}

variable "admin_password" {
  description = "Administrator password for the VM."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "A map of tags to apply to all resources."
  type        = map(string)
  default     = {}
}
