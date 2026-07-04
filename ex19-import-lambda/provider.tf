terraform {
  required_version = "~> 1.15.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.51.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.0"
    }

    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.8.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = {
      ManagedBy = "Terraform"
      Project   = "ex19-import-lambda"
    }
  }
}
