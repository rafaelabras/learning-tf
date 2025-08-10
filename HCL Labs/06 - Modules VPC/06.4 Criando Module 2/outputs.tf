output "policy_arns" {
  description = "ARN das politicas IAM criadas"
  value = {
    s3_read_only = module.s3_read_only_policy.policy_arn
    cloudwatch   = module.cloudwatch.policy_arn
  }
}

output "role_arn" {
  description = "ARN das roles"
  value = {
    app_role        = module.role_app.role_arn,
    monitoring_role = module.role_monitoring.role_arn
  }
}

output "role_names" {
  description = "nome das roles"
  value = {
    app_role        = module.role_app.role_name
    monitoring_role = module.role_monitoring.role_name
  }

}