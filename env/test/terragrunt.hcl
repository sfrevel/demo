locals {
  # Automatically load environment-level variables from files in parent folders
  location_vars = read_terragrunt_config("location.hcl")
  global_vars   = read_terragrunt_config(find_in_parent_folders("global.hcl"))

  # Extract out common variables for reuse
  location     = local.location_vars.locals.location
  env          = "test"
  project_name = "demoproject"
 }

# Specify the path to the source of the module
terraform {
  source = "${get_repo_root()}/modules//aks"
}

# Include all settings from the root terragrunt.hcl file
include "root" {
  # find_in_parent_folders() searches up the directory tree from the current .tfvars 
  # file and returns the relative path to to the first terraform.tfvars in a parent folder 
  # or exit with an error if no such file is found
  path = find_in_parent_folders()
}

# Set inputs to pass as variables to the module
inputs = {
  project_name   = local.project_name
  rg_name        = "rg_terratest_project_name"
  aks_name       = "aks_terratest_project_name"
  aks_node_count = 2
  location       = local.location
  environment    = local.env
  appId          = get_env("ARM_CLIENT_ID")
  password       = get_env("ARM_CLIENT_SECRET")
}


remote_state {
  backend = "azurerm"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  # Store the terraform state files in a blob container located on an azure storage account
  config = {
    key                  = "${local.project_name}-${local.env}.tfstate"
    resource_group_name  = "demo-backend"
    storage_account_name = "demo43816"
    container_name       = "terraform-state"
  }
}
