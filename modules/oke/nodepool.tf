data "oci_core_images" "shape_specific_images" {
  compartment_id = var.tenancy_ocid
  shape = "VM.Standard.E3.Flex"
}

data "oci_containerengine_cluster_option" "cluster_option" {
  cluster_option_id = "all"
}

data "oci_containerengine_node_pool_option" "node_pool_option" {
  node_pool_option_id = "all"
}

data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}

locals {
    all_images = "${data.oci_core_images.shape_specific_images.images}"
    all_sources = "${data.oci_containerengine_node_pool_option.node_pool_option.sources}"
    compartment_images = [for image in local.all_images : image.id if length(regexall("Oracle-Linux-[0-9]*.[0-9]*-20[0-9]*",image.display_name)) > 0 ]
    oracle_linux_images = [for source in local.all_sources : source.image_id if length(regexall("Oracle-Linux-[0-9]*.[0-9]*-20[0-9]*",source.source_name)) > 0]
    image_id = tolist(setintersection( toset(local.compartment_images), toset(local.oracle_linux_images)))[0]
}


resource "oci_containerengine_node_pool" "node_pool" {
    for_each = { for pl in var.node_pools : pl.pool_name => pl}


  cluster_id         = oci_containerengine_cluster.test_cluster.id
  compartment_id     = var.compartment_ocid
  kubernetes_version = var.oke_kubernetes_version
  name               = each.value.pool_name
  node_shape         = each.value.pool_node_shape
  

  node_config_details {
    placement_configs {
        availability_domain = data.oci_identity_availability_domain.ad.name
        subnet_id          = each.value.node_subnet_pool_id
    }

    size = each.value.pool_size

    node_pool_pod_network_option_details {
        cni_type = var.oke_options_cni_type
        pod_subnet_ids = ["${each.value.pool_node_pod_subnet_id}"]
    }
  }

  node_source_details {
    image_id    = local.oracle_linux_images.0
    source_type = "IMAGE"
  }

  node_shape_config {
    ocpus = each.value.pool_ocpus
    memory_in_gbs = each.value.pool_memory
  }
}