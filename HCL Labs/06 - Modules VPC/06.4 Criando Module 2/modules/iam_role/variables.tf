variable "environment" {
  description = "Ambiente de deploy"
  type        = string
}

variable "role_name" {
  description = "Nome da role IAM"
  type        = string
}

variable "role_description" {
  description = "Descricao da role IAM"
  type        = string
}

variable "trusted_principal" {
  description = "Principal AWS que pode assumir essa role"
  type        = string
}

variable "policy_arns" {
  description = "Arn das politicas atachadas a essa role"
  type        = list(string)
  default     = []
}