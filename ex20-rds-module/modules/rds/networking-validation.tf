data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "input" {
  for_each = toset(var.subnet_ids)
  id       = each.value

  lifecycle {
    postcondition {
      condition     = self.vpc_id != data.aws_vpc.default.id
      error_message = <<-EOT
      This subnet is a part of the default VPC:
      ${data.aws_vpc.default.id}
      Default VPC subnets are not allowed. Please provide a subnet from a non-default VPC.
      EOT
    }

    postcondition {
      condition     = lower(lookup(self.tags, "access", "")) == "private"
      error_message = "The subnet must be private. Please provide a subnet with the 'access' tag set to 'private'."
    }
  }
}

data "aws_vpc_security_group_rules" "input" {
  filter {
    name   = "group-id"
    values = var.security_group_ids
  }
}

data "aws_vpc_security_group_rule" "input" {
  for_each               = toset(data.aws_vpc_security_group_rules.input.ids)
  security_group_rule_id = each.value

  lifecycle {
    postcondition {
      condition = self.is_egress ? true : self.cidr_ipv4 == null && self.cidr_ipv6 == null && self.referenced_security_group_id != null

      error_message = "Inbound rules must reference a security group, not an IP range."
    }
  }
}