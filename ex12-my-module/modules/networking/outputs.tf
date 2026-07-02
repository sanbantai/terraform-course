output "vpc_id" {
  description = "The AWS ID from the created VPC"
  value       = aws_vpc.this.id
}

output "public_subnets" {
  description = "The ID and the availability zone of public subnets."
  value       = local.output_public_subnets
}

output "private_subnets" {
  description = "The ID and the availability zone of private subnets."
  value       = local.output_private_subnets
}