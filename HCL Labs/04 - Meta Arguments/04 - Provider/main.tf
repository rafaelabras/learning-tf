resource "aws_s3_bucket" "primary" {
  provider = aws.primary
  bucket   = "primary-${var.environment}-${random_string.suffix.result}"

  tags = {
    Name        = "Primary Region Bucket"
    Environment = var.environment
    Region      = var.primary_region
  }
}

resource "aws_sns_topic" "sns_primary" {
  provider = aws.primary
  name = "topic-sns-${var.environment}-${var.primary_region}"

  tags = {
    Name = "topic sns região primaria"
    Environment = var.environment
    Region = var.primary_region
  }

}

resource "aws_sns_topic" "sns_secondary" {
  provider = aws.secondary
  name = "topic-sns-${var.environment}-${var.secondary_region}"

  tags = {
    Name = "topic sns região secundaria"
    Environment = var.environment
    Region = var.secondary_region
  }

}

resource "aws_s3_bucket" "secondary" {
  provider = aws.secondary
  bucket   = "secondary-${var.environment}-${random_string.suffix.result}"

  tags = {
    Name        = "Secondary Region Bucket"
    Environment = var.environment
    Region      = var.secondary_region
  }
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}