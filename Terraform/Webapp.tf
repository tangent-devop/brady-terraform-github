provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev" {
  name     = "${var.resource-group-name}"
  location = "${var.location}"
}

resource "azurerm_app_service_plan" "dev" {
  name                = "${var.app-service-plan}"
  location            = "${azurerm_resource_group.dev.location}"
  resource_group_name = "${azurerm_resource_group.dev.name}"

  sku {
    tier = "Free"
    size = "F1"
  }
}
resource "azurerm_app_service" "dev" {
  name                = "${var.app-service-name}"
  location            = "${azurerm_resource_group.dev.location}"
  resource_group_name = "${azurerm_resource_group.dev.name}"
  app_service_plan_id = "${azurerm_app_service_plan.dev.id}"
  app_settings = {
    "Web__WeatherApi__ApiKey" = "${var.api-key}"
  }
}