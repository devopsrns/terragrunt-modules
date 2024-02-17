resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = var.tags // Modificado para usar o mapa de tags
}


resource "aws_subnet" "eks_subnet_private" {
  count                   = length(var.private_subnets_cidr_blocks)
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.private_subnets_cidr_blocks[count.index]
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "eks_subnet_private_${count.index}"
  }
}

resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id
  tags = {
    Name = "eks_igw"
  }
}

resource "aws_route_table" "eks_rt" {
  vpc_id = aws_vpc.eks_vpc.id
}

resource "aws_route_table_association" "eks_rta" {
  count          = length(aws_subnet.eks_subnet_private.*.id)
  subnet_id      = aws_subnet.eks_subnet_private[count.index].id
  route_table_id = aws_route_table.eks_rt.id
}

resource "aws_route" "eks_route_internet_access" {
  route_table_id         = aws_route_table.eks_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.eks_igw.id
}
