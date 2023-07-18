# This file defines baseline variables used across this TF deployment

# These will typically be provided at Runtime in a CI/CD pipeline from a key vault

variable "TENANT_ID" {
     type = string
}

variable "SUBSCRIPTION_ID" {
     type = string
}

variable "CLIENT_ID" {
     type = string
}

variable "CLIENT_SECRET" {
     type = string
}
