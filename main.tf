terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

locals {
  sa_name = format("sa%s%s000", var.assetname, var.environment)
}

resource "azurerm_resource_group" "main" {
  name = var.rg_name
  location = var.rg_location
  
}

resource "azurerm_storage_account" "storageaccount" {
  count = var.instance_count

  name                      = "${local.sa_name}${count.index + 1}"
  resource_group_name       = azurerm_resource_group.main.name
  location                  = azurerm_resource_group.main.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true



  tags = {
    environment = var.environment
  }
}
