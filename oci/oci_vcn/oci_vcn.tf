# Variables
variable "compartment_id"   { type = string }
variable "vcn_display_name" { type = string }

variable "cidr_blocks" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

variable "subnet_display_name" { type = string }


# Resources
resource "oci_core_vcn" "tf_vcn" {
  compartment_id = var.compartment_id
  cidr_blocks    = var.cidr_blocks
  display_name   = var.vcn_display_name
}

resource "oci_core_subnet" "tf_subnet" {
  cidr_block        = var.subnet_cidr_block
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.tf_vcn.id
  display_name      = var.subnet_display_name
  security_list_ids = [oci_core_vcn.tf_vcn.default_security_list_id]
}


# Outputs
output "vcn_name" {
  value = oci_core_vcn.tf_vcn.display_name
}

output "vcn_id" {
  value = oci_core_vcn.tf_vcn.id
}

output "subnet_id" {
  value = oci_core_subnet.tf_subnet.id
}

output "default_security_list_id" {
  value = oci_core_vcn.tf_vcn.default_security_list_id
}