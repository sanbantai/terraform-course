module "vpc" {
  source = "./modules/networking"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "12-my-module-vpc"
  }

  subnet_config = {
    subnet_1 = {
      cidr_block = "10.0.0.0/24"
      public     = true
      az         = "eu-central-1a"
    }

    subnet_2 = {
      cidr_block = "10.0.1.0/24"
      public     = false
      az         = "eu-central-1b"
    }
  }
}

