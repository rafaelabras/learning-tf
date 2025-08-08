data "aws_region" "current" {}

locals {

  tags = {
    Name        = "production-vpc-us-east-1"
    Environment = var.environment
    Project     = "terraform-demo"
    Owner       = "infrastructure-team"
    CostCenter  = "cc-1234"
    Region      = data.aws_region.current.name
    ManagedBy   = "terraform"
  }
  prefixo = "${var.environment}-"
}

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${local.prefixo}-vpc-us-east-1"
    Environment = local.tags.Environment
    Project     = local.tags.Project
    Owner       = local.tags.Owner
    CostCenter  = local.tags.CostCenter
    Region      = local.tags.Region
    ManagedBy   = local.tags.ManagedBy
  }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name        = "${local.prefixo}-public-subnet-us-east-1a"
    Environment = local.tags.Environment
    Project     = local.tags.Project
    Owner       = local.tags.Owner
    CostCenter  = local.tags.CostCenter
    Region      = local.tags.Region
    ManagedBy   = local.tags.ManagedBy
    Tier        = "public"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name        = "${local.prefixo}--subnet-us-east-1b"
    Environment = local.tags.Environment
    Project     = local.tags.Project
    Owner       = local.tags.Owner
    CostCenter  = local.tags.CostCenter
    Region      = local.tags.Region
    ManagedBy   = local.tags.ManagedBy
    Tier        = "public"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name        = "${local.prefixo}-private-subnet-us-east-1a"
    Environment = local.tags.Environment
    Project     = local.tags.Project
    Owner       = local.tags.Owner
    CostCenter  = local.tags.CostCenter
    Region      = local.tags.Region
    ManagedBy   = local.tags.ManagedBy
    Tier        = "private"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name        = "${local.prefixo}-private-subnet-us-east-1b"
    Environment = local.tags.Environment
    Project     = local.tags.Project
    Owner       = local.tags.Owner
    CostCenter  = local.tags.CostCenter
    Region      = local.tags.Region
    ManagedBy   = local.tags.ManagedBy
    Tier        = "public"
  }
}

resource "aws_security_group" "web" {
  name        = "production-web-sg"
  description = "Allow web traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${local.prefixo}-web-sg"
    Environment = local.tags.Environment
    Project     = local.tags.Project
    Owner       = local.tags.Owner
    CostCenter  = local.tags.CostCenter
    Region      = local.tags.Region
    ManagedBy   = local.tags.ManagedBy
  }
}