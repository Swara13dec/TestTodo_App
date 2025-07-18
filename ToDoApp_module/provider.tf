terraform {
  required_providers {
    azurerm = {
    source = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
}


provider "azurerm"{
    features {
      
    }
    subscription_id = "332de106-8035-4f48-a71e-790b9e30e3ff"
}