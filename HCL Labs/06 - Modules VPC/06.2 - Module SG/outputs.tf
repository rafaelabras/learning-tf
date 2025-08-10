output "vpc_id" {
    description = "ID da vpc"
    value = module.vpc.vpc_id
}

output "security_group1_id" {
  description = "sg group 1 ID"
  value = module.security_group.security_group_id
}

output "s3_bucket_nomes" {
  description = "nome dos buckets-s3"
  value = {for k, v in module.module.s3-bucket : k => v.s3_bucket_id}
  
}

output "security_group2_id" {
  description = "sg group 1 ID"
  value = module.sg_group2.security_group_id
}

output "public_subnet-id" {
    description = "ID da subnet publica"
    value = module.vpc.public_subnets
}

output "private_subnet_ids" {
    description = "ID das subnets privadas"
    value = module.vpc.private_subnets
}

