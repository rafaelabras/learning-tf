output "vpc_id" {
  description = "ID da vpc"
  value       = aws_vpc.main_vpc.id
}

output "teams_unicos" {
  description = "valores unicos em teams"
  value       = local.teams
}

output "sg-group-name" {
  description = "nome do sg-group"
  value       = aws_security_group.security_groups.name
}

output "subnet_count" {
  description = "Quantidade de subnets"
  value       = min(length((var.availability_zones), length(var.subnet_cidrs)))
}

