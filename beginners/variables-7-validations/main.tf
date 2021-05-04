variable "my_password" {
  type      = string
  sensitive = true

  validation {
    condition     = length(var.my_password) >= 8
    error_message = "The my_password value must be at least 8 characters long."
  }
}

variable "my_email" {
  type = string

  validation {
    condition     =  can(regex("^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$", var.my_email))
    error_message = "The my_email value must be a valid email address."
  }
}


# Outputs
output "my_password_output" {
  value     = var.my_password
  sensitive = true
}

output "my_email_output" {
  value = var.my_email
}
