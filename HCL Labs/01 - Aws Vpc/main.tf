resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/24"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    name       = "Vpc feita com terraform"
    terraform  = "true"
    enviroment = "lab"
  }
}