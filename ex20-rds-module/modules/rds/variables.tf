variable "project_name" {
  type = string
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"


  validation {
    condition     = contains(["db.t3.micro", "db.t4g.micro"], var.instance_class)
    error_message = "Invalid instance class. Allowed values are: db.t3.micro, db.t4g.micro."
  }
}

variable "storage_size" {
  type    = number
  default = 10

  validation {
    condition     = var.storage_size >= 5 && var.storage_size <= 10
    error_message = "Storage size must be between 5 and 10 GB."
  }
}

variable "engine" {
  type    = string
  default = "postgres-18"

  validation {
    condition     = contains(["postgres-18", "postgres-latest"], var.engine)
    error_message = "Invalid engine. Allowed values are: postgres-18, postgres-latest."
  }
}

variable "credentials" {
  type = object({
    username = string
    password = string
  })
  sensitive = true

  validation {
    condition = (
      length(regexall("^[a-zA-Z][a-zA-Z0-9]{0,15}$", var.credentials.username)) > 0 &&
      length(regexall("^[^@/\"\\s]{8,41}$", var.credentials.password)) > 0
    )
    error_message = "Username must start with a letter, be 1-16 chars, alphanumeric only. Password must be 8-41 chars with no @, /, \", or spaces."
  }
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}