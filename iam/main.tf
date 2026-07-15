resource "oci_identity_group" "demo_users" {
  compartment_id = var.tenancy_ocid     # ← 注意：Group 一定在 tenancy
  name           = "demo-users"
  description    = "Demo group for IaC course"
}

resource "oci_identity_policy" "demo_policy" {
  compartment_id = var.tenancy_ocid     # ← 注意：Policy 寫了 in tenancy 所以建在 root
  name           = "demo-policy"
  description    = "Allow demo-users to manage instances in demo compartment"

  statements = [
    "Allow group 'Default'/'demo-users' to manage instances in compartment id ${var.compartment_id}",
    "Allow group 'Default'/'demo-users' to use virtual-network-family in compartment id ${var.compartment_id}",
    "Allow group 'Default'/'demo-users' to read compartments in tenancy",
  ]
}