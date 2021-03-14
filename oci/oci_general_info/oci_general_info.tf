# Variables
variable "compartment_id" { type = string }

variable "operating_system" { 
  type    = string
  default = "Oracle Linux"
}

variable "operating_system_version" { 
  type    = string
  default = "8"
}

variable "shape" { 
  type    = string
  default = "VM.Standard.E2.1.Micro"
}


# Resources
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

data "oci_core_images" "tf_images" {
  compartment_id           = var.compartment_id
  operating_system         = var.operating_system
  operating_system_version = var.operating_system_version
  shape                    = var.shape
}

data "oci_core_shapes" "tf_shapes" {
  compartment_id      = var.compartment_id
  image_id            = data.oci_core_images.tf_images.images.0.id
}


# Outputs
output "first_availability_domain_name" {
  value = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

output "availability_domain_names" {
  value = data.oci_identity_availability_domains.ads.availability_domains[*].name
}

output "latest_image_id" {
  value = data.oci_core_images.tf_images.images[0].id
}

output "shape_names" {
  value = data.oci_core_shapes.tf_shapes.shapes[*].name
}
