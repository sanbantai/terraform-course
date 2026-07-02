locals {
  project_name = "11-public-modules"
  shared_tags = {
    Project   = local.project_name
    ManagedBy = "Terraform"
  }
}