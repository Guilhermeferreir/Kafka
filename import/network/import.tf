module "basic_network" {
source = "../../modules/basic-network"

      ### provider ###

   tenancy_ocid      = var.tenancy_ocid
   user_ocid         = var.user_ocid
   fingerprint       = var.fingerprint
   private_key_path  = var.private_key_path
   compartment_ocid  = var.compartment_ocid
   region            = var.region

      ### vcn ###

   vcn-cidr          = var.vcn-cidr
   vcn-dns_label     = var.vcn-dns_label
   vcn-display_name  = var.vcn-display_name

      ### subnet ###

   oci_subnet_public = var.oci_subnet_public
   oci_subnet_private = var.oci_subnet_private

   route_table-dp_name_private = var.route_table-dp_name_private
   nat_gateway-dp_name_private = var.nat_gateway-dp_name_private
   security_list_display_name_private = var.security_list_display_name_private
   svc_gateway-dp_name_private = var.svc_gateway-dp_name_private

   route_table-dp_name_public = var.route_table-dp_name_public
   it_gateway-dp_name_public = var.it_gateway-dp_name_public
   security_list_display_name_public = var.security_list_display_name_public
   dhcp_options_display_name = var.dhcp_options_display_name

}