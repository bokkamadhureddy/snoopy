variable "vpc_cidr" {
    default     = null
    description = " VPC CIDR block"
    type        = string
}
variable "vpc_name" {
    default     = null
    description = "VPC Name"
    type        = string
}
variable "IGW_name" {
    default     = null
    description = "Internet Gateway name"
    type        = string
}
variable "key_name" {
    default     = null
    description = "Kay Name for EC2 instance installation"
    type        = string
}
variable "public_subnet_cidr" {
    default     = null
    description = "Public subnet cidr block"
    type        = list
}
variable "private_subnet_cidr" {
    default     = null
    description = "Private subnet cidr block"
    type        = list
}
variable "availabulity_zone_names" {
    default     = null
    description = "available zones"
    type        = list
}
variable "public_routing_table" {
    default     = null
    description = " Public routing table"
    type        = string
}
variable "private_routing_table" {
    default     = null
    description = "Private routing table"
    type        = string
}
variable "infra_env" { 
    default = "dev"
    description = "infrastructure types"
    type        = string 
}
variable "db_subnet_cidr" {
    default     = null
    description = "DB subnet cidr block"
    type        = list
  
}

variable "dns_enable" {
  description = "Enable/disable DNS support in the VPC."
  type        = bool
  default     = null
}
variable "dns_hostname" {
    description = "Enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = null
}
variable "clasiclink_enable" {
    description = "Enable/disable ClassicLink for the VPC"
  type        = bool
  default     = null
}
variable "clasiclink_dns_enable" {
    description = "Enable/disable ClassicLink DNS Support for the VP"
  type        = bool
  default     = null
}
variable "ipv6_enable" {
    description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC"
  type        = bool
  default     = null
}
