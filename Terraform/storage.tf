terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "xxxxx-xxxxx-xxxxx-xxxxx-xxxxx"
}

resource "azurerm_resource_group" "rg" {
  name     = "storage-resource"
  location = "Central India"
}

resource "azurerm_storage_account" "example" {
  name                     = "mystorageacctdemo1"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}
