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
}

variable "compartment_ocid" {
    type = string
}

variable "region" {
    type = string
}


### OKE ###

variable "oke_kubernetes_version" {
}

variable "oke_kubernetes_name" {
}

variable "oke_vcn_id" {
}

variable "oke_options_cni_type" {
}

variable "oke_is_public_ip_enabled" {
}

variable "oke_network_config_pods_cidr" {
}

variable "oke_network_config_services_cidr" {
}

variable "cluster_options_service_lb_subnet_ids" {
}

variable "oke_endpoint_config_subnet_id" {
}

variable "node_pools" {
    type = list(object({
        pool_name : string
        pool_node_shape : string
        node_subnet_pool_id : string
        pool_node_pod_subnet_id : string
        pool_ocpus : string
        pool_memory : string
        pool_qty_per_subnet : string
        pool_size : string
        pool_av_domain : string
    }))
}