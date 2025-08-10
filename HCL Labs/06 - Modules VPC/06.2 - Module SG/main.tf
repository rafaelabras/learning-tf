module "vpc" {
 source = "terraform-aws-modules/vpc/aws"
 version = "5.19.0"

 name = "${var.vpc_name}-${var.environment}"
 cidr = var.vpc_cidr

 azs = ["${var.region}a", "${var.region}b"]
 private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
 public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

 enable_nat_gateway = false
 enable_vpn_gateway = false

 tags = {
    Environment = var.environment
 }
}

resource "random_string" "sufixo" {
  length = 15
  special = false
  upper = true
}

module "s3-bucket" {
    source = "terraform-aws-modules/s3-bucket/aws"
    version = "4.6.0"
    
    for_each = var.s3_buckets

    bucket = "${each.key}-${var.environment}-${radom_string.sufixo}"
  
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true

  versioning = {
    enabled = true
  }

  tags = {
    Environment = var.environment
  }
}

module "security_group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name = "${var.environment}-sg-group"
  description = "Security group"
  vpc_id = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules = ["http-80-tpc", "https-443-tcp"]

  tags = {
    Environment = var.environment
  }

}

module "sg-group2" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name = "${var.environment}-sg-group"
  description = "sg-group para aws"
  vpc_id = module.vpc.vpc_id

  ingress_cidr_blocks = [var.vpc_cidr] #permite o trafego apenas na vpc
  ingress_rules = ["ssh-tcp"]
  ingress_with_cidr_blocks = [
    {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    description = "porta com cidr"
    cidr_block = var.vpc_cidr
  }
  ]
  egress_rules = ["all-all"]

  tags = {
    Environment = var.environment
  }
}