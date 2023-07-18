# This azure main.tf file configures 
#  - The baseline terraform registery for Azure
#  - The backend terraform uses to store STATE
#  - Authenication with Azure via Service Principle 
#  - Basic Azure structures such as resource groups


# Configure terraform resource providers and remote backend state management

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.65.0"
    }
  }
}

# Configure the Azure provider to use specific subscription + other parameters
# https://registry.terraform.io/providers/hashicorp/azurerm/latest

provider "azurerm" {
  features {

    resource_group {
      prevent_deletion_if_contains_resources = false
    }

  }

  skip_provider_registration = true

  tenant_id       = var.TENANT_ID
  subscription_id = var.SUBSCRIPTION_ID
  client_id       = var.CLIENT_ID
  client_secret   = var.CLIENT_SECRET
}

# Create azure resource group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

resource "azurerm_resource_group" "rg" {
  name     = "rg-tim-demo-uksouth"
  location = "UK South"
}
