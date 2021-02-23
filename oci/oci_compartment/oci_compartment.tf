# Variables
variable "compartment_name" {
  type = string
}

variable "compartment_desc" {
  type = string
}


# Resources
resource "oci_identity_compartment" "tf_compartment" {
  compartment_id = var.root_compartment_id
  description    = var.compartment_desc
  name           = var.compartment_name
}


# Outputs
output "compartment_name" {
  value = oci_identity_compartment.tf_compartment.name
}

output "compartment_id" {
  value = oci_identity_compartment.tf_compartment.id
}
