resource "aws_iam_role" "role" {
  name        = "${var.role_name}-${var.environment}"
  description = var.role_description

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = var.trusted_principal
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Environment = var.environment
  }

}

resource "aws_iam_role_policy_attachment" "atachar_policy" {
  count      = length(var.policy_arns)
  role       = aws_iam_role.role.name
  policy_arn = var.policy_arns[count.index]

}