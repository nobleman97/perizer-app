provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"

    }


  }
}

terraform {

  backend "azurerm" {
    resource_group_name  = "raven_stream"
    storage_account_name = "raven2023sa"
    container_name       = "tfstate"
    key                  = "k8s.tfstate"

  }
}