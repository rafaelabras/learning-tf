output "bucket_name_no_cycle" {
  description = "Nome do bucket sem lifecycle"
  value       = aws_s3_bucket.standard.bucket
}

output "bucket_name_cycle" {
  description = "Nome do bucket com lifecycle"
  value       = aws_s3_bucket.protected.bucket
}

output "normal_dynamodb" {
  description = "tabela padrão do dynamodb"
  value       = aws_dynamodb_table.standard.name
}

output "replacement_dynamodb" {
  description = "tabela de replacement do dynamodb"
  value       = aws_dynamodb_table.replacement.name
}

output "sns_topic_arn" {
  description = "ARN do sns topic"
  value       = aws_sns_topic.sns.arn
}