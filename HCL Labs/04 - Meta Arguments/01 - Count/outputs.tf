output "vpc_id" {
  description = "ID da vpc"
  value = aws_vpc.main.id
}

output "subnet_ids" {
 description = "IDs das subnets"
 value = aws_subnet.subnet[*].id
}

output "subnet_cidr_blocks" {
  description = "CIDR block das subnets"
  value = aws_subnet.subnet[*].cidr_block
}

output "security_group_ids" {
  description = "ID dos security groups"
  value = aws_security_group.security_group[*].id
}

output "aws_route_table_ids" {
  description = "IDS das route tables"
  value = aws_route_table.route_Table[*].id
}