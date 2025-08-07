# Static configuration with hardcoded values
resource "aws_vpc" "production" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "production-vpc"
    Environment = var.enviroment
    Project     = var.project_name
    ManagedBy   = "manual-deployment"
    Region      = data.aws_region.current.region
    AccountID   = data.aws_caller_identity.current.account_id
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.production.id
  cidr_block              = var.subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name        = "production-private-subnet"
    Environment = var.enviroment
    Project     = var.project_name
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.region
    AZ          = data.aws_availability_zones.available.names[0]
  }
}

resource "aws_route_table" "static" {
  vpc_id = aws_vpc.production.id

  tags = {
    Name        = "production-route-table"
    Environment = var.enviroment
    Project     = var.project_name
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.region
  }
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}