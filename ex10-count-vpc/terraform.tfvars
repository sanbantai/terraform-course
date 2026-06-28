ec2_instance_count = 0

ec2_instance_config_list = [
  {
    instance_type = "t2.micro",
    ami           = "ubuntu"
  },
  {
    instance_type = "t2.micro",
    ami           = "amazon_linux"
  }
]

ec2_instance_config_map = {
  ubuntu_1 = {
    instance_type = "t2.micro"
    ami           = "ubuntu"
  }

  amazon_linux_1 = {
    instance_type = "t2.micro"
    ami           = "amazon_linux"
  }
}

subnet_config = {
  default = {
    cidr_block = "10.0.0.0/24"
  }
  subnet_1 = {
    cidr_block = "10.0.1.0/24"
  }
}