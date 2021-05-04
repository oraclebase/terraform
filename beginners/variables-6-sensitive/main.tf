variable "my_variable" {
  type      = string
  default   = "default-value"
  sensitive = true
}

output "my_variable_output" {
  value     = var.my_variable
  sensitive = true
}
