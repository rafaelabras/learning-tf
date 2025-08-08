output "vpc_id" {
  description = "ID da vpc"
  value       = aws_vpc.main.id
}

output "subnet_ids" {
  description = "IDS das subnets"
  value       = aws_subnet.subnet[*].id
}

output "security_group_ids" {
  description = "ID dos security groups"
  value       = aws_security_group.sg[*].id
}

output "route_table_ids" {
  description = "IDs das route tables"
  value       = aws_route_table.route_tables[*].id
}