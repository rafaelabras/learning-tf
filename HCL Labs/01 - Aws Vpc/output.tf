output "vpc_cidr" {
  description = "CIDR da vpc criada"
  value       = aws_vpc.vpc.cidr_block
}

output "vpc_arn" {
  description = "ARN da vpc criada pelo terraform"
  value       = aws_vpc.vpc.arn
}

output "vpc_id" {
  description = "Id da vpc criada pelo terraform"
  value       = aws_vpc.vpc.id
}

output "public_subnet_id" {
  description = "Id da subnet publica"
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "Id da subnet privada"
  value = aws_subnet.private_subnet.id
}

output "route_table_public_id" {
  description = "Id da route table publica"
  value = aws_route_table.route_table_public.id
}

output "route_table_private_id" {
  description = "Id da route table privada"
  value = aws_route_table.route_table_private.id
}

output "security_group_id" {
  description = "Id do security group"
  value = aws_security_group.sg_group.id
}