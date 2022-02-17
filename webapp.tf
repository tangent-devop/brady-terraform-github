resource "azurerm_resource_group" "dev" {
  name     = "brady-tf-github-rg"
  location = "UK south"
}

resource "azurerm_app_service_plan" "dev" {
  name                =  "bradyappsrvplan"
  location            =   azurerm_resource_group.dev.location
  resource_group_name =   azurerm_resource_group.dev.name

  sku {
    tier = "Free"
    size = "F1"
  }
}
resource "azurerm_app_service" "dev" {
  name                =  "bradytfapp"
  location            =   azurerm_resource_group.dev.location
  resource_group_name =   azurerm_resource_group.dev.name
  app_service_plan_id =   azurerm_app_service_plan.dev.id
}
