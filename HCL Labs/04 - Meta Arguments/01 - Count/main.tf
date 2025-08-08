resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "main-vpc"
  }
}

# Cria 3 Subnets
resource "aws_subnet" "subnet" {
  count = var.count_resource
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${count.index + 1}.0/24"
  availability_zone = "us-east-1${var.count_list[count.index]}"

  tags = {
    Name = "subnet-${count.index + 1}"
  }
}


# cria 3 security groups

resource "aws_security_group" "security_group" {
    count = var.count_resource
    name = var.sg_group[count.index].name
    description = var.sg_group[count.index].description
    vpc_id = aws_vpc.main.id

    ingress {
        from_port = var.sg_group[count.index].ingress_port
        to_port = var.sg_group[count.index].ingress_port
        protocol = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1" # -1 indica todos protocolos.
        cidr_blocks = ["0.0.0.0/0"]
        }

    tags = {
      Name = "${var.sg_group[count.index].name}-sg"
    }
  
}

# cria 2 route tables

resource "aws_route_table" "route_Table" {
  count = var.route_table_count
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "route-table-${count.index + 1}"
  }
}