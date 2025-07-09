terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "a9704e7f-47d2-4667-87a4-0af54d3a5082"
  tenant_id       = "344d828a-143f-4143-8ece-b093285bf36d"
  client_id       = "9168c8eb-71e8-49c9-b00a-6ecca3672737"
  client_secret   = ""
}
    