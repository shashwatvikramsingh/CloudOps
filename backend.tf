# This file exclusively defines the remote backend for storing the Terraform state file.
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend"
    storage_account_name = "tfstatedissertation" # IMPORTANT: Replace with your storage account name
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }


 required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.7"
    }
  }
}