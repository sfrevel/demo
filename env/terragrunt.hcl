locals {
  terraform_version = "1.9.0"
  azurerm_provider_version = "3.110.0"
  global_vars      = read_terragrunt_config(find_in_parent_folders("global.hcl"))

  env           = local.global_vars.locals.env
  project_name  = local.global_vars.locals.project
}

# This instructs Terragrunt to create the file provider.tf in the working directory (where Terragrunt calls terraform) before it calls any 
# of the Terraform commands (e.g plan, apply, validate, etc)
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_version = ">= ${local.terraform_version}"

  required_providers {
    azurerm = {
      source =  "hashicorp/azurerm"
      version = "~>${local.azurerm_provider_version}"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}
EOF
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
