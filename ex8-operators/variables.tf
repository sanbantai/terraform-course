variable "numbers_list" {
  type = list(number)
}

variable "objects_list" {
  type = list(object({
    first_name = string
    last_name  = string
  }))
}

variable "numbers_map" {
  type = map(number)
}

variable "doubles_map" {
  type = map(number)
}

variable "even_map" {
  type = map(number)
}

variable "users" {
  type = list(object({
    username = string
    role     = string
  }))
}