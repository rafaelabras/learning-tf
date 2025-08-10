variable "vpc_cidr" {
  description = "Bloco CIDR da vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Nome da vpc"
  type        = string
  default     = "Vpc nome"
}