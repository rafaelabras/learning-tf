output "vpc_id" {
    description = "ID da vpc"
    value = aws_vpc.main.id
}

output "subnet_id" {
    description = "ID da subnet"
    value = aws_subnet.public.id
}

output "id_do_sg" {
    description = "ID do security group"
    value = aws_security_group.web.id
}

output "bucket_s3_nome" {
    description = "Nome do bucket s3"
    value = aws_s3_bucket.logs.bucket
}

