data "aws_availability_zone" "avaliable" {
  state = "avaliable"
}

# retorna a região usada
data "aws_region" "current" {}

# retorna a identidade de quem invocou
data "aws_caller_identity" "current" {}

# criando um recurso através de dados

resource "aws_vpc" "development_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    name       = "development-vpc"
    enviroment = "development"
    region     = data.aws_region.current.region
    account    = data.aws_caller_identity.current.account_id
    criadoPor  = "${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}"
  }

}

resource "aws_subnet" "development_subnet_vpc" {
  vpc_id            = aws_vpc.development_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = data.aws_availability_zone.avaliable.name

  tags = {
    name       = "development-subnet"
    enviroment = "development"
  }
}