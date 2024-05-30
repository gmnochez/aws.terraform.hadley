# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

locals {

  # Define organization-level variables
  organization = "gmnochez"

  # Automatically load environment-level variables
  global_vars = read_terragrunt_config(find_in_parent_folders("global.hcl"))

  # Automatically load site-level variables
  env_vars = read_terragrunt_config(find_in_parent_folders("enviroment.hcl"))

# Automatically load resource variables
  res_vars = read_terragrunt_config(find_in_parent_folders("resource.hcl"))




  # Extract the variables we need for easy access
  account_id          = get_env("AWS_ACCOUNT_ID")
  access_key_id       = get_env("AWS_ACCESS_KEY_ID")
  secret_access_key   = get_env("AWS_SECRET_ACCESS_KEY")
  
  aws_region   = local.env_vars.locals.aws_region

}

# Generate an Azure provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"

  # Only these AWS Account IDs may be operated on by this template
  allowed_account_ids = ["${local.account_id}"]
}

EOF
}
 
# Configure Terragrunt to automatically store tfstate files in an Blob Storage container
remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "assdteus2016st001"
    key            = "key_remote_state"
    region         = "${local.aws_region}"
    dynamodb_table = "assdteus2016st001-tfstate-lock"
    disable_bucket_update = true
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}


# ---------------------------------------------------------------------------------------------------------------------
# GLOBAL PARAMETERS
# These variables apply to all configurations in this subfolder. These are automatically merged into the child
# `terragrunt.hcl` config via the include block.
# ---------------------------------------------------------------------------------------------------------------------

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.
inputs = merge(
  local.global_vars.locals,
  local.env_vars.locals,
  local.res_vars.locals
)
