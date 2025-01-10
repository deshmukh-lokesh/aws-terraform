# VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_name
  }
}

# Subnets
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr_block

  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_cidr_block

  tags = {
    Name = var.private_subnet_name
  }
}

# Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.public_route_table_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.public_route_table_name
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.private_route_table_cidr_block
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = var.private_route_table_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}

# NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = var.nat_gateway_name
  }

  depends_on = [aws_internet_gateway.igw]
}

# Elastic IP
resource "aws_eip" "eip" {
  tags = {
    Name = var.eip_name
  }
}

# Route Table Association
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}