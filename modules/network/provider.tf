resource "oci_core_subnet" "subnet_private" {
  for_each = { for sn in var.oci_subnet_private : sn.display_name_private => sn}

  cidr_block        = each.value.subnet_cidr_block_private
  display_name      = each.value.display_name_private
  compartment_id    = var.compartment_ocid

  dns_label = each.value.subnet_dns_label_private

  vcn_id            = oci_core_vcn.vcn.id

  route_table_id    = oci_core_route_table.route_table_private.id
  dhcp_options_id   = oci_core_dhcp_options.dhcp_options.id
  security_list_ids = ["${oci_core_security_list.security_list_private.id}"]
}

resource "oci_core_route_table" "route_table_private" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = var.route_table-dp_name_private

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.nat_gateway_private.id
  }
}

resource "oci_core_nat_gateway" "nat_gateway_private" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = var.nat_gateway-dp_name_private
}

data "oci_core_services" "services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}

resource "oci_core_service_gateway" "service_gateway" {
  compartment_id = var.compartment_ocid
  services {
    service_id = data.oci_core_services.services.services[0]["id"]
  }

  vcn_id = oci_core_vcn.vcn.id

  display_name   = var.svc_gateway-dp_name_private
  #route_table_id = oci_core_route_table.route_table_private.id
}

resource "oci_core_security_list" "security_list_private" {
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.vcn.id

  display_name = var.security_list_display_name_private

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol = "all"
  }
}