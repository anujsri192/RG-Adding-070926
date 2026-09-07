terraform {
  required_providers {
    azurerm = {
      version = "4.81.0"
      source  = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-test"
    storage_account_name = "stg734324"
    container_name       = "test-container"
    key                  = "oneclick.terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
}

