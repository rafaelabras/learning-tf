
# OBS: o terraform.tfvars é excluido do versionamento de código devido a boas práticas.
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpcCidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name       = "Vpc feita com terraform"
    terraform  = "true"
    enviroment = var.enviroment
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr
  tags = {
    Name       = "subnet publica 01"
    enviroment = var.enviroment
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name       = "subnet privada 01"
    enviroment = var.enviroment
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name       = "route table publica"
    enviroment = var.enviroment
  }
}

resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name       = "route table private"
    enviroment = var.enviroment
  }
}

resource "aws_route" "route_public" {
  route_table_id         = aws_route_table.route_table_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main_igw.id
}

resource "aws_route_table_association" "roteamento_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "roteament_private_subnet" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.route_table_private.id
}


resource "aws_security_group" "sg_group" {
  name        = "teste-sg-group"
  description = "permite todas entradas e saidas"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "allow-all"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg_group_ingress" {
  security_group_id = aws_security_group.sg_group.id
  cidr_ipv4         = "0.0.0.0/0"
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" #semanticamente equivale a todas as portas.
}

resource "aws_vpc_security_group_egress_rule" "sg_group_egress" {
  security_group_id = aws_security_group.sg_group.id
  cidr_ipv4         = "0.0.0.0/0"
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}