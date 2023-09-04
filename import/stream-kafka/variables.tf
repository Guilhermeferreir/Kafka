## provider ###

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


### streaming pool ###

variable "stream_pool" {
    type = list(object({
        stream_pool_name : string
        stream_pool_auto_create_topics : bool
        stream_pool_retention_hours : string
        stream_pool_num_partitions : string
        streaming_pool_subnet_id : string
    }))
}

variable "stream" {
    type = list(object({
        stream_name : string
        stream_partition : string
        stream_retention_hours : string
        stream_pool : string
    }))
}

variable "stream_pool_public" {
    type = list(object({
        stream_pool_name : string
        stream_pool_auto_create_topics : bool
        stream_pool_retention_hours : string
        stream_pool_num_partitions : string
    }))
}

variable "stream_public" {
    type = list(object({
        stream_name : string
        stream_partition : string
        stream_retention_hours : string
        stream_pool : string
    }))
}