output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.eks_vpc.id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets."
  value       = aws_subnet.eks_subnet_private.*.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.eks_igw.id
}
