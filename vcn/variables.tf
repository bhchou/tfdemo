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

variable "public_sl_dns_label" {
  type        = string
  description = "public subnet security list dns label"
}

/*
variable "tenancy_ocid" {
  type        = string
  description = "The Tanency of OCI"
}
variable "user_ocid" {
  type        = string
  description = "User to login to OCI"
}
variable "private_key_path" {
  type        = string
  description = "The private key to use for connecting OCI"
}
variable "fingerprint" {
  type        = string
  description = "The fingerprint to connect OCI"
}
variable "region" {
  type        = string
  description = "The region to provision the resources in"
}
variable "compartment_id" {
  type        = string
  description = "compartment ocid that vcn resides in"
}
variable "vcn_name" {
  type        = string
  description = "vcn name"
}
variable "vcn_dns_label" {
  type        = string
  description = "vcn dns label"
}
variable "private_subnet_cidr" {
  type        = string
  description = "cidr for private subnet"
}
variable "public_subnet_cidr" {
  type        = string
  description = "cidr for public subnet"
}
variable "eklb_subnet_cidr" {
  type        = string
  description = "cidr for public subnet"
}
variable "ekbastion_subnet_cidr" {
  type        = string
  description = "cidr for public subnet"
}
variable "vcn_cidrs" {
  type        = list(string)
  description = "vcn cidr"
}
variable "security_lists" {
  type = map(object({
    egress_rules = map(object({
      protocol    = string
      ports       = object({ min : number, max : number })
      destination = string
      destination_type = string
      optionals   = map(any)
    }))
    ingress_rules = map(object({
      protocol  = string
      ports     = object({ min : number, max : number })
      source    = string
      source_type = string
      optionals   = map(any)
    }))
  }))
}

*/