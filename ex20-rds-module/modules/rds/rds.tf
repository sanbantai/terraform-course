locals {
  db_engine = {
    postgres-18 = {
      engine  = "postgres"
      version = "18.1"
      family  = "postgres18"
    }
    postgres-latest = {
      engine  = "postgres"
      version = "18.1"
      family  = "postgres18"
    }
  }
}

resource "aws_db_subnet_group" "this" {
  name       = var.project_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.project_name
  }
}


resource "aws_db_instance" "this" {
  identifier             = var.project_name
  instance_class         = var.instance_class
  allocated_storage      = var.storage_size
  engine                 = local.db_engine[var.engine].engine
  engine_version         = local.db_engine[var.engine].version
  username               = var.credentials.username
  password               = var.credentials.password
  vpc_security_group_ids = var.security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.this.name
  publicly_accessible    = false
  skip_final_snapshot    = true

  tags = {
    Name = var.project_name
  }
}