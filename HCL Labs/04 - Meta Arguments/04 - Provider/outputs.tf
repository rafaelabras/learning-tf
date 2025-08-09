output "primary_Bucket_name" {
    description = "nome do bucket primario"
    value = aws_s3_bucket.primary.bucket
}

output "secondary_bucket_name" {
    description = "nome do bucket secundario"
    value = aws_s3_bucket.secondary.bucket
}

output "primary_bucket_region" {
  description = "regiao do bucket primario"
  value = aws_s3_bucket.primary.region
}

output "secondary_bucket_region" {
  description = "regiao do bucket secundario"
  value = aws_s3_bucket.secondary.region
}

output "sns_primary_arn" {
  description = "arn do sns topic na região primaria"
  value = aws_sns_topic.sns_primary.region
}

output "sns_secondary_arn" {
  description = "arn do sns topic na região secundaria"
  value = aws_sns_topic.sns_secondary.region
}
