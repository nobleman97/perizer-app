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
  
  # The resurce group and the storage account used here were created manually for ease.
  backend "azurerm" {
    resource_group_name  = "sysmon"
    storage_account_name = "sysmon2024sa"
    container_name       = "tfstate"
    key                  = "k8s.tfstate"

  }
}