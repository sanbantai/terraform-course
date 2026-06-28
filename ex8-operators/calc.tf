locals {
  double_numbers = [for n in var.numbers_list : n * 2]
  even_numbers   = [for n in var.numbers_list : n if n % 2 == 0]
  first_names    = [for obj in var.objects_list : obj.first_name]
  full_names     = [for obj in var.objects_list : "${obj.first_name} ${obj.last_name}"]
}

locals {
  doubles_map = { for key, value in var.numbers_map : key => value * 2 }
  even_map    = { for key, value in var.numbers_map : key => value * 2 if value % 2 == 0 }
}

locals {
  users_map = { for user in var.users : user.username => user.role }
}

output "users_map" {
  value = local.users_map
}