# Variables
variable "compartment_id"                { type = string }
variable "target_subnet_id"              { type = string }
variable "bastion_name"                  { type = string }

variable "bastion_client_cidr_block_allow_list" {
  type    = list
  default = ["10.0.1.0/24"]
}

# Resources
resource "oci_bastion_bastion" "tf_bastion" {
  #Required
  bastion_type     = "standard"
  compartment_id   = var.compartment_id
  target_subnet_id = var.target_subnet_id

  #Optional
  name = var.bastion_name
  client_cidr_block_allow_list = var.bastion_client_cidr_block_allow_list
}


# Outputs
output "bastion_id" {
  value = oci_bastion_bastion.tf_bastion.id
}
