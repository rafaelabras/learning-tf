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