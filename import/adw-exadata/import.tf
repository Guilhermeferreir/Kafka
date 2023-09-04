terraform {
  backend "http" {
    address = ""
    update_method = "PUT"
  }
}

module "basic-adw" {
source = "../../modules/adw-exadata"

      ### provider ###

   tenancy_ocid      = var.tenancy_ocid
   user_ocid         = var.user_ocid
   fingerprint       = var.fingerprint
   private_key_path  = var.private_key_path
   compartment_ocid  = var.compartment_ocid
   region            = var.region

      ### adw ###

   db_name = var.db_name
   admin_password = var.admin_password
   data_storage_size_in_tbs = var.data_storage_size_in_tbs
   db_version = var.db_version
   db_workload = var.db_workload
   display_name = var.display_name
   is_auto_scaling_enabled = var.is_auto_scaling_enabled
   is_auto_scaling_for_storage_enabled = var.is_auto_scaling_for_storage_enabled
   is_dedicated = var.is_dedicated
   license_model = var.license_model
   ocpu_count = var.ocpu_count
   character_set = var.character_set

}