terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_service_plan" "asp" {
  name                = "TEoppopo"
  location            = "ukwest"
  resource_group_name = "Cohort30_ValTam_Workshop"
  os_type             = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "linux_webapp"{
  name                = var.web_app_name
  location            = var.web_app_location
  resource_group_name = "Cohort30_ValTam_Workshop"
  service_plan_id = azurerm_service_plan.asp.id
  tags = {owner = "Valery"}
  site_config {
   always_on   = false
    use_32_bit_worker = true
  }
  }
