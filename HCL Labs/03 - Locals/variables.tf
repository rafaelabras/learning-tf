variable "region" {
  description = "Região da aws"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Nome do ambinete"
  type        = string
  default     = "production"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}