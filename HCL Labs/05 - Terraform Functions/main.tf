locals {
  teams = toset(var.teams)
}

resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = join("-", "${var.environment}", "vpc")
  }
}

resource "aws_subnet" "main_subnet" {
  count             = min(length((var.availability_zones), length(var.subnet_cidrs)))
  vpc_id            = aws_vpc.main_vpc
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = join("-", "${var.environment}", "subnet-${count.index}")
  }
}

resource "aws_security_group" "security_groups" {
  name        = "${var.environment}-security-groups"
  description = "Security groups"
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name  = "security-group-${var.environment}"
    Teams = join("-", "${locals.teams}")
  }
}


