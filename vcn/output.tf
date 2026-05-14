output "vcn_id" {
  description = "VCN OCID，供其他目錄用 remote_state 或 data 引用"
  value       = oci_core_vcn.demo.id
}

output "vcn_display_name" {
  description = "VCN 名稱，供其他目錄用 data block 查"
  value       = oci_core_vcn.demo.display_name
}

output "public_subnet_id" {
  description = "Public Subnet OCID"
  value       = oci_core_subnet.public.id
}

output "public_subnet_display_name" {
  description = "Public Subnet 名稱"
  value       = oci_core_subnet.public.display_name
}
