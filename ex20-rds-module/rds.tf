module "rds" {
  source = "./modules/rds"

  project_name = "ex20-rds-module"

  credentials = {
    username = "dbadmin"
    password = "Password123"
  }

  subnet_ids = [
    aws_subnet.private1.id,
    aws_subnet.private2.id
  ]

  security_group_ids = [
    aws_security_group.compliant.id
  ]
}