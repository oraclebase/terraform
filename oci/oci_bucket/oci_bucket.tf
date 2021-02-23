# Variables
variable "compartment_id" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "bucket_namespace" {
  type = string
}

variable "bucket_access_type" {
  type    = string
  default = "NoPublicAccess"
}


# Resources
resource "oci_objectstorage_bucket" "tf_bucket" {
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = var.bucket_namespace
  access_type    = var.bucket_access_type
}


# Outputs
output "bucket_name" {
  value = oci_objectstorage_bucket.tf_bucket.name
}

output "bucket_id" {
  value = oci_objectstorage_bucket.tf_bucket.bucket_id
}
