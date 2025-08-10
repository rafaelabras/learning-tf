module "s3_read_only_policy" {
  source             = "./modules/iam_policy"
  environment        = var.environment
  policy_name        = "s3-readonly"
  policy_description = "read-only acesso ao S3"

  policy_statements = [{
    effect    = "Allow"
    actions   = ["s3:Get*", "s3:List"]
    resources = ["*"]
  }]
}

module "cloudwatch" {
  source             = "./modules/iam_policy"
  environment        = var.environment
  policy_name        = "Cloudwatch-write"
  policy_description = "permitir ao cloudwatch acesso a escrita"

  policy_statements = [{
    effect    = "Allow"
    actions   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
    resources = ["*"]
  }]
}

module "role_app" {
  source            = "./modules/iam_role"
  environment       = var.environment
  role_name         = "app_role"
  role_description  = "Role para aplicação"
  trusted_principal = "ec2.amazonaws.com"
  policy_arns       = [module.s3_read_only_policy.policy_arn]
}

module "role_monitoring" {
  source            = "./modules/iam_role"
  environment       = var.environment
  role_name         = "monitoring_role"
  role_description  = "Role para monitoração"
  trusted_principal = "lamda.amazonaws.com"
  policy_arns       = [module.cloudwatch.policy_arn]
}