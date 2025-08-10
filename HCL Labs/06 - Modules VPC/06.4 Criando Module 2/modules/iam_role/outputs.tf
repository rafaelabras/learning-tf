output "role-arn" {
  description = "ARN da role"
  value       = aws_iam_role.role.arn
}

output "role_name" {
  description = "nome da role"
  value       = aws_iam_role.role.name
}

output "role_id" {
  description = "ID da role IAM"
  value       = aws_iam_role.role.id
}

