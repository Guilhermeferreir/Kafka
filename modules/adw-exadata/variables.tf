### provider ###

variable "tenancy_ocid" {
    type = string
}

variable "user_ocid" {
    type = string
}

variable "fingerprint" {
    type = string
}

variable "private_key_path" {
    type = string
    default = "~/.oci/api_private.pem"
}

variable "compartment_ocid" {
    type = string
}

variable "region" {
    type = string
}
### ADW - Autonomous Data Warehouse ###

variable "db_name" {
}

variable "admin_password" {
}

variable "data_storage_size_in_tbs" {
}

variable "db_version" {
}

variable "db_workload" {
}

variable "display_name" {
}

variable "is_auto_scaling_enabled" {
}

variable "is_auto_scaling_for_storage_enabled" {
}

variable "is_dedicated" {
}

variable "license_model" {
}

variable "ocpu_count" {
}

variable "character_set" {
}