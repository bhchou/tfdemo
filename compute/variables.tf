variable "tenancy_ocid" { type = string }
variable "user_ocid" { type = string }
variable "fingerprint" { type = string }
variable "private_key_path" { type = string }

variable "region" {
  type    = string
  default = "ap-tokyo-1"
}

variable "vcn_name" {
  type        = string
  description = "vcn name"
}

variable "public_subnet_name" {
  type        = string
  description = "public subnet name"
}

variable "compartment_id" {
  type        = string
  description = "資源建在哪個 Compartment（demo-compartment OCID）"
}

variable "vm_shape" {
  type        = string
  description = "VM shape"
}

variable "vm_name" {
  type        = string
  description = "VM name"
}

variable "vm_ocpus" {
  type        = number
  description = "VM OCPUs"
}

variable "vm_memory_in_gbs" {
  type        = number
  description = "VM memory in GBs"
}

variable "ssh_public_key_path" {
  type        = string
  description = "SSH public key path"
}

variable "ssh_private_key_path" {
  type        = string
  description = "SSH private key path"
}