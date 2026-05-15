output "vm_id" {
  description = "VM OCID"
  value       = oci_core_instance.vm.id
}

output "vm_public_ip" {
  description = "VM 對外 IP"
  value       = oci_core_instance.vm.public_ip
}

output "vm_private_ip" {
  description = "VM 內部 IP"
  value       = oci_core_instance.vm.private_ip
}

output "vm_state" {
  description = "VM 狀態（RUNNING / STOPPED / ...）"
  value       = oci_core_instance.vm.state
}

output "ssh_command" {
  description = "直接複製貼上連線"
  value       = "ssh -i ${var.ssh_private_key_path} ubuntu@${oci_core_instance.vm.public_ip}"
}