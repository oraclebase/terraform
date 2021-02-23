# Variables
variable "compartment_id" { type = string }
variable "db_name"        { type = string }
variable "admin_password" { type = string }
variable "db_version"     { type = string }
# OLTP, DW, AJD, APEX
variable "db_workload"    { type = string }
# Must be false for AJD and APEX
variable "is_free_tier"   { type = string }
# BRING_YOUR_OWN_LICENSE or LICENSE_INCLUDED
variable "license_model"  { type = string }

variable "cpu_core_count" {
  type    = number
  default = 1
}

variable "data_storage_size_in_tbs" {
  type    = number
  default = 1
}


# Resources
resource "oci_database_autonomous_database" "tf_adb" {
  compartment_id           = var.compartment_id
  cpu_core_count           = var.cpu_core_count
  data_storage_size_in_tbs = var.data_storage_size_in_tbs
  db_name                  = var.db_name
  admin_password           = var.admin_password
  db_version               = var.db_version
  db_workload              = var.db_workload
  display_name             = var.db_name
  is_free_tier             = var.is_free_tier
  license_model            = var.license_model
}


# Outputs
output "db_name" {
  value = oci_database_autonomous_database.tf_adb.display_name
}

output "db_state" {
  value = oci_database_autonomous_database.tf_adb.state
}
