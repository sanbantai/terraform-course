output "name" {
  value = startswith(lower(local.name), "ilya")
}

output "age_power_2" {
  value = pow(local.age, 2)
}

output "yaml_decoded" {
  value = yamldecode(file("${path.module}/users.yaml")).users[*].name
}

output "my_object" {
  value = jsonencode(local.my_object)
}