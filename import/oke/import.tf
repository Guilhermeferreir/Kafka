module "oke" {
source = "../../modules/oke"

      ## provider ###

    tenancy_ocid      = var.tenancy_ocid
    user_ocid         = var.user_ocid
    fingerprint       = var.fingerprint
    private_key_path  = var.private_key_path
    compartment_ocid  = var.compartment_ocid
    region            = var.region

      ### OKE ###

    oke_kubernetes_version = var.oke_kubernetes_version
    oke_kubernetes_name = var.oke_kubernetes_name
    oke_vcn_id = var.oke_vcn_id
    oke_options_cni_type = var.oke_options_cni_type
    oke_is_public_ip_enabled = var.oke_is_public_ip_enabled
    oke_network_config_pods_cidr = var.oke_network_config_pods_cidr
    oke_network_config_services_cidr = var.oke_network_config_services_cidr
    cluster_options_service_lb_subnet_ids = var.cluster_options_service_lb_subnet_ids
    oke_endpoint_config_subnet_id = var.oke_endpoint_config_subnet_id

    node_pools = var.node_pools
}