# Global variables used by all environments

locals {
  project = "demoproject"
  env     = get_env("ENVIRONMENT")

  resource_group_name = "rg-${local.project}-${local.env}"
  aks_name            = "aks-${local.project}-${local.env}"
}