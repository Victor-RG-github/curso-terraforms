resource "aws_vpc" "vpc_stockholm" {
  cidr_block = var.stockholm_cidr
  tags = {
    Name = "VPC_STOCKHOLM"
    name = "prueba"
    env  = "Dev"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_stockholm.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
    name = "prueba"
    env  = "Dev"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.vpc_stockholm.id
  cidr_block              = var.subnets[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "Private Subnet"
    name = "prueba"
    env  = "Dev"
  }
}
