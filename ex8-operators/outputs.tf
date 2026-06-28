output "operators" {
  value = {
    double      = local.double_numbers
    even        = local.even_numbers
    first_names = local.first_names
    full_names  = local.full_names
    doubles_map = local.doubles_map
    even_map    = local.even_map
  }
}