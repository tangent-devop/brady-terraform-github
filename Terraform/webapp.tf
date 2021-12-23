terraform {
  required_version = ">= 0.11"
  backend "azurerm" {
    storage_account_name = "terraformstorageaccount"
    container_name       = "terraform"
    key                  = "terraform.tfstate"  
    accesskey            = "__storagekey__"
    
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "test" {
  name     = "TerraformBdy"
  location = "UK South"
}

resource "azurerm_app_service_plan" "test" {
  name                =    "appserviceplan"
  location            =    azurerm_resource_group.test.location
  resource_group_name =    azurerm_resource_group.test.name

  sku {
    tier = "Free"
    size = "F1"
  }
}
resource "azurerm_app_service" "test" {
  name                =    "appservicename"
  location            =    azurerm_resource_group.test.location
  resource_group_name =    azurerm_resource_group.test.name
  app_service_plan_id =    azurerm_app_service_plan.test.id


}