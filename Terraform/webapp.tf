terraform {
  required_version = ">= 0.15"
  backend "azurerm" {
    storage_account_name = "__terraformstorageaccount__"
    container_name       = "terraform"
    key                  = "terraform.tfstate"  
    accesskey            = "__storagekey__"
    
  }
}
provider "azurerm" {
  version= "=2.0.0"
  feature {}
}

resource "azurerm_resource_group" "test" {
  name     = "TerraformBdy"
  location = "UK South"
}

resource "azurerm_app_service_plan" "test" {
  name                = "__appserviceplan__"
  location            =    azurerm_resource_group.test.location
  resource_group_name =    azurerm_resource_group.test.name

  sku {
    tier = "Free"
    size = "F1"
  }
}
resource "azurerm_app_service" "test" {
  name                = "__appservicename__"
  location            =    azurerm_resource_group.test.location
  resource_group_name =    azurerm_resource_group.test.name
  app_service_plan_id =    azurerm_app_service_plan.test.id
}