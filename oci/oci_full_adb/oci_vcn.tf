# Variables
variable "vcn_display_name" { type = string }

variable "cidr_blocks" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}


# Resources
resource "oci_core_vcn" "tf_vcn" {
  compartment_id = oci_identity_compartment.tf_compartment.id
  cidr_blocks    = var.cidr_blocks
  display_name   = var.vcn_display_name
}


# Outputs
output "vcn_name" {
  value = oci_core_vcn.tf_vcn.display_name
}

output "vcn_id" {
  value = oci_core_vcn.tf_vcn.id
}

output "default_security_list_id" {
  value = oci_core_vcn.tf_vcn.default_security_list_id
}