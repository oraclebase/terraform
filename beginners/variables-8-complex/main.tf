# Variables
variable "my_string_variable" {
  type      = string
  default   = "default-value"
}

variable "my_number_variable" {
  type      = number
  default   = 0
}

variable "my_boolean_variable" {
  type      = bool
  default   = false
}

variable "my_list_variable" {
  type      = list(string)
  default   = ["Melon", "Banana", "Apple"]
}

variable "my_object_variable" {
  type       = object({
    name     = string
    quantity = number
  })
  default   = {name:"Melon", quantity:10}
}


# Outputs
output "my_string_variable_output" {
  value = var.my_string_variable
}

output "my_number_variable_output" {
  value = var.my_number_variable
}

output "my_boolean_variable_output" {
  value = var.my_boolean_variable
}

# Whole list.
output "my_list_variable_output" {
  value = var.my_list_variable
}

# First element of list (zero-based).
output "my_list_variable_0_output" {
  value = var.my_list_variable[0]
}

# Whole object.
output "my_object_variable_output" {
  value = var.my_object_variable
}

# Individual elements of object.
output "my_object_variable_name_output" {
  value = var.my_object_variable.name
}

output "my_object_variable_quantity_output" {
  value = var.my_object_variable.quantity
}
