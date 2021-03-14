# Variables
variable "compartment_id"              { type = string }
variable "compute_name"                { type = string }
variable "compute_subnet_id"           { type = string }
variable "compute_image_id"            { type = string }
variable "compute_ssh_authorized_keys" { type = string }

variable "compute_shape" {
  type    = string
  default = "VM.Standard.E2.1.Micro"
}

variable "compute_cpus" {
  type    = string
  default = "1"
}

variable "compute_memory_in_gbs" {
  type    = string
  default = "1"
}


# Resources
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

resource "oci_core_instance" "tf_compute" {
  # Required
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
  shape               = var.compute_shape

  source_details {
    source_id         = var.compute_image_id
    source_type       = "image"
  }

  # Optional
  display_name        = var.compute_name

  shape_config {
    ocpus         = var.compute_cpus
    memory_in_gbs = var.compute_memory_in_gbs
  }

  create_vnic_details {
    subnet_id         = var.compute_subnet_id
    assign_public_ip  = true
  }

  metadata = {
    ssh_authorized_keys = file(var.compute_ssh_authorized_keys)
  } 

  preserve_boot_volume = false
}


# Outputs
output "compute_id" {
  value = oci_core_instance.tf_compute.id
}

output "db_state" {
  value = oci_core_instance.tf_compute.state
}

output "compute_public_ip" {
  value = oci_core_instance.tf_compute.public_ip
}
