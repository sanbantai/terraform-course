variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })
  description = "The size and type of the root block volume for EC2 instances."

  default = {
    size = 10
    type = "gp3"
  }
}

variable "additional_tags" {
  type        = map(string)
  description = "Additional tags to apply to resources."

  default = {}
}