variable "tenancy_ocid"     { type = string }
variable "user_ocid"        { type = string }
variable "fingerprint"      { type = string }
variable "private_key_path" { type = string }

variable "region" {
  type    = string
  default = "ap-tokyo-1"
}

variable "vcn_name" {
  type        = string
  description = "vcn name"
}

variable "igw_name" {
  type        = string
  description = "internet gateway name"
}

variable "rt_name" {
  type        = string
  description = "route table name"
}

variable "public_sl_name" {
  type        = string
  description = "public subnet security list name"
}

variable "public_subnet_name" {
  type        = string
  description = "public subnet name"
}

variable "public_subnet_dns_label" {
  type        = string
  description = "public subnet dns label"
}

variable "compartment_id" {
  type        = string
  description = "資源建在哪個 Compartment（demo-compartment OCID）"
}

variable "vcn_cidr" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "vcn_dns_label" {
  type        = string
  description = "vcn dns label"
}

