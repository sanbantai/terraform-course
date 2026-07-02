data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.1"
  azs = data.aws_availability_zones.available.names

  cidr = "10.0.0.0/16"
  name = "11-public-modules"
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.128.0/24"]
}