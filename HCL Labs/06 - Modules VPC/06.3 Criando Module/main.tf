module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "vpc-teste"
}

module "subnet" {
  source      = "./modules/subnet"
  vpc_id      = module.vpc.vpc_id
  subnet_cidr = "10.0.1.0/24"
  subnet_name = "demo-subnet"
  az_zone     = "us-east-1a"
}

module "ec2_instance" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.subnet.subnet_id
  instance_name = "Minha-EC2-Terraform"
  instance_type = "t2.small"
}