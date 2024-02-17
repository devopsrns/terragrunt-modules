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


variable "name" {
  description = "The name of the VPC"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
