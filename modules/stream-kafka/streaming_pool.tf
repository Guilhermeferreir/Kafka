# resource "oci_streaming_stream_pool" "test_stream_pool" {
#   #Required
#   compartment_id = var.compartment_ocid
#   name           = "TFStreamPool"

#   #Optional
#   private_endpoint_settings {
#     #nsg_ids             = [oci_core_network_security_group.test_nsg.id]
#     #private_endpoint_ip = "10.0.0.5"
#     subnet_id           = oci_core_subnet.test_subnet.id
#   }

#   kafka_settings {
#     auto_create_topics_enable = true
#     log_retention_hours       = 24
#     num_partitions            = 1
#   }
# }

resource "oci_streaming_stream_pool" "stream_pool" {
    for_each = { for st in var.stream_pool : st.stream_pool_name  => st}

    compartment_id = var.compartment_ocid
    name = each.value.stream_pool_name

    kafka_settings {
        auto_create_topics_enable = each.value.stream_pool_auto_create_topics
        log_retention_hours = each.value.stream_pool_retention_hours
        num_partitions = each.value.stream_pool_num_partitions
    }
    private_endpoint_settings {
        subnet_id = each.value.streaming_pool_subnet_id
    }
}

resource "oci_streaming_stream_pool" "stream_pool_public" {
    for_each = { for st in var.stream_pool_public : st.stream_pool_name  => st}

    compartment_id = var.compartment_ocid
    name = each.value.stream_pool_name

    kafka_settings {
        auto_create_topics_enable = each.value.stream_pool_auto_create_topics
        log_retention_hours = each.value.stream_pool_retention_hours
        num_partitions = each.value.stream_pool_num_partitions
    }
}