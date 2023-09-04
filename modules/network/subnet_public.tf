resource "oci_core_subnet" "subnet_public" {
  for_each = { for sn in var.oci_subnet_public : sn.display_name_public => sn}

  cidr_block        = each.value.subnet_cidr_block_public
  display_name      = each.value.display_name_public
  compartment_id    = var.compartment_ocid

  dns_label = each.value.subnet_dns_label_public

  vcn_id            = oci_core_vcn.vcn.id

  route_table_id    = oci_core_route_table.route_table_public.id
  dhcp_options_id   = oci_core_dhcp_options.dhcp_options.id
  security_list_ids = ["${oci_core_security_list.security_list_public.id}"]
}

resource "oci_core_route_table" "route_table_public" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = var.route_table-dp_name_public

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw_public.id
  }
}

resource "oci_core_internet_gateway" "igw_public" {
  compartment_id = var.compartment_ocid
  display_name   = var.it_gateway-dp_name_public
  vcn_id         = oci_core_vcn.vcn.id
}

resource "oci_core_security_list" "security_list_public" {
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.vcn.id

  display_name = var.security_list_display_name_public

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol = "all"
  }
}