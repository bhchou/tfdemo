# 用 display_name 查 VCN
data "oci_core_vcns" "main" {
  compartment_id = var.compartment_id
  display_name   = var.vcn_name
}

# 用 display_name + VCN 查 Subnet
data "oci_core_subnets" "public" {
  compartment_id = var.compartment_id
  vcn_id         = data.oci_core_vcns.main.virtual_networks[0].id
  display_name   = var.public_subnet_name
}

# 取 AD
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

# 取最新 Ubuntu ARM image
data "oci_core_images" "ubuntu" {
  compartment_id           = var.compartment_id
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "24.04"
  shape                    = var.vm_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

resource "oci_core_instance" "vm" {
  compartment_id      = var.compartment_id
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  shape               = var.vm_shape
  display_name        = var.vm_name

  shape_config {
    ocpus         = var.vm_ocpus
    memory_in_gbs = var.vm_memory_in_gbs
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.ubuntu.images[0].id
  }

  create_vnic_details {
    # ← 這就是跨目錄引用：用 data 查到的 subnet
    subnet_id        = data.oci_core_subnets.public.subnets[0].id
    assign_public_ip = true
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)
  }
}
