resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "protected" {
  bucket = "protected-${var.environment}-${random_string.suffix.result}"
  tags = {
    Name        = "Bucket protegido"
    Environment = var.environment
  }

  lifecycle {
    prevent_destroy = true
  }

}

resource "aws_s3_bucket" "standard" {
  bucket = "standard-${var.environment}-${random_string.suffix.result}"

  tags = {
    Name        = "Standard Bucket"
    Environment = var.environment
  }
}

resource "aws_dynamodb_table" "replacement" {
  name         = "replacement-${var.environment}-${random_string.suffix.result}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name        = "Replacement table"
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_dynamodb_table" "standard" {
  name         = "standard-${var.environment}-${random_string.suffix.result}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "S"
  }

  tags = {
    Name        = "Standard Table"
    Environment = var.environment
  }
}

resource "aws_sns_topic" "sns" {
  name = "uptades-${var.environment}-${random_string.suffix.result}"

  tags = {
    Name        = "Update topic"
    Environment = var.environment
    version     = "1.5.0"
  }

  lifecycle {
    ignore_changes = [
      tags["Version"]
    ]
  }

}