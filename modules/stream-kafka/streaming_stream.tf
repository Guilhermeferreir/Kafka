resource "oci_streaming_stream" "stream" {
  for_each = { for st in var.stream : st.stream_name  => st}

  name               = each.value.stream_name
  partitions         = each.value.stream_partition
  retention_in_hours = each.value.stream_retention_hours
  stream_pool_id     = oci_streaming_stream_pool.stream_pool[each.value.stream_pool].id
}

resource "oci_streaming_stream" "stream_public" {
  for_each = { for st in var.stream_public : st.stream_name  => st}

  name               = each.value.stream_name
  partitions         = each.value.stream_partition
  retention_in_hours = each.value.stream_retention_hours
  stream_pool_id     = oci_streaming_stream_pool.stream_pool_public[each.value.stream_pool].id
}