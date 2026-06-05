terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "portfolio" {
  name     = "${var.environment}-portfolio-rg"
  location = var.location
}

resource "azurerm_storage_account" "portfolio" {
  name                     = "${var.environment}portfoliostorage${var.your_name}"
  resource_group_name      = azurerm_resource_group.portfolio.name
  location                 = azurerm_resource_group.portfolio.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "portfolio" {
  name                = "${var.environment}-portfolio-service-plan"
  resource_group_name = azurerm_resource_group.portfolio.name
  location            = azurerm_resource_group.portfolio.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "portfolio" {
  name                       = "${var.environment}-portfolio-cv-api-${var.your_name}"
  resource_group_name        = azurerm_resource_group.portfolio.name
  location                   = azurerm_resource_group.portfolio.location
  storage_account_name       = azurerm_storage_account.portfolio.name
  storage_account_access_key = azurerm_storage_account.portfolio.primary_access_key
  service_plan_id            = azurerm_service_plan.portfolio.id

  site_config {
    application_stack {
      node_version = "18"
    }
  }
}