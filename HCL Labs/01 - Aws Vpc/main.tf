
# OBS: o terraform.tfvars é excluido do versionamento de código devido a boas práticas.
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpcCidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    name       = "Vpc feita com terraform"
    terraform  = "true"
    enviroment = var.enviroment
  }
}