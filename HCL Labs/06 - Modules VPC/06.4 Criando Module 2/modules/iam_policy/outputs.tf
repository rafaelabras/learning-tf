output "policy_arn" {
  description = "ARN da policy"
  value       = aws_iam_policy.iam_policy.arn
}

output "policy_name" {
  description = "Nome da policy IAM"
  value       = aws_iam_policy.iam_policy.name
}

output "policy_id" {
  description = "ID da policy IAM"
  value       = aws_iam_policy.iam_policy.id
}
