output "vpc_id" {
  description = "ID da vpc"
  value = aws_vpc.main.id
}

output "public_subnet_id_a" {
    description = "ID da subnet publica na AZ A"
    value = aws_subnet.public_a.id
}

output "public_subnet_id_b" {
    description = "ID da subnet publica na AZ AB"
    value = aws_subnet.public_b.id
}

output "private_subnet_id_a" {
    description = "ID da subnet privada na AZ A"
    value = aws_subnet.private_a.id
}

output "private_subnet_id_b" {
    description = "ID da subnet privada na AZ B"
    value = aws_subnet.private_b.id
}