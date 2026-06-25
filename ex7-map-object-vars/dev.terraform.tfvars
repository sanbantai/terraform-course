ec2_volume_config = {
  size = 15
  type = "gp3"
}

additional_tags = {
  ValuesFrom = "terraform.tfvars"
}
