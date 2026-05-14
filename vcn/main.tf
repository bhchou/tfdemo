resource "oci_core_vcn" "demo" {
  compartment_id = var.compartment_id
  cidr_blocks    = var.vcn_cidr
  display_name   = var.vcn_name
  dns_label      = var.vcn_dns_label
}

# Internet Gateway
resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.demo.id   # ← 這就是 DAG!
  display_name   = var.igw_name
  enabled        = true
}

# Route Table
resource "oci_core_route_table" "public_rt" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.demo.id
  display_name   = var.rt_name

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}

resource "oci_core_security_list" "public_sl" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.demo.id
  display_name   = var.public_sl_name

  egress_security_rules {
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
  }

  ingress_security_rules {
    protocol = "6"   # TCP, IANA 編號
    source   = "0.0.0.0/0"
    tcp_options {
      min = 22
      max = 22
    }
  }
}

resource "oci_core_subnet" "public" {
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.demo.id
  cidr_block        = var.subnet_cidr
  display_name      = var.public_sl_name
  dns_label         = var.public_sl_dns_label 
  route_table_id    = oci_core_route_table.public_rt.id
  security_list_ids = [oci_core_security_list.public_sl.id]

  prohibit_public_ip_on_vnic = false
}