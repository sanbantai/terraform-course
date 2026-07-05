data "aws_vpc" "default" {
  default = true
}

resource "aws_vpc" "custom" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name   = "ex20-rds-module-custom-vpc"
    access = "private"
  }
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.custom.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name   = "ex20-rds-module-allowed-private-subnet1"
    access = "private"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.custom.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name   = "ex20-rds-module-allowed-private-subnet2"
    access = "private"
  }
}

# For documentation | Not really used 
resource "aws_subnet" "not_allowed" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.128.0/24"

  tags = {
    Name = "ex20-rds-module-not-allowed-subnet"
  }
}

resource "aws_security_group" "source" {
  name        = "source-sg"
  description = "Source security group for RDS module"
  vpc_id      = aws_vpc.custom.id

  tags = {
    Name = "ex20-rds-module-allowed-security-group"
  }
}

resource "aws_security_group" "compliant" {
  name        = "compliant-sg"
  description = "Compliant security group for RDS module"
  vpc_id      = aws_vpc.custom.id

  tags = {
    Name = "ex20-rds-module-allowed-security-group"
  }
}

resource "aws_security_group" "non_compliant" {
  name        = "non-compliant-sg"
  description = "Non-compliant security group for RDS module"
  vpc_id      = aws_vpc.custom.id

  tags = {
    Name = "ex20-rds-module-allowed-security-group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "db" {
  security_group_id            = aws_security_group.compliant.id
  referenced_security_group_id = aws_security_group.source.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.non_compliant.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}