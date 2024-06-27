terraform {
  backend "azurerm" {
    storage_account_name = "demo43816"
    container_name = "terraform-state"
    key = "terraform.tfstate" 
 }
}
