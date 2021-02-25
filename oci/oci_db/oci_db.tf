# Variables
variable "compartment_id"      { type = string }
variable "db_admin_password"   { type = string }
variable "db_name"             { type = string }
variable "db_public_keys"      { type = list(string) }
variable "db_subnet_id"        { type = string }
variable "db_display_name"     { type = string }
variable "db_pdb_name"         { type = string }
variable "db_hostname"         { type = string }
variable "db_host_domain"      { type = string }
variable "db_storage_gb"       { type = number }

variable "db_workload" {
  type    = string
  default = "OLTP"
}

variable "db_version" {
  type    = string
  default = "21.1.0.0"
}

variable "db_shape" {
  type    = string
  default = "VM.Standard2.1"
}

variable "db_database_edition" {
  type    = string
  default = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
}

variable "db_license_model" {
  type    = string
  default = "LICENSE_INCLUDED"
}

variable "db_node_count" {
  type    = number
  default = 1
}


# Resources
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

resource "oci_database_db_system" "tf_db" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
  db_home {
    database {
      admin_password = var.db_admin_password
      db_name        = var.db_name
      db_workload    = var.db_workload
      pdb_name       = var.db_pdb_name
    }
    db_version = var.db_version
  }
  hostname                = var.db_hostname
  shape                   = var.db_shape
  ssh_public_keys         = var.db_public_keys
  subnet_id               = var.db_subnet_id
  display_name            = var.db_display_name
  data_storage_size_in_gb = var.db_storage_gb
  database_edition        = var.db_database_edition
  domain                  = var.db_host_domain
  license_model           = var.db_license_model
  node_count              = var.db_node_count
}


# Outputs
output "db_display_name" {
  value = oci_database_db_system.tf_db.display_name
}

output "db_id" {
  value = oci_database_db_system.tf_db.id
}

output "db_state" {
  value = oci_database_db_system.tf_db.state
}

output "first-availability-domain_name" {
  value = data.oci_identity_availability_domains.ads.availability_domains[0].name
}
