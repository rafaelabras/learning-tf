resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "main-vpc"
  }
}

# subnet criada com foreach
resource "aws_subnet" "subnet" {
  for_each          = var.subnet_cidr_blocks
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = var.availability_zones[each.key]

  tags = {
    Name = "subnet-${each.key}"
    Tier = "padrao"
  }
}

# Security groups criada com foreach
resource "aws_security_group" "sg" {
  for_each    = var.security_groups
  name        = "${each.key}-sg"
  description = "Security group for ${each.key}"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "${each.key}-sg-${each.value}"
  }
}

# regras de SG criada com foreach
resource "aws_security_group_rule" "ingress" {
  for_each          = var.sg_ports
  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg[each.key].id
}

resource "aws_route_table" "route_tables" {
  vpc_id   = aws_vpc.main.id
  for_each = var.route_tables
  tags = {
    Name        = each.key
    Description = each.value
  }

}