resource "oci_containerengine_cluster" "test_cluster" {
  compartment_id     = var.compartment_ocid
  kubernetes_version = var.oke_kubernetes_version
  name               = var.oke_kubernetes_name
  vcn_id             = var.oke_vcn_id

  cluster_pod_network_options {
      cni_type = var.oke_options_cni_type
  }

  endpoint_config {
      is_public_ip_enabled = var.oke_is_public_ip_enabled
      #nsg_ids = var.cluster_endpoint_config_nsg_ids ##croar msg especifico
      subnet_id = var.oke_endpoint_config_subnet_id 
   }

  options {
    add_ons {
      is_kubernetes_dashboard_enabled = true
      is_tiller_enabled = false
    }
    admission_controller_options {
      is_pod_security_policy_enabled = false
    }
    kubernetes_network_config {
      pods_cidr = var.oke_network_config_pods_cidr
      services_cidr = var.oke_network_config_services_cidr
    }

  service_lb_subnet_ids = ["${var.cluster_options_service_lb_subnet_ids}"] 

  }
}