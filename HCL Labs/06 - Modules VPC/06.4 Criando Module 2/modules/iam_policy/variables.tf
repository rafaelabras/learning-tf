variable "environment" {
  description = "Ambiente de deploy"
  type        = string
}

variable "policy_name" {
  description = "Nome da policy do IAM"
  type        = string
}

variable "policy_description" {
  description = "Descrição da policy IAM"
  type        = string
}

variable "policy_statements" {
  description = "Lista da declaracoes de policy"
  type = list(object({
    effect    = string
    actions   = list(string)
    resources = list(string)
  }))
}