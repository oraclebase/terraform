variable "my_variable" {
  type    = string
  default = "default-value"
}

output "my_variable_output" {
  value = var.my_variable
}
