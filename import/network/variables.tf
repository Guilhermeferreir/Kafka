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
    default = "~/.oci/oci_api_key.pem"
}

variable "compartment_ocid" {
    type = string
}

variable "region" {
    type = string
}

### vcn ###

variable "vcn-cidr" {
    type = list
}

variable "vcn-dns_label" {
    type = string
}

variable "vcn-display_name" {
    type = string
}

### subnet ###

variable "dhcp_options_display_name" {
    type = string
}

variable "oci_subnet_public" {
    type = list(object({
        display_name_public : string
        subnet_cidr_block_public : string
        subnet_dns_label_public : string

    }))
}

variable "route_table-dp_name_public" {
    type = string
}

variable "it_gateway-dp_name_public" {
    type = string
}

variable "security_list_display_name_public" {
    type = string
}

variable "oci_subnet_private" {
    type = list(object({
        display_name_private : string
        subnet_cidr_block_private : string
        subnet_dns_label_private : string
    }))
}

variable "route_table-dp_name_private" {
    type = string
}

variable "nat_gateway-dp_name_private" {
    type = string
}

variable "security_list_display_name_private" {
    type = string
}

variable "svc_gateway-dp_name_private" {
    type = string
}