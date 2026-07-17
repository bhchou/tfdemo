resource "oci_identity_group" "iac_runner" {
  compartment_id = var.tenancy_ocid     # ← 注意：Group 一定在 tenancy
  name           = "iac-runner"
  description    = "IaC runner group"
}

resource "oci_identity_policy" "iac_runner_policy" {
  compartment_id = var.tenancy_ocid     # ← 注意：Policy 寫了 in tenancy 所以建在 root
  name           = "iac-policy"
  description    = "Allow iac-runner to manage instances in demo compartment"

  statements = [
    "Allow group 'Default'/'iac-runner' to manage all-resources in compartment id ${var.compartment_id}",
    "Allow group 'Default'/'iac-runner' to read compartments in tenancy",
  ]
}