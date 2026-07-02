locals {
  vpc_cidr            = "10.0.0.0/16"
  private_subnet_cidr = ["10.0.1.0/24"]
  public_subnet_cidr  = ["10.0.128.0/24"]
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.1"

  azs             = data.aws_availability_zones.available.names
  cidr            = local.vpc_cidr
  name            = local.project_name
  private_subnets = local.private_subnet_cidr
  public_subnets  = local.public_subnet_cidr

  tags = local.shared_tags
}