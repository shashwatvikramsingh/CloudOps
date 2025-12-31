variable "vm_name" {
  description = "Name for the VM and its resources."
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

variable "vm_size" {
  description = "The size of the VM (e.g., Standard_B1s)."
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Administrator username for the VM."
  type        = string
  default     = "azureuser"
}


variable "admin_password" {
  description = "The admin password for the VM."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "A map of tags to apply."
  type        = map(string)
  default     = {}
}

