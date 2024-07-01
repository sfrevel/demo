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
  project_name   = "demoproject"
  rg_name        = "rg_terratest_project_name"
  aks_name       = "aks_terratest_project_name"
  aks_node_count = 2
  location       = "Germany West Central"
  environment    = "test"
  appId          = get_env("ARM_CLIENT_ID")
  password       = get_env("ARM_CLIENT_SECRET")
}
