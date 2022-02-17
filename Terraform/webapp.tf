resource "azurerm_resource_group" "dev" {
  name     = "rg-github-tf-brd"
  location = "UK west"
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
  name                =  "bradytfwebapp"
  location            =   azurerm_resource_group.dev.location
  resource_group_name =   azurerm_resource_group.dev.name
  app_service_plan_id =   azurerm_app_service_plan.dev.id
}
