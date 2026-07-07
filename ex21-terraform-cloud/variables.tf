variable "ec2_instance_type" {
  type = string

  validation {
    condition     = var.ec2_instance_type == "t2.micro"
    error_message = "Use t2.micro for free tier"
  }
}

