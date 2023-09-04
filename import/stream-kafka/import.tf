module "streaming" {
source = "../../modules/stream-kafka"

      ## provider ###

    tenancy_ocid      = var.tenancy_ocid
    user_ocid         = var.user_ocid
    fingerprint       = var.fingerprint
    private_key_path  = var.private_key_path
    compartment_ocid  = var.compartment_ocid
    region            = var.region

    stream_pool = var.stream_pool
    stream = var.stream
    stream_pool_public = var.stream_pool_public
    stream_public = var.stream_public
}