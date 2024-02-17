variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones in which to create subnets."
  type        = list(string)
}

variable "private_subnets_cidr_blocks" {
  description = "List of CIDR blocks for the private subnets."
  type        = list(string)
}

variable "common_tags" {
  description = "Common tags to be applied to all resources."
  type        = map(string)
  default     = {}
}
