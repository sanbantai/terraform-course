variable "terraform_cloud_hostname" {
  type        = string
  default     = "app.terraform.io"
  description = "Terraform Cloud Hostname"
}

variable "terraform_cloud_audience" {
  type        = string
  default     = "aws.workload.identity"
  description = "Terraform Cloud Audience"
}

variable "organization_name" {
  type    = string
  default = "sanbantai"
}

variable "project_name" {
  type    = string
  default = "Default Project"
}

variable "workspace_name" {
  type    = string
  default = "my-workspace"
}

variable "admin_role_workspaces" {
  type        = list(string)
  description = "In case we want to connect more than 1 workspace to OIDC"
}