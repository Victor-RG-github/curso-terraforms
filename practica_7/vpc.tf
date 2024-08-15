resource "aws_vpc" "vpc_stockholm" {
  cidr_block = var.stockholm_cidr
  tags = {
    Name = "vpc_stockholm-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_stockholm.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet-${local.sufix}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.vpc_stockholm.id
  cidr_block              = var.subnets[1]
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet-${local.sufix}"
  }
  depends_on = [aws_subnet.public_subnet]
}

resource "aws_internet_gateway" "igw_stockholm" {
  vpc_id = aws_vpc.vpc_stockholm.id

  tags = {
    Name = "igw stockholm-${local.sufix}"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_stockholm.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_stockholm.id
  }

  tags = {
    Name = "public_crt-${local.sufix}"
  }
}

resource "aws_route_table_association" "ctra_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_security_group" "sg_public_instance" {
  name        = "Public instance Security Group"
  description = "Allow SSH inbound traffic and All egress traffic "
  vpc_id      = aws_vpc.vpc_stockholm.id

  tags = {
    Name = "sg_public_instance-${local.sufix}"
  }

  ingress = [{
    description      = "SSH over internet"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.sg_ingress_cidr]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]

  egress = [{
    description      = "Out all internet"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = []
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]

}


