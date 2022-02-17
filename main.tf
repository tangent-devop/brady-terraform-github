provider "azurerm" {
    version = "=2.0.0"
    features {}
}
terraform {
  backend "azurerm" {
    resource_group_name  = "brd-github-tf-rg"  
    storage_account_name = "bradygithubstracc"
    container_name       = "tfbradytatefile"
    key                  = "terraform.tfstate"  
    
  }
}
