resource "aws_iam_policy" "iam_policy" {
  name        = "${var.policy_name}-${var.environment}"
  path        = "/"
  description = var.policy_description

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      for statement in var.policy_statements : {
        Effect   = statement.effect
        Aciton   = statement.actions
        Resource = statement.resources
      }
    ]
  })

  tags = {
    Environment = var.environment
  }

}