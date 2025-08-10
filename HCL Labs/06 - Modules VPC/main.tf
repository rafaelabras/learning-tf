module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"
  name = var.vpc_name
  cidr = var.cidr_block
}

module "security-group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name = "sg-group"
  vpc_id = module.vpc.vpc_id

}